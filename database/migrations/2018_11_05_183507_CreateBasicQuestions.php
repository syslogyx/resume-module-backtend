<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBasicQuestions extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('basic_screening_questions', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('stream_id')->unsigned()->nullable();
            $table->longText('question')->nullable();
            $table->integer('status');
            $table->longText('expected_answer')->nullable();
            $table->timestamps();
        });

        Schema::table('basic_screening_questions', function ($table) {
            $table->foreign('stream_id')->references('id')->on('streams');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('basic_screening_questions');
    }
}
