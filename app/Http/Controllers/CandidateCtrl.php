<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use DateTime;
use App\Candidate;
use App\CandidateQualification;
use App\CandidateAchivements;
use App\CandidateIndustrialExperiance;
use App\CandidateTechnicalSkill;
use App\CandidateHobbies;

class CandidateCtrl extends BaseController
{
    function index(Request $request) {

        $candidateData = Candidate::paginate(50);

        if ($candidateData->first()) {

            return $this->dispatchResponse(200, "", $candidateData);

        } else {
            
            return $this->dispatchResponse(200, "No Records Found!!", $candidateData);
        }
    }

	function create(Request $request) {
      $type=$request->type;
      // print_r($type);
      // die();
      if($type =='data'){
        $posted_data = Input::all();
        
        //$file = "";
        // $posted_data_r = $posted_data["model"];
        // if ($request->hasFile('file')) {
        //   $file = $request->file('file');
        // }

        DB::beginTransaction();
        try {
            
            $objectCandidate = new Candidate();

            $now = new DateTime();
            $currentTime = $now->format('H:i:s.u');
            $formetedDate = $now->format('Y-m-d');
            $currentTimestamp = time();

            $expireDate = date('Y-m-d', strtotime('+6 month'));
            
            if ($objectCandidate->validate($posted_data)) {
                $posted_data["status"]="Active";
                $posted_data["timestamp"]=$currentTimestamp;
                $posted_data["expired_on"]=$expireDate;
                 
                $model = Candidate::create($posted_data);
                    
                if($model->id != null){

                    $candidate_education = new CandidateQualification();
                    // print_r($posted_data["educationalDetails"]);
                    // die();
                    
                    foreach ($posted_data["educationalDetails"] as &$row) {
                       unset ($row["qualificationName"]);
                       
                       $row["candidate_id"] = $model->id;
                       $row["timestamp"]=$currentTimestamp;
                    }
                    CandidateQualification::insert($posted_data["educationalDetails"]);

                    // print_r($posted_data["educationalDetails"]);
                    // die();

                    $candidate_achivements = new CandidateAchivements();
                    foreach ($posted_data["achivementDetails"] as &$row1) {
                       $row1["candidate_id"] = $model->id;
                       $row1["timestamp"]=$currentTimestamp;
                      
                    }

                    CandidateAchivements::insert($posted_data["achivementDetails"]);
                    
                    $candidate_industrial_experiance = new CandidateIndustrialExperiance();
                    foreach ($posted_data["industryExperiance"] as &$row2) {
                       $row2["candidate_id"] = $model->id;
                       $row2["timestamp"]=$currentTimestamp;
                       
                    }

                    CandidateIndustrialExperiance::insert($posted_data["industryExperiance"]);

                    $candidate_technical_skill= new CandidateTechnicalSkill();

                    foreach ($posted_data["technicalSkill"] as &$row3) {

                       $row3["candidate_id"] = $model->id;
                       $row3["timestamp"]=$currentTimestamp;
                       $row3["technology_experience"]=$row3["relevanceMonthExperience"].'.'.$row3["relevanceYearExperience"];

                       unset ($row3["relevanceMonthExperience"]);
                       unset ($row3["relevanceYearExperience"]);
                      
                    }

                    CandidateTechnicalSkill::insert($posted_data["technicalSkill"]);

                    $candidate_hobbies= new CandidateHobbies();

                    foreach ($posted_data["hobbyDetails"] as &$row4) {

                       $row4["candidate_id"] = $model->id;
                       $row4["timestamp"]=$currentTimestamp;
                       
                    }

                    CandidateHobbies::insert($posted_data["hobbyDetails"]);
                }
                DB::commit();
                if($model)

                    return $this->dispatchResponse(200, "Candidate added Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectCandidate->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        } 
      }
      else{

         //   $file = $request->file('file');
         // $posted_data['file_name'] =time().'.'.$file->getClientOriginalExtension();
      
      }
    } 

    function viewCandiadte($id) {
        $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }
   
}
