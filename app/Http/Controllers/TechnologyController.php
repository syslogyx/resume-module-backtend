<?php

namespace App\Http\Controllers;

use App\Candidate;
use App\CandidateUserAssoc;
use App\Company;
use App\JobDescription;
use App\Technology;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class TechnologyController extends BaseController
{
    /* Function to fetch Technology list */
    public function index(Request $request)
    {
        $page = $request->page;
        $limit = $request->limit;

        if (($page == null || $limit == null) || ($page == -1 || $limit == -1)) {
            $technologyData = Technology::paginate(50);
        } else {
            $technologyData = Technology::paginate($limit);
        }

        if ($technologyData->first()) {
            return $this->dispatchResponse(200, "Technology List", $technologyData);
        } else {
            // return $this->dispatchResponse(404, "No Records Found!!");
            return response()->json(['status_code' => 404, 'message' => 'No Records Found!!']);
        }
    }

    /* Function to Get Technology descrption by id */
    public function viewTechnology($id)
    {
        $model = Technology::find((int) $id);

        if ($model) {
            return $this->dispatchResponse(200, "Records Found...!!", $model);
        } else {
            return $this->dispatchResponse(400, 'No Records Found!!');
        }
    }

    /* Function to create Technology */
    public function create()
    {
        $posted_data = Input::all();
        DB::beginTransaction();
        try {
            $objectTechnology = new Technology();
            $posted_data["status"] = 1;
            if ($objectTechnology->validate($posted_data)) {
                $model = Technology::create($posted_data);
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Technology Created Successfully...!!", $model);
                }

            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectTechnology->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }

    /* Function to update Technology by id */
    public function update($id)
    {
        $posted_data = Input::all();
        try {
            DB::beginTransaction();
            $model = Technology::find((int) $id);
            if ($model->validate($posted_data)) {
                if ($model->update($posted_data)) {
                    DB::commit();
                    return $this->dispatchResponse(200, "Technology Updated Successfully...!!", $model);
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

    /* Function to chasnge job status by id */
    public function changeStatus($id)
    {
        $posted_data = Input::all();
        $model = Technology::find((int) $id);
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

    /* Function to fetch active Technology list */
    public function activeTechnologyList(Request $request)
    {
        $TechnologyData = Technology::where("status", 1)->get();

        if ($TechnologyData->first()) {
            return $this->dispatchResponse(200, "Technology List", $TechnologyData);
        } else {
            return $this->dispatchResponse(404, "No Records Found!!", null);
        }
    }

    public function getTechnologyAccordingToJobDescription(Request $request)
    {
        $technologiesData = Technology::where("status", 1)->get();
        $posted_data = Input::all();

        $clientID = Company::where('email', $posted_data['email'])->where('contact_no', $posted_data['contact_no'])->pluck('id')->first();

        if ($technologiesData) {
            foreach ($technologiesData as &$data) {
                //set technology id
                $technology_id = $data['id'];
                //retrive count of jd as per technology
                $data['job_description_count'] = JobDescription::where('technology_id', $technology_id)->where('company_id', $clientID)->count();
                //retrive total no of requirement of jd
                $data['total_no_of_requiremet_count'] = JobDescription::where('technology_id', $technology_id)->where('company_id', $clientID)->sum('no_of_requiremet');
                //get Jd id's
                $jd_data_ids = JobDescription::where('technology_id', $technology_id)->where('company_id', $clientID)->pluck('id');

                $data['jd_ids'] = $jd_data_ids;

                $data['shortlisted_candidates_count'] = Candidate::where('status', 'Pass')->whereIN('job_description_id', $jd_data_ids)->count();

                $data['forwarded_candidates_count'] = Candidate::where('status', 'Forwarded')->whereIN('job_description_id', $jd_data_ids)->count();

                $data['joined_candidates_count'] = Candidate::where('status', 'Joined')->whereIN('job_description_id', $jd_data_ids)->count();

            }
            return response()->json(['status_code' => 200, 'message' => 'Technology List', 'data' => $technologiesData]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }

    /*
     *   API to get Client details on dashboard page
     */
    public function getClientDashboardDetails(Request $request)
    {
        if ($request->isMethod('POST')) {
            $posted_data = Input::all();

            $clientID = Company::where('email', $posted_data['email'])->where('contact_no', $posted_data['contact_no'])->pluck('id')->first();

            $tec_data_ids = JobDescription::where('company_id', $clientID)->pluck('technology_id');

            $technologiesData = Technology::select('id', 'name', 'status')->whereIn('id', $tec_data_ids)->where("status", 1)->get();

            // return $technologiesData;

            $responsedata["technology_details"] = [];
            if ($clientID) {
                $jdID = [];
                if (count($technologiesData) > 0) {
                    foreach ($technologiesData as &$data) {
                        $technology_id = $data['id'];
                        $jd_data_ids = JobDescription::where('technology_id', $technology_id)->where('company_id', $clientID)->pluck('id');
                        $data['jd_ids'] = $jd_data_ids;
                        $data['total_candidate_count'] = Candidate::whereIN('job_description_id', $jd_data_ids)->count();
                        $data['selected_candidates_count'] = Candidate::where('status', 'Selected')->whereIN('job_description_id', $jd_data_ids)->count();
                        $data['shortlist_through_other_vendor'] = '0';
                        $data['joinded_directly_tcs'] = '0';

                        $data['joined_somewhere_else'] = Candidate::where('status', 'Join Somewhere Else')->whereIN('job_description_id', $jd_data_ids)->count();

                        $data['rejected'] = Candidate::where('status', 'Fail')->orwhere('status', 'Rejected')->whereIN('job_description_id', $jd_data_ids)->count();

                        $data['no_response_from_Candidate'] = Candidate::where('status', 'No Response from Candidate')->whereIN('job_description_id', $jd_data_ids)->count();

                        $data['expecting_high_ctc'] = Candidate::where('status', 'Expecting High CTC')->whereIN('job_description_id', $jd_data_ids)->count();

                        $data['bgc_form_not_shared_not_interested_candidate'] = Candidate::where('status', 'BGC Form not shared / candidate not interested')->whereIN('job_description_id', $jd_data_ids)->count();
                        if (count($jd_data_ids) > 0) {
                            array_push($jdID, $jd_data_ids);
                        }

                        array_push($responsedata["technology_details"], $data);

                    }
                    $responsedata['total_no_of_client_cv'] = Candidate::whereIN('job_description_id', $jdID)->count();
                    return response()->json(['status_code' => 200, 'message' => 'Data', 'data' => $responsedata]);
                } else {
                    return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
                }
            } else {
                return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
            }
        }
    }

    /*
     *   API to get Admin details on dashboard page
     */
    public function getAdminDashboardDetails(Request $request)
    {
        if ($request->isMethod('GET')) {
            $responsedata = [];
            $jd_count = JobDescription::where('status', 1)->count();
            $client_count = Company::where('status', 1)->count();

            $responsedata['total_jd_count'] = $jd_count;
            $responsedata['total_client_count'] = $client_count;
            $responsedata['technology_details'] = [];
            // $responsedata['joined_technology_details'] = [];
            $responsedata['candidate_mgmt_details'] = [];

            $technologiesData = Technology::select('id', 'name', 'status')->where("status", 1)->get();

            if (count($technologiesData) > 0) {
                // to set overall candidates technologies detials
                foreach ($technologiesData as &$data1) {
                    $technology_id = $data1['id'];
                    $jd_data_ids = JobDescription::where('technology_id', $technology_id)->pluck('id');
                    $data1['jd_ids'] = $jd_data_ids;
                    $data1['total_overall_candidate_count'] = Candidate::whereIN('job_description_id', $jd_data_ids)->count();
                    $data1['total_joined_candidate_count'] = Candidate::whereIN('job_description_id', $jd_data_ids)->where('status', 'Joined')->count();

                    array_push($responsedata['technology_details'], $data1);
                }

                $responsedata['candidate_mgmt_details']['shortlisted_candidates_count'] = Candidate::where('status', 'Pass')->count();

                $responsedata['candidate_mgmt_details']['forwarded_candidates_count'] = Candidate::where('status', 'Forwarded')->count();

                $responsedata['candidate_mgmt_details']['joined_candidates_count'] = Candidate::where('status', 'Joined')->count();

                $responsedata['candidate_mgmt_details']['inprogress_interviews_count'] = Candidate::where('status', 'Clear')->orwhere('status', 'Schedule')->count();

                $responsedata['candidate_mgmt_details']['onbording'] = Candidate::where('status', 'Selected')->count();

                return response()->json(['status_code' => 200, 'message' => 'Data', 'data' => $responsedata]);
            } else {
                return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
            }
        } else {
            return response()->json(['status_code' => 405, 'message' => 'Method Not Allowed']);
        }
    }

    /*
     *   API to get HR details on dashboard page
     */
    public function getHrDashboardDetails(Request $request)
    {
        if ($request->isMethod('GET')) {
            $responsedata = [];
            $jd_count = JobDescription::where('status', 1)->count();
            $client_count = Company::where('status', 1)->count();

            $responsedata['total_jd_count'] = $jd_count;
            $responsedata['total_client_count'] = $client_count;
            $responsedata['technology_details'] = [];
            // $responsedata['joined_technology_details'] = [];
            $responsedata['candidate_mgmt_details'] = [];
            // $responsedata['todays_interview_details'] = [];

            $technologiesData = Technology::select('id', 'name', 'status')->where("status", 1)->get();
            $current_date = new DateTime();
            if (count($technologiesData) > 0) {
                // to set overall candidates technologies detials
                foreach ($technologiesData as &$data1) {
                    $technology_id = $data1['id'];
                    $jd_data_ids = JobDescription::where('technology_id', $technology_id)->pluck('id');
                    $data1['jd_ids'] = $jd_data_ids;
                    $data1['total_overall_candidate_count'] = Candidate::whereIN('job_description_id', $jd_data_ids)->count();
                    $data1['total_joined_candidate_count'] = Candidate::whereIN('job_description_id', $jd_data_ids)->where('status', 'Joined')->count();
                    $data1['total_todayinterview_candidate_count'] = CandidateUserAssoc::whereIN('job_description_id', $jd_data_ids)->where('schedule_date', $current_date->format('Y-m-d'))->count();

                    array_push($responsedata['technology_details'], $data1);
                }

                $responsedata['candidate_mgmt_details']['shortlisted_candidates_count'] = Candidate::where('status', 'Pass')->count();

                $responsedata['candidate_mgmt_details']['forwarded_candidates_count'] = Candidate::where('status', 'Forwarded')->count();

                $responsedata['candidate_mgmt_details']['joined_candidates_count'] = Candidate::where('status', 'Joined')->count();

                $responsedata['candidate_mgmt_details']['inprogress_interviews_count'] = Candidate::where('status', 'Clear')->orwhere('status', 'Schedule')->count();

                $responsedata['candidate_mgmt_details']['onbording'] = Candidate::where('status', 'Selected')->count();

                return response()->json(['status_code' => 200, 'message' => 'Data', 'data' => $responsedata]);
            } else {
                return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
            }
        } else {
            return response()->json(['status_code' => 405, 'message' => 'Method Not Allowed']);
        }
    }

}
