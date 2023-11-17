package com.example.absensi_apps.api.endpoint

import com.example.absensi_apps.api.response.UserResponse
import com.example.absensi_apps.api.model.UserRequest
import com.example.absensi_apps.api.response.AbsenResponse
import com.example.absensi_apps.api.response.LogoutResponse
import com.example.absensi_apps.api.response.UserDetailResponse
import retrofit2.Call
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.POST

interface UserApi {
    @POST("login-user")
    fun login(
        @Body userRequest: UserRequest
    ): Call<UserResponse>

    @GET("user")
    fun getData(@Header("Authorization") token: String): Call<UserDetailResponse>

    @POST("logout")
    fun logout(
        @Header("Authorization")
        token: String
    ):Call<LogoutResponse>

    @POST("absen-masuk")
    fun absenMasuk(
        @Header("Authorization")
        token: String
    ):Call<AbsenResponse>

    @POST("absen-maksi")
    fun absenMaksi(
        @Header("Authorization")
        token: String
    ):Call<AbsenResponse>

    @POST("absen-end-maksi")
    fun absenEndMaksi(
        @Header("Authorization")
        token: String
    ):Call<AbsenResponse>

    @POST("absen-pulang")
    fun absenPulang(
        @Header("Authorization")
        token: String
    ):Call<AbsenResponse>
}