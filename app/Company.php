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
        'name', 'contact_no','address','status'
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
        'contact_no' => 'nullable',
        'address' => 'nullable',
        'status' => 'nullable'
    );
    private $errors;

    public function validate($data) {
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
