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
use App\User;

// use Illuminate\Support\Facades\App;
// use Mnvx\Unoconv\ConverterInterface;
// use Mnvx\Unoconv\Format;
// use Mnvx\Unoconv\UnoconvParameters;
// use Illuminate\Contracts\Routing\ResponseFactory;
use Response;

class CandidateCtrl extends BaseController
{
  /*
  * To Fetch list of resumes from server
  */
  function index(Request $request) {
      $page = $request->page;
      $limit = $request->limit;
      if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
          $candidateData = Candidate::paginate(50);
      }
      else{
          $candidateData = Candidate::paginate($limit);
      }

      if ($candidateData->first()) {

          return $this->dispatchResponse(200, "", $candidateData);

      } else {
          
          return $this->dispatchResponse(200, "No Records Found!!", $candidateData);
      }
  }

  /*
  * To save data of candidate details and its relevent details
  */
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
            $posted_data["unique_token"]=$this->checkTokenExit($posted_data["unique_token"]);

            //to store data in 'candidate_details' table 
            $model = Candidate::create($posted_data);
            
            //to check data existing in candidate table or not if exist then store to another tables
            if($model->id != null){

                $candidate_education = new CandidateQualification();
               
                foreach ($posted_data["educationalDetails"] as &$row) {
                   unset ($row["qualificationName"]);
                   
                   $row["candidate_id"] = $model->id;
                   $row["timestamp"]=$currentTimestamp;
                }
                //to store data in candidate 'educationl_details' table
                CandidateQualification::insert($posted_data["educationalDetails"]);

                $candidate_achivements = new CandidateAchivements();
                foreach ($posted_data["achivementDetails"] as &$row1) {
                   $row1["candidate_id"] = $model->id;
                   $row1["timestamp"]=$currentTimestamp;
                  
                }
                //to store data in candidate 'other_achievements' table
                CandidateAchivements::insert($posted_data["achivementDetails"]);
                
                $candidate_industrial_experiance = new CandidateIndustrialExperiance();
                foreach ($posted_data["industryExperiance"] as &$row2) {
                   $row2["candidate_id"] = $model->id;
                   $row2["timestamp"]=$currentTimestamp;
                   
                }
                //to store data in candidate 'industrial_experience' table
                CandidateIndustrialExperiance::insert($posted_data["industryExperiance"]);

                $candidate_technical_skill= new CandidateTechnicalSkill();

                foreach ($posted_data["technicalSkill"] as &$row3) {

                   $row3["candidate_id"] = $model->id;
                   $row3["timestamp"]=$currentTimestamp;
                   $row3["technology_experience"]=$row3["relevanceYearExperience"].'.'.$row3["relevanceMonthExperience"];

                   unset ($row3["relevanceYearExperience"]);
                   unset ($row3["relevanceMonthExperience"]);
                  
                }
                //to store data in candidate 'technical_skills' table
                CandidateTechnicalSkill::insert($posted_data["technicalSkill"]);

                $candidate_hobbies= new CandidateHobbies();

                foreach ($posted_data["hobbyDetails"] as &$row4) {

                   $row4["candidate_id"] = $model->id;
                   $row4["timestamp"]=$currentTimestamp;
                   
                }
                //to store data in candidate 'hobbies' table
                CandidateHobbies::insert($posted_data["hobbyDetails"]);
            }
            DB::commit();
            if($model){              
              return $this->dispatchResponse(200, "Candidate added Successfully...!!", $model);
            }else{
              return $this->dispatchResponse(401, "Candidate not added.");
            }
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
    
  /*
  * To Fetch candidate details by id
  */
  function viewCandiadte($id) {
      $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);

      if ($model){
          return $this->dispatchResponse(200, "Records Found...!!", $model);
      }else{
          return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
      }
  }

  function checkTokenExit($token){
       
        $uniqueToken = User::where('unique_token','=',$token)->pluck('unique_token');
        if(count($uniqueToken)>0){
            return $uniqueToken=$uniqueToken[0];

        }else{
            $uniqueToken=User::where('name','Admin')->pluck('unique_token');
            return $uniqueToken[0];
        }
      
    }

  /*
  * To save uploaded resume file in db
  */
  public function uploadResume(Request $request){
      $object = new CandidateDocument();
      $image = $request->file('file_name');
      $ext = $image->getClientOriginalExtension();
      // if($ext != 'pdf'){
      //   $ext = 'docx';
      // $converter = App::make(ConverterInterface::class);
      // $parameters = (new UnoconvParameters())
      //     ->setInputStream(time().'.'.$ext)
      //     ->setOutputFormat(Format::FORMAT_TEXT_PDF);
      // echo $converter->convert($parameters);
      //}
      if($ext == 'doc'){
        $ext = 'docx';
      }
      $posted_data['file_name'] =time().'.'.$ext;
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

  /*
  * To get uploaded resume file from db
  */
  public function getDownload($id){
      $data= CandidateDocument::where('candidate_id',$id)->latest()->first();
      $file = public_path('/doc/').$data['file_name'];
      $headers = array('Content-Type: application/pdf','Content-Type: application/msword');
      return Response::download($file, $data['file_name'],$headers);
  }
   
}
