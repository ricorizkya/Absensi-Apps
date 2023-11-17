<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Auth;

class AdminAuthMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function handle($request, Closure $next)
    {
        // dd(Auth::guard('admin')->user());
        // dd('Middleware is running');

        if ($request->user() && $request->user()->hasRole('admin')) {
            return $next($request);
        }

        return response()->json(['error' => 'Unauthorized'], 401);
    }
}