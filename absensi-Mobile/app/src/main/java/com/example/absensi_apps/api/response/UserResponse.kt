package com.example.absensi_apps.api.response

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class UserResponse {
    @SerializedName("success")
    @Expose
    var success: Boolean = false

    @SerializedName("message")
    @Expose
    var message: String? = null

    @SerializedName("data")
    @Expose
    var data: UserData? = null

    class UserData {
        @SerializedName("token")
        @Expose
        var token: String? = null
    }
}
