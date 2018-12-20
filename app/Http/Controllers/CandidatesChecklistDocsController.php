<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Response;

class CandidatesChecklistDocsController extends BaseController
{
	/*
	* To get background check pdf file from db server
	*/
	public function downloadBackgroundCheckForm(){
	  $file = public_path('/background_check_form/BGCForm_BA_Revised_Ver7.0.pdf');
	  $headers = array('Content-Type: application/pdf');
	  return Response::download($file, 'BGCForm_BA_Revised_Ver7.0.pdf',$headers);
	}
	  
	/*
	* To get sample background check pdf file from db server
	*/
	public function downloadSampleBackgroundForm(){
	  $file = public_path('/background_check_form/TCS_BGC_FORM_SAMPLE.pdf');
	  $headers = array('Content-Type: application/pdf');
	  return Response::download($file, 'TCS_BGC_FORM_SAMPLE.pdf',$headers);
	}
	  
	/*
	* To save Filled background check pdf file form on server
	*/
	// public function uploadBackgroundForm(Request $request){
	//   $object = new CandidatesChecklistDocs();
	//   $image = $request->file('file_name');
	//   $ext = $image->getClientOriginalExtension();     
	//   // if($ext == 'doc'){
	//   //   $ext = 'docx';
	//   // }
	//   $posted_data['file_name'] =time().'.'.$ext;
	//   $isFileAlreadyPresent = false;
	//   $posted_data['candidate_id']=$request['candidate_id'];
	  
	//   $upladed_data = CandidatesChecklistDocs::where('candidate_id','=',$posted_data['candidate_id'])->where('file_type','=',$request['file_type'])->get();
	//   // return count($upladed_data);
	//   // to check candidate form is already present or not
	//   if(count($upladed_data) > 0){
	//     $isFileAlreadyPresent = true;
	//   }

	//   if(!($isFileAlreadyPresent)){

	//       $posted_data['timestamp']=$request['timestamp'];
	//       $posted_data['file_type']=$request['file_type'];
	//       $destinationPath = public_path('/uploaded_backgroud_doc');
	//       $posted_data['path']=$destinationPath; 

	//       // return $posted_data;      
	      
	//       if ($object->validate($posted_data)) {
	//           $image->move($destinationPath, $posted_data['file_name']);
	//           $model = CandidatesChecklistDocs::create($posted_data);
	//           return response()->json(['status_code' => 200, 'message' => 'Document uploaded successfully', 'data' => $model]);           
	//       } else {
	//            throw new \Dingo\Api\Exception\StoreResourceFailedException('Document not uploaded.',$object->errors());
	//       }
	//   }else{
	//       return response()->json(['status_code' => 404, 'message' => 'Document is already uploaded']);
	//   }
	  
	// }
}
