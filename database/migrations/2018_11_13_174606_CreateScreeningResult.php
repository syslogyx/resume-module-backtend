<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateScreeningResult extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('basic_screening_result', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->integer('question_id')->unsigned()->nullable();
            $table->foreign('question_id')->references('id')->on('basic_screening_questions');            
            $table->string('answer')->nullable();
            $table->longText('remark')->nullable();
            $table->string('status')->nullable();            
            $table->string('refereral_token')->nullable();
            $table->float('duration_of_interview')->nullable();
            $table->text('observation')->nullable();
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
        Schema::dropIfExists('basic_screening_result');
    }
}
