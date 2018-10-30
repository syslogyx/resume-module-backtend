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

    // qualification's api
    $api->get("qualification_details", "App\Http\Controllers\QualificationCtrl@index");
    $api->post("qualification", "App\Http\Controllers\QualificationCtrl@create");
    $api->put("qualification/{id}/update", "App\Http\Controllers\QualificationCtrl@update");

    //  document's api 
    $api->post("document/upload", "App\Http\Controllers\DocumentController@upload");

   // change password api
    $api->get("change_password", "App\Http\Controllers\ChangePasswordController@index");
    $api->post("changePassword", "App\Http\Controllers\ChangePasswordController@create");


    // fund particulars's api
    $api->get("add_particular", "App\Http\Controllers\FundParticularController@index");

    $api->get('generate_pdf/{id}', 'App\Http\Controllers\PdfGenerateController@generatePdf');

    // candidate's api
    $api->get("candidate_details", "App\Http\Controllers\CandidateCtrl@index");
    $api->post("create_candidate", "App\Http\Controllers\CandidateCtrl@create");
    $api->get("candidateInfoByID/{id}", "App\Http\Controllers\CandidateCtrl@viewCandiadte");

});

$api->version("v1", ['middleware' => 'api.auth'], function($api) {
    
});
