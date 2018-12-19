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
    function getAllStreams(Request $request) {
        $streamData = Stream::All();
        if ($streamData){
          return response()->json(['status_code' => 200, 'message' => 'Stream List', 'data' => $streamData]);
        }else{
          return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
