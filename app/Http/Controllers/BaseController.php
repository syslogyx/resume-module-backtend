<?php

namespace App\Http\Controllers;

use Dingo\Api\Routing\Helpers;
use Illuminate\Routing\Controller;
use Illuminate\Http\Response;
use League\Fractal\Resource\Item;
use League\Fractal\Resource\Collection;

class BaseController extends Controller {

    use Helpers;

    public function dispatchResponse( $statusCode = 200, $msg = "", $data = null) {
        $response = [];
        $response["status_code"] = $statusCode;
        $response["message"] = $msg;
        $response["data"] = $data;

        return new Response($response, $statusCode);
    }

    public function pp($data) {
        echo "<pre>";
        print_r($data);
        echo "</pre>";
    }

    public function pv($data) {
        echo "<pre>";
        var_dump($data);
        echo "</pre>";
    }

}
