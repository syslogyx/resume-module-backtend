<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use DateTime;
use App\Candidate;
use App\CandidateQualification;
use App\CandidateAchivements;
use App\CandidateIndustrialExperiance;
use App\CandidateTechnicalSkill;
use App\CandidateHobbies;
use App\CandidateDocument;
use App\JobDescription;
use App\CandidateUserAssoc;
use App\CandidateJdAssoc;
use App\TechnicalInterviewResult;
use App\CandidateBackgroundDocuments;
use App\CandidatesChecklistDocs;
use App\User;
use App\Company;
use Response;
use App\forwordedResume;
use Validator;
use Illuminate\Validation\Rule; 
use Excel;


class CandidateCtrl extends BaseController
{
  /*
  * To Fetch list of resumes from server
  */
  function index(Request $request) {
      $page = $request->page;
      $limit = $request->limit;
      if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
          $candidateData = Candidate::with('job_description')->paginate(50);
      }
      else{
          $candidateData = Candidate::with('job_description')->paginate($limit);
      }

      if ($candidateData->first()) {
          return $this->dispatchResponse(200, "Candidate List", $candidateData);
      } else {          
          return $this->dispatchResponse(404, "No Records Found!!", $candidateData);
      }
  }


  /*
  * API to fetch data according applied filter.
  */
  function filterCandidates(Request $request){
      $page = $request->page;
      $limit = $request->limit;

      $posted_data = Input::all();

      $query = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document','job_description','candidate_technical_result.users','candidate_user_assocs.users','candidate_bg_documents');

      // if(isset($posted_data["job_description_id"])){
      if(isset($posted_data['role_id']) && $posted_data['role_id']==6 && isset($posted_data["email"]) && isset($posted_data["contact_no"])){
          // if( ){
              $clientID = Company::where('email', $posted_data['email'])->where('contact_no', $posted_data['contact_no'])->pluck('id')->first();
            
              $jdIDArrayOfClient = JobDescription::where('company_id',$clientID)->pluck('id');

              $query->whereIn('job_description_id',$jdIDArrayOfClient);
          // }
          // else{
          //     return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
          // }
      }
      // }else{
      //     $query = Candidate::with('job_description','candidate_technical_result.users','candidate_user_assocs.users','candidate_bg_documents'); 
      // }

      // if filter is not appiled
      if(Input::get()=="" || Input::get()==null ){
          $query->get();
      }

      // to filter according to job description
      if(isset($posted_data["job_description_id"])){
          $query->where("job_description_id",$posted_data["job_description_id"]);
      }

      
      // if(isset($posted_data["total_experience"])){
      //     $query->where("total_experience",$posted_data["total_experience"]);
      // }  

      // to filter according to ctc
      if(isset($posted_data["from_ctc"]) && isset($posted_data["to_ctc"])){
          $from_ctc = ($posted_data["from_ctc"] == (int) $posted_data["from_ctc"]) ? (int) $posted_data["from_ctc"] : (float) $posted_data["from_ctc"];

          $to_ctc = ($posted_data["to_ctc"] == (int) $posted_data["to_ctc"]) ? (int) $posted_data["to_ctc"] : (float) $posted_data["to_ctc"];

          $query->where('ctc', '>=', $from_ctc)->where('ctc', '<=', $to_ctc);        
      }

      // to filter according to total experience
      if(isset($posted_data["from_total_experience"]) && isset($posted_data["to_total_experience"])){
          $from_number = ($posted_data["from_total_experience"] == (int) $posted_data["from_total_experience"]) ? (int) $posted_data["from_total_experience"] : (float) $posted_data["from_total_experience"];
          $to_number = ($posted_data["to_total_experience"] == (int) $posted_data["to_total_experience"]) ? (int) $posted_data["to_total_experience"] : (float) $posted_data["to_total_experience"];

          $query->where('total_experience', '>=',$from_number)->where('total_experience', '<=', $to_number);        
      }

      // to filter according to alphabets
      if(isset($posted_data['search_alphabet']) && $posted_data['search_alphabet'] != 'All'){
          $query->where('first_name','LIKE',$posted_data['search_alphabet']."%");
      }

      // to filter according to status
      if(isset($posted_data["status"]) && $posted_data["status"] == 'selected' && $posted_data['search_alphabet'] != 'All'){
          $query->where("status","Selected")->orwhere("status","Joined")->where('first_name','LIKE',$posted_data['search_alphabet']."%"); 
      }else if(isset($posted_data["status"]) && $posted_data["status"] == 'selected' && $posted_data['search_alphabet'] == 'All'){
          $query->where("status","Selected")->orwhere("status","Joined");
      }else if(isset($posted_data["status"]) && $posted_data["status"] == 'non-selected'){
          $query->where("status","!=","Selected")->where("status","!=","Joined");
      }

      // to filter according to pagination
      if(($page != null && $page != 0) && ($limit != null && $limit != 0)){
          $candidateData = $query->orderBy('created_at', 'DESC')->paginate($limit);
      }
      else{
          $candidateData = $query->orderBy('created_at', 'DESC')->paginate(50);
      }

      if ($candidateData->first()) {
          return $this->dispatchResponse(200, "",$candidateData);
      }else{
          return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
      }

  }

  /*
  * To save data of candidate details and its relevent details
  */
	function create(Request $request) {
    try {
      $posted_data = Input::all();

      DB::beginTransaction();
        
        $objectCandidate = new Candidate();

        $now = new DateTime();
        $currentTime = $now->format('H:i:s.u');
        $formetedDate = $now->format('Y-m-d');
        $currentTimestamp = time();

        // $expireDate = date('Y-m-d', strtotime('+6 month'));
        
        if ($objectCandidate->validate($posted_data)) {
            $posted_data["status"]="Active";
            $posted_data["timestamp"]=$currentTimestamp;
            // $posted_data["expired_on"]=$expireDate;
            $posted_data["unique_token"]=$this->checkTokenExit($posted_data["unique_token"]);

            //to store data in 'candidate_details' table 
            $model = Candidate::create($posted_data);
            
            //to check data existing in candidate table or not if exist then store to another tables
            $candidateJdData = [];
            if($model->id != null){
                $candidateJdData['job_description_id'] = $model->job_description_id;
                $candidateJdData['candidate_id'] = $model->id;
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
                   unset ($row2["languages"]);
                   unset ($row2["tools"]);
                   unset ($row2["project_descriptions"]);
                   
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

                $candidate_jd_assoc = new CandidateJdAssoc();
                CandidateJdAssoc::create($candidateJdData);


                $user_data["name"] = $posted_data['first_name'].' '.$posted_data['middle_name'].' '.$posted_data['last_name'];
                $user_data["email"] = $posted_data['email'];
                $user_data["mobile"] = $posted_data['mobile_no'];
                $user_data["password"] = $posted_data['mobile_no'];
                $user_data["role_id"] = 5;
                $user_data["company_name"] = 'Candidate';
                $user_data["password"] = Hash::make($posted_data['mobile_no']);
                $user_data["unique_token"] = $posted_data["unique_token"];
                $user_data["status"] ="Active";
                // $user_data["unique_token"] = $posted_data['unique_token'];
                User::create($user_data);

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
    
  /*
  * To Fetch candidate details by id
  */
  function viewCandiadte($id) {
    $candidateDtls = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);      
    if ($candidateDtls){
        return response()->json(['status_code' => 200, 'message' => 'Candidate Details', 'data' => $candidateDtls]);
    }else{
      return response()->json(['status_code' => 404, 'message' => 'Details not found']);
    }
  }

  /*
  * To Check token already exist or not
  */
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
  function uploadResume(Request $request){
      $object = new CandidateDocument();
      $image = $request->file('file_name');
      $ext = $image->getClientOriginalExtension();
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
        throw new \Dingo\Api\Exception\StoreResourceFailedException('File not uploaded.',$object->errors());
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

  /*
  * To update data of candidate details and its relevent details
  */
  public function update($id){
    try {
      $posted_data = Input::all();
        $model = Candidate::find((int) $id);
        $oldEmailId = $model->email;
        $oldMobile = $model->mobile_no;
        // $expireDate = date('Y-m-d', strtotime('+6 month'));
        $currentTimestamp = $posted_data['timestamp'];
          if ($model->validate($posted_data)) {   
              // $posted_data["expired_on"]=$expireDate;                      
              if ($model->update($posted_data)){
                // to check data existing in candidate table or not if exist then store to another tables
                $candidateJdData = [];
                if($model->id != null){
                  $candidateJdData['job_description_id'] = $model->job_description_id;
                  $candidateJdData['candidate_id'] = $model->id;
                  CandidateJdAssoc::create($candidateJdData);
                  
                  $candidate_education = new CandidateQualification();
                    //to delete previous data and store new data in candidate 'educationl_details' table
                    CandidateQualification::where('timestamp', '=', $currentTimestamp)->delete();
                    foreach ($posted_data["educationalDetails"] as &$row) {
                         unset ($row["qualificationName"]);
                         
                         $row["candidate_id"] = $model->id;
                         $row["timestamp"]=$currentTimestamp;
                    }

                    //to store data in candidate 'educationl_details' table
                    CandidateQualification::insert($posted_data["educationalDetails"]);
                    $candidate_achivements = new CandidateAchivements();
                    //to delete previous data and store new data in candidate 'other_achievements' table
                    CandidateAchivements::where('timestamp', '=', $currentTimestamp)->delete();

                    foreach ($posted_data["achivementDetails"] as &$row1) {
                       $row1["candidate_id"] = $model->id;
                       $row1["timestamp"]=$currentTimestamp;
                      
                    }
                    //to store data in candidate 'other_achievements' table
                    CandidateAchivements::insert($posted_data["achivementDetails"]);
                    
                    $candidate_industrial_experiance = new CandidateIndustrialExperiance();
                    //to delete previous data and store new data in candidate 'industrial_experience' table
                    CandidateIndustrialExperiance::where('timestamp', '=', $currentTimestamp)->delete();

                    foreach ($posted_data["industryExperiance"] as &$row2) {
                       $row2["candidate_id"] = $model->id;
                       $row2["timestamp"]=$currentTimestamp;
                       unset ($row2["languages"]);
                       unset ($row2["tools"]);
                       unset ($row2["project_descriptions"]);
                    }
                    //to store data in candidate 'industrial_experience' table
                    CandidateIndustrialExperiance::insert($posted_data["industryExperiance"]);

                    $candidate_technical_skill= new CandidateTechnicalSkill();
                    //to delete previous data and store new data in candidate 'educationl_details' table
                    CandidateTechnicalSkill::where('timestamp', '=', $currentTimestamp)->delete();

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
                    //to delete previous data and store new data in candidate 'educationl_details' table
                    CandidateHobbies::where('timestamp', '=', $currentTimestamp)->delete();

                    foreach ($posted_data["hobbyDetails"] as &$row4) {

                       $row4["candidate_id"] = $model->id;
                       $row4["timestamp"]=$currentTimestamp;
                       
                    }
                    //to store data in candidate 'hobbies' table
                    CandidateHobbies::insert($posted_data["hobbyDetails"]);
                    
                    $user_name = $posted_data['first_name'].' '.$posted_data['middle_name'].' '.$posted_data['last_name'];
                    $user_email = $posted_data['email'];
                    $user_mobile = $posted_data['mobile_no'];
                    $user_pwd = Hash::make($posted_data['mobile_no']);

                    User::where('email','=',$oldEmailId)->where('mobile','=',$oldMobile)->update(['name'=>$user_name,'email'=>$user_email,'mobile'=>$user_mobile,'password'=>$user_pwd]);
                }

                DB::commit();
                return $this->dispatchResponse(200, "Candidate Details Updated Successfully...!!", $model);

              }
          } else {
              DB::rollback();
              return $this->dispatchResponse(400,"Something went wrong.", $model->errors());
          }
    } catch (\Exception $e) {
        throw $e;
    }
  }

  /*
  *   Function to update job descrption status by id
  */
  public function updateStatus($id){
        $posted_data = Input::all();
        $model = Candidate::find((int) $id);
        if ($model){
            try{
                DB::beginTransaction();
                if ($model->update($posted_data)) {
                  if($posted_data['id']){
                    forwordedResume::where('candidate_id','=',$posted_data['id'])->update(['final_status'=>$posted_data['status']]);                    
                    DB::commit();
                    return $this->dispatchResponse(200, "Status Updated Successfully...!!", $model);
                  }
                } else {
                    DB::rollback();
                    return $this->dispatchResponse(400,"Something went wrong.", $model->errors());
                }
            } catch (\Exception $e) {
                DB::rollback();
                throw $e;
            }
        }
  }

  /*
  * Function to get Jd list by candidate id
  */
  public function getJDListByCandidateId($candidateId){
    $oldJdIdArray = CandidateJdAssoc::distinct()->select('job_description_id')->where('candidate_id', '=', $candidateId)->get()->pluck('job_description_id')->toArray();
    $getAllJdIdArray = JobDescription::get()->pluck('id')->toArray();
    $ids = array_merge(array_diff($oldJdIdArray, $getAllJdIdArray), array_diff($getAllJdIdArray, $oldJdIdArray));
    $newJdList = JobDescription::whereIn('id', $ids)->where('status',1)->get();
      if($newJdList){
          return $this->dispatchResponse(200, "Data", $newJdList);
      } else {            
          return $this->dispatchResponse(404, "No Records Found!!", $newJdList);
      }
  }

  /*
  * Function used to change jd and create candidate jd assoc
  */
  public function changeCandidateJd($candidateId){
    $posted_data = Input::all();
    $model = Candidate::find((int) $candidateId);
    $posted_data['status'] = 'Clear';
    if ($model){
        try{
            DB::beginTransaction();
            if ($model->update($posted_data)) {
              $candidateJdData = [];
              if($model->id != null){
                $candidateJdData['job_description_id'] = $model->job_description_id;
                $candidateJdData['candidate_id'] = $model->id;
                CandidateJdAssoc::create($candidateJdData);
              }
                DB::commit();
                return $this->dispatchResponse(200, "Job Descrption Updated Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400,"Something went wrong.", $model->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }
  }

  /*
  * Function used to fetch logged user (role as candidate) information
  */
  public function getLoggedCandidateInfo(){
    $posted_data = Input::all();
      $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document','job_description')->where('email','=',$posted_data['email'])->where('mobile_no','=',$posted_data['mobile'])->get()->first();
      if ($model){
          return $this->dispatchResponse(200, "Records Found...!!", $model);
      }else{
          return $this->dispatchResponse(400, "No Records Found!!");
      }
  }

  /*
  *  Function now not in use but required when we want to create logins of previous created candidates
  */
  public function createAllCandidatesLogin(){

      $candidate_data = "SELECT CONCAT(first_name,' ', middle_name,' ',last_name) AS name, mobile_no,email,'Candidate' AS company_name, mobile_no AS password, '5' AS role_id, status FROM `candidate_details`";

      $res_candidate = DB::select($candidate_data);  
      $data = json_decode(json_encode($res_candidate), True);
    
      foreach ($data as $value) {
        $array['name'] = $value['name'];
        $array['mobile'] = $value['mobile_no'];
        $array['email'] = $value['email'];
        $array['company_name'] = $value['company_name'];
        $array['role_id'] = $value['role_id'];
        $array['status'] = $value['status'];
        $array['password'] = Hash::make($value['mobile_no']);
        $array["created_at"] = new DateTime();
        $array["updated_at"] =  new DateTime();
        $newArray[] = $array;
      }

      User::insert($newArray);

  }

  /*
  *  Function to get initial alphabet list of candidates
  */
  public function getListOfCandidateOrderByAlphabets($type){
    if($type =='selected'){      
      return $alphabetsArray = Candidate::selectRaw('substr(upper(first_name),1,1) as letter')->where('status',$type)->orwhere('status','joined')->distinct()->orderBy('letter')->get()->pluck('letter')->toArray();
    }else{
      return $alphabetsArray = Candidate::selectRaw('substr(upper(first_name),1,1) as letter')->distinct()->orderBy('letter')->get()->pluck('letter')->toArray();
    }
  }

  /*
  *   Function to get candidate list by job_id
  */
  function getCandidateListByJobId($job_id){
      $candidateList = Candidate::where('job_description_id','=',$job_id)->orderBy('created_at', 'DESC')->get();
      if($candidateList->first()){
          return $this->dispatchResponse(200, "Data", $candidateList);
      } else {            
          return $this->dispatchResponse(404, "No Records Found!!", $candidateList);
      }
  }

  // function getAllCandidateList(){
  //     $candidateList = Candidate::get();
  //     if($candidateList->first()){
  //         return $this->dispatchResponse(200, "Data", $candidateList);
  //     } else {            
  //         return $this->dispatchResponse(404, "No Records Found!!", $candidateList);
  //     }
  // }

  /*
  * Function to get Candidate which is not yet forwared to any company.
  */
  public function getNotFowardedCandidateList(Request $request){

      $posted_data = Input::all();
      $candidateIdArray = forwordedResume::where('company_id',$posted_data["company_id"])->where("job_description_id",$posted_data["job_description_id"])->pluck('candidate_id');

      $query = Candidate::with('job_description','job_description.companies','candidate_technical_result.users','candidate_user_assocs.users','candidate_bg_documents');

      if(empty($candidateIdArray)){
        $candidateData = $query->where("job_description_id",$posted_data["job_description_id"])->where("status","Pass")->orwhere("status","Clear")->orderBy('created_at', 'DESC')->get();
      }else{
        $candidateData = $query->whereNotIn('id', $candidateIdArray)->where("job_description_id",$posted_data["job_description_id"])->where("status","Pass")->orderBy('created_at', 'DESC')->get();
      }
      
      if ($candidateData->first()) {
        return $this->dispatchResponse(200, "",$candidateData);
      }else{
        return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
      }
  }

  /*
  * Function to get Candidate's technical round details .
  */
  public function getCandidateTechnicalRoundDetails($candidate_id){
    if($candidate_id){
      $candidateDtls = Candidate::with('candidate_technical_result','candidate_technical_result.job_description','candidate_technical_result.users','forwarded_resumes_data','forwarded_resumes_data.job_description','forwarded_resumes_data.companies','forwarded_resumes_data.companies_tech_round_info')->find((int) $candidate_id);
      if ($candidateDtls){
          return response()->json(['status_code' => 200, 'message' => 'Candidate Details', 'data' => $candidateDtls]);
      }else{
        return response()->json(['status_code' => 404, 'message' => 'Details not found']);
      }
    }else{
      return $this->dispatchResponse(400,"Something went wrong.");
    }
  }

  /*
  * Function to check remote validation of field
  */
  public function check_validation() {
        $rules = [];
        if (Input::get("mobile_no")) {
            $data = json_decode(Input::get("mobile_no"));
            $rules['mobile_no'] = 'required|unique:candidate_details,mobile_no,'.$data->id;
            $validator = Validator::make((array) $data, $rules);
            if ($validator->fails()) {
                $this->errors = $validator->errors();
                //return $this->errors;
                return "false";
            }
        }

        if (Input::get("email")) {
            $data = json_decode(Input::get("email"));
            $rules['email'] = 'required|email|unique:candidate_details,email,'.$data->id;
            $validator = Validator::make((array) $data, $rules);
            if ($validator->fails()) {
                $this->errors = $validator->errors();
                //return $this->errors;
                return "false";
            }
        }

        if (Input::get("pan_number")) {
            $data = json_decode(Input::get("pan_number"));
            // return $data;
            $rules['pan_number'] = 'required|unique:candidate_details,pan_number,'.$data->id;
            $validator = Validator::make((array) $data, $rules);
            if ($validator->fails()) {
                $this->errors = $validator->errors();
                //return $this->errors;
                return "false";
            }
        }
  }

  /* Get login client candidate list
    public function getLoginClientsCandidateList(Request $request){
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();
        
        $clientID = Company::where('email', $posted_data['email'])->where('contact_no', $posted_data['contact_no'])->pluck('id')->first();
        
        $jdIDArrayOfClient = JobDescription::where('company_id',$clientID)->pluck('id');
        
        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document','job_description')->whereIn('job_description_id',$jdIDArrayOfClient)->paginate(50);
        }
        else{
            $model = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document','job_description')->whereIn('job_description_id',$jdIDArrayOfClient)->paginate($limit);
        }
        
        if ($model->first()) {
            return $this->dispatchResponse(200, "Candidate List", $model);
        } else {          
            return $this->dispatchResponse(404, "No Records Found!!", $model);
        }
    }
  */

  /*
  *  Function used to read csv file data as per format
  */
  public function readCsvFileData(Request $request){
    $file = $request->file('file_name');

    if($file)
    {
        $original_ext = $file->getClientOriginalExtension();
        if($original_ext === 'csv'){         
          $path = $request->file('file_name')->getRealPath();
          $data = Excel::load($path)->get();

            $dataImported = [];
            if(!empty($data) && $data->count())
            {
              $data = $data->toArray();
              for($i=0;$i<count($data);$i++)
              {
                if(isset($data[$i]['email']) && isset($data[$i]['mobile_no']) && isset($data[$i]['pan_no'])){

                  $data[$i]['email'] = str_replace("+AEA-","@",$data[$i]['email']);

                  $isEmailPresent = $this->checkEmailPresent($data[$i]['email']);
                  $isMobilePresent = $this->checkMobilePresent($data[$i]['mobile_no']);
                  $isPanNumberPresent = $this->checkPanNumberPresent($data[$i]['pan_no']);
                  if($isEmailPresent == true || $isMobilePresent == true || $isPanNumberPresent == true){
                    $data[$i]['is_record_exist'] = 'true';
                  }else{
                    $data[$i]['is_record_exist'] = 'false';
                  }
                  array_push($dataImported, $data[$i]);
                }else{
                  return $this->dispatchResponse(404, "No Records Found!!", $dataImported);
                }

              }
              return $this->dispatchResponse(200, "Candidate List", $dataImported);
            } else {            
              return $this->dispatchResponse(404, "No Records Found!!", $dataImported);
            }
        }else{
          return $this->dispatchResponse(400, "Invalid File Type");
        }
    }
    return back();
  }

  function checkEmailPresent($email){
    $candidate = Candidate::where('email',$email)->first();
    // return $candidate;
    if (isset($candidate)) {
       // print_r("email is exists");
      return true;
    }else{
       // print_r("email is not exists");
      return false;
    }
  }

  function checkMobilePresent($mobileNumber){
    $candidate = Candidate::where('mobile_no',$mobileNumber)->first();
    if (isset($candidate)) {
       // print_r("mobile_no is exists");
      return true;
    }else{
       // print_r("mobile_no is not exists");
      return false;
    }
  }

  function checkPanNumberPresent($panNumber){
    $candidate = Candidate::where('pan_number',$panNumber)->first();
    if (isset($candidate)) {
       // print_r("pan_number is exists");
      return true;
    }else{
       // print_r("pan_number is not exists");
      return false;
    }
  }

  /*
  *  Function used to save csv file data as per format
  */
  public function importCandidateData(Request $request){
    try {
    $posted_data = Input::all();

    DB::beginTransaction();
      
      $objectCandidate = new Candidate();

      $now = new DateTime();
      $currentTime = $now->format('H:i:s.u');
      $formetedDate = $now->format('Y-m-d');
      $currentTimestamp = time();
      $model = [];
      foreach ($posted_data['data'] as $key => $value) {
          $posted_data['data'][$key]["timestamp"]=$currentTimestamp;
          $posted_data['data'][$key]["unique_token"]=$this->checkTokenExit($posted_data['data'][$key]["unique_token"]);
          $row = Candidate::create($posted_data['data'][$key]);
          if($row->id != null){
                $user_data["name"] = $posted_data['data'][$key]['first_name'].' '.$posted_data['data'][$key]['middle_name'].' '.$posted_data['data'][$key]['last_name'];
                  $user_data["email"] = $posted_data['data'][$key]['email'];
                  $user_data["mobile"] = $posted_data['data'][$key]['mobile_no'];
                  $user_data["password"] = $posted_data['data'][$key]['mobile_no'];
                  $user_data["role_id"] = 5;
                  $user_data["company_name"] = 'Candidate';
                  $user_data["password"] = Hash::make($posted_data['data'][$key]['mobile_no']);
                  $user_data["unique_token"] = $posted_data['data'][$key]["unique_token"];
                  $user_data["status"] ="Active";
                  // $user_data["unique_token"] = $posted_data['unique_token'];
                  User::create($user_data);
          }
          array_push($model, $row);

      }
      DB::commit();
      if($model){              
        return $this->dispatchResponse(200, "Candidate added Successfully...!!", $model);
      }else{
        return $this->dispatchResponse(401, "Candidate not added.");
      }
    } catch (\Exception $e) {
      DB::rollback();
      throw $e;
    } 
  }

  /*
  * API to Show list of candidates having filtered result as pr jd technology and 
  * client
  */
  public function getCandidateListByJDDetails(Request $request){
    $page = $request->page;
    $limit = $request->limit;

    $posted_data = Input::all();

    $query = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document','job_description','candidate_technical_result.users','candidate_user_assocs.users','candidate_bg_documents');

    if(Input::get()=="" || Input::get()==null ){
        $query->get();
    }

    // return $posted_data;

    if(isset($posted_data["technology_id"]) && isset($posted_data["job_description_id"])){
        $query = $query->whereIn('job_description_id',$posted_data["job_description_id"]);
    }

    if(isset($posted_data["status"]) && $posted_data["status"] == 'Joined'){
        $query->where("status","Joined");
    }else if(isset($posted_data["status"]) && $posted_data["status"] == 'Forwarded'){
        $query->where("status","Forwarded");
    }else if(isset($posted_data["status"]) && $posted_data["status"] == 'Pass'){
        $query->where("status","Pass");
    // }else if(isset($posted_data["status"]) && $posted_data["status"] == 'All'){
    //     $query->where("status","Selected")->where("status","Joined")->where("status","Forwarded")->where("status","Active")->where("status","Fail")->where("status","Pass");
    }

    if(($page != null && $page != 0) && ($limit != null && $limit != 0)){
        $candidateData = $query->orderBy('created_at', 'DESC')->paginate($limit);
    }else{
        $candidateData = $query->orderBy('created_at', 'DESC')->paginate(50);
    }

    if ($candidateData->first()) {
        return $this->dispatchResponse(200, "",$candidateData);
    }else{
        return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
    }
  }

}
