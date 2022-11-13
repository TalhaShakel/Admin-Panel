import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/components/DashboardPage/my_files.dart';

class Drivers extends StatelessWidget {
  var activedriver;
  Drivers({super.key, required this.activedriver});

  @override
  Widget build(BuildContext context) {
    print(activedriver.runtimeType);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: activedriver.length,
        itemBuilder: (context, index) {
          String key = activedriver.keys.elementAt(index);

          return activedriver[key]["name"] == null
              ? Container()
              : Padding(
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
                      title: Text("${activedriver[key]["name"]}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${activedriver[key]["email"]}"),
                          Text("Phone :${activedriver[key]["phone"]}"),
                        ],
                      ),
                      trailing: GestureDetector(
                          onTap: () async {
                            try {
                              EasyLoading.show();
                              DatabaseReference ref = await FirebaseDatabase
                                  .instance
                                  .ref("drivers/${activedriver[key]["id"]}");
                              activedriver[key]["block"] == false
                                  ? await ref.update({"block": true})
                                  : await ref.update({"block": false});
                              EasyLoading.dismiss();
                              Get.to( ()=>MyFiles());
                            } catch (e) {
                              Get.snackbar("$e", "");
                              print(e);
                            }
                          },
                          child: Text(activedriver[key]["block"] == true
                              ? "UnBlock"
                              : "Block")),
                    ),
                  ),
                );
        },
        // Text("$activedriver"),
      ),
    );
  }
}
