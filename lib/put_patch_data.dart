import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk menggunakan jsonEncode

class PutPatchData extends StatefulWidget {
  // Mengganti nama kelas
  const PutPatchData({super.key});

  @override
  State<PutPatchData> createState() =>
      _PutPatchDataState(); // Mengganti referensi di sini
}

class _PutPatchDataState extends State<PutPatchData> {
  // Mengganti referensi di sini
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameC,
            decoration: InputDecoration(label: Text("Name")),
          ),
          TextField(
            controller: jobC,
            decoration: InputDecoration(label: Text("Job")),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              // Mengirim data dalam format JSON
              var response = await http.patch(
                Uri.parse("https://reqres.in/api/users/2"),
                headers: {
                  "Content-Type": "application/json", // Menambahkan header
                },
                body: jsonEncode({
                  "name": nameC.text,
                  "job": jobC.text,
                }), // Menggunakan jsonEncode untuk mengonversi ke format JSON
              );

              print(response.body); // Menampilkan respons di konsol

              setState(() {
                result = response.body; // Memperbarui UI dengan respons
              });
            },
            child: Text("Submit"),
          ),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          Text(result), // Menampilkan hasil respons
        ],
      ),
    );
  }
}
