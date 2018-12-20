<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateChecklistDocs extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidate_bgchecklist_documents', function (Blueprint $table) {
            $table->increments('id');
            $table->string('file_name');
            $table->integer('candidate_id')->unsigned()->nullable();
            $table->integer('bg_checklist_id')->unsigned()->nullable();
            $table->string('path')->nullable();
            $table->string('timestamp')->nullable();
            $table->timestamps();
        });

        Schema::table('candidate_bgchecklist_documents', function($table) {
            $table->foreign('candidate_id')->references('id')->on('candidate_details');
            $table->foreign('bg_checklist_id')->references('id')->on('background_check_list');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('candidate_bgchecklist_documents');
    }
}
