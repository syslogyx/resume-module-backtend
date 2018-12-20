<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\BackgroundChecklist;

class CreateBackgroundChecklist extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('background_checklist', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('type');
            $table->boolean('mandatory');
            $table->string('status');
            $table->timestamps();
        });

        $data = array(
            array(
                "name" => "BA BGC Form(with passport size photograph)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Address Proof(Present and Permanent)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "SSC",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Intermediate(HSC/Diploma)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Graduation",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Post-graduation",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Mark sheets(consolidated / semester wise)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Provisional CertificatC",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "O.D (Original Document)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Offer letter (For all employers)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Experience Certificates(For all employers)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Salary last 3 months pay slips. (For all employers)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Recent Hike letters",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Consultancy Offer letter",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Bank statements(Complete tenure for all companies without any PF remittance)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Deputation letters (Need Client Name, Emp. code & reporting manager details)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "PF statements",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            ),
            array(
                "name" => "Form 16 (For all employers)",
                "type" => "PDF",
                "mandatory" => 1,
                "status" => 1
            )
        );

        BackgroundChecklist::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('background_checklist');
    }
}
