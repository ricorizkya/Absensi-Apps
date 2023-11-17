<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\Response;
use Illuminate\Support\Facades\Route;

class DataController extends Controller {

    public function index()
    {
        $request = Request::create('/api/get-user', 'GET');
        $response = Route::dispatch($request);

        $responseBody = json_decode($response->getContent(), true);
        $data = $responseBody["data"];

        $requestAbsen = Request::create('/api/data-absensi', 'GET');
        $responseAbsen = Route::dispatch($requestAbsen);

        $responseAbsenBody = json_decode($responseAbsen->getContent(), true);
        $dataAbsen = $responseAbsenBody["data"];

        return view('welcome', compact('data', 'dataAbsen'));
    }
}