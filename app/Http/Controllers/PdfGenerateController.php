<?php

namespace App\Http\Controllers;
use App\Candidate;
use PDF;
use Storage;

class PdfGenerateController extends Controller
{
	/**	
	** to generate pdf 
	**/
	public function generatePdf($id) {
		$json = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);
        if ($json){
            view()->share('candidateDetails',$json);
			$pdf = PDF::loadView('pdfview');
			$ext = '.pdf';
			$fileName = 'CV_'.$json['name'].$ext;
			$pdf->download($fileName);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
        }
		
		
	}
	public function generatePdfWithoutContact($id) {
		$json = Candidate::with('candidate_achievements','candidate_hobbies','candidate_ind_exp','candidate_qualification.qualification','candidate_tech_skill','candidate_document')->find((int) $id);
        if ($json){
            view()->share('candidateDetails',$json);
			$pdf = PDF::loadView('pdfviewwithoutcontact');
			$ext = '.pdf';
			$fileName = 'CV_Without_Contact_'.$json['name'].$ext;
			$pdf->download($fileName);
        }else{
            return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
        }
		
		
	}
	
}