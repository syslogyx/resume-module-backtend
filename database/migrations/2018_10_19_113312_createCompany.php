<?php

use App\Company;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

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
            $table->string('email')->nullable();
            $table->longText('address')->nullable();
            $table->integer('status');
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "Tata Consultancy Services",
                "contact_no" => "2266568484",
                "email" => "careers@tcs.com",
                "address" => "MIHAN, Nagpur, Telhara, Maharashtra 441108",
                "status" => 1,
            ),
            array(
                "name" => "Syslogyx Technologies Pvt. Ltd.",
                "contact_no" => "07122292195",
                "email" => "contact@syslogyx.com",
                "address" => "215, H.B. Estate, Sonegaon, Nagpur, Maharashtra, India – 440025",
                "status" => 1,
            ),
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
