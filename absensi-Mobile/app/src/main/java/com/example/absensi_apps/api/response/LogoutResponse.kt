package com.example.absensi_apps.api.response

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class LogoutResponse {
    @SerializedName("success")
    @Expose
    var success: Boolean = false

    @SerializedName("message")
    @Expose
    var message: String? = null
}