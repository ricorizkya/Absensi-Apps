package com.example.absensi_apps.activity

import android.content.Context
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import com.example.absensi_apps.R
import com.example.absensi_apps.api.Retro
import com.example.absensi_apps.api.endpoint.UserApi
import com.example.absensi_apps.api.response.AbsenResponse
import com.example.absensi_apps.api.response.LogoutResponse
import com.example.absensi_apps.api.response.UserDetailResponse
import org.w3c.dom.Text
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response

class MainActivity : AppCompatActivity() {
    private lateinit var btnAbsen: Button
    private lateinit var textAbsen: TextView
    private lateinit var textDone: TextView
    private lateinit var imgDone: ImageView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharedPreferences = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
        val token = sharedPreferences.getString("token", "") ?: ""

        getDataUser(token)

        findViewById<ImageView>(R.id.img_logout).setOnClickListener {
            logoutUser(token)
        }

        textAbsen = findViewById(R.id.tv_absen)
        btnAbsen = findViewById(R.id.button_absen)
        textDone = findViewById(R.id.tv_done)
        imgDone = findViewById(R.id.img_done)

        absenMasuk(token)
    }

    private fun getDataUser(token: String) {
        val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
        retro.getData("Bearer $token").enqueue(object : Callback<UserDetailResponse> {
            override fun onResponse(
                call: Call<UserDetailResponse>,
                response: Response<UserDetailResponse>
            ) {
                if (response.isSuccessful) {
                    val data = response.body()

                    runOnUiThread {
                        findViewById<TextView>(R.id.tv_nik_value).text = data?.nik
                        findViewById<TextView>(R.id.tv_nama_value).text = data?.nama
                    }
                } else {
                    Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                }
            }

            override fun onFailure(call: Call<UserDetailResponse>, t: Throwable) {
                t.message?.let { Log.e("Error", it) }
            }
        })
    }

    private fun logoutUser(token: String) {
        val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
        retro.logout("Bearer $token").enqueue(object : Callback<LogoutResponse>{
            override fun onResponse(
                call: Call<LogoutResponse>,
                response: Response<LogoutResponse>
            ) {
                if (response.isSuccessful) {
                    val sharedPreferences = getSharedPreferences("myPrefs", Context.MODE_PRIVATE)
                    val editor = sharedPreferences.edit()
                    editor.remove("token")
                    editor.apply()

                    val data = response.body()
                    Toast.makeText(this@MainActivity, data?.message, Toast.LENGTH_SHORT).show()
                    startActivity(Intent(this@MainActivity, LoginActivity::class.java))
                    finish()
                } else {
                    Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                }
            }

            override fun onFailure(call: Call<LogoutResponse>, t: Throwable) {
                t.message?.let { Log.e("Error", it) }
            }
        })
    }

    private fun absenMasuk(token: String) {
        textDone.visibility = View.INVISIBLE
        imgDone.visibility = View.INVISIBLE

        btnAbsen.setOnClickListener {
            val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
            retro.absenMasuk("Bearer $token").enqueue(object : Callback<AbsenResponse> {
                override fun onResponse(
                    call: Call<AbsenResponse>,
                    response: Response<AbsenResponse>
                ) {
                    if (response.isSuccessful) {
                        Toast.makeText(this@MainActivity, response.body()?.message, Toast.LENGTH_SHORT).show()
                        btnAbsen.text = "Absen Makan Siang"
                        textAbsen.text = "Waktunya jam makan siang! Jangan lupa klik tombol di bawah ini dan beristirahatlah sebentar!"
                        btnAbsen.setBackgroundResource(R.drawable.button_background_yellow)
                        absenMaksi(token)
                    } else {
                        Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                    }
                }

                override fun onFailure(call: Call<AbsenResponse>, t: Throwable) {
                    t.message?.let { Log.e("Error", it) }
                }
            })
        }
    }

    private fun absenMaksi(token: String) {
        btnAbsen.setOnClickListener {
            val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
            retro.absenMaksi("Bearer $token").enqueue(object : Callback<AbsenResponse> {
                override fun onResponse(
                    call: Call<AbsenResponse>,
                    response: Response<AbsenResponse>
                ) {
                    if (response.isSuccessful) {
                        textDone.visibility = View.INVISIBLE
                        imgDone.visibility = View.INVISIBLE
                        Toast.makeText(this@MainActivity, response.body()?.message, Toast.LENGTH_SHORT).show()
                        btnAbsen.text = "Absen Selesai Makan Siang"
                        textAbsen.text = "Jam makan siang sudah selesai! Jangan lupa klik tombol di bawah ini dan mari lanjut bekerja"
                        btnAbsen.setBackgroundResource(R.drawable.button_background_orange)
                        absenEndMaksi(token)
                    } else {
                        Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                    }
                }

                override fun onFailure(call: Call<AbsenResponse>, t: Throwable) {
                    t.message?.let { Log.e("Error", it) }
                }
            })
        }
    }

    private fun absenEndMaksi(token: String) {
        btnAbsen.setOnClickListener {
            val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
            retro.absenEndMaksi("Bearer $token").enqueue(object : Callback<AbsenResponse> {
                override fun onResponse(
                    call: Call<AbsenResponse>,
                    response: Response<AbsenResponse>
                ) {
                    if (response.isSuccessful) {
                        textDone.visibility = View.INVISIBLE
                        imgDone.visibility = View.INVISIBLE
                        Toast.makeText(this@MainActivity, response.body()?.message, Toast.LENGTH_SHORT).show()
                        btnAbsen.text = "Absen Pulang"
                        textAbsen.text = "Jam kerja sudah selesai! Terima kasih atas waktu dan tenaganya hari ini! Waktunya pulang dan beristirahat. Jangan lupa absen pulang dan silahkan logout dari aplikasi. Sampai bertemu kemmbali!"
                        btnAbsen.setBackgroundResource(R.drawable.button_background_red)
                        absenPulang(token)
                    } else {
                        Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                    }
                }

                override fun onFailure(call: Call<AbsenResponse>, t: Throwable) {
                    t.message?.let { Log.e("Error", it) }
                }
            })
        }
    }

    private fun absenPulang(token: String) {
        btnAbsen.setOnClickListener {
            val retro = Retro().getRetroClientInstance().create(UserApi::class.java)
            retro.absenPulang("Bearer $token").enqueue(object : Callback<AbsenResponse> {
                override fun onResponse(
                    call: Call<AbsenResponse>,
                    response: Response<AbsenResponse>
                ) {
                    if (response.isSuccessful) {
                        Toast.makeText(this@MainActivity, response.body()?.message, Toast.LENGTH_SHORT).show()
                        btnAbsen.visibility = View.INVISIBLE
                        textAbsen.visibility = View.INVISIBLE
                        textDone.visibility = View.VISIBLE
                        imgDone.visibility = View.VISIBLE
                    } else {
                        Log.e("Error", "Gagal mendapatkan respons: ${response.code()}")
                    }
                }

                override fun onFailure(call: Call<AbsenResponse>, t: Throwable) {
                    t.message?.let { Log.e("Error", it) }
                }
            })
        }
    }
}
