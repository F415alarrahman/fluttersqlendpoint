import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk menggunakan jsonEncode

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
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
              var response = await http.post(
                Uri.parse("https://reqres.in/api/users"),
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
