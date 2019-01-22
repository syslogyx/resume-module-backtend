<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class Company extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'contact_no','email','address','status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'company_table';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'name' => 'required',
        'contact_no' => 'required|unique:company_table,contact_no,',
        'email' => 'required|unique:company_table,email,',
        'address' => 'required',
        'status' => 'nullable'
    );
    private $errors;

    public function validate($data) {
        if ($this->id){
            $this->rules['email'] .= $this->id;
            $this->rules['contact_no'] .= $this->id;
        }
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

    public function forwarded_resumes_data() {
        return $this->hasMany('App\forwordedResume','company_id'); 
    }
}
