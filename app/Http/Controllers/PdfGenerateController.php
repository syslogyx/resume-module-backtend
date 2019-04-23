<?php

namespace App\Http\Controllers;

use App\Candidate;
use Illuminate\Support\Facades\Input;
use PDF;

class PdfGenerateController extends Controller
{
    /**
     ** to generate pdf
     **/
    public function generatePdf($id)
    {
        $json = Candidate::with('candidate_achievements', 'candidate_hobbies', 'candidate_ind_exp', 'candidate_qualification.qualification', 'candidate_tech_skill', 'candidate_document')->find((int) $id);

        $section_names = Input::get('section_names');
        $sectionArray = explode(",", $section_names);
        $json['section_names'] = $sectionArray;
        // return $json;
        if ($json) {

            for ($i = 0; $i < count($json['candidate_ind_exp']); $i++) {

                $languageToolsUsedArray = json_decode($json['candidate_ind_exp'][$i]['language_or_tools']);

                $languagesArray = $languageToolsUsedArray[0];

                $toolsArray = $languageToolsUsedArray[1];

                $langStringSplit1 = explode("[", $languagesArray);
                $langStringSplit2 = explode("]", $langStringSplit1[1]);
                $finalLanguagesArray = explode(",", $langStringSplit2[0]);

                $toolStringSplit1 = explode("[", $toolsArray);
                $toolStringSplit2 = explode("]", $toolStringSplit1[1]);
                $finalToolsArray = explode(",", $toolStringSplit2[0]);

                $json['candidate_ind_exp'][$i]['languages'] = $finalLanguagesArray;
                $json['candidate_ind_exp'][$i]['tools'] = $finalToolsArray;
            }

            view()->share('candidateDetails', $json);
            $pdf = PDF::loadView('pdfview');
            $ext = '.pdf';
            $candidate_name = $json['first_name'] . $json['middle_name'] . $json['last_name'];
            $jdTitle = $json['job_description']['title'];
            $jdExperience = str_replace(' ', '_', $json['job_description']['experience']);
            $fileName = 'CV_' . $candidate_name . '_' . $jdTitle . '_' . $jdExperience . $ext;
            $pdf->download($fileName);
        } else {
            return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
        }
    }

    public function generatePdfWithoutContact($id)
    {
        $json = Candidate::with('candidate_achievements', 'candidate_hobbies', 'candidate_ind_exp', 'candidate_qualification.qualification', 'candidate_tech_skill', 'candidate_document')->find((int) $id);
        if ($json) {

            for ($i = 0; $i < count($json['candidate_ind_exp']); $i++) {

                $languageToolsUsedArray = json_decode($json['candidate_ind_exp'][$i]['language_or_tools']);

                $languagesArray = $languageToolsUsedArray[0];
                $toolsArray = $languageToolsUsedArray[1];

                $langStringSplit1 = explode("[", $languagesArray);
                $langStringSplit2 = explode("]", $langStringSplit1[1]);
                $finalLanguagesArray = explode(",", $langStringSplit2[0]);

                $toolStringSplit1 = explode("[", $toolsArray);
                $toolStringSplit2 = explode("]", $toolStringSplit1[1]);
                $finalToolsArray = explode(",", $toolStringSplit2[0]);

                $json['candidate_ind_exp'][$i]['languages'] = $finalLanguagesArray;
                $json['candidate_ind_exp'][$i]['tools'] = $finalToolsArray;
            }
            view()->share('candidateDetails', $json);
            $pdf = PDF::loadView('pdfviewwithoutcontact');
            $ext = '.pdf';
            $candidate_name = $json['first_name'] . $json['middle_name'] . $json['last_name'];
            $jdTitle = $json['job_description']['title'];
            $jdExperience = $json['job_description']['experience'];
            $fileName = 'CV_Without_Contact_' . $candidate_name . '_' . $jdTitle . '_' . $jdExperience . $ext;
            $pdf->download($fileName);
        } else {
            return $this->dispatchResponse(400, "Something went wrong.", $json->errors());
        }

    }

}
