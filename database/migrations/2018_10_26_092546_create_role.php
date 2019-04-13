<?php

use App\Role;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRole extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('role', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "Admin",
            ),
            array(
                "name" => "HR",
            ),
            array(
                "name" => "Collegue",
            ),
            array(
                "name" => "Interviewer",
            ),
            array(
                "name" => "Candidate",
            ),
            array(
                "name" => "Client",
            ),

        );

        Role::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('role');
    }
}
