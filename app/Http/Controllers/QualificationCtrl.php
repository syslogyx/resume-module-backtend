<?php

namespace App\Http\Controllers;

use App\Qualification;
use Illuminate\Http\Request;

class QualificationCtrl extends BaseController
{
    /**
     *    To fetch list of qualifications
     **/
    public function getAllQualification(Request $request)
    {
        $qualifiactionData = Qualification::All();
        if ($qualifiactionData) {
            return response()->json(['status_code' => 200, 'message' => 'Qualification List', 'data' => $qualifiactionData]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
