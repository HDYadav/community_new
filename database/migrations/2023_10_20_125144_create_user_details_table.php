<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('user_details', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id','11');
            $table->integer('sub_congregation_id','11');
            $table->integer('sub-congregation_caretaker_id','11');
            $table->date('consecration_date')->nullable();
            $table->string('upload_consecration_certificate','200')->nullable();
            $table->date('date_of_birth')->nullable();
            $table->integer('gender','2');
            $table->integer('zip_code','7')->nullable();
            $table->string('state','100')->nullable();
            $table->string('city','200')->nullable();
            $table->text('address')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_details');
    }
};
