<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use App\PdfSetting;
use ZipArchive;
use Carbon;
use PDF;
use Storage;
use App\Candidate;

class PdfSettingController extends BaseController
{
    /**
    *	To fetch list of Stream
    **/
    function getAllPdfSectionList(Request $request) {

        $pdfSettingData = PdfSetting::all();
        if (count($pdfSettingData)>0) {
            return response()->json(['status_code' => 200, 'message' => 'Pdf List', 'data' => $pdfSettingData]);
        } else {
            return response()->json(['status_code' => 404, 'message' => 'Record not found.']);
        }
    }

    public function generateAllPdfZipFile(Request $request){
        $public_dir=public_path().'/uploads';
        $filepath = public_path().'/doc/';
      
        $zipFileName = Carbon\Carbon::now().'.zip';
        $files = ['1541243235.pdf','1541249865.pdf','1541998119.pdf'];
   
        $zip = new ZipArchive;
        if ($zip->open($public_dir . '/' . $zipFileName, ZipArchive::CREATE) === TRUE)
        {  
            foreach($files as $file)
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
        );
        $filetopath=$public_dir.'/'.$zipFileName;
        if(file_exists($filetopath)){
            return response()->download($filetopath,$zipFileName,$headers);
        }
        return ['status'=>'file does not exist'];   
    }

    public function generatePdfView($id)
    {
   
        $json = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);
         
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
            }
                // view()->share('candidateDetails',$json);
                // $pdf = PDF::loadView('pdfview');
                // $ext = '.pdf';
                // $candidate_name = $json['first_name'].$json['middle_name'].$json['last_name'];
                // $jdTitle = $json['job_description']['title'];
                // $jdExperience = str_replace(' ', '_', $json['job_description']['experience']);
                // $fileName = 'CV_'.$candidate_name.'_'.$jdTitle.'_'.$jdExperience.$ext;
                // $pdf->download($fileName);
            //else{
            //     return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
            // }   
        return $json;  
    }

    function downloadZipbyPdfCreation($id)
    {

        $data = array(
             'results' => $this->generatePdfView($id)
        );

        // foreach ($data['results'] as $d)
        // {  
            view()->share('candidateDetails',$data['results']);
            $pdf = PDF::loadView('pdfview');
                // $ext = '.pdf';
                // $candidate_name = $d['first_name'].$d['middle_name'].$d['last_name'];
                // $jdTitle = $d['job_description']['title'];
                // $jdExperience = str_replace(' ', '_', $d['job_description']['experience']);
                // $fileName = 'CV_'.$candidate_name.'_'.$jdTitle.'_'.$jdExperience.$ext;
            $pdf->download($fileName);
            // $mpdf = new \Mpdf\Mpdf();
            // $html = $this->load->view('pdfview',$d,true);
            $mpdf->WriteHTML($pdf);
            $mpdf->Output(); //this will create a pdf file in next tab

             $this->load->library('zip');
             $this->zip->add_data();
             $this->zip->archive('/var/www/my_backup.zip');
             $this->zip->download('my_backup.zip');
        // }
    }
    
}
