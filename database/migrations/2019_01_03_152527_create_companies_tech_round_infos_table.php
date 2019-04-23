<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTechRoundInfosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies_tech_round_infos', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('forwarded_id')->unsigned()->nullable();
            $table->date('company_round_date')->nullable();
            $table->string('company_tech_status')->nullable();
            $table->string('company_tech_round_type')->nullable();
            $table->string('companies_tech_remark')->nullable();
            $table->timestamps();
        });

        Schema::table('companies_tech_round_infos', function ($table) {
            $table->foreign('forwarded_id')->references('id')->on('forworded_resumes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('companies_tech_round_infos');
    }
}
