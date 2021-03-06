<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateAchivements extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'candidate_id', 'achievement_type', 'achivement', 'timestamp',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'other_achievements';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'candidate_id' => 'required',
        'achievement_type' => 'required',
        'achivement' => 'required',
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
}
