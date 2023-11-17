# Absensi-Apps
Mini project Absensi Apps
- Mobile Apps dibuat menggunakan Kotlin dan Retrofit untuk parsing data API
- Mobile Apps dibuat untuk user/karyawan melakukan absen. Fitur-fitur di dalamnya yaitu Login, Absen Masuk, Absen Makan Siang, Absen Selesai Makan Siang, Absen Pulang, Logout
- Login menggunakan NIK dan Nama yang akan memperoleh token. Token tersebut nantinya digunakan untuk absen hingga logout
- API dibuat dengan Laravel v10 dengan PHP v8
- API yang dibuat ada API Login menggunakan Laravel Sanctum untuk mendapatkan token. Token tersebut yang akan digunakan sebagai header untuk API absen dan logout
- Mini Web Admin dibuat juga di dalam satu folder dengan API. Mini web admin memanggil API dalam satu folder untuk menampilkan list data user dan log absensi user/karyawan
- Dalam log absensi user/karyawan terdapat sebuah kolom yang menunjukkan apakah karyawan datang terlambat atau pulang lebih awal
