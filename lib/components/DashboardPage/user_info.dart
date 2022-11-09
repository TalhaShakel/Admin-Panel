import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/Const_Colors.dart';
import '../../constants/padding.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: ConstColors.primaryColor)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Seller Information",
                  style: TextStyle(
                      color: ConstColors.primaryColor,
                      fontWeight: FontWeight.bold,fontSize: 20
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ConstColors.primaryColor,
                    ),
                    child: Center(
                      child: Text("Add Seller",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w700
                      ),),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height,
              child: DataTable2(
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Name",style: GoogleFonts.raleway(
                      textStyle: TextStyle(color: ConstColors.primaryColor,fontWeight: FontWeight.bold),
                    ),),
                  ),
                  DataColumn(
                    label: Text("Email",style: GoogleFonts.raleway(
                      textStyle: TextStyle(color:ConstColors.primaryColor,fontWeight: FontWeight.bold),
                    ),),
                  ),
                  DataColumn(
                    label: Text("City",style: GoogleFonts.raleway(
                      textStyle: TextStyle(color: ConstColors.primaryColor,fontWeight: FontWeight.bold),
                    ),),
                  ),
                  DataColumn(
                    label: Text("Phone No",style: GoogleFonts.raleway(
                      textStyle: TextStyle(color: ConstColors.primaryColor,fontWeight: FontWeight.bold),
                    ),),
                  ),
                  DataColumn(
                    label: Text("Skills",style: GoogleFonts.raleway(
                      textStyle: TextStyle(color: ConstColors.primaryColor,fontWeight: FontWeight.bold),
                    ),),
                  ),
                ],
                rows: List.generate(
                  demoRecentFiles.length,
                      (index) => recentFileDataRow(demoRecentFiles[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Text(fileInfo.name!),
      ),
      DataCell(
        Text(fileInfo.email!),
      ),
      DataCell(Text(fileInfo.city!)),
      DataCell(Text(fileInfo.phone!)),
      DataCell(Text(fileInfo.skills!)),
    ],
  );
}

class RecentFile {
  final String?  city,name, phone, email,skills;

  RecentFile({ this.city, this.name, this.phone, this.email,this.skills});
}

List demoRecentFiles = [
  RecentFile(
    city: "Multan",
    name: "Muhammad Hassan",
    email: "hassan420@gmail.com",
    phone: "03038540852",
      skills: "Video Editor"

  ),
  RecentFile(
    city: "Karachi",
    name: "Muhammad Hassan",
    email: "hassan420@gmail.com",
    phone: "03038540852",
    skills: "Video Editor"
  ),
  RecentFile(
    city: "Lahore",
    name: "Muhammad Hassan",
    email: "hassan420@gmail.com",
    phone: "03038540852",
      skills: "Video Editor"

  ),
];
