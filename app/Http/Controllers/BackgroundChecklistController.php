<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\BackgroundChecklist;
use App\CandidatesChecklistDocs;

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
            // $posted_data["type"] = 'file';
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

    /* Function to get all background checklist of candiadate id */
    function getAllBackgroundCheckList(Request $request){
        $id = $request->candidate_id;
        $unique_bg_checklist_ids_array =[];

        $candidateUploadedBgChecklistIDArray = CandidatesChecklistDocs::where('candidate_id',$id)->pluck('bg_checklist_id')->toArray();
        
        $unique_bg_checklist_ids=array_unique($candidateUploadedBgChecklistIDArray);

        foreach ($unique_bg_checklist_ids as $key => $value) {
           array_push($unique_bg_checklist_ids_array, $value);
        }

        $uniqueBgChecklistIDCount = count($unique_bg_checklist_ids_array);

        // if(count($unique_bg_checklist_ids) <= 0){
        //     $backgroundChecklistData = BackgroundChecklist::all();
        // }else{
        //     $backgroundChecklistData = BackgroundChecklist::whereNotIn('id', $unique_bg_checklist_ids)
        //             ->get();
        // }
        $backgroundChecklistData = BackgroundChecklist::where('status',1)->get();

        foreach($backgroundChecklistData as $row) {
            $row['displayFlag'] = 'True';
        }

        if($uniqueBgChecklistIDCount > 0){
            for($i=0;$i<$uniqueBgChecklistIDCount;$i++){
                foreach($backgroundChecklistData as $row) {
                    if($row['id'] == $unique_bg_checklist_ids_array[$i]){
                        $row['displayFlag'] = 'False';
                    }
                } 
            }
        }
        
        if ($backgroundChecklistData){
            return response()->json(['status_code' => 200, 'message' => 'Background Check List', 'data' => $backgroundChecklistData]);
        }else{
            return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
