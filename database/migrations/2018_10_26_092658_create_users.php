<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\User;

class CreateUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('mobile')->nullable()->unique();
            $table->string('email')->nullable()->unique();
            $table->string('company_name')->nullable();
            $table->string('password')->nullable();
            $table->integer('role_id')->unsigned();
            $table->foreign('role_id')->references('id')->on('role');
            $table->string('status')->nullable();
            $table->string('unique_token')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "Admin",
                "mobile" => "9876543210",
                "email" => "admin@syslogyx.com",
                "company_name" => "Syslogyx Pvt Ltd.",
                "password" => Hash::make('admin123'),
                "role_id" => 1,
                "status" => "Active",
                "unique_token" => base64_encode('admin@syslogyx.com'.'9876543210'.'Syslogyx Pvt Ltd.'),
            )
        );

        User::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
