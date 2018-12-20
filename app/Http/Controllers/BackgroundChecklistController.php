<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\BackgroundChecklist;

class BackgroundChecklistController extends BaseController
{
    /* Function to fetch background checklist list */
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;

        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
            $backgroundChecklistData = BackgroundChecklist::paginate(50);
        }
        else{
            $backgroundChecklistData = BackgroundChecklist::paginate($limit);
        }

        if ($backgroundChecklistData->first()) {
            return $this->dispatchResponse(200, "", $backgroundChecklistData);
        } else {
        	// return $this->dispatchResponse(404, "No Records Found!!");
             return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /* Function to Get background checklist descrption by id */
    function viewBackgroundChecklist($id) {
        $model = BackgroundChecklist::find((int) $id);

        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }

    /* Function to create background checklist */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();
        try {        
            $objectBackgroundChecklist = new BackgroundChecklist();
            $posted_data["status"] = 1;
            $posted_data["mandatory"] = 1;
            if ($objectBackgroundChecklist->validate($posted_data)) {
                $model = BackgroundChecklist::create($posted_data);
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Background Checklist Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectBackgroundChecklist->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

    /* Function to update background checklist by id */
    function update($id) {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = BackgroundChecklist::find((int) $id);
            if ($model->validate($posted_data)) {                         
                if ($model->update($posted_data)){
                    DB::commit();
                    return $this->dispatchResponse(200, "Background Checklist Updated Successfully...!!", $model);
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

    /* Function to change background checklist status by id */
    function changeStatus($id){
        $posted_data = Input::all();
        $model = BackgroundChecklist::find((int) $id);
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

    function getAllBackgroundCheckList(){
        $backgroundChecklistData = BackgroundChecklist::all();
        if ($backgroundChecklistData){
          return response()->json(['status_code' => 200, 'message' => 'Background Check List', 'data' => $backgroundChecklistData]);
        }else{
          return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
