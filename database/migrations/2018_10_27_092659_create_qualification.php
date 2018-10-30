<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Qualification;

class CreateQualification extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('qualification_details', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('alias')->nullable();
             $table->integer('status')->nullable();
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "SSC - 10th",
                "alias" => "ssc_-_10th",
                "status" => "0"
            ),
            array(
                "name" => "HSC - 12th",
                "alias" => "hsc_-_12th",
                "status" => "0"
            ),
            array(
                "name" => "Diploma",
                "alias" => "diploma",
                "status" => "0"
            ),
            array(
                "name" => "Graduate",
                "alias" => "graduate",
                "status" => "0"
            ),
            array(
                "name" => "Post Graduate",
                "alias" => "pg",
                "status" => "0"
            ),
            array(
                "name" => "PHD",
                "alias" => "phd",
                "status" => "0"
            )
        );

        Qualification::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('qualification_details');
    }
}
