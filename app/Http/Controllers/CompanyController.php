<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Company;

class CompanyController extends BaseController
{
   	/* Function to fetch company list */
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;

        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $companyData = Company::paginate(50);
        }
        else{
            $companyData = Company::paginate($limit);
        }

        if ($companyData->first()) {
            return $this->dispatchResponse(200, "", $companyData);
        } else {
        	// return $this->dispatchResponse(404, "No Records Found!!");
             return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /* Function to Get company descrption by id */
    function viewCompany($id) {
        $model = Company::find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }

    /* Function to create company */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();
        try {        
            $objectCompany = new Company();
            $posted_data["status"] = 1;
            if ($objectCompany->validate($posted_data)) {
                $model = Company::create($posted_data);
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Company Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectCompany->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

    /* Function to update company by id */
    function update($id) {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = Company::find((int) $id);
            if ($model->validate($posted_data)) {                         
                if ($model->update($posted_data)){
                    DB::commit();
                    return $this->dispatchResponse(200, "Company Updated Successfully...!!", $model);
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
        $model = Company::find((int) $id);
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

}
