<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Qualification;

class CreateJobDescription extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('job_description', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('company_id')->unsigned()->nullable();
            $table->text('title')->nullable();
            $table->text('sub_title')->nullable();
            $table->longText('description')->nullable();
            $table->integer('no_of_requiremet')->nullable();
            $table->string('experience')->nullable();
            $table->longText('skills_required')->nullable();
            $table->longText('additional_skills')->nullable();
            $table->longText('roles_and_responsibility')->nullable();
            $table->longText('project_title')->nullable();
            $table->string('job_location')->nullable();
            $table->string('job_type')->nullable();
            $table->string('ctc')->nullable();
            $table->string('notice_period')->nullable();
            $table->string('job_code')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();
        });

        Schema::table('job_description', function($table) {
            $table->foreign('company_id')->references('id')->on('company_table');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('job_description');
    }
}
