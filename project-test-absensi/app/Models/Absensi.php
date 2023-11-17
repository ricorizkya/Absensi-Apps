<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    use HasFactory;

    protected $table = 'log_absensi';
    protected $fillable = [
        'user_id',
        'log_start',
        'log_lunch',
        'log_end_lunch',
        'log_end'
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }
}