<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class TechnicalInterviewResult extends Model
{
   /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id', 'user_id','technical_round','feedback','status'
    ];
    
    protected $table = 'technical_interview_result';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    
    private $rules = array(
        'candidate_id' => 'required',
        'user_id' => 'required',
        'technical_round' => 'required',
        'feedback' => 'required',
        'status' => 'required',
        'timestamp' => 'nullable'
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

}