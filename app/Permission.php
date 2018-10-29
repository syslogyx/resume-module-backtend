<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class Permission extends \Zizaco\Entrust\EntrustPermission {

    protected $table = 'permission';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'name' => 'required|unique:permission,name,'
    );
    private $errors;

    public function validate($data) {
        if ($this->id)
            $this->rules['name'] .= $this->id;

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
