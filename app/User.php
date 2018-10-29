<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
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
        'name', 'email', 'password','mobile','role_id','company_name','status', 'unique_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];

    protected $table = 'users';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'name' => 'required',
        'email' => 'required|unique:users,email,',
        'password' => 'nullable',
        'role_id' => 'required',
        'company_name' => 'required',
        'mobile' => 'required',
        'status' => 'required',
        'unique_token' => 'nullable'
    );
    private $errors;

    public function validate($data) {
        if ($this->id)
            $this->rules['email'] .= $this->id;
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

    // public function userDesignation() {
    //     return $this->belongsTo('App\UserDesignation','designation_id');
         
    // }

    public function role() {
        return $this->belongsTo('App\Role','role_id');    
    }
}

