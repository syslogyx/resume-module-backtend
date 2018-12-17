<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\PdfSetting;

class PdfSettingController extends BaseController
{
    /**
    *	To fetch list of Stream
    **/
    function getAllPdfSectionList(Request $request) {

        $pdfSettingData = PdfSetting::all();
        if (count($pdfSettingData)>0) {
            return response()->json(['status_code' => 200, 'message' => 'Pdf List', 'data' => $pdfSettingData]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Record not found.']);
        }
    }
}
