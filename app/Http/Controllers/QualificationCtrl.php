<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Qualification;

class QualificationCtrl extends BaseController
{
    /**
    *	To fetch list of qualifications
    **/
    function getAllQualification(Request $request) {
        $qualifiactionData = Qualification::All();
        if ($qualifiactionData){
          return response()->json(['status_code' => 200, 'message' => 'Qualification List', 'data' => $qualifiactionData]);
        }else{
          return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
