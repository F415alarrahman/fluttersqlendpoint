import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  String result = ""; // Variabel untuk menyimpan hasil respons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result.isEmpty ? "Kosong" : result),
            ElevatedButton(
              onPressed: () async {
                // Melakukan permintaan HTTP
                Response response =
                    await http.get(Uri.parse("https://reqres.in/api/users/2"));

                print(response.body);

                // Memeriksa status respons
                if (response.statusCode == 200) {
                  Map<String, dynamic> data =
                      json.decode(response.body) as Map<String, dynamic>;
                  setState(() {
                    result =
                        '${data["data"]["email"]}-${data["data"]["first_name"]}${data["data"]["last_name"]}'; // Menyimpan hasil respons
                  });
                } else {
                  print("Gagal: ${response.statusCode}"); // Menangani kesalahan
                  setState(() {
                    result =
                        "Gagal: ${response.statusCode}"; // Menampilkan pesan gagal
                  });
                }
              },
              child: const Text("Get"),
            ),
          ],
        ),
      ),
    );
  }
}
