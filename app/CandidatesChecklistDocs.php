<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CandidatesChecklistDocs extends Model
{
   /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'file_name','candidate_id','bg_checklist_id', 'path','timestamp'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    // protected $hidden = [
    //     'password', 'remember_token',
    // ];

    protected $table = 'candidate_bgcheck_list_documents';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    private $rules = array(
    	'file_name.*' => 'required|mimes:jpeg,png,jpg,bmp,pdf',
        'candidate_id.*' => 'required',
        'bg_checklist_id.*' => 'required',
        'path.*' => 'required',
        'timestamp.*' => 'required'
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

    // public function background_checklist() {
    //     return $this->belongsTo('App\BackgroundChecklist');    
    // }

    // public function candidate_checklist_docs() {
    //     return $this->hasMany('App\CandidatesChecklistDocs','bg_checklist_id'); 
    // }

}
