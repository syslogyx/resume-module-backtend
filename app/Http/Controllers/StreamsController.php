<?php

namespace App\Http\Controllers;

use App\Stream;
use Illuminate\Http\Request;

class StreamsController extends BaseController
{
    /**
     *    To fetch list of Stream
     **/
    public function getAllStreams(Request $request)
    {
        $streamData = Stream::All();
        if ($streamData) {
            return response()->json(['status_code' => 200, 'message' => 'Stream List', 'data' => $streamData]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Record not found..!']);
        }
    }
}
