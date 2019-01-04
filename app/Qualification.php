<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Qualification extends Model
{
    protected $fillable = [
        'name','alise','status'
    ];
    protected $table = 'qualification_details';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'name' => 'required|unique:qualification_details,name,',
        'alise' => 'required',
        'status' => 'required'
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
