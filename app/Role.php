<?php

namespace App;

use Validator;

class Role extends \Zizaco\Entrust\EntrustRole
{

    protected $table = 'role';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'name' => 'required|unique:role,name,',
    );
    private $errors;

    public function validate($data)
    {
        if ($this->id) {
            $this->rules['name'] .= $this->id;
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

    // public function users() {
    //     return $this->belongsToMany('App\User', 'role_user', 'role_id', 'user_id');
    // }

}
