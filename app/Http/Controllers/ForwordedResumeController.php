<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\forwordedResume;
use App\Candidate;
use App\Company;
use DateTime;

class ForwordedResumeController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Display a listing of the Forwarded Resumes.
     *
     * @return \Illuminate\Http\Response
     */
    public function filterForwardedResume(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;

        $posted_data = Input::all();
        $query = forwordedResume::with('candidates','candidates.candidate_achievements','candidates.candidate_hobbies','candidates.candidate_ind_exp','candidates.candidate_qualification.qualification','candidates.candidate_tech_skill','candidates.candidate_document','candidates.candidate_technical_result','candidates.job_description','job_description','companies','companies_tech_round_info');


        if(Input::get()=="" || Input::get()==null ){
            $query->get();
        }

        // return $posted_data;
        if(isset($posted_data["company_id"]) && isset($posted_data["job_description_id"])){
              $query->where("company_id",$posted_data["company_id"])->where("job_description_id",$posted_data["job_description_id"]);
        }

        if(isset($posted_data["candidate_id"])){
              $query->where("candidate_id",$posted_data["candidate_id"]);
        }

        if(($page != null && $page != 0) && ($limit != null && $limit != 0)){
            $forwardedResumesList = $query->paginate($limit);

        }
        else{
            $forwardedResumesList = $query->paginate(50);
        }

        if ($forwardedResumesList->first()) {
            return $this->dispatchResponse(200, "",$forwardedResumesList);
        }else{
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /*
    *  Function to create forwerded resume
    */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();

        $candidatesIds = [];
        // return $posted_data['data'];
        foreach ($posted_data['data'] as $key => $value) {
            // $posted_data['data'][$key]["cv_received_on_date"] = date("Y-m-d", strtotime(str_replace('/', '-', $posted_data['data'][$key]["cv_received_on_date"])));
            $posted_data['data'][$key]["data_sent_to_company_date"] = date('Y-m-d');
            $posted_data['data'][$key]["created_at"] = new DateTime();
            $posted_data['data'][$key]["updated_at"] =  new DateTime();
            array_push($candidatesIds, $posted_data['data'][$key]['candidate_id']);

        }

        // return $candidatesIds;

        $companyName = Company::where('id',$posted_data['data'][0]['company_id'])->pluck('name')->first();
        
        try {        
            $objectFd = new forwordedResume();
            if ($objectFd->validate($posted_data["data"])) {
                $model = forwordedResume::insert($posted_data["data"]);                
                DB::commit();
                if($model)
                    Candidate::whereIn('id',$candidatesIds)->update(array('status' => 'Forwarded'));
                    return $this->dispatchResponse(200, "Resume successfully forwarded to ".$companyName.".", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectFd->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

   
    /*
    *  Function to update forwerded resume
    */
    public function update(Request $request)
    {
        //
    }

    /*
    *  Function to update forwerded resume
    */
    public function updateForwaredResumeInfo($id)
    {
        $posted_data = Input::all();
        $model = forwordedResume::find($id);
        if ($model){
            try{
                DB::beginTransaction();
                if ($model->update($posted_data)) {
                    if($model->id){
                        if(isset($posted_data['candidate_id'])){
                            $candidateData = Candidate::find((int) $posted_data['candidate_id']);
                            // if($candidateData->status != 'Selected' && $candidateData->status != 'Joined'){
                                $candidateData->status = isset($posted_data['final_status'])? $posted_data['final_status'] : $posted_data['company_final_status'];
                                $candidateData->save();
                            // }else{                                
                            //     return $this->dispatchResponse(401,"Candidate is already selected.");
                            // }
                        }
                    }
                    DB::commit();
                    return $this->dispatchResponse(200, "Details saved Successfully...!!", $model);
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


}
