<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\CandidateUserAssoc;

class UserController extends BaseController
{
    
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;
        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $user = User::with('role')->orderBy('name', 'asc')->paginate(50);
        }
        else{
            $user = User::with('role')->orderBy('name', 'asc')->paginate($limit);
        }
        if ($user->first()) {
            return $this->dispatchResponse(200, "Record found successfully.", $user);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", $user);
        }
    }

    function selectedUser(Request $request) {
        $page = $request->page;
        $limit = $request->limit;
        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $user = User::where('role_id',3)->with('role')->orderBy('name', 'asc')->paginate(50);
        }
        else{
            $user = User::where('role_id',3)->with('role')->orderBy('name', 'asc')->paginate($limit);
        }
        if ($user->first()) {
            return $this->dispatchResponse(200, "Record found successfully.", $user);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", $user);
        }
    }

    function create() {
        $posted_data = Input::all();
        DB::beginTransaction();
        try {        
            $objectUser = new User();
            $posted_data["status"] ="Active";
            if ($objectUser->validate($posted_data)) {
                $posted_data["password"] = trim($posted_data["password"]);
                $posted_data["password"] = Hash::make($posted_data["password"]);
                $posted_data["unique_token"] =isset($posted_data["unique_token"])?$posted_data["unique_token"]:base64_encode($posted_data['email'].$posted_data['mobile'].$posted_data['company_name']);
                // $posted_data["data"] =base64_decode($posted_data["unique_token"]);
                // return $posted_data;
                $model = User::create($posted_data);
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "User Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectUser->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }        
    }

    function update($id) {
        $posted_data = Input::all();

        // return $posted_data;
        try {
            DB::beginTransaction();
            $model = User::find((int) $id);

            if ($model->validate($posted_data)) {
                if($posted_data['password'] == '') {
                    unset($posted_data['password']);
                }else{
                    $posted_data['password']=Hash::check('plain-text', $posted_data['password'])?$posted_data['password']:Hash::make($posted_data['password']);
                }                
                if ($model->update($posted_data)){
                    DB::commit();
                    return $this->dispatchResponse(200, "User Updated Successfully...!!", $model);
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

    function view($id) {
        $model = User::with('role')->find((int) $id);

        if ($model)
            return $this->dispatchResponse(200, "Records Found...!!", $model);
    }

    /*
    *  Function to get initial alphabet list of users
    */
    public function getListOfUserOrderByAlphabets($type){
        if($type =='all'){      
            return $alphabetsArray = User::selectRaw('substr(upper(name),1,1) as letter')->whereNotIn("role_id",[5,6])->distinct()->orderBy('letter')->get()->pluck('letter')->toArray();
        }else if($type =='candidate'){
            return $alphabetsArray = User::selectRaw('substr(upper(name),1,1) as letter')->where("role_id",5)->distinct()->orderBy('letter')->get()->pluck('letter')->toArray();
        }else if($type =='client'){
            return $alphabetsArray = User::selectRaw('substr(upper(name),1,1) as letter')->where("role_id",6)->distinct()->orderBy('letter')->get()->pluck('letter')->toArray();
        }
    }

    function filterUsers(Request $request){
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();

        $query = User::with('role');
        
        if(Input::get()=="" || Input::get()==null ){
            $query->get();
        }

        if(Input::get("user_id")){
            $query->where("id",Input::get("user_id"));    
        }

        // to filter according to alphabets
        if(isset($posted_data['search_alphabet']) && $posted_data['search_alphabet'] != 'All'){
            $query->where('name','LIKE',$posted_data['search_alphabet']."%");
        }

        if(isset($posted_data["role_id"]) && $posted_data["role_id"] == 'all'){
            $query->whereNotIn("role_id",[5,6]);    
        }else if(isset($posted_data["role_id"]) && $posted_data["role_id"] == 'candidate'){
            $query->where("role_id",5);
        }else if(isset($posted_data["role_id"]) && $posted_data["role_id"] == 'client'){
            $query->where("role_id",6);
        }



        // if(Input::get("designantions_id")){
        //     $query->where("designation_id",Input::get("designantions_id"));        
        // }

        // if(Input::get("contact_email")){
        //     $query->where("email",Input::get("contact_email"));        
        // }

        // if(Input::get("user_id") && Input::get("designantions_id") && !Input::get("contact_email")){
        //     $query->where("id",Input::get("user_id"))
        //           ->where("designation_id",Input::get("designantions_id"));
        // }

        // if(Input::get("user_id") && Input::get("contact_email") && !Input::get("designantions_id")){
        //     $query->where("id",Input::get("user_id"))
        //           ->where("email",Input::get("contact_email"));       
        // }

        // if(Input::get("contact_email") && Input::get("designantions_id") && !Input::get("user_id")){
        //     $query->where("email",Input::get("contact_email"))
        //           ->where("designation_id",Input::get("designantions_id"));
        // }

        // if(Input::get("user_id") && Input::get("contact_email") && Input::get("designantions_id")){
        //     $query->where("id",Input::get("user_id"))
        //           ->where("email",Input::get("contact_email"))
        //           ->where("designation_id",Input::get("designantions_id"));
        // }

        if(($page != null && $page != 0) && ($limit != null && $limit != 0)){
            $userList = $query->orderBy('name', 'asc')->paginate($limit);
        }
        else{
            $userList = $query->orderBy('name', 'asc')->paginate(50);
        }

        if ($userList->first()) {
            return $this->dispatchResponse(200, "",$userList);
        }else{
            return $this->dispatchResponse(404, "No Records Found!!",null);
        }

    }

    /**
    *   To fetch list of user having role interviewer
    **/
    function getUsersByInterviewerRoleId(){
        $userData = User::where('role_id','=',4)->get();
        if($userData->first()){
            return $this->dispatchResponse(200, "Data", $userData);
        } else {            
            return $this->dispatchResponse(404, "No Records Found!!", $userData);
        }
    }


    function getUserByCandidateIdAndJdId(){
        $posted_data = Input::all();
        $userId = CandidateUserAssoc::where('candidate_id',$posted_data['candidate_id'])->where('job_description_id',$posted_data['job_description_id'])->pluck('user_id');
        
        if(count($userId) == 0){
            $userData = User::where('role_id','=',4)->get();
        }else{
            $userData = User::where('role_id','=',4)->whereNotIn('id',$userId)->get();
        }
        if($userData->first()){
            return $this->dispatchResponse(200, "Data", $userData);
        } else {            
            return $this->dispatchResponse(404, "No Records Found!!", $userData);
        }
    }


    function changePassword() {
        $posted_data = Input::all();
        DB::beginTransaction();
        try {
            $newPassword = trim($posted_data["new_password"]);
            $posted_data["new_password"] = Hash::make($newPassword);
             
            $user_data = User::find((int)$posted_data["user_id"]);
            if($posted_data["old_password"] != NULL){
                if(Hash::check($posted_data["old_password"], $user_data->password)){
                    $user_data->password = $posted_data["new_password"];
                    $user_data->update();
                    DB::commit();
                    if($user_data)
                        return $this->dispatchResponse(200, "Password changed successfully...!!", $user_data);
                }
                else{
                    DB::rollback();
                    return $this->dispatchResponse(400, "Old password is not matched.", $user_data->errors());
                }
            }
            else{  
                $user_data->password = $posted_data["new_password"];
                $user_data->update();
                DB::commit();
                if($user_data)
                   return $this->dispatchResponse(200, "Password changed successfully...!!", $user_data);
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }        
    }

}