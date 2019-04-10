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
use App\PdfSetting;
use ZipArchive;
use Carbon;
use PDF;
use Storage;

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
	  $file = public_path('/background_check_form/SYSLOGYX_BGC_FORM_SAMPLE.pdf');
	  $headers = array('Content-Type: application/pdf');
	  return Response::download($file, 'SYSLOGYX_BGC_FORM_SAMPLE.pdf',$headers);
	}

	/*
	* To get bg uploaded file by candidate checklist doc ID
	*/
	public function downloadCandidateChecklistDocID($id){
		$candidateUploadFile = CandidatesChecklistDocs::where('id',$id)->first();
	 	$file = public_path('/uploaded_backgroud_doc/'.$candidateUploadFile->file_name);
	  	$headers = array('Content-Type: application/pdf');
	  	return Response::download($file, $candidateUploadFile->file_name,$headers);
	}

	/*
	* To delete bg uploaded file by candidate checklist doc ID
	*/
	function deleteCandidateChecklistDoc($id) {
		$model = CandidatesChecklistDocs::where('id',$id)->first();
        if($id != null && $model){
        	if(file_exists(public_path('/uploaded_backgroud_doc/'.$model->file_name))){
			  	unlink(public_path('/uploaded_backgroud_doc/'.$model->file_name));
			  	$query = CandidatesChecklistDocs::where('id',$id)->delete();
	            if ($query)
	            	return $this->dispatchResponse(200, "Document deleted Successfully...!!", null);
			}else{
				return $this->dispatchResponse(201, "File does not exists.", null);  
			}  
        }else{
            return $this->dispatchResponse(202, "Something went wrong", null);    
        }
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

				foreach($request->file('file_name') as $file => $value){ 
					// $fileName = $file->getClientOriginalName();
					$fullName=$value->getClientOriginalName();
					$fileName=explode('.',$fullName)[0];
					$ext = $value->getClientOriginalExtension();
					$fileArray['file_name'] = $request['candidate_name'].'_'.$request['bg_name'].'_'.$file.'_'.time().'.'.$ext;

					// $fileArray['file_name'] = time().'.'.$fileExtension;
					$fileArray['real_file_name']= $fullName;
					$fileArray['candidate_id']= $request['candidate_id'];
					$fileArray['timestamp']= $request['timestamp'];
					$fileArray['bg_checklist_id']=$request['bg_checklist_id'];
					$destinationPath = public_path('/uploaded_backgroud_doc');

					$value->move($destinationPath, $fileArray['file_name']);
					// $file->move($destinationPath, $name);  
				    $fileArray['path']=$destinationPath; 
				    $fileArray["created_at"] = new DateTime();
		      		$fileArray["updated_at"] =  new DateTime();
					array_push($posted_data, $fileArray);
				}
				// return $posted_data;
				unset($request['bg_name']);
				unset($request['candidate_name']);
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
		$section_names = $request->section_names;

        $sectionArray = explode(",",$section_names);

		$candidateInfo = Candidate::where('id',$candidateId)->first();
		
		$zipFileNamewithSpace = $candidateInfo->first_name.'_'.$candidateInfo->middle_name.'_'.$candidateInfo->last_name;
		
		$zipFileName = join("_",explode(" ",$zipFileNamewithSpace)).'.zip';

		if(file_exists(public_path().'/'.$zipFileName)){
	        unlink(public_path().'/'.$zipFileName);
	    }

        $cv_filename = $this->generatePdfToAddInZip($candidateId,$sectionArray);

	    $documentsFileNames = CandidatesChecklistDocs::where('candidate_id',$candidateId)->pluck('file_name');

	    $filepath = public_path('/uploaded_backgroud_doc/');

	    $archiveFile =$zipFileName;

	    $archive = new ZipArchive();
	    
	    // if ($archive->open($archiveFile, ZipArchive::CREATE | ZipArchive::OVERWRITE)) {
	    if ($archive->open(public_path().'/'.$archiveFile, ZipArchive::CREATE)) {

	    	 $archive->deleteName('./'.$cv_filename);
		   
	        foreach ($documentsFileNames as $file) {
        		if ($archive->addFile($filepath.'/'.$file, basename($filepath.'/'.$file))) {
            		 continue;
	            } 
	            else {
	                return response()->json(['status_code' => 404, 'message' => 'file `{$file}` could not be added to the zip file: ','error' => $archive->getStatusString()]);
	            }
	        }

	        if(file_exists($filepath.'/'.$cv_filename)){
	        	$archive->addFile($filepath.'/'.$cv_filename, basename($filepath.'/'.$cv_filename));
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
	* Function to create candidate PDF to add in zip file
	*/
	function generatePdfToAddInZip($id,$sectionArray) {
        $json = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);

        $json['section_names'] = $sectionArray;

        if ($json){

        	for ($i=0; $i < count($json['candidate_ind_exp']); $i++) { 

        		$languageToolsUsedArray = json_decode($json['candidate_ind_exp'][$i]['language_or_tools']);

        		$languagesArray = $languageToolsUsedArray[0];

                $toolsArray = $languageToolsUsedArray[1];

                $langStringSplit1 = explode("[",$languagesArray);
                $langStringSplit2 = explode("]",$langStringSplit1[1]);
                $finalLanguagesArray = explode(",",$langStringSplit2[0]);

                $toolStringSplit1 = explode("[",$toolsArray);
                $toolStringSplit2 = explode("]",$toolStringSplit1[1]);
                $finalToolsArray = explode(",",$toolStringSplit2[0]);

                $json['candidate_ind_exp'][$i]['languages'] = $finalLanguagesArray;
                $json['candidate_ind_exp'][$i]['tools'] = $finalToolsArray;
        	}

            view()->share('candidateDetails',$json);
			$pdf = PDF::loadView('pdfview');
			$ext = '.pdf';
			$candidate_name = $json['first_name'].$json['middle_name'].$json['last_name'];
			$jdTitle = $json['job_description']['title'];
			$jdExperience = str_replace(' ', '_', $json['job_description']['experience']);
			$fileName = 'CV_'.$candidate_name.'_'.$jdTitle.'_'.$jdExperience.$ext;

			$filepath = public_path('/uploaded_backgroud_doc/');
			if(is_file($filepath.'/'.$fileName)){
				$currentTime = time(); // get current time
			    $lastModifiedTime = filemtime($filepath.'/'.$fileName); // get file creation time    
			    $timeDiff = abs($currentTime - $lastModifiedTime); // get how old is file in hours:
			        
			    if(is_file($filepath.'/'.$fileName) && $timeDiff > 1){ //check if file was modified before 1 hour:
			        unlink($filepath.'/'.$fileName); //delete file
				}
			}
			// $pdf->download($fileName);
			$pdf->save($filepath.'/'.$fileName);
			return $fileName;
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
        }
	}

	public function downloadcandidateZip(Request $request){
		$file_name = $request->file_name;
		// $file=public_path('/').$file_name;

		

	  	// $file = public_path($file_name);
	  	// return $file;
	  	// $headers = array('Content-Type: application/pdf');
	  	ob_end_clean();
		/* Header is use if zip file download function will be used*/
	    $headers = array(
	    	'Cache-Control' =>'public',
	        'Content-Type' => 'application/zip',
	        'Content-Disposition' =>'attachment',
	        'Content-Description' =>'File Transfer',
	        'Content-Transfer-Encoding' => 'binary',
	      	'filename' => pathinfo($file_name , PATHINFO_BASENAME),
	      	'Pragma' => 'no-cache',
	      	'Expires' => 0,
	      	// 'Content-Length' =>filesize($archiveFile),
	    );

		ob_end_flush();

		$filetopath=public_path().'/'.$file_name;
        if(file_exists($filetopath)){
            return response()->download($filetopath,$file_name,$headers);
        }
	  // return Response::download($file, basename($file),$headers);
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