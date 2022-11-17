import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:trillest_admin/Screens/Dashborad/main_screen.dart';
import 'package:trillest_admin/Screens/Drivers.dart';
import 'package:trillest_admin/Screens/User.dart';
import 'package:trillest_admin/components/DashboardPage/dashboard_page.dart';
// import 'package:trillest_admin/Screens/activeDrivers.dart';

import '../../constants/Const_Colors.dart';
import '../../constants/Responsive.dart';
import '../../constants/padding.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio:
                  _size.width < 650 && _size.width > 350 ? 1.5 : 1.3,
            ),
            tablet: const FileInfoCardGridView(),
            desktop: FileInfoCardGridView(
              childAspectRatio: _size.width < 1400 ? 1.7 : 1.7,
            ),
          ),
        ],
      ),
    );
  }
}

var activeDrivers1, users1;

class FileInfoCardGridView extends StatefulWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.5,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<FileInfoCardGridView> createState() => _FileInfoCardGridViewState();
}

class _FileInfoCardGridViewState extends State<FileInfoCardGridView> {
  @override
  var rideRequests, activeDrivers, drivers, users;
  // var users1;
  void initState() {
    // TODO: implement initState
    dataGet("All Ride Requests").then((id) {
      print("Id that was loaded: $id");
      rideRequests = id;
    });
    // rideRequests = dataGet("All Ride Requests");
    dataGet("activeDrivers").then((id) {
      print("Id that was loaded: $id");
      activeDrivers = id;
    });

    dataGet("drivers").then((id) {
      print("Id that was loaded: $id");
      drivers = id;
    });
    dataGet("users").then((id) {
      print("Id that was loaded: $id");
      users = id;
    });
    dataGet2("drivers").then((id) {
      print("Id that was loaded11: $id");
      activeDrivers1 = id;
    });
    dataGet2("users").then((id) {
      print("Id that was loaded11: $id");
      users1 = id;
    });

    super.initState();
  }

  dataGet(type) async {
    try {
      EasyLoading.show();
      DatabaseReference ref = FirebaseDatabase.instance.ref("$type");
      DatabaseEvent event = await ref.once();
      // print("object");
      Map<String, dynamic>? k = event.snapshot.value as Map<String, dynamic>;
      print(k.length.toString() + "$type");
      setState(() {});
      EasyLoading.dismiss();
      Get.to(() => MainScreen());

      return k.length;
    } on FirebaseException catch (e) {
      Get.snackbar("${e.message}", "");
      print(e.toString() + "eee");
    }
  }

  dataGet2(type) async {
    try {
      EasyLoading.show();
      DatabaseReference ref = FirebaseDatabase.instance.ref("$type");
      DatabaseEvent event = await ref.once();
      // print("object");
      Map<String, dynamic>? k = event.snapshot.value as Map<String, dynamic>;
      print(k.length.toString() + "$type");
      setState(() {});
      EasyLoading.dismiss();
      Get.to(() => MainScreen());

      return k;
    } on FirebaseException catch (e) {
      Get.snackbar("${e.message}", "");
      print(e.toString() + "eee");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          childAspectRatio: widget.childAspectRatio,
        ),
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => User(
                    user: users1,
                  ));
              print(users1);
            },
            child: CustomTotalDetails(
                icon: Icons.person_rounded,
                detail: "${users}",
                title: "Total Users",
                colors: ConstColors.primaryColor),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => User(
                    user: users1,
                  ));
              print(users1);
            },
            child: CustomTotalDetails(
                icon: Icons.person_rounded,
                detail: "${users}",
                title: "Active Users",
                colors: ConstColors.red),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Drivers(
                    activedriver: activeDrivers1,
                  ));

              // print(drivers);
            },
            child: CustomTotalDetails(
                icon: Icons.person_rounded,
                detail: "${drivers}",
                title: "Total Drivers",
                colors: ConstColors.lightBlue),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Drivers(
                    activedriver: activeDrivers1,
                  ));
              print(activeDrivers1);
            },
            child: CustomTotalDetails(
                icon: Icons.person_rounded,
                detail: "${activeDrivers}",
                title: "Active Drivers",
                colors: ConstColors.green),
          ),
        ],
      ),
    );
  }
}

class CustomTotalDetails extends StatelessWidget {
  CustomTotalDetails(
      {Key? key,
      required this.title,
      required this.colors,
      required this.detail,
      required this.icon})
      : super(key: key);

  IconData icon;
  String title;
  Color colors;
  String detail;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ConstColors.primaryColor, width: 2),
        boxShadow: [
          BoxShadow(
              color: const Color(0xffBBC3CE).withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 12),
          BoxShadow(
              color: const Color(0xffFDFFFF).withOpacity(0.8),
              offset: const Offset(-4, -4),
              blurRadius: 12),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              height: _size.width < 400 ? 40 : 50,
              width: _size.width < 400 ? 40 : 50,
              decoration: BoxDecoration(
                color: colors,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Icon(
                icon,
                size: _size.width < 400 ? 15 : 20,
              )),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            detail,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black, height: 0.5),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
