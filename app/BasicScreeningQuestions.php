<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class BasicScreeningQuestions extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'stream_id', 'question', 'expected_answer', 'status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'basic_screening_questions';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'stream_id' => 'required',
        'question' => 'required',
        'status' => 'required',
        'expected_answer' => 'required',

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

    public function stream()
    {
        return $this->belongsTo('App\Stream');
    }
}
