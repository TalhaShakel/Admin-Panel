import 'package:flutter/material.dart';

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
              childAspectRatio: _size.width < 650  &&  _size.width>350? 1.5   : 1.3,
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

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.5,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,

          childAspectRatio: childAspectRatio,
        ),
        children: [
          CustomTotalDetails(icon: Icons.person_rounded,detail:  "1000",title:"Total Users",colors: ConstColors.primaryColor),
          CustomTotalDetails(icon: Icons.person_rounded,detail:  "1000",title: "Active Users",colors: ConstColors.red),
          CustomTotalDetails(icon: Icons.person_rounded,detail:  "1000",title: "Total Drivers",colors: ConstColors.lightBlue),
          CustomTotalDetails(icon: Icons.person_rounded,detail:  "1000",title: "Active Drivers",colors: ConstColors.green),

        ],
      ),
    );
  }
}
class CustomTotalDetails extends StatelessWidget {
  CustomTotalDetails({Key? key,required this.title,required this.colors,required this.detail,required this.icon}) : super(key: key);

  IconData icon;
  String title;
  Color colors;
  String detail;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return  Container(


      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ConstColors.primaryColor,width: 2),
        boxShadow: [
          BoxShadow(
              color: const Color(0xffBBC3CE).withOpacity(0.6),
              offset: const Offset(4,4),
              blurRadius: 12
          ),
          BoxShadow(
              color: const Color(0xffFDFFFF).withOpacity(0.8),
              offset: const Offset(-4,-4),
              blurRadius: 12
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              height: _size.width< 400?40:50,
              width: _size.width< 400?40:50,
              decoration: BoxDecoration(

                color: colors,
                borderRadius:
                const BorderRadius.all(Radius.circular(25)),
              ),
              child: Icon(icon,size: _size.width< 400?15:20,)),
          const Spacer(),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
          ),
          const Spacer(),

          Text(
            detail,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.black,height: 0.5),
          ),
          const Spacer(),

        ],
      ),
    );
  }
}