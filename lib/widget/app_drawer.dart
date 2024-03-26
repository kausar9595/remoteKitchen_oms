import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/model/restaurant_model/location_list_model.dart';
import 'package:oms/widget/app_shemmer.dart';
import '../model/restaurant_model/restaurantListModel.dart';
import '../utility/appcolor.dart';
import '../view/history/history_screen.dart';
import '../view/menus/menus.dart';
import '../view/order/screen/orders.dart';
import '../view/setting_screen/setting_screen.dart';

class AppDrawer extends StatefulWidget {
  final Widget currentPage;
  const AppDrawer({super.key, required this.currentPage});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isOrder = false;
  bool _isMenu = false;
  bool _isHistory = false;

  bool _isRestaurantLoading = false;
  bool _isLocationLoading = false;

  //store restaurant list into a empty list
  List<RestaurantResult> _restaurantList = [];

  //store location list into a empty list
  List<LocationResult> _locationList = [];

  //restaurant id
  String _selectedRestaurantId = "";
  String _selectedLocationId = "";
  String selectedValue = "Restaurant Select";
  String selectedLocationValue = "Location Select";


  void _getRestaurantList()async{
    setState(() => _isRestaurantLoading = true);
    var res = await RestaurantController.getRestaurantList();
    for(var i in res.results!){
      setState(() {
        _restaurantList.add(i);
      });
    }
    print("_restaurantList == ${_restaurantList[0].id}");
    setState(() => _isRestaurantLoading = false);
  }

  void _getLocation()async{
    setState(() => _isLocationLoading = true);
    var res = await RestaurantController.getLocationList();
    for(var i in res.results!){
      setState(() {
        _locationList.add(i);
      });
    }
    setState(() => _isLocationLoading = false);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRestaurantList();
  }


  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.30,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {Navigator.pop(context);},
                icon: Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                  size: 40,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              "Current location Selected",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.20,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textindigo, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _isRestaurantLoading ? AppShimmer(width: 200)

                  : DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'Restaurant Select',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textindigo,
                    ),
                  ),
                    items: _restaurantList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id!.toString(),
                        child: Text(value.name.toString(),
                          style: TextStyle(
                            fontSize: 13
                          ),
                        ),
                      );
                    }).toList(),
                    value: _selectedRestaurantId.isNotEmpty ? _selectedRestaurantId : null, // Ensure value is null or non-empty
                    onChanged: (v) {
                      setState(() {
                        _selectedRestaurantId = v!;
                      });
                      RestaurantController.addSelectedRestaurantInfo(restaurantId: _selectedRestaurantId.toString(), restaurantName: '').then((value){
                        //call location list
                        _getLocation();
                      });
                    },
                ),
              )
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.20,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textindigo, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _isLocationLoading ? AppShimmer(width: 200,)

                    : DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Location Select',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textindigo,
                      ),
                    ),
                    items: _locationList.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id!.toString(),
                        child: Text(value.name.toString(),
                          style: TextStyle(
                              fontSize: 13
                          ),
                        ),
                      );
                    }).toList(),
                    value: _selectedLocationId.isNotEmpty ? _selectedLocationId : null, // Ensure value is null or non-empty
                    onChanged: (v) {
                      setState(() {
                        _selectedLocationId = v!;
                      });
                      //After that back to the
                      ///Get.to(widget.currentPage, transition: Transition.fade);
                      RestaurantController.addSelectedLocationInfo(locationId: _selectedLocationId, locationName: '').then((value){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> widget.currentPage));
                      });

                    },
                  ),
                )

            ),


            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isOrder = true;
                  _isMenu = false;
                  _isHistory = false;
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Orders())
                  // );
                  Get.to(Orders(), transition: Transition.rightToLeft);

                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: _isOrder
                      ? Border(
                      left: BorderSide(
                          color: AppColors.textindigo, width: 6))
                      : Border(left: BorderSide.none),
                  color: _isOrder ? Colors.grey : Colors.transparent,
                ),
                child: Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isMenu = true;
                  _isOrder = false;
                  _isHistory = false;
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>Menus()));
                  Get.to(Menus(), transition: Transition.rightToLeft);
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: _isMenu
                      ? Border(
                    left: BorderSide(
                        color: AppColors.textindigo, width: 6),
                  )
                      : Border(left: BorderSide.none),
                  color: _isMenu ? Colors.grey : Colors.transparent,
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isHistory = true;
                  _isOrder = false;
                  _isMenu = false;
                  Get.to(HistoryScreen(), transition: Transition.rightToLeft);
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: _isHistory
                      ? Border(
                    left: BorderSide(
                        color: AppColors.textindigo, width: 6),
                  ) : Border(left: BorderSide.none),
                  color: _isHistory ? Colors.grey : Colors.transparent,
                ),
                child: Text(
                  "History",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Icon(Icons.ios_share_sharp,size: 20,color: Colors.black,),
                  SizedBox(width: 60,),


                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
              },
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){},
              child: Text(
                "Helps",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
