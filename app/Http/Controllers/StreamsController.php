<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\Stream;

class StreamsController extends BaseController
{
    /**
    *	To fetch list of Stream
    **/
    function index(Request $request) {

        $streamData = Stream::paginate(50);

        if ($streamData->first()) {

            return $this->dispatchResponse(200, "", $streamData);

        } else {
        	
            return $this->dispatchResponse(404, "No Records Found!!", $streamData);
        }
    }
}
