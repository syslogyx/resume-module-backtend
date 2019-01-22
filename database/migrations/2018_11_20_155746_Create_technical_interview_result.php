<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTechnicalInterviewResult extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('technical_interview_result', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('job_description_id')->unsigned()->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->string('technical_round')->nullable();
            $table->string('feedback')->nullable();
            $table->string('status')->nullable();
            $table->float('duration_of_interview')->nullable();
            $table->text('observation')->nullable();
            $table->timestamps();
        });
        Schema::table('technical_interview_result', function($table) {
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->foreign('job_description_id')->references('id')->on('candidate_details');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('technical_interview_result');
    }
}
