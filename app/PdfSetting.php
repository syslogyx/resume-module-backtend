<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PdfSetting extends Model
{
    //use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'section_name'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'pdf_setting';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
        'section_name' => 'required',
        'timestamp' => 'nullable'
    );
    private $errors;

    public function validate($data) {

        if ($this->id){
            $this->rules['id'] .= $this->id;
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
}
