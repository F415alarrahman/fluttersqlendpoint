import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostData extends StatelessWidget {
  const PostData({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameC = TextEditingController();
    TextEditingController jobC = TextEditingController();
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            controller: nameC,
            decoration: InputDecoration(label: Text("name")),
          ),
          TextField(
            controller: jobC,
            decoration: InputDecoration(label: Text("job")),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () async {
                var response = await http.post(
                    Uri.parse("https://reqres.in/api/users"),
                    body: {"name": nameC.text, "job": jobC.text});
                print(response.body);
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
