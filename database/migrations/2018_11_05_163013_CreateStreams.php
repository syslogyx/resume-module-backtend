<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Stream;

class CreateStreams extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('streams', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name')->nullable();
            $table->string('alias')->nullable();
            $table->integer('status')->nullable();
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "Android",
                "alias" => "android",
                "status" => "0"
            ),
            array(
                "name" => "Java",
                "alias" => "java",
                "status" => "0"
            ),
            array(
                "name" => "Common",
                "alias" => "common",
                "status" => "0"
            )
        );

        Stream::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('streams');
    }
}
