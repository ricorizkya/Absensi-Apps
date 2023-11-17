<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AbsensiController;
use App\Http\Controllers\API\AdminController;
use App\Http\Middleware\AdminAuthMiddleware;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\LogAbsensiController;


Route::post('/add-user', [AuthController::class, 'addUser']);
Route::post('/login-user', [AuthController::class, 'loginUser']);
Route::get('/get-user', [UserController::class, 'getUser']);
Route::get('/data-absensi', [LogAbsensiController::class, 'getDataAbsensi']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::post('/absen-masuk', [AbsensiController::class, 'absenMasuk']);
    Route::post('/absen-maksi', [AbsensiController::class, 'absenMaksi']);
    Route::post('/absen-end-maksi', [AbsensiController::class, 'absenEndMaksi']);
    Route::post('/absen-pulang', [AbsensiController::class, 'absenPulang']);
    Route::post('/logout', [AuthController::class, 'logout']);
});

Route::post('/admin/add-admin', [AdminController::class, 'addAdmin']);
Route::post('/admin/login-admin', [AdminController::class, 'loginAdmin']);
Route::middleware(['auth:sanctum', 'auth.admin'])->group(function () {
    Route::get('/admin', function (Request $request) {
         return $request->admin();
    });
    Route::post('/admin/logout', [AdminController::class, 'logout']);
});