<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class JobDescription extends Model
{
  	//use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'sub_title', 'description','no_of_requiremet','experience','skills_required','additional_skills','roles_and_responsibility','job_location','job_type','ctc','notice_period','job_code','status','company_id'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'job_description';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'title' => 'required',
        'sub_title' => 'required',
        'description' => 'required',
        'no_of_requiremet' => 'required',
        'experience' => 'required',
        'skills_required' => 'required',
        'additional_skills' => 'required',
        'roles_and_responsibility' => 'required',
        'job_location' => 'required',
        'job_type' => 'required',
        'ctc' => 'nullable',
        'notice_period' => 'nullable',
        'ctc' => 'nullable',
        'status' => 'nullable',
        'job_code' => 'required|unique:job_description,job_code,',


    );
    private $errors;

    public function validate($data) {

        if ($this->id){
            $this->rules['job_code'] .= $this->id;
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

}
