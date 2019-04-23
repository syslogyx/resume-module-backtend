<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChecklistDoc extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidate_bgcheck_list_documents', function (Blueprint $table) {
            $table->increments('id');
            $table->longText('file_name');
            $table->longText('real_file_name');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('bg_checklist_id')->unsigned()->nullable();
            $table->string('path')->nullable();
            $table->string('timestamp')->nullable();
            $table->timestamps();
        });

        Schema::table('candidate_bgcheck_list_documents', function ($table) {
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->foreign('bg_checklist_id')->references('id')->on('background_checklist');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidate_bgcheck_list_documents');
    }
}
