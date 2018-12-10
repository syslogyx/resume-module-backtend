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
    function index(Request $request) {

        $pdfSettingData = PdfSetting::paginate(50);

        if ($pdfSettingData->first()) {

            return $this->dispatchResponse(200, "", $pdfSettingData);

        } else {
        	
            return $this->dispatchResponse(200, "No Records Found!!", $pdfSettingData);
        }
    }
}
