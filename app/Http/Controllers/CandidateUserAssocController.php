<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\CandidateUserAssoc;
use App\Candidate;
use App\User;
use DateTime;

class CandidateUserAssocController extends BaseController
{
    /**
    * API to fetch data according applied filter.
    **/
    function filterUserAssoc(Request $request){

        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();
        $query = CandidateUserAssoc::with('users','candidates');
        //return $posted_data;
        if(Input::get()=="" || Input::get()==null ){
            $query->get();
        }

        if(Input::get("user_id")){
            $query->where("user_id",Input::get("user_id"));
        } 

        if(($page != null && $page != -1) && ($limit != null && $limit != -1)){
            $candidateDetails = $query->paginate($limit);
        }
        else{
            $candidateDetails = $query->paginate(50);
        }

        if ($candidateDetails->first()) {
            return $this->dispatchResponse(200, "",$candidateDetails);
        }else{
            return $this->dispatchResponse(200, "No Records Found!!",null);
        }

    }


    /**
    *   Function used to assign interviewer to a candidate
    **/
    public function assignInterviewerToCandidate(){
    	$posted_data = Input::all();
    	$data = [];
        if($posted_data['users_list'] != null){
        	foreach ($posted_data['users_list'] as $key => $value) {
                $data["user_id"] = $value;
                $data["candidate_id"] = $posted_data['candidate_id'];
                $data["technical_round"] = $posted_data['technical_round'];
                $data["schedule_date"] = $posted_data['schedule_date'];
                $scheduledTime = preg_replace('/\s*:\s*/', ':', $posted_data['schedule_time']);                    
                $data["schedule_time"] = date("H:i", strtotime($scheduledTime));
                $data["mode_of_interview"] = $posted_data['mode_of_interview'];
                $data["created_at"] = new DateTime();
                $data["updated_at"] =  new DateTime();
                $datas[] = $data;            
        	}
        }
    	DB::beginTransaction();
        try { 
            $object = new CandidateUserAssoc();			    
            if ($object->validate($datas)) {
                $model = CandidateUserAssoc::insert($datas);
                $candidateData = Candidate::find((int) $posted_data['candidate_id']);
                $candidateData->status = 'Schedule';
                $candidateData->save();
               DB::commit();	       
                if($model){
	              return $this->dispatchResponse(200, "Interview scheduled Successfully...!!", $model);
	            }else{
	              return $this->dispatchResponse(401, "Interview not scheduled.");
	            }
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $object->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    	
    }
}
