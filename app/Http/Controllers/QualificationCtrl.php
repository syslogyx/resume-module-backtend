<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Qualification;

class QualificationCtrl extends BaseController
{
     function index(Request $request) {

        $qualifiactionData = Qualification::paginate(50);

        if ($qualifiactionData->first()) {

            return $this->dispatchResponse(200, "", $qualifiactionData);

        } else {
        	
            return $this->dispatchResponse(200, "No Records Found!!", $qualifiactionData);
        }
    }
}
