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
use App\CandidateDocument;
// use Illuminate\Contracts\Routing\ResponseFactory;
use Response;

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
      // $type=$request->type;
      // if($type =='data'){
        $posted_data = Input::all();

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
                       $row3["technology_experience"]=$row3["relevanceYearExperience"].'.'.$row3["relevanceMonthExperience"];

                       unset ($row3["relevanceYearExperience"]);
                       unset ($row3["relevanceMonthExperience"]);
                      
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
      // else{

      //    //   $file = $request->file('file');
      //    // $posted_data['file_name'] =time().'.'.$file->getClientOriginalExtension();
      
      // }
    

    function viewCandiadte($id) {
        $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }

      public function uploadResume(Request $request)
    {
        
         $object = new CandidateDocument();
         $image = $request->file('file_name');
          // return $request;
         $posted_data['file_name'] =time().'.'.$image->getClientOriginalExtension();
         $posted_data['candidate_id']=$request['candidate_id'];
         $posted_data['timestamp']=$request['timestamp'];
         $destinationPath = public_path('/doc');
         $posted_data['path']=$destinationPath;
       
        
        if ($object->validate($posted_data)) {
            $image->move($destinationPath, $posted_data['file_name']);
            $model = CandidateDocument::create($posted_data);
            return response()->json(['status_code' => 200, 'message' => 'Resume uploaded successfully', 'data' => $model]);
           
       } else {
           throw new \Dingo\Api\Exception\StoreResourceFailedException('Resume not uploaded.',$object->errors());
       }



    }

    public function getDownload($id){
        $data= CandidateDocument::where('candidate_id',$id)->latest()->first();
        $file = public_path()."/doc/".$data['file_name'];
        // $headers = array('Content-Type: application/pdf',);
        return Response::download($file, $data['file_name']);
    }
   
}
