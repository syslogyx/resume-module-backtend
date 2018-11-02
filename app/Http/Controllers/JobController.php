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
}
