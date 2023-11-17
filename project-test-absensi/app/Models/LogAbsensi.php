<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;
use App\Models\User;

class LogAbsensi extends Model {
    protected $table = 'log_absensi';
    
    public function user() {
        return $this->belongsTo(User::class, 'user_id');
    }
    
    public function getStatusCondition() {
        $status = '';

            if (Carbon::parse($this->log_start)->format('H:i') <= '07:30') {
                $status = 'Hadir';
            } else {
                $status = 'Hadir & Terlambat';
            }

            $endWaktu = $this->log_end;

            if (!empty($endWaktu)) {
                $status .= (Carbon::parse($endWaktu)->format('H:i') < '16:30') ? ' & Pulang Sebelum Waktunya' : '';
            }

        return $status;
    }

    public function getKeterangan() {
        $keterangan = '';
            $startWaktu = Carbon::parse($this->log_start);
            $endWaktu = Carbon::parse($this->log_end);

            if ($startWaktu->format('H:i') > '07:30') {
                $terlambat = $startWaktu->diffInMinutes(Carbon::parse('07:30'));
                $keterangan = $this->formatWaktu("Terlambat:", $terlambat);
            }

            if (!empty($endWaktu) && $endWaktu->format('H:i') < '16:30') {
                $pulangSebelumWaktunya = Carbon::parse('16:30')->diffInMinutes($endWaktu);
                $keterangan .= !empty($keterangan) ? ' ' : '';
                $keterangan .= $this->formatWaktu("Pulang Sebelum Waktunya:", $pulangSebelumWaktunya);
            }

        return $keterangan;
    }

    public function formatWaktu($label, $minutes) {
        $hours = floor($minutes / 60);
        $remainingMinutes = $minutes % 60;

        $formattedTime = $label . " ";

        if ($hours > 0) {
            $formattedTime .= "{$hours} Jam ";
        }

        if ($remainingMinutes > 0) {
            $formattedTime .= "{$remainingMinutes} Menit";
        }

        return $formattedTime;
    }
}