<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\LogAbsensi;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
    public function getUser() {
        $user = User::all();
        if($user) {
            return response()->json([
                'success' => true,
                'message' => 'Data User',
                'data' => $user,
            ], 200);
        }

        return response()->json([
            'success' => false,
            'message' => 'Data User Tidak Ditemukan',
            'data' => null,
        ]);
    } 
}