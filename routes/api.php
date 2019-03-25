<?php

use Illuminate\Http\Request;

/*
  |--------------------------------------------------------------------------
  | API Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register API routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | is assigned the "api" middleware group. Enjoy building your API!
  |
 */

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });



$api = app("Dingo\Api\Routing\Router");


$api->version("v1", function($api) {

    // generate token
    $api->post("authenticate", "App\Http\Controllers\Auth\AuthController@authenticate");

    // test api  
    $api->get("hello", "App\Http\Controllers\HomeController@index");

    //Home controller API
    $api->get("users/{user_id}/roles/{role_name}", "App\Http\Controllers\HomeController@attachUserRole");

    $api->get("users/{user_id}/roles", "App\Http\Controllers\HomeController@getUserRole");

    $api->post("role/{role_name}/permission/add", "App\Http\Controllers\HomeController@attachPermission");

    $api->get("role/{role_name}/permissions", "App\Http\Controllers\HomeController@getPremissions");
    
    $api->get("permissions", "App\Http\Controllers\HomeController@getAllPremissions");

    $api->get("roles", "App\Http\Controllers\HomeController@getAllRoles");
    
    $api->get("selected/roles", "App\Http\Controllers\HomeController@getSelectedRoles");
    
    $api->post("create/permission", "App\Http\Controllers\HomeController@createPermissions");

    $api->post("create/role", "App\Http\Controllers\HomeController@createRoles");
    
    $api->post("role/{id}/update", "App\Http\Controllers\HomeController@updateRoles");

    $api->post("permission/{id}/update", "App\Http\Controllers\HomeController@updatePermissions");
    
    $api->get("role/{id}/view", "App\Http\Controllers\HomeController@viewRoles");

    $api->get("permission/{id}/view", "App\Http\Controllers\HomeController@viewPermissions");
    
    $api->delete("user/{user_id}/role/{role_id}", "App\Http\Controllers\HomeController@deleteRolesOfUser");

    // user's api
    $api->get("users", "App\Http\Controllers\UserController@index");
    $api->get("selected/users", "App\Http\Controllers\UserController@selecteduser");
    $api->post("register/user", "App\Http\Controllers\UserController@create");
    $api->put("user/{id}/update", "App\Http\Controllers\UserController@update");
    $api->get("user/{id}/view", "App\Http\Controllers\UserController@view");
    $api->post("user/filter", "App\Http\Controllers\UserController@filterUsers");
    // $api->get("check_token/{token}", "App\Http\Controllers\UserController@checkTokenExit");
    $api->get("user/getUsersByInterviewerRoleId", "App\Http\Controllers\UserController@getUsersByInterviewerRoleId");

    $api->post("user/getUserByCandidateIdAndJdId", "App\Http\Controllers\UserController@getUserByCandidateIdAndJdId");

    // qualification's api
    $api->get("qualification_details", "App\Http\Controllers\QualificationCtrl@getAllQualification");
    $api->post("qualification", "App\Http\Controllers\QualificationCtrl@create");
    $api->put("qualification/{id}/update", "App\Http\Controllers\QualificationCtrl@update");

    //  document's api 
    $api->post("document/upload", "App\Http\Controllers\DocumentController@upload");

    // change password api
    $api->post("changePassword", "App\Http\Controllers\UserController@changePassword");


    // fund particulars's api
    $api->get("add_particular", "App\Http\Controllers\FundParticularController@index");

    $api->get('generate_pdf/{id}', 'App\Http\Controllers\PdfGenerateController@generatePdf');
    $api->get('generate_pdf_without_contact/{id}', 'App\Http\Controllers\PdfGenerateController@generatePdfWithoutContact');

    // candidate's api
    $api->get("candidate_details", "App\Http\Controllers\CandidateCtrl@index");
    $api->post("create_candidate", "App\Http\Controllers\CandidateCtrl@create");
    $api->get("candidateInfoByID/{id}", "App\Http\Controllers\CandidateCtrl@viewCandiadte");
    $api->get("candidate/technical-rounds/{candidate_id}", "App\Http\Controllers\CandidateCtrl@getCandidateTechnicalRoundDetails");
    $api->post("upload_resume", "App\Http\Controllers\CandidateCtrl@uploadResume");
    $api->get("download/{id}", "App\Http\Controllers\CandidateCtrl@getDownload");    
    $api->post("candidate/filter", "App\Http\Controllers\CandidateCtrl@filterCandidates");
    $api->post("not_forwarded_candidate/filter", "App\Http\Controllers\CandidateCtrl@getNotFowardedCandidateList");
    $api->put("candidate/{id}/update", "App\Http\Controllers\CandidateCtrl@update");
    $api->post("candidate/changestatus/{id}", "App\Http\Controllers\CandidateCtrl@updateStatus");
    $api->post("candidate/changeJobDescription/{id}", "App\Http\Controllers\CandidateCtrl@changeCandidateJd");
    $api->get("candidate/getJDListByCandidateId/{id}", "App\Http\Controllers\CandidateCtrl@getJDListByCandidateId");
    $api->post("candidate/getLoggedCandidateDetails","App\Http\Controllers\CandidateCtrl@getLoggedCandidateInfo");
    $api->post("create_logins","App\Http\Controllers\CandidateCtrl@createAllCandidatesLogin");
    $api->get("get_alphabets/{type}", "App\Http\Controllers\CandidateCtrl@getListOfCandidateOrderByAlphabets");
    // $api->get("list/all_candidates", "App\Http\Controllers\CandidateCtrl@getAllCandidateList");
    // Get login client candidate list api
    $api->post("candidate/get_login_client_candidatelist","App\Http\Controllers\CandidateCtrl@getLoginClientsCandidateList");
    $api->post("read_excel", "App\Http\Controllers\CandidateCtrl@readCsvFileData");
    $api->post("import_excel", "App\Http\Controllers\CandidateCtrl@importCandidateData");
    $api->post("candidate/filter/clients", "App\Http\Controllers\CandidateCtrl@getCandidateListByJDDetails");


    // Job Description's api
    $api->get("job_description", "App\Http\Controllers\JobController@index");
    $api->post("job_description/filter", "App\Http\Controllers\JobController@jdListWithFilter");
    $api->get("jobInfoByID/{id}/view", "App\Http\Controllers\JobController@viewJob");
    $api->post("job/create", "App\Http\Controllers\JobController@create");
    $api->post("job/update/{id}", "App\Http\Controllers\JobController@update");
    $api->post("job/changestatus/{id}", "App\Http\Controllers\JobController@updateStatus");
    $api->get("getAllActiveJd", "App\Http\Controllers\JobController@fetchActiveJd");
    $api->post("job/get_login_clients_jdlist", "App\Http\Controllers\JobController@getLoginClientsJobDescriptionList");

    // Basic Screen Questions api
    $api->get("basic_screening_questions", "App\Http\Controllers\BasicScreeningQuestionsController@index");

    // Basic Screen Questions api
    $api->post("basic_screening_questions/filter", "App\Http\Controllers\BasicScreeningQuestionsController@filterList");

    $api->post("questions/add", "App\Http\Controllers\BasicScreeningQuestionsController@create");
    $api->get("questionInfoByID/{id}/view", "App\Http\Controllers\BasicScreeningQuestionsController@view");
    $api->put("questions/{id}/update", "App\Http\Controllers\BasicScreeningQuestionsController@update");
    $api->post("questions/changestatus/{id}", "App\Http\Controllers\BasicScreeningQuestionsController@changeStatus");

    // streams api
    $api->get("streams", "App\Http\Controllers\StreamsController@getAllStreams");

    // Basic screening test Api
    $api->post("result/add", "App\Http\Controllers\BasicScreeningResultController@create");
    
    // Basic screening test Api
    $api->post("assignInterviewer", "App\Http\Controllers\CandidateUserAssocController@assignInterviewerToCandidate");
    $api->put("reschedule_interview/{id}/update", "App\Http\Controllers\CandidateUserAssocController@rescheduleInterview");

    // CandidateUser Assoc
    $api->post("interview/filter", "App\Http\Controllers\CandidateUserAssocController@filterUserAssoc");
    $api->post("interview/todays", "App\Http\Controllers\CandidateUserAssocController@getTodaysInterviewListByUserId");

    //candidate feedback api
    $api->post("tech_feedback/add", "App\Http\Controllers\TechnicalInterviewResultController@create");

    $api->get("pdf_setting","App\Http\Controllers\PdfSettingController@getAllPdfSectionList");
    
    //ZIP API
    $api->get("pdfzip","App\Http\Controllers\PdfSettingController@generateAllPdfZipFile");
    $api->get("generate_zip_by_creating_pdf/{id}","App\Http\Controllers\PdfSettingController@downloadZipbyPdfCreation");

    // Company api
    $api->get("company_table", "App\Http\Controllers\CompanyController@index");
    $api->get("companyInfoByID/{id}/view", "App\Http\Controllers\CompanyController@viewCompany");
    $api->post("company/create", "App\Http\Controllers\CompanyController@create");
    $api->post("company/update/{id}", "App\Http\Controllers\CompanyController@update");
    $api->post("company/changestatus/{id}", "App\Http\Controllers\CompanyController@changeStatus");
    $api->get("company_list", "App\Http\Controllers\CompanyController@activeCompanyList");
    

    // check list documents api
    $api->get("download_background_form/", "App\Http\Controllers\CandidatesChecklistDocsController@downloadBackgroundCheckForm");
    $api->post("upload_bgdoc", "App\Http\Controllers\CandidatesChecklistDocsController@uploadBackgroundForm");
    $api->get("download_sample_bgform/", "App\Http\Controllers\CandidatesChecklistDocsController@downloadSampleBackgroundForm");

    // Background Checklist api
    $api->get("background_checklist", "App\Http\Controllers\BackgroundChecklistController@index");
    $api->get("backgroundChecklistInfoByID/{id}/view", "App\Http\Controllers\BackgroundChecklistController@viewBackgroundChecklist");
    $api->post("background_checklist/create", "App\Http\Controllers\BackgroundChecklistController@create");
    $api->post("background_checklist/update/{id}", "App\Http\Controllers\BackgroundChecklistController@update");
    $api->post("background_checklist/changestatus/{id}", "App\Http\Controllers\BackgroundChecklistController@changeStatus");
    $api->get("get_bg_checklist_with_flag", "App\Http\Controllers\BackgroundChecklistController@getAllBackgroundCheckList");
    // $api->get("get_bg_checklist_with_flag", "App\Http\Controllers\BackgroundChecklistController@getAllBackgroundCheckListWithDisplayFlag");

    $api->get("download_bg_documents", "App\Http\Controllers\CandidatesChecklistDocsController@downloadDocsInZipFile");
    $api->get("download_bg_doc_url", "App\Http\Controllers\CandidatesChecklistDocsController@downloadBgDocURl");
    $api->get("download_candidate_zip", "App\Http\Controllers\CandidatesChecklistDocsController@downloadcandidateZip");
    // $api->get("generate_pdf_for_zip/{id}", "App\Http\Controllers\CandidatesChecklistDocsController@generatePdfToAddInZip");

    //get job list by company id
    $api->get("jobList/company/{company_id}", "App\Http\Controllers\JobController@getJobDescriptionListByCompanyId");

    //get candidate list by job id
    $api->get("candidateList/job/{job_id}", "App\Http\Controllers\CandidateCtrl@getCandidateListByJobId");

    //Forwarded resume
    $api->post("forworded_resumes/filter", "App\Http\Controllers\ForwordedResumeController@filterForwardedResume");
    $api->post("forwarded_resume/create", "App\Http\Controllers\ForwordedResumeController@create");
    $api->post("companies_feedback/update/{id}", "App\Http\Controllers\ForwordedResumeController@updateForwaredResumeInfo");

    //Company Technical Round info resume
    $api->post("company_techround_info/create", "App\Http\Controllers\CompaniesTechRoundInfoController@create");

    //Remote validation
    $api->post("validate","App\Http\Controllers\CandidateCtrl@check_validation");

    // Technology api's
    $api->get("technologies","App\Http\Controllers\TechnologyController@index");
    $api->get("technologiesInfoByID/{id}/view", "App\Http\Controllers\TechnologyController@viewTechnology");
    $api->post("technologies/create", "App\Http\Controllers\TechnologyController@create");
    $api->post("technologies/update/{id}","App\Http\Controllers\TechnologyController@update");
    $api->post("technologies/changestatus/{id}","App\Http\Controllers\TechnologyController@changeStatus");
    $api->get("technologies_list","App\Http\Controllers\TechnologyController@activeTechnologyList");
    $api->post("technologies/list/dashboard","App\Http\Controllers\TechnologyController@getTechnologyAccordingToJobDescription");


    //API for Client dashboard
    $api->post("dashboard/client","App\Http\Controllers\TechnologyController@getClientDashboardDetails");
    //API for HR dashboard
    $api->get("dashboard/hr","App\Http\Controllers\TechnologyController@getHrDashboardDetails");
    //API for Admin dashboard
    $api->get("dashboard/admin","App\Http\Controllers\TechnologyController@getAdminDashboardDetails");


});

$api->version("v4", ['middleware' => 'api.auth'], function($api) {
    
});
