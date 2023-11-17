<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Auth;
use App\Models\Absensi;

class AuthController extends Controller
{
    public function addUser(Request $request) {
        $validator = Validator::make($request->all(), [
            'nik' => 'required|unique:users',
            'nama' => 'required',
            'password' => 'required',
        ]);
        
        if($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Pastikan form diisi dengan benar',
                'data' => $validator->errors()
            ]);
        }

        $input = $request->all();

        if (strlen($input['nik']) !== 10) {
            return response()->json([
                'success' => false,
                'message' => 'The nik field must be 10 characters',
                'data' => null
            ]);
        }
        
        $input['password'] = bcrypt($input['password']);

        $user = User::create($input);

        $success['token'] = $user->createToken('auth-token')->plainTextToken;
        $success['nik'] = $user->nik;

        return response()->json([
            'success' => true,
            'message' => 'Data user berhasil ditambahkan',
            'data' => $success
        ]);
    }

    public function loginUser(Request $request) {
        if(Auth::attempt(['nik' => $request->nik, 'password' => $request->password])) {
            $auth = Auth::user();
            $success['token'] = $auth->createToken('auth-token')->plainTextToken;

            Absensi::create([
                'user_id' => $auth->id
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Login Sukses!',
                'data' => $success
            ]);
        }else {
            return response()->json([
                'success' => false,
                'message' => 'Login Gagal! Silahkan Cek NIK dan Password',
                'data' => null
            ]);
        }
    }

    public function logout(Request $request) {
        $request->user()->tokens()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logout Berhasil'
        ]);
    }
}