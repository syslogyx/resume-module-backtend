<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidateUserAssocs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidate_user_assoc', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('job_description_id')->unsigned()->nullable();
            $table->integer('user_id')->unsigned()->nullable();
            $table->string('technical_round')->nullable();
            $table->date('schedule_date')->nullable();
            $table->timestamp('schedule_time')->nullable();
            $table->string('mode_of_interview')->nullable();
            $table->timestamps();
        });
        Schema::table('candidate_user_assoc', function($table) {
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->foreign('job_description_id')->references('id')->on('job_description');
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
        Schema::dropIfExists('candidate_user_assoc');
    }
}
