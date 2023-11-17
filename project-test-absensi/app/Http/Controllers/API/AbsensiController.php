<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Absensi;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class AbsensiController extends Controller
{
    public function absenMasuk(Request $request) {
        $user = $request->user();
        $currentTime = Carbon::now();

        $existingAbsenMasuk = Absensi::where('user_id', $user->id)
            ->first();

        $existingAbsenMasuk->update([
            'log_start' => $currentTime->format('Y-m-d H:i:s')
        ]);
        
        return response()->json([
            'success' => true,
            'message' => 'Berhasil melakukan absen masuk',
        ]);
    }

    public function absenMaksi(Request $request) {
        $user = $request->user();
        $currentTime = Carbon::now();

        $existingAbsenMaksi = Absensi::where('user_id', $user->id)
            ->first();
        
        $existingAbsenMaksi->update([
            'log_lunch' => $currentTime->format('Y-m-d H:i:s'),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil melakukan absen makan siang',
        ]);
    }


    public function absenEndMaksi(Request $request) {
        $user = $request->user();
        $currentTime = Carbon::now();

        $existingAbsenEndMaksi = Absensi::where('user_id', $user->id)
            ->first();
        
        $existingAbsenEndMaksi->update([
            'log_end_lunch' => $currentTime->format('Y-m-d H:i:s'),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil melakukan absen selesai makan siang',
        ]);
    }

    public function absenPulang(Request $request) {
        $user = $request->user();
        $currentTime = Carbon::now();

        $existingAbsenEnd = Absensi::where('user_id', $user->id)
            ->first();
        
        $existingAbsenEnd->update([
            'log_end' => $currentTime->format('Y-m-d H:i:s'),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Berhasil melakukan absen pulang',
        ]);
    }
}