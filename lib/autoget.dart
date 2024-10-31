import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk menggunakan jsonDecode

class Autoget extends StatelessWidget {
  const Autoget({super.key});

  // Fungsi untuk mengambil semua pengguna
  Future<List<dynamic>> getAllUser() async {
    final response = await http.get(Uri.parse("https://reqres.in/api/users"));

    if (response.statusCode == 200) {
      // Mengembalikan data pengguna dalam format JSON
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getAllUser(), // Mengisi future dengan fungsi getAllUser
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Menampilkan indikator loading
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
                    'Error: ${snapshot.error}')); // Menampilkan pesan kesalahan
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
                    'No users found')); // Menampilkan pesan jika tidak ada pengguna
          }

          // Mengambil data dari snapshot
          final users = snapshot.data!;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      user['avatar']), // Menggunakan avatar dari API
                ),
                title: Text(user['first_name'] +
                    ' ' +
                    user['last_name']), // Menggabungkan nama depan dan belakang
                subtitle: Text(user['email']), // Menampilkan email pengguna
              );
            },
          );
        },
      ),
    );
  }
}
