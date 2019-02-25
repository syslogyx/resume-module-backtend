<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use App\Company;
use App\User;

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
            return $this->dispatchResponse(200, "Client List", $companyData);
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
            return $this->dispatchResponse(400, 'No Records Found!!');
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
                if ($model->id) {
                    $user_data["name"] = $posted_data['name'];
                    $user_data["email"] = $posted_data['email'];
                    $user_data["mobile"] = $posted_data['contact_no'];
                    $user_data["password"] = $posted_data['contact_no'];
                    $user_data["role_id"] = 6;
                    $user_data["company_name"] = $posted_data['name'];
                    $user_data["password"] = Hash::make($posted_data['contact_no']);
                    $user_data["status"] = "Active";
                    User::create($user_data);
                }
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Client Created Successfully...!!", $model);
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
            $oldEmailId = $model->email;
            $oldMobile = $model->contact_no;
            if ($model->validate($posted_data)) {                         
                if ($model->update($posted_data)){
                    // if ($model->id) {
                    //     $user_data["name"] = $posted_data['name'];
                    //     $user_data["email"] = $posted_data['email'];
                    //     $user_data["mobile"] = $posted_data['contact_no'];
                    //     $user_data["password"] = $posted_data['contact_no'];
                    //     $user_data["role_id"] = 6;
                    //     $user_data["company_name"] = $posted_data['name'];
                    //     $user_data["password"] = Hash::make($posted_data['contact_no']);
                    //     $user_data["status"] ="Active";
                    //     User::create($user_data);
                    // }

                    $user_name = $posted_data['name'];
                    $user_email = $posted_data['email'];
                    $user_mobile = $posted_data['contact_no'];
                    $user_pwd = Hash::make($posted_data['contact_no']);

                    User::where('email','=',$oldEmailId)->where('mobile','=',$oldMobile)->update(['name'=>$user_name,'email'=>$user_email,'mobile'=>$user_mobile,'password'=>$user_pwd]);
                    DB::commit();
                    return $this->dispatchResponse(200, "Client Updated Successfully...!!", $model);
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

    /* Function to fetch active company list */
    function activeCompanyList(Request $request) {
        $companyData = Company::where("status",1)->get();
        if ($companyData->first()) {
            return $this->dispatchResponse(200, "Client List", $companyData);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", null);
        }
    }

}
