<?php

namespace App\Http\Controllers;

use App\BasicScreeningQuestions;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class BasicScreeningQuestionsController extends BaseController
{
    /*
     *  Function to fetch question list
     */
    public function index(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;

        if (Input::get() == "" || Input::get() == null) {
            $query->get();
        }

        if (($page == null || $limit == null) || ($page == -1 || $limit == -1)) {
            $questionsData = BasicScreeningQuestions::with('stream')->paginate(50);
        } else {
            $questionsData = BasicScreeningQuestions::with('stream')->paginate($limit);
        }
        if ($questionsData->first()) {
            return $this->dispatchResponse(200, "Questions List", $questionsData);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /*
     *  Function to fetch question list with applied filter data
     */
    public function filterList(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();

        $query = BasicScreeningQuestions::with('stream');

        if (Input::get() == "" || Input::get() == null) {
            $query->get();
        }

        // return $posted_data["stream_id"];
        if (isset($posted_data["stream_id"])) {
            $query->whereIn("stream_id", $posted_data["stream_id"]);
        }

        if (($page == null || $limit == null) || ($page == -1 || $limit == -1)) {
            $questionsData = $query->where('status', 1)->paginate(50);
        } else {
            $questionsData = $query->where('status', 1)->paginate($limit);
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
    public function view($id)
    {
        $details = BasicScreeningQuestions::with('stream')->find((int) $id);
        if ($details) {
            return response()->json(['status_code' => 200, 'message' => 'Question Details', 'data' => $details]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Details not found']);
        }
    }

    /*
     *  Function to create question
     */
    public function create()
    {
        $posted_data = Input::all();
        DB::beginTransaction();
        try {
            $objectJd = new BasicScreeningQuestions();
            $posted_data["status"] = 1;
            if ($objectJd->validate($posted_data)) {
                $model = BasicScreeningQuestions::create($posted_data);
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Question Created Successfully...!!", $model);
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
            $model = BasicScreeningQuestions::find((int) $id);
            $posted_data["status"] = 1;
            if ($model->validate($posted_data)) {
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Question Updated Successfully...!!", $model);
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

    /* Function to change background checklist status by id */
    public function changeStatus($id)
    {
        $posted_data = Input::all();
        $model = BasicScreeningQuestions::find((int) $id);
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
}
