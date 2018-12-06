<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidate extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidate_details', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name');
            $table->string('middle_name');
            $table->string('last_name');
            $table->string('email')->nullable();            
            $table->string('opprtunity_for')->nullable();
            $table->string('gender')->nullable();
            $table->string('marital_status')->nullable();
            $table->string('indian_languages')->nullable();
            $table->string('foreign_languages')->nullable();
            $table->string('currency_unit')->nullable();
            $table->string('mobile_no')->nullable();
            $table->string('corresponding_address')->nullable();
            $table->string('permanent_address')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('pan_number')->nullable();
            $table->string('passport')->nullable();
            $table->text('objective')->nullable();
            $table->text('summary')->nullable();
            $table->string('status')->nullable();
            $table->string('timestamp')->nullable();                         
            $table->string('total_experience')->nullable();
            $table->float('ctc')->nullable();  
            $table->integer('job_description_id')->unsigned()->nullable();
            $table->foreign('job_description_id')->references('id')->on('job_description');
            $table->date('expired_on')->nullable();
            $table->string('unique_token')->nullable();          
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
        Schema::dropIfExists('candidate_details');
    }
}
