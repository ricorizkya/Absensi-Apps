package com.example.absensi_apps.api.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class UserRequest {
    @SerializedName("nik")
    @Expose
    var nik: String? = null

    @SerializedName("password")
    @Expose
    var password: String? = null
}