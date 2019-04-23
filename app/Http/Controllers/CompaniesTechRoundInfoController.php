<?php

namespace App\Http\Controllers;

use App\CompaniesTechRoundInfo;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class CompaniesTechRoundInfoController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $posted_data = Input::all();

        foreach ($posted_data['round_info'] as $key => $value) {
            $posted_data['round_info'][$key]["company_round_date"] = date("Y-m-d", strtotime(str_replace('/', '-', $posted_data['round_info'][$key]["company_round_date"])));
            $posted_data['round_info'][$key]["created_at"] = new DateTime();
            $posted_data['round_info'][$key]["updated_at"] = new DateTime();

        }

        try {
            DB::beginTransaction();
            $objectResult = new CompaniesTechRoundInfo();
            // return $posted_data['result_data'];
            if ($objectResult->validate($posted_data['round_info'])) {
                $model = CompaniesTechRoundInfo::insert($posted_data['round_info']);
                DB::commit();
                if ($model) {
                    return $this->dispatchResponse(200, "Data saved Successfully...!!", $model);
                } else {
                    return $this->dispatchResponse(401, "Data not saved.");
                }
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectResult->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CompaniesTechRoundInfo  $companies_tech_round_info
     * @return \Illuminate\Http\Response
     */
    public function show(CompaniesTechRoundInfo $companies_tech_round_info)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\companies_tech_round_info  $companies_tech_round_info
     * @return \Illuminate\Http\Response
     */
    public function edit(CompaniesTechRoundInfo $companies_tech_round_info)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\companies_tech_round_info  $companies_tech_round_info
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CompaniesTechRoundInfo $companies_tech_round_info)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\companies_tech_round_info  $companies_tech_round_info
     * @return \Illuminate\Http\Response
     */
    public function destroy(CompaniesTechRoundInfo $companies_tech_round_info)
    {
        //
    }
}
