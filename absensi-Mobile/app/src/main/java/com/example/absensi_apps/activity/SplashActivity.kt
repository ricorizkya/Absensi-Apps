package com.example.absensi_apps.activity

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.example.absensi_apps.R

class SplashActivity : AppCompatActivity() {
    private val splashTimeOut: Long = 3000
    private lateinit var sharedPreferences: SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)

        sharedPreferences = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
        Handler(Looper.getMainLooper()).postDelayed({
            checkLoginStatus()
        }, splashTimeOut)
    }

    private fun checkLoginStatus() {
        val token = sharedPreferences.getString("token", "")
        if (token?.isNotEmpty() == true) {
            startActivity(Intent(this@SplashActivity, MainActivity::class.java))
        }else {
            startActivity(Intent(this@SplashActivity, LoginActivity::class.java))
        }
        finish()
    }
}