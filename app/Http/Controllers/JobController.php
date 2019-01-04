<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\JobDescription;

class JobController extends BaseController
{
    /*
    *  Function to fetch job descrption list
    */
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;
        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $jobDescriptionData = JobDescription::paginate(50);
        }
        else{
            $jobDescriptionData = JobDescription::paginate($limit);
        }

        if ($jobDescriptionData->first()) {

            return $this->dispatchResponse(200, "", $jobDescriptionData);

        } else {
            
            // return $this->dispatchResponse(200, "No Records Found!!", $jobDescriptionData);
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /*
    *  Function to Get job descrption by id
    */
    function viewJob($id) {
        $model = JobDescription::find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, 'No Records Found!!');
        }
    }

    /*
    *  Function to create job descrption
    */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();

        try {        
            $objectJd = new JobDescription();
            $posted_data["job_code"] = 'SYS';
            if ($objectJd->validate($posted_data)) {
                $posted_data["status"] = 1;
                $model = JobDescription::create($posted_data);
                // $posted_data["job_code"] = $posted_data["job_code"].$model->id;
                $model->job_code = $model->job_code.$model->id;
                $model->save();
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Job Description Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectJd->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

    /*
    *  Function to update job descrption by id
    */
    function update($id) {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = JobDescription::find((int) $id);
            if ($model->validate($posted_data)) {                         
                if ($model->update($posted_data)){
                    DB::commit();
                    return $this->dispatchResponse(200, "Job Description Updated Successfully...!!", $model);
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

    /*
    *   Function to update job descrption status by id
    */
    function updateStatus($id){
        $posted_data = Input::all();
        //get jd by id
        $model = JobDescription::find((int) $id);
        if ($model){
            try{
                DB::beginTransaction();
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Status Updated Successfully...!!", $model);
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

    public function fetchActiveJd(){
        $jdData = JobDescription::where('status','=',1)->get();
        if($jdData->first()){
            return $this->dispatchResponse(200, "Data", $jdData);
        } else {            
            return $this->dispatchResponse(404, "No Records Found!!", $jdData);
        }
    }

    /*
    *   Function to get job descrption list by company_id
    */
    function getJobDescriptionListByCompanyId($company_id){
        $jdList = JobDescription::where('company_id','=',$company_id)->get();
        if($jdList->first()){
            return $this->dispatchResponse(200, "Data", $jdList);
        } else {            
            return $this->dispatchResponse(404, "No Records Found!!", $jdList);
        }
    }
    
}
