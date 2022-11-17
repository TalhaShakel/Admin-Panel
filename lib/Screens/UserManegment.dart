import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/Screens/Dashborad/main_screen.dart';
import 'package:trillest_admin/components/DashboardPage/my_files.dart';

class UserManegment extends StatelessWidget {
  var user;
  UserManegment({super.key, this.user});

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
                        user[key]["aprroved"] == false
                            ? await ref.update({"aprroved": true})
                            : await ref.update({"aprroved": false});
                        EasyLoading.dismiss();
                        Get.to(() => MyFiles());
                      } catch (e) {
                        Get.snackbar("$e", "");
                        print(e);
                      }
                    },
                    child: Text(user[key]["aprroved"] == true
                        ? "Approved"
                        : "UnApproved")),
              ),
            ),
          );
        },
        // Text("$activedriver"),
      ),
    );
  }
}
