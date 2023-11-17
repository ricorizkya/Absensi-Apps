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
        Schema::table('log_absensi', function (Blueprint $table) {
            $table->dropColumn('waktu');
            $table->dropColumn('status');
            
            $table->timestamp('log_start')->nullable()->default(null);
            $table->timestamp('log_lunch')->nullable()->default(null);
            $table->timestamp('log_end_lunch')->nullable()->default(null);
            $table->timestamp('log_end')->nullable()->default(null);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $table->timestamp('waktu');
        $table->string('status');
    }
};