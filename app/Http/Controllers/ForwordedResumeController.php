<?php

namespace App\Http\Controllers;

use App\forworded_resume;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\forworded_resume;

class ForwordedResumeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /*
    *  Function to create forwerded resume
    */
    function create(){
        $posted_data = Input::all();
        DB::beginTransaction();

        try {        
            $objectFd = new forworded_resume();
            if ($objectFd->validate($posted_data)) {
                $model = forworded_resume::create($posted_data);
                DB::commit();
                if($model)
                    return $this->dispatchResponse(200, "Forworded resume Created Successfully...!!", $model);
            } else {
                DB::rollback();
                return $this->dispatchResponse(400, "Something went wrong.", $objectJd->errors());
            }
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
    }

   
    /*
    *  Function to update forwerded resume
    */
    public function update(Request $request)
    {
        //
    }
}
