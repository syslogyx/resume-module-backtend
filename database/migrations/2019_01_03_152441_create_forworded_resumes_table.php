<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateForwordedResumesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('forworded_resumes', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id')->unsigned()->nullable();
            $table->integer('job_description_id')->unsigned()->nullable();
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->date('cv_received_on_date')->nullable();
            $table->date('data_sent_to_company_date')->nullable();
            $table->date('feedback_received_date')->nullable();
            $table->string('company_final_status')->nullable();
            $table->string('company_final_remark')->nullable();
            $table->date('hr_interview_on_date')->nullable();
            $table->string('hr_status')->nullable();
            $table->string('hr_remark')->nullable();
            $table->string('final_status')->nullable();
            $table->date('tentative_doj')->nullable();
            $table->date('actual_doj')->nullable();
            $table->timestamps();
        });

        Schema::table('forworded_resumes', function($table) {
            $table->foreign('company_id')->references('id')->on('company_table');
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->foreign('job_description_id')->references('id')->on('job_description');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('forworded_resumes');
    }
}
