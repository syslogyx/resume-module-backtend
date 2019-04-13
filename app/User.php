<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Validator;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'mobile', 'role_id', 'company_name', 'status', 'unique_token',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    protected $table = 'users';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'name' => 'required',
        'email' => 'required|unique:users,email,',
        'mobile' => 'required|unique:users,mobile,',
        // 'mobile' => 'unique:users,mobile,$user->id,id,account_id,1'
        'password' => 'required',
        'role_id' => 'required',
        'company_name' => 'required',
        'status' => 'required',
        'unique_token' => 'nullable',
    );

    private $errors;

    public function validate($data)
    {
        if ($this->id) {
            $this->rules['email'] .= $this->id;
            $this->rules['mobile'] .= $this->id;
            $this->rules['password'] = '';
        }

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

    // public function userDesignation() {
    //     return $this->belongsTo('App\UserDesignation','designation_id');

    // }

    public function role()
    {
        return $this->belongsTo('App\Role', 'role_id');
    }

    public function candidate_user_assoc()
    {
        return $this->belongsToMany('App\CandidateUserAssoc', 'user_id');
    }

    public function candidate_technical_result()
    {
        // return $this->hasMany('App\TechnicalInterviewResult','user_id')->where('candidate_id','=', 10);
        return $this->hasMany('App\TechnicalInterviewResult', 'user_id');
    }
}
