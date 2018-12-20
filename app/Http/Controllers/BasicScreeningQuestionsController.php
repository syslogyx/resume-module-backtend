<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use DateTime;
use App\BasicScreeningQuestions;

class BasicScreeningQuestionsController extends BaseController
{
    /*
    *  Function to fetch question list
    */
    function index(Request $request) {
        $page = $request->page;
        $limit = $request->limit;
        if(($page == null|| $limit == null) || ($page == -1 || $limit == -1)){
           $questionsData = BasicScreeningQuestions::with('stream')->paginate(50);
        }
        else{
           $questionsData = BasicScreeningQuestions::with('stream')->paginate($limit);
        }
        if ($questionsData->first()) {
           return $this->dispatchResponse(200, "Questions List", $questionsData);
        } else {
           return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }


    /*
    *  Function to Get question by id
    */
    function view($id) {
        $model = BasicScreeningQuestions::with('stream')->find((int) $id);
        if ($model){
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $model->errors());
        }
    }

    /*
    *  Function to create question
    */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();
        try {        
            $objectJd = new BasicScreeningQuestions();
            if ($objectJd->validate($posted_data)) {
                $model = BasicScreeningQuestions::create($posted_data);
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Question Created Successfully...!!", $model);
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
            $model = BasicScreeningQuestions::find((int) $id);
            if ($model->validate($posted_data)) {                         
                if ($model->update($posted_data)){
                    DB::commit();
                    return $this->dispatchResponse(200, "Question Updated Successfully...!!", $model);
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
}
