<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\JobDescription;

class JobController extends BaseController
{
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
            
            return $this->dispatchResponse(200, "No Records Found!!", $candidatejobDescriptionDataData);
        }
    }

    function viewJob($id) {
        $model = JobDescription::find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }

    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();

        try {        
            $objectJd = new JobDescription();
            $posted_data["job_code"] = 'SYS';
            if ($objectJd->validate($posted_data)) {
                $posted_data["status"] = "Active";
                $model = JobDescription::create($posted_data);
                $posted_data["job_code"] = $model->job_code.$model->id;
                $model->update($posted_data);
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


    // function update($id) {
    //     $posted_data = Input::all();

    //     try {
    //         DB::beginTransaction();
    //         $model = JobDescription::find((int) $id);

    //         if ($model->validate($posted_data)) {
    //             DB::commit();
    //             if ($model->update($posted_data))
    //                 return $this->dispatchResponse(200, "Job Description Updated Successfully...!!", $model);
    //         } else {
    //             DB::rollback();
    //             return $this->dispatchResponse(400,"Something went wrong.", $model->errors());
    //         }
    //     } catch (\Exception $e) {
    //         DB::rollback();
    //         throw $e;
    //     }
    // }
}
