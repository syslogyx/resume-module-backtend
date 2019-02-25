<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Technology;
use App\JobDescription;
use App\Candidate;

class TechnologyController extends BaseController
{
    /* Function to fetch Technology list */
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;

        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $technologyData = Technology::paginate(50);
        }
        else{
            $technologyData = Technology::paginate($limit);
        }

        if ($technologyData->first()) {
            return $this->dispatchResponse(200, "Technology List", $technologyData);
        } else {
        	// return $this->dispatchResponse(404, "No Records Found!!");
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /* Function to Get Technology descrption by id */
    function viewTechnology($id) {
        $model = Technology::find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, 'No Records Found!!');
        }
    }

    /* Function to create Technology */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();
        try {        
            $objectTechnology = new Technology();
            $posted_data["status"] = 1;
            if ($objectTechnology->validate($posted_data)) {
                $model = Technology::create($posted_data);                
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Technology Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectTechnology->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

    /* Function to update Technology by id */
    function update($id) {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = Technology::find((int) $id);
            if ($model->validate($posted_data)) {    
            	if ($model->update($posted_data)){                     
	                DB::commit();
	                return $this->dispatchResponse(200, "Technology Updated Successfully...!!", $model);
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

    /* Function to chasnge job status by id */
    function changeStatus($id){
        $posted_data = Input::all();
        $model = Technology::find((int) $id);
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

    /* Function to fetch active Technology list */
    function activeTechnologyList(Request $request) {
        $TechnologyData = Technology::where("status",1)->get();

        if ($TechnologyData->first()) {
            return $this->dispatchResponse(200, "Technology List", $TechnologyData);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", null);
        }
    }


    function getTechnologyAccordingToJobDescription(){
        $technologiesData = Technology::where("status",1)->get();

        if ($technologiesData){
            foreach ($technologiesData  as &$data) {
                //set technology id
                $technology_id = $data['id'];
                //retrive count of jd as per technology
                $data['job_description_count'] = JobDescription::where('technology_id',$technology_id)->count();
                //retrive total no of requirement of jd
                $data['total_no_of_requiremet_count'] = JobDescription::where('technology_id',$technology_id)->sum('no_of_requiremet');
                //get Jd id's
                $jd_data_ids = JobDescription::where('technology_id',$technology_id)->pluck('id');

                $data['jd_ids'] = $jd_data_ids;

                $data['shortlisted_candidates_count'] = Candidate::where('status','Pass')->whereIN('job_description_id', $jd_data_ids)->count();

                $data['forwarded_candidates_count'] = Candidate::where('status','Forwarded')->whereIN('job_description_id', $jd_data_ids)->count();
                
                $data['joined_candidates_count'] = Candidate::where('status','Joined')->whereIN('job_description_id', $jd_data_ids)->count();

            }
          return response()->json(['status_code' => 200, 'message' => 'Technology List', 'data' => $technologiesData]);
        }else{
          return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
