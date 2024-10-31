import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Delete extends StatelessWidget {
  const Delete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Menggunakan metode DELETE
            var response = await http.delete(Uri.parse(
                "https://reqres.in/api/users/2")); // Gantilah ID sesuai kebutuhan
            if (response.statusCode == 204) {
              // Status 204 menunjukkan bahwa penghapusan berhasil
              print("Data terhapus");
            } else {
              print(
                  "Gagal: ${response.statusCode}"); // Menampilkan status kode saat gagal
            }
          },
          child: Text("Hapus"),
        ),
      ),
    );
  }
}
