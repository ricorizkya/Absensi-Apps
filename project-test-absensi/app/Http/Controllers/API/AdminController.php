<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin;
use Illuminate\Support\Facades\Validator;
use Auth;

class AdminController extends Controller
{
    public function addAdmin(Request $request) {
        $validator = Validator::make($request->all(), [
            'username' => 'required|unique:admins',
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

        if (strlen($input['username']) !== 10) {
            return response()->json([
                'success' => false,
                'message' => 'The username field must be 10 characters',
                'data' => null
            ]);
        }
        
        $input['password'] = bcrypt($input['password']);

        $admin = Admin::create($input);

        $success['token'] = $admin->createToken('auth-token')->plainTextToken;
        $success['username'] = $admin->username;

        return response()->json([
            'success' => true,
            'message' => 'Data user berhasil ditambahkan',
            'data' => $success
        ]);
    }

    public function loginAdmin(Request $request) {
        if(Auth::guard('admin')->attempt(['username' => $request->username, 'password' => $request->password])) {
            $admin = Auth::guard('admin')->user();
            // dd($admin);
            $success['token'] = $admin->createToken('auth-token-admin')->plainTextToken;
            return response()->json([
                'success' => true,
                'message' => 'Login Sukses!',
                'data' => $success
            ]);
        }else {
            return response()->json([
                'success' => false,
                'message' => 'Login Gagal! Silahkan Cek Username dan Password',
                'data' => null
            ]);
        }
    }

    public function logout(Request $request) {
        $request->admin()->tokens()->delete();

        return response()->json([
            'success' => true,
            'message' => 'Logout Berhasil'
        ]);
    }
}