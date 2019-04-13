<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateQualification extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id', 'qualification_id', 'steam', 'percentage', 'university', 'college', 'start_year', 'end_year', 'timestamp',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'educationl_details';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'candidate_id' => 'required',
        'qualification_id' => 'required',
        'steam' => 'required',
        'percentage' => 'required',
        'university' => 'required',
        'college' => 'required',
        'start_year' => 'required',
        'end_year' => 'required',
        'timestamp' => 'required',

    );
    private $errors;

    public function validate($data)
    {
        $validator = Validator::make($data, $this->rules);
        if ($validator->fails()) {
            $this->errors = $validator->errors();
            return false;
        }
        return true;
    }

    public function errors()
    {
        return $this->errors;
    }

    public function candidates()
    {
        return $this->belongsTo('App\Candidate');
    }

    public function qualification()
    {
        return $this->belongsTo('App\Qualification');
    }
}
