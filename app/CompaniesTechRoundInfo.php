<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Validator;

class CompaniesTechRoundInfo extends Model
{
    protected $fillable = [
        'forwarded_id', 'company_round_date', 'company_tech_status', 'company_tech_round_type', 'companies_tech_remark',
    ];
    protected $table = 'companies_tech_round_infos';
    protected $guarded = ['id', 'created_at', 'updated_at'];
    private $rules = array(
        'forwarded_id.*' => 'required',
        'company_round_date.*' => 'required',
        'company_tech_status.*' => 'required',
        'company_tech_round_type.*' => 'required',
        'companies_tech_remark.*' => 'required',
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

    public function candidates()
    {
        return $this->belongsTo('App\Candidate');
    }

    public function forwarded_resumes_data()
    {
        return $this->belongsTo('App\forwordedResume');
    }
}
