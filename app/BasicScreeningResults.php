<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class BasicScreeningResults extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id','question_id', 'answer','status','refereral_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'basic_screening_result';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
    	'candidate_id.*' => 'required',
    	'question_id.*' => 'required',
        'refereral_token.*' => 'required',
        'answer.*' => 'nullable',
        'status.*' => 'nullable',
        'timestamp' => 'nullable',

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

    public function basic_screening_questions() {
        return $this->belongsTo('App\BasicScreeningQuestions');
    }
}
