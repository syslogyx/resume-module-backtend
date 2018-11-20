<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\TechnicalInterviewResult;
use App\Candidate;

class TechnicalInterviewResultController extends BaseController
{
    /*
    *  Function to create question
    */
    function create(){

        $posted_data = Input::all();
    	// return $posted_data;
        DB::beginTransaction();
        try {        
            $object = new TechnicalInterviewResult();
            if ($object->validate($posted_data)) {
                $model = TechnicalInterviewResult::create($posted_data);
                $candidateData = Candidate::find((int) $posted_data['candidate_id']);
                $candidateData->status = $posted_data['status'];
                $candidateData->save();
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Question Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $object->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }
}
