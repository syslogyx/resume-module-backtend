<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidateDocument extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'file_name', 'candidate_id', 'path', 'timestamp', 'type',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'candidate_document';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'file_name' => 'required',
        'candidate_id' => 'required',
        'path' => 'required',
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
