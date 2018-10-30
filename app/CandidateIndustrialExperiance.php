<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateIndustrialExperiance extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id','company_name', 'project_name', 'role_in_project', 'language_or_tools','project_description','timestamp'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'industrial_experience';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'candidate_id' => 'required',
        'company_name' => 'required',
        'project_name' => 'required',
        'role_in_project' => 'required',
        'language_or_tools' => 'required',
        'project_description' => 'required',
        'timestamp' => 'required'
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

    public function candidates() {
        return $this->belongsTo('App\Candidate');
    }
}
