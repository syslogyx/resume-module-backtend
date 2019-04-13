<?php

namespace App\Http\Controllers;

use App\Candidate;
use App\TechnicalInterviewResult;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class TechnicalInterviewResultController extends BaseController
{
    /*
     *  Function to create question
     */
    public function create()
    {
        $posted_data = Input::all();
        DB::beginTransaction();
        try {
            $object = new TechnicalInterviewResult();
            if ($object->validate($posted_data)) {
                $model = TechnicalInterviewResult::create($posted_data);
                $candidateData = Candidate::find((int) $posted_data['candidate_id']);
                $candidateData->status = $posted_data['status'];
                $candidateData->save();
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Saved Successfully...!!", $model);
                }

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
