<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidateHobbies extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hobbies', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->string('hobbie_name')->nullable();  
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
        Schema::dropIfExists('hobbies');
    }
}
