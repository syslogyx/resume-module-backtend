<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class ChangePassword extends Model
{
    protected $fillable = [
        'user_id', 'old_password', 'new_password', 'created_by', 'updated_by'];

    protected $table = 'change_password';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'user_id' => 'required',
        'new_password' => 'required',
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
}
