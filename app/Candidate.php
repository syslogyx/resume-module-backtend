<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class Candidate extends Model
{
  	//use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'first_name','middle_name','last_name','email','opprtunity_for','gender','marital_status','mobile_no','corresponding_address','permanent_address','date_of_birth','pan_number','passport','objective','summary','status','total_experience','ctc','expired_on','job_description_id','unique_token','timestamp','indian_languages','foreign_languages'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'candidate_details';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'first_name' => 'required',
        'middle_name' => 'required',
        'last_name' => 'required',
        'email' => 'required|unique:candidate_details,email,',
        'opprtunity_for' => 'required',
        'gender' => 'required',
        'marital_status' => 'required',
        'indian_languages' => 'required',
        'foreign_languages' => 'required',
        'mobile_no' => 'required|unique:candidate_details,mobile_no',
        'corresponding_address' => 'required',
        'permanent_address' => 'required',
        'date_of_birth' => 'nullable',
        'pan_number' => 'required|unique:candidate_details,pan_number,',
        'passport' => 'nullable',
        'objective' => 'required',
        'summary' => 'required',
        'status' => 'nullable',
        'total_experience' => 'nullable',
        'ctc' => 'nullable',
        'job_description_id' => 'required',
        'expired_on' => 'nullable',
        'unique_token' => 'nullable',
        'timestamp' => 'nullable',


    );
    private $errors;

    public function validate($data) {
        if ($this->id){
            $this->rules['email'] .= $this->id;
            $this->rules['mobile_no'] .= $this->id;
            $this->rules['pan_number'] .= $this->id;

        }
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

    public function candidate_achievements() {
        return $this->hasMany('App\CandidateAchivements');    
    }

    public function candidate_hobbies() {
        return $this->hasMany('App\CandidateHobbies');    
    }

    public function candidate_ind_exp() {
        return $this->hasMany('App\CandidateIndustrialExperiance');    
    }

    public function candidate_qualification() {
        return $this->hasMany('App\CandidateQualification');    
    }

    public function candidate_tech_skill() {
        return $this->hasMany('App\CandidateTechnicalSkill');    
    }

    public function candidate_document() {
        return $this->hasMany('App\CandidateDocument');    
    }

    public function candidate_technical_result() {
        return $this->hasMany('App\TechnicalInterviewResult','candidate_id'); 
    }

    public function job_description() {
        return $this->belongsTo('App\JobDescription','job_description_id');    
    }

    public function candidate_user_assoc() {
        return $this->belongsToMany('App\CandidateUserAssoc','candidate_id');    
    }

}
