<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Response;
use DateTime;
use App\CandidatesChecklistDocs;
use App\Candidate;
use App\BackgroundChecklist;
use ZipArchive;
use Carbon;

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
	public function uploadBackgroundForm(Request $request){
		$object = new CandidatesChecklistDocs();
		DB::beginTransaction();
		try { 
			// $files = $request->file('file_name');			
			$fileArray = [];
			$posted_data=[];
			// if($request->hasfile('file_name'))
			// {
				foreach($request->file('file_name') as $file){ 
					$fileArray['file_name'] = $file->getClientOriginalName();	 
					// $fileExtension = $file->getClientOriginalExtension();
					// $fileArray['file_name'] = time().'.'.$fileExtension;
					$fileArray['candidate_id']= $request['candidate_id'];
					$fileArray['timestamp']= $request['timestamp'];
					$fileArray['bg_checklist_id']=$request['bg_checklist_id'];
					$destinationPath = public_path('/uploaded_backgroud_doc');

					$file->move($destinationPath, $fileArray['file_name']);
					// $file->move($destinationPath, $name);  
				    $fileArray['path']=$destinationPath; 
				    $fileArray["created_at"] = new DateTime();
		      		$fileArray["updated_at"] =  new DateTime();
					array_push($posted_data, $fileArray);
				}
				if ($object->validate($posted_data)) {
					$model = CandidatesChecklistDocs::insert($posted_data);
					DB::commit();
					if($model){
						return response()->json(['status_code' => 200, 'message' => 'Document uploaded successfully', 'data' => $model]);  ;
			        }else{
			          	return response()->json(['status_code' => 401, 'message' => 'Unable to upload files.']);
			        }
			    } else {
	                DB::rollback();
	                return response()->json(['status_code' => 404, 'message' => 'Something went wrong.','error' => $object->errors()]);
	            }
			// }else{
			// 	DB::rollback();
			// 	return response()->json(['status_code' => 404, 'message' => 'Please Select atleast one file.']);
			// }
		} catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }  
	}

    /*
	* Function to create candidate uploaded bg docs zip file
	*/
    public function downloadDocsInZipFile(Request $request){
    	ob_start();
		$candidateId = $request->candidate_id;
		$candidateInfo = Candidate::where('id',$candidateId)->first();
		
		$zipFileNamewithSpace = $candidateInfo->first_name.'_'.$candidateInfo->middle_name.'_'.$candidateInfo->last_name;
		$zipFileName = join("_",explode(" ",$zipFileNamewithSpace)).'.zip';

	    $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');

	    $filepath = public_path('/uploaded_backgroud_doc/');

	    $archiveFile =$zipFileName;

	    $archive = new ZipArchive();
	    
	    // if ($archive->open($archiveFile, ZipArchive::CREATE | ZipArchive::OVERWRITE)) {
	    if ($archive->open(public_path().'/'.$archiveFile, ZipArchive::CREATE)) {
	        foreach ($documentsFileNames as $file) {
        		if ($archive->addFile($filepath.'/'.$file, basename($filepath.'/'.$file))) {
            		 continue;
	            } 
	            else {
	                return response()->json(['status_code' => 404, 'message' => 'file `{$file}` could not be added to the zip file: ','error' => $archive->getStatusString()]);
	            }
	        }

	        if ($archive->close()) {

	        	ob_end_clean();
	        	/* Header is use if zip file download function will be used*/
		        $headers = array(
		        	'Cache-Control' =>'public',
		            'Content-Type' => 'application/zip',
		            'Content-Disposition' =>'attachment',
		            'Content-Description' =>'File Transfer',
		            'Content-Transfer-Encoding' => 'binary',
		          	'filename' => pathinfo($archiveFile , PATHINFO_BASENAME),
		          	'Pragma' => 'no-cache',
		          	'Expires' => 0,
		          	// 'Content-Length' =>filesize($archiveFile),
		        );

				ob_end_flush();
				$filetopath=public_path().'/'.$archiveFile;

		        if(file_exists($filetopath)){
		            return response()->json(['status_code' => 200, 'message' => 'Zip File Created Successfully..!']);
		        }else{
		        	return response()->json(['status_code' => 404, 'message' => 'Zip File is not Created Successfully..!']);
		        }
	            // response()->download($archiveFile, basename($archiveFile),$headers);
	        } else {
	            return response()->json(['status_code' => 406, 'message' => 'could not close zip file:','error' => $archive->getStatusString()]);
	        }
	    } else {
	      	return response()->json(['status_code' => 407, 'message' => 'zip file could not be created:','error' => $archive->getStatusString()]);
	    }
	}

	/* 
	* Function to get download bg checklist doc URL
	*/
	public function downloadBgDocURl(Request $request){
    	$candidateId = $request->candidate_id;
        $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');
        $bgUploadedDocUrl = [];
        $filepath = public_path('/uploaded_backgroud_doc/');
        foreach ($documentsFileNames as $fileName) {
        	$url = $filepath.'/'.$fileName;
        	array_push($bgUploadedDocUrl, $url);
        }
        if($bgUploadedDocUrl){
			return response()->json(['status_code' => 200, 'message' => 'Document URL Get successfully', 'data' => $bgUploadedDocUrl]);  ;
        }else{
          	return response()->json(['status_code' => 401, 'message' => 'Document URL not found.']);
        }
    }

	/* sample example for download zip file*/
	public function downloadDocsInZipFile1(Request $request){
		$candidateId = $request->candidate_id;
	    $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');

	    $filePath = public_path('/uploaded_backgroud_doc/');

	    // define the name of the archive and create a new ZipArchive instance.
	    $archiveFile =public_path(Carbon\Carbon::now().'.zip');

	    $zip = new ZipArchive();


	    $fileName = 'samplefile' . date("d-m-YH:i:s") . '.zip';
	    $fileName = str_replace(" ", "", $fileName);

	    foreach ($documentsFileNames as $configuration) {
	        if ($dir = opendir($filePath)) {
	            $file = $configuration;
	            chdir($filePath);
	            try {
	                if ($zip->open($fileName, ZIPARCHIVE::CREATE) === false) {
	                    die ("An error occurred creating your ZIP file.");
	                }

	                if (file_exists($filePath.$file) && is_file($filePath.$file)){
	                	$zip->addFile($file);
	                }else{
	                	return 'File not exist';
	                }
	                
	            } catch (Exception $e) {
	                echo $e->getMessage();
	            }
	        }
        }
        $zip->close();
	    unlink($file);
        return response()->download($fileName, basename($fileName));
    }

    /* another sample example for download zip file */
    public function downloadDocsInZipFile2(Request $request){
        $candidateId = $request->candidate_id;
        $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');

        $public_dir=public_path('/uploads');
        $filepath = public_path('/uploaded_backgroud_doc/');

        // return $documentsFileNames;
        $public_dir=public_path('/uploads');
        $filepath = public_path('/uploaded_backgroud_doc');
      

        $zipFileName = Carbon\Carbon::now().'.zip';
   
        $zip = new ZipArchive;
        if ($zip->open($public_dir . '/' . $zipFileName, ZipArchive::CREATE === True))
        {  
            foreach($documentsFileNames as $file)
            {
                if (file_exists($filepath.'/'.$file) && is_file($filepath.'/'.$file)){
                    $zip->addFile($filepath.'/'.$file,basename($filepath.'/'.$file)); 
                }
                // else{
                //     return ['status'=>'file does not exist'];
                // }
            }
            $zip->close();   
        }
        $headers = array(
            'Content-Type' => 'application/octet-stream',
            'Content-Disposition' =>'inline',
            'Content-Transfer-Encoding' => 'binary'     
        );

        $filetopath=$public_dir.'/'.$zipFileName;
        if(file_exists($filetopath)){
            return response()->download($filetopath,$zipFileName,$headers);
        }
        return ['status'=>'file does not exist'];   
    }

}