<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateJdAssoc extends Model
{
   /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id', 'job_description_id'
    ];
    
    protected $table = 'candidate_jd_assoc';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'candidate_id' => 'required',
        'job_description_id' => 'required',
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

    public function candidate_jd_assocs() {
        return $this->belongsTo('App\CandidateJdAssoc','candidate_id');
    }
}
