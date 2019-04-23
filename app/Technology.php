<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class Technology extends Model
{
    protected $fillable = [
        'name', 'description', 'status',
    ];

    protected $table = 'technologies';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'name' => 'required',
        'description' => 'nullable',
        'status' => 'nullable',
    );
    private $errors;

    public function validate($data)
    {
        // if ($this->id){
        //     $this->rules['email'] .= $this->id;
        //     $this->rules['contact_no'] .= $this->id;
        // }
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
