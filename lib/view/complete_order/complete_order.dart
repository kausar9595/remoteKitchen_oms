import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/schedule_order/widget/data_table.dart';
import '../../utility/appcolor.dart';
import '../../widget/app_drawer.dart';

class CompleteOrder extends StatefulWidget {
  const CompleteOrder({super.key});

  @override
  State<CompleteOrder> createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder> {
  final _search= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      drawer: AppDrawer(
        currentPage: CompleteOrder(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Divider(color: Colors.grey.withOpacity(0.5),),
            )
        ),
        elevation: 0,
        title: Text("Complete Orders",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color:AppColors.textblack
          ),
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.45,
              child: TextFormField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search Order number, Customer name, or Items",
                  hintStyle: TextStyle(
                    fontSize: smallFontSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textblack,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search,color: AppColors.textblack,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(height: 20,),
            scheduleTable(
              rowOneTitle: "#600175820",
              rowOneSubtitle: "Customer Name Ex.",
              rowTwoTitle: "Meat that Skewers&Kebab",
              rowTwoSubtitle: "Fresh lamb kebab (10 skewers)- BOG....",
              orderCount: "2",
              orderPrice: "CA\$23",
              buttonColor: Colors.green.shade100,
              buttonText: "Complete",
            ),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 10,),
            scheduleTable(
              rowOneTitle: "#600175820",
              rowOneSubtitle: "Customer Name Ex.",
              rowTwoTitle: "Meat that Skewers&Kebab",
              rowTwoSubtitle: "Fresh lamb kebab (10 skewers)- BOG....",
              orderCount: "3",
              orderPrice: "CA\$23",
              buttonColor: Colors.green.shade100,
              buttonText: "Complete",
            ),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 10,),
            scheduleTable(
              rowOneTitle: "#600175820",
              rowOneSubtitle: "Customer Name Ex.",
              rowTwoTitle: "Meat that Skewers&Kebab",
              rowTwoSubtitle: "Fresh lamb kebab (10 skewers)- BOG....",
              orderCount: "5",
              orderPrice: "CA\$23",
              buttonColor: Colors.green.shade100,
              buttonText: "Complete",
            ),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 10,),
            scheduleTable(
              rowOneTitle: "#600175820",
              rowOneSubtitle: "Customer Name Ex.",
              rowTwoTitle: "Meat that Skewers&Kebab",
              rowTwoSubtitle: "Fresh lamb kebab (10 skewers)- BOG....",
              orderCount: "1",
              orderPrice: "CA\$23",
              buttonColor: Colors.green.shade100,
              buttonText: "Complete",
            ),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 10,),


          ],
        ),
      ),
    ));
  }
}


