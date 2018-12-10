<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use DateTime;
use App\BasicScreeningResults;
use App\Candidate;

class BasicScreeningResultController extends BaseController
{
    /*
    *  Function to create Result
    */
    function create(){
        $posted_data = Input::all();  
        $candidateId = $posted_data['result_data'][0]['candidate_id']; 
        $status = $posted_data['result_data'][0]['status']; 
        if($status == 'Pass'){
            $status = 'Clear';
        }
        foreach ($posted_data['result_data'] as $key => $value) {
            $posted_data['result_data'][$key]["created_at"] = new DateTime();
            $posted_data['result_data'][$key]["updated_at"] =  new DateTime();
           
        }       
        DB::beginTransaction();
        try { 
            $objectResult = new BasicScreeningResults();
		    // return $posted_data['result_data'];
            if ($objectResult->validate($posted_data['result_data'])) {

                $model = BasicScreeningResults::insert($posted_data['result_data']);
                $candidateData = Candidate::find((int) $candidateId);
                $candidateData->status = $status;
				$candidateData->save();
                DB::commit();	       
                if($model){
	              return $this->dispatchResponse(200, "Data saved Successfully...!!", $model);
	            }else{
	              return $this->dispatchResponse(401, "Data not saved.");
	            }
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectResult->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }
}
