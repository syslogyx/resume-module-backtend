<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCandidateJdAssoc extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidate_jd_assoc', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('job_description_id')->unsigned()->nullable();
            $table->timestamps();
        });
        Schema::table('candidate_jd_assoc', function ($table) {
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
        Schema::dropIfExists('candidate_jd_assoc');
    }
}
