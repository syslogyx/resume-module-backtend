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
    $api->post("upload_resume", "App\Http\Controllers\CandidateCtrl@uploadResume");
    $api->post("upload_bgdoc", "App\Http\Controllers\CandidateCtrl@uploadBackgroundForm");
    $api->get("download/{id}", "App\Http\Controllers\CandidateCtrl@getDownload");
    $api->get("download_background_form/", "App\Http\Controllers\CandidateCtrl@downloadBackgroundCheckForm");
    $api->get("download_sample_bgform/", "App\Http\Controllers\CandidateCtrl@downloadSampleBackgroundForm");
    $api->post("candidate/filter", "App\Http\Controllers\CandidateCtrl@filterCandidates");
    $api->put("candidate/{id}/update", "App\Http\Controllers\CandidateCtrl@update");
    $api->post("candidate/changestatus/{id}", "App\Http\Controllers\CandidateCtrl@updateStatus");
    $api->post("candidate/changeJobDescription/{id}", "App\Http\Controllers\CandidateCtrl@changeCandidateJd");
    $api->get("candidate/getJDListByCandidateId/{id}", "App\Http\Controllers\CandidateCtrl@getJDListByCandidateId");
    $api->post("candidate/getLoggedCandidateDetails","App\Http\Controllers\CandidateCtrl@getLoggedCandidateInfo");
    $api->post("create_logins","App\Http\Controllers\CandidateCtrl@createAllCandidatesLogin");

    // Job Description's api
    $api->get("job_description", "App\Http\Controllers\JobController@index");
    $api->get("jobInfoByID/{id}/view", "App\Http\Controllers\JobController@viewJob");
    $api->post("job/create", "App\Http\Controllers\JobController@create");
    $api->post("/job/update/{id}", "App\Http\Controllers\JobController@update");
    $api->post("/job/changestatus/{id}", "App\Http\Controllers\JobController@updateStatus");
    $api->get("/getAllActiveJd", "App\Http\Controllers\JobController@fetchActiveJd");

    // Basic Screen Questions api
    $api->get("basic_screening_questions", "App\Http\Controllers\BasicScreeningQuestionsController@index");
    $api->post("questions/add", "App\Http\Controllers\BasicScreeningQuestionsController@create");
    $api->get("questionInfoByID/{id}/view", "App\Http\Controllers\BasicScreeningQuestionsController@view");
    $api->put("questions/{id}/update", "App\Http\Controllers\BasicScreeningQuestionsController@update");

    // streams api
    $api->get("streams", "App\Http\Controllers\StreamsController@getAllStreams");

    // Basic screening test Api
    $api->post("result/add", "App\Http\Controllers\BasicScreeningResultController@create");
    
    // Basic screening test Api
    $api->post("assignInterviewer", "App\Http\Controllers\CandidateUserAssocController@assignInterviewerToCandidate");
    $api->put("reschedule_interview/{id}/update", "App\Http\Controllers\CandidateUserAssocController@rescheduleInterview");

    // CandidateUser Assoc
    $api->post("interview/filter", "App\Http\Controllers\CandidateUserAssocController@filterUserAssoc");

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
    $api->post("/company/update/{id}", "App\Http\Controllers\CompanyController@update");
    $api->post("/company/changestatus/{id}", "App\Http\Controllers\CompanyController@changeStatus");

});

$api->version("v1", ['middleware' => 'api.auth'], function($api) {
    
});
