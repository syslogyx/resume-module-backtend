<?php

namespace App\Http\Controllers;

use App\Company;
use App\JobDescription;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class JobController extends BaseController
{
    /*
     *  Function to fetch job descrption list
     */
    public function index(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;
        if (($page == null || $limit == null) || ($page == -1 || $limit == -1)) {
            $jobDescriptionData = JobDescription::with('companies', 'technologies')->paginate(50);
        } else {
            $jobDescriptionData = JobDescription::with('companies', 'technologies')->paginate($limit);
        }

        if ($jobDescriptionData->first()) {

            return $this->dispatchResponse(200, "Job Description List", $jobDescriptionData);

        } else {

            // return $this->dispatchResponse(200, "No Records Found!!", $jobDescriptionData);
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /*
     *  Function to fetch job descrption list
     */
    public function jdListWithFilter(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();

        $query = JobDescription::with('companies', 'technologies');

        if (Input::get() == "" || Input::get() == null) {
            $query->get();
        }

        if (isset($posted_data['technology_id'])) {
            $query = $query->where('technology_id', $posted_data['technology_id']);
        }

        if (($page != null && $page != 0) && ($limit != null && $limit != 0)) {
            $jobDescriptionData = $query->orderBy('created_at', 'DESC')->paginate($limit);
        } else {
            $jobDescriptionData = $query->orderBy('created_at', 'DESC')->paginate(50);
        }

        if ($jobDescriptionData->first()) {

            return $this->dispatchResponse(200, "Job Description List", $jobDescriptionData);

        } else {

            // return $this->dispatchResponse(200, "No Records Found!!", $jobDescriptionData);
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /*
     *  Function to Get job descrption by id
     */
    public function viewJob($id)
    {
        $model = JobDescription::with('companies', 'technologies')->find((int) $id);

        if ($model) {
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        } else {
            return $this->dispatchResponse(400, 'No Records Found!!');
        }
    }

    /*
     *  Function to create job descrption
     */
    public function create()
    {
        $posted_data = Input::all();
        DB::beginTransaction();

        try {
            $objectJd = new JobDescription();
            $posted_data["job_code"] = 'SYS';
            if ($objectJd->validate($posted_data)) {
                $posted_data["status"] = 1;
                $model = JobDescription::create($posted_data);
                // $posted_data["job_code"] = $posted_data["job_code"].$model->id;
                $model->job_code = $model->job_code . $model->id;
                $model->save();
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Job Description Created Successfully...!!", $model);
                }

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
    public function update($id)
    {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = JobDescription::find((int) $id);
            if ($model->validate($posted_data)) {
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Job Description Updated Successfully...!!", $model);
                }
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }

    /*
     *   Function to update job descrption status by id
     */
    public function updateStatus($id)
    {
        $posted_data = Input::all();
        //get jd by id
        $model = JobDescription::find((int) $id);
        if ($model) {
            try {
                DB::beginTransaction();
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Status Updated Successfully...!!", $model);
                } else {
                    DB::rollback();
                    return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
                }
            } catch (\Exception $e) {
                DB::rollback();
                throw $e;
            }
        }
    }

    public function fetchActiveJd()
    {
        $jdData = JobDescription::where('status', '=', 1)->get();
        if ($jdData->first()) {
            return $this->dispatchResponse(200, "Data", $jdData);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", $jdData);
        }
    }

    /*
     *   Function to get job descrption list by company_id
     */
    public function getJobDescriptionListByCompanyId($company_id)
    {
        $jdList = JobDescription::where('company_id', '=', $company_id)->get();
        if ($jdList->first()) {
            return $this->dispatchResponse(200, "Data", $jdList);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", $jdList);
        }
    }

    public function getLoginClientsJobDescriptionList(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();

        $clientID = Company::where('email', $posted_data['email'])->where('contact_no', $posted_data['contact_no'])->pluck('id')->first();

        $query = JobDescription::with('companies', 'technologies');

        if (Input::get() == "" || Input::get() == null) {
            $query->get();
        }

        if (isset($posted_data['technology_id'])) {
            $query = $query->where('technology_id', $posted_data['technology_id']);
        }

        if (($page == null || $limit == null) || ($page == -1 || $limit == -1)) {
            $model = $query->where('company_id', $clientID)->paginate(50);
        } else {
            $model = $query->where('company_id', $clientID)->paginate($limit);
        }

        if ($model->first()) {
            return $this->dispatchResponse(200, "Job Description List", $model);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", $model);
        }
    }

}
