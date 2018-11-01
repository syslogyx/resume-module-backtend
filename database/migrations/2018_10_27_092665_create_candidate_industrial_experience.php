<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidateIndustrialExperience extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('industrial_experience', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->string('company_name')->nullable();  
            $table->string('project_name')->nullable();  
            $table->string('role_in_project')->nullable();  
            $table->string('language_or_tools')->nullable();  
            $table->text('project_description')->nullable(); 
            $table->string('timestamp')->nullable(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('industrial_experience');
    }
}
