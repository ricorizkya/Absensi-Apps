<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LogAbsensi;
use App\Models\User;
use Illuminate\Support\Carbon;

class LogAbsensiController extends Controller
{
    public function getDataAbsensi() {
        $logAbsensiData = LogAbsensi::all();
        $processData = [];

        foreach($logAbsensiData as $key => $log) {
            $processData[] = [
                'No' => $key + 1,
                'Tanggal' => Carbon::parse($log->log_start)->format('Y-m-d'),
                'NIK' => $log->user->nik,
                'Nama' => $log->user->nama,
                'Start' => Carbon::parse($log->log_start)->format('H:i'),
                'Lunch' => Carbon::parse($log->log_lunch)->format('H:i'),
                'End Lunch' => Carbon::parse($log->log_end_lunch)->format('H:i'),
                'End' => Carbon::parse($log->log_end)->format('H:i'),
                'Status' => $log->getStatusCondition(),
                'Keterangan' => $log->getKeterangan(),
            ];
        }
        return response()->json([
            'success' => true,
            'data' => $processData
        ], 200);
    }
}