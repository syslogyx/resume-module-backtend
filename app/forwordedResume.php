<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class forwordedResume extends Model
{
    protected $fillable = [
        'company_id', 'job_description_id', 'candidate_id', 'cv_received_on_date' ,'data_sent_to_company_date', 'feedback_received_date', 'company_final_status', 'company_final_remark', 'hr_interview_on_date', 'hr_status', 'hr_remark', 'final_status', 'tentative_doj', 'actual_doj'
    ];
    protected $table = 'forworded_resumes';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'company_id.*' => 'required',
        'job_description_id.*' => 'required',
        'candidate_id.*' => 'required',
        'cv_received_on_date.*' => 'required',
        'data_sent_to_company_date.*' => 'required',
        // 'feedback_received_date' => 'required',
        // 'company_final_status' => 'required',
        // 'company_final_remark' => 'required',
        // 'hr_interview_on_date' => 'required',
        // 'hr_status' => 'required',
        // 'hr_remark' => 'required',
        // 'final_status' => 'required',
        // 'tentative_doj' => 'required',
        // 'actual_doj' => 'required',
    );
    private $errors;
  
    public function validate($data) {
        $validator = Validator::make($data, $this->rules);

        if ($validator->fails()) {
            $this->errors = $validator->errors();
            return false;
        }
        return true;
    }

    public function errors() {
        return $this->errors;
    }

    public function companies_tech_round_info() {
        return $this->hasMany('App\CompaniesTechRoundInfo','forwarded_id');
    }

    public function candidates() {
        return $this->belongsTo('App\Candidate','candidate_id');
    }

    public function companies() {
        return $this->belongsTo('App\Company','company_id');
    }

    public function job_description() {
        return $this->belongsTo('App\JobDescription','job_description_id');
    }
}
