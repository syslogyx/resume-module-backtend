<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCandidateQualifications extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('educationl_details', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('qualification_id')->unsigned()->nullable();
            $table->string('stream')->nullable();
            $table->float('percentage')->nullable();
            $table->string('university')->nullable();
            $table->string('college')->nullable();
            $table->string('start_year')->nullable();
            $table->string('end_year')->nullable();
            $table->string('timestamp')->nullable();
            $table->timestamps();
        });

        Schema::table('educationl_details', function ($table) {
            $table->foreign('qualification_id')->references('id')->on('qualification_details');
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('educationl_details');
    }
}
