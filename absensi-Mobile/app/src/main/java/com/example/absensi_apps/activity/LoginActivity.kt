package com.example.absensi_apps.activity

import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.example.absensi_apps.*
import com.example.absensi_apps.api.Retro
import com.example.absensi_apps.api.endpoint.UserApi
import com.example.absensi_apps.api.model.UserRequest
import com.example.absensi_apps.api.response.UserResponse
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class LoginActivity : AppCompatActivity() {
    private lateinit var sharedPreferences: SharedPreferences

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login)

        sharedPreferences = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)

        val btnLogin: Button = findViewById(R.id.btn_login)
        btnLogin.setOnClickListener {
            performLogin()
        }
    }

    private fun performLogin() {
        val inputNIK: EditText = findViewById(R.id.input_nik)
        val inputPassword: EditText = findViewById(R.id.input_password)

        val request = UserRequest()
        request.nik = inputNIK.text.toString().trim()
        request.password = inputPassword.text.toString().trim()

        val retro = Retro().getRetroClientInstance().create(UserApi::class.java)

        retro.login(request).enqueue(object : Callback<UserResponse> {
            override fun onResponse(call: Call<UserResponse>, response: Response<UserResponse>) {
                val user = response.body()
                if (response.isSuccessful) {
                    if (user?.success == true) {
                        handleLoginResponse(user)
                        Toast.makeText(this@LoginActivity, "Login Berhasil!", Toast.LENGTH_SHORT).show()
                    } else {
                        Log.e("Error", "Login failed: ${user?.message}")
                        Toast.makeText(this@LoginActivity, "Login Gagal! ${user?.message}", Toast.LENGTH_SHORT).show()
                    }
                } else {
                    Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                    Toast.makeText(this@LoginActivity, "Login Gagal! ${response.code()}", Toast.LENGTH_SHORT).show()
                }
            }

            override fun onFailure(call: Call<UserResponse>, t: Throwable) {
                t.message?.let { Log.e("Error", it) }
                Toast.makeText(this@LoginActivity, "Login Gagal! ${t.message}", Toast.LENGTH_SHORT).show()
            }
        })

    }

    private fun handleLoginResponse(user: UserResponse?) {
        if (user != null) {
            if (user.success) {
                val token = user.data?.token
                if (token != null) {
                    saveTokenPrefs(token)
                    startActivity(Intent(this@LoginActivity, MainActivity::class.java))
                    finish()
                } else {
                    if (token != null) {
                        deleteTokenPrefs(token)
                    }
                    Log.e("Error", "Token is null in the response")
                }
            } else {
                val errorMessage = user.message ?: "Unknown error"
                Log.e("Error", "Login failed: $errorMessage")
            }
        } else {
            Log.e("Error", "Response body is null")
        }
    }

    private fun saveTokenPrefs(token: String) {
        val editor = sharedPreferences.edit()
        editor.putString("token", token)
        editor.apply()
    }

    private fun deleteTokenPrefs(token: String) {
        val editor = sharedPreferences.edit()
        editor.remove("token")
        editor.apply()
    }
}