package com.example.absensi_apps.api.response

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class UserDetailResponse {
    @SerializedName("nik")
    @Expose
    var nik: String? = null

    @SerializedName("nama")
    @Expose
    var nama: String? = null
}