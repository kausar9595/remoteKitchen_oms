import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:oms/app_config.dart';
import 'package:oms/controller/auth_controller.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/model/restaurant_model/location_list_model.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/widget/app_shemmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/restaurant_model/restaurantListModel.dart';
import '../utility/appcolor.dart';
import '../view/history/history_screen.dart';
import '../view/order/screen/orders.dart';

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
  RestaurantResult? _selectedRestaurantId;
  LocationResult? _selectedLocationId;
  var selectRsname;
  var selectLocationName;

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

  _getLocationAdnRestaurant()async{
    await RestaurantController.getLocationAndRestaurantIds().then((value){
      print("value.locationName! === ${value.locationName!}");
        setState(() {
          selectLocationName = (value.locationName!);
          selectRsname = value.restaurantName!;
        });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getRestaurantList();

    _getLocationAdnRestaurant();




  }


  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.30,
      child:  SingleChildScrollView(
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
                  fontSize: titleFontSize,
                  color: Colors.black),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment.centerLeft,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.27,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.textindigo, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _isRestaurantLoading ? AppShimmer(width: 200)

                  : DropdownButtonHideUnderline(
                child: DropdownButton2<RestaurantResult>(
                  isExpanded: true,
                  hint: Text(
                    '${selectRsname != null ? selectRsname : "Restaurant Select"}',
                    style: TextStyle(
                      fontSize: normalFontSize,
                      color: AppColors.textindigo,
                    ),
                  ),
                    items: _restaurantList.map<DropdownMenuItem<RestaurantResult>>((value) {
                      return DropdownMenuItem<RestaurantResult>(
                        value: value,
                        child: Text(value.name.toString(),
                          style: TextStyle(
                            fontSize: normalFontSize
                          ),
                        ),
                      );
                    }).toList(),
                    value: _selectedRestaurantId != null ? _selectedRestaurantId : null, // Ensure value is null or non-empty
                    onChanged: (v) {
                      setState(() {
                        _selectedRestaurantId = v;
                      });
                      RestaurantController.addSelectedRestaurantInfo(restaurantId: _selectedRestaurantId!.id.toString(), restaurantName: _selectedRestaurantId!.name.toString()).then((value){
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
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.27,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textindigo, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _isLocationLoading ? AppShimmer(width: 200,)

                    : DropdownButtonHideUnderline(
                  child: DropdownButton2<LocationResult>(
                    isExpanded: true,
                    hint: Text(
                      '${selectLocationName != null ? selectLocationName : "Location Select"}',
                      style: TextStyle(
                        fontSize: normalFontSize,
                        color: AppColors.textindigo,
                      ),
                    ),
                    items: _locationList.map((value) {
                      return DropdownMenuItem<LocationResult>(
                        value: value,
                        child: Text(value.name.toString(),
                          style: TextStyle(
                              fontSize: normalFontSize,
                          ),
                        ),
                      );
                    }).toList(),
                    value: _selectedLocationId != null ? _selectedLocationId : null, // Ensure value is null or non-empty
                    onChanged: (v) {
                      setState(() {
                        _selectedLocationId = v!;
                      });
                      //After that back to the
                      ///Get.to(widget.currentPage, transition: Transition.fade);
                      RestaurantController.addSelectedLocationInfo(locationId: _selectedLocationId!.id.toString(), locationName: _selectedLocationId!.name.toString()).then((value){
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
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),


            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       _isMenu = true;
            //       _isOrder = false;
            //       _isHistory = false;
            //       //Navigator.push(context, MaterialPageRoute(builder: (context)=>Menus()));
            //       Get.to(Menus(), transition: Transition.rightToLeft);
            //     });
            //   },
            //   child: Container(
            //     padding: EdgeInsets.only(left: 20),
            //     alignment: Alignment.centerLeft,
            //     height: 50,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       border: _isMenu
            //           ? Border(
            //         left: BorderSide(
            //             color: AppColors.textindigo, width: 6),
            //       )
            //           : Border(left: BorderSide.none),
            //       color: _isMenu ? Colors.grey : Colors.transparent,
            //     ),
            //     child: Text(
            //       "Menu",
            //       style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.w600,
            //           color: Colors.black),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
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
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: ()async{
                _launchInBrowserView(Uri.parse("${AppConfig.DASHBOARD}"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(
                        fontSize: titleFontSize,
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
              onTap: ()=> alert(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Icon(Icons.logout,size: 20,color: Colors.black,),
                  SizedBox(width: 60,),


                ],
              ),
            ),
            // InkWell(
            //   onTap: (){
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
            //   },
            //   child: Text(
            //     "Settings",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // InkWell(
            //   onTap: (){},
            //   child: Text(
            //     "Helps",
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.black),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> alert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure? You want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () async{
                AuthController.logout(context);
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () async{
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
  
}
