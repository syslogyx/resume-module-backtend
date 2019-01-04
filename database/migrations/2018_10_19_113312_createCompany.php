<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Company;

class CreateCompany extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('company_table', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('contact_no')->nullable();
            $table->longText('address')->nullable();
            $table->integer('status');
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "Tata Consultancy Services",
                "contact_no" => "2266568484",
                "address" => "MIHAN, Nagpur, Telhara, Maharashtra 441108",
                "status" => 1
            )
        );

        Company::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('company_table');
    }
}
