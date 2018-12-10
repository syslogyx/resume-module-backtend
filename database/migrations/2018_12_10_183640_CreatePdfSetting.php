<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\PdfSetting;

class CreatePdfSetting extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pdf_setting', function (Blueprint $table) {
            $table->increments('id');
            $table->string('section_name');
            $table->timestamps();
        });

        $data = array(
            array(
                "section_name" => "Name"
            ),
            array(
                "section_name" => "Email"
            ),
            array(
                "section_name" => "Phone"
            ),
            array(
                "section_name" => "Address"
            ),
            array(
                "section_name" => "Summary"
            ),
            array(
                "section_name" => "Date Of Birth"
            ),
            array(
                "section_name" => "Passport No."
            ),
            array(
                "section_name" => "Total Experience"
            ),
            array(
                "section_name" => "Educational Details"
            ),
            array(
                "section_name" => "Other Achievements"
            ),
            array(
                "section_name" => "Technical Skill"
            ),
            array(
                "section_name" => "Industrial Experience"
            ),
            array(
                "section_name" => "Hobbies"
            )
        );

        PdfSetting::insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pdf_setting');
    }
}
