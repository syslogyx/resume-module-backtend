<?php

namespace App\Http\Controllers;

use App\Candidate;
use App\CandidateUserAssoc;
use App\User;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class CandidateUserAssocController extends BaseController
{
    /**
     * API to fetch data according applied filter.
     **/
    public function filterUserAssoc(Request $request)
    {

        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();
        $id = $posted_data['user_id'];
        $jd_id = $posted_data['job_description_id'];

        $query = CandidateUserAssoc::with('users', 'all_candidates', 'job_description', 'all_candidates.candidate_technical_result');

        if (isset($posted_data["job_description_id"]) && isset($posted_data["user_id"])) {
            $query = CandidateUserAssoc::with('users', 'all_candidates', 'job_description')->with(array('all_candidates.candidate_technical_result' => function ($que) use ($id, $jd_id) {
                $que->where('user_id', $id)->where('job_description_id', $jd_id)->get();
            }))->where("user_id", $id)->where('job_description_id', $jd_id);
        }
        if (isset($posted_data["job_description_id"])) {
            $query->where("job_description_id", $posted_data["job_description_id"]);
        }

        if (isset($posted_data["user_id"])) {
            $query->where("user_id", $posted_data["user_id"]);
        }

        if (isset($posted_data["schedule_date"])) {
            $query->where('schedule_date', $posted_data['schedule_date']);
        }

        if (isset($posted_data["candidate_id"])) {
            $query->where('candidate_id', $posted_data['candidate_id']);
        }

        if (($page != null && $page != -1) && ($limit != null && $limit != -1)) {
            $candidateDetails = $query->paginate($limit);
        } else {
            $candidateDetails = $query->paginate(50);
        }

        if ($candidateDetails->first()) {
            return $this->dispatchResponse(200, "", $candidateDetails);
        } else {
            // return $this->dispatchResponse(404, "No Records Found!!",$candidateDetails);
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }

    }

    /**
     *   Function used to Schedule interview of a candidate
     **/
    public function assignInterviewerToCandidate()
    {
        $posted_data = Input::all();
        //provision for multiple interviewers
        // $data = [];
        // if($posted_data['users_list'] != null){
        //     foreach ($posted_data['users_list'] as $key => $value) {
        //         $data["user_id"] = $value;
        //         $data["candidate_id"] = $posted_data['candidate_id'];
        //         $data["technical_round"] = $posted_data['technical_round'];
        //         $data["schedule_date"] = $posted_data['schedule_date'];
        //         $scheduledTime = preg_replace('/\s*:\s*/', ':', $posted_data['schedule_time']);
        //         $data["schedule_time"] = date("H:i", strtotime($scheduledTime));
        //         $data["mode_of_interview"] = $posted_data['mode_of_interview'];
        //         $data["created_at"] = new DateTime();
        //         $data["updated_at"] =  new DateTime();
        //         $datas[] = $data;
        //     }
        // }
        DB::beginTransaction();
        try {
            $object = new CandidateUserAssoc();
            if ($object->validate($posted_data)) {
                // $model = CandidateUserAssoc::insert($posted_data);
                $model = CandidateUserAssoc::create($posted_data);
                $candidateData = Candidate::find((int) $posted_data['candidate_id']);
                $candidateData->status = 'Schedule';
                $candidateData->save();
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Interview scheduled Successfully...!!", $model);
                } else {
                    return $this->dispatchResponse(401, "Interview not scheduled.");
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

    /**
     * Function used to reSchedule interview of a candidate
     **/
    public function rescheduleInterview($id)
    {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = CandidateUserAssoc::find((int) $id);
            if ($model->validate($posted_data)) {
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Interview Rescheduled Successfully...!!", $model);
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

    /**
     *  Function used to get today's scheduled interview list according to logged user
     *  id
     **/
    public function getTodaysInterviewListByUserId(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;
        $posted_data = Input::all();
        $id = $posted_data['user_id'];
        $jd_id = $posted_data['job_description_id'];

        $current_date = new DateTime();

        $query = CandidateUserAssoc::with('users', 'all_candidates', 'job_description', 'all_candidates.candidate_technical_result');

        if (isset($posted_data["user_id"]) && isset($posted_data["job_description_id"])) {
            $query = CandidateUserAssoc::with('job_description')->with(array('all_candidates.candidate_technical_result' => function ($que) use ($id, $jd_id) {
                $que->where('user_id', $id)->where('job_description_id', $jd_id)->get();
            }))->where("user_id", $id)->where('job_description_id', $jd_id);
        }

        if (($page != null && $page != -1) && ($limit != null && $limit != -1)) {
            $candidateDetails = $query->where('schedule_date', $current_date->format('Y-m-d'))->paginate($limit);
        } else {
            $candidateDetails = $query->where('schedule_date', $current_date->format('Y-m-d'))->paginate(50);
        }

        if ($candidateDetails->first()) {
            return $this->dispatchResponse(200, "", $candidateDetails);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }
}
