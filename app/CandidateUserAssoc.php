<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateUserAssoc extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id', 'user_id','technical_round','schedule_date','schedule_time','mode_of_interview','timestamp'
    ];
    
    protected $table = 'candidate_user_assoc';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    protected $casts = [
        'schedule_time' => 'date:hh:mm'
    ];
    private $rules = array(
        'candidate_id.*' => 'required',
        'user_id.*' => 'required',
        'technical_round.*' => 'required',
        'schedule_date.*' => 'required',
        'schedule_time.*' => 'required',
        'mode_of_interview.*' => 'required',
        'timestamp.*' => 'nullable'
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

    public function users() {
        return $this->belongsTo('App\User','user_id');    
    }

    public function candidates() {
        return $this->belongsTo('App\Candidate','candidate_id');
    }

   
}
