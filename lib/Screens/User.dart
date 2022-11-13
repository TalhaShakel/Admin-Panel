import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/components/DashboardPage/my_files.dart';

class User extends StatelessWidget {
  var user;
  User({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          String key = user.keys.elementAt(index);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              // color: Color.fromARGB(255, 219, 180, 186),
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11), // if you need this
                side: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),

              child: ListTile(
                title: Text("${user[key]["name"]}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${user[key]["email"]}"),
                    Text("Phone :${user[key]["phone"]}"),
                  ],
                ),
                trailing: GestureDetector(
                    onTap: () async {
                      try {
                        EasyLoading.show();
                        DatabaseReference ref = await FirebaseDatabase.instance
                            .ref("users/${user[key]["id"]}");
                        user[key]["block"] == false
                            ? await ref.update({"block": true})
                            : await ref.update({"block": false});
                        EasyLoading.dismiss();
                        Get.to(() => MyFiles());
                      } catch (e) {
                        Get.snackbar("$e", "");
                        print(e);
                      }
                    },
                    child:
                        Text(user[key]["block"] == true ? "UnBlock" : "Block")),
              ),
            ),
          );
        },
        // Text("$activedriver"),
      ),
    );
  }
}
