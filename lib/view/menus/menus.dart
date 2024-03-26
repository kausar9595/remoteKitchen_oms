import 'package:flutter/material.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/view/history/history_screen.dart';
import 'package:oms/view/menus/widgets/availability.dart';
import 'package:oms/view/menus/hours_screen/hours.dart';
import 'package:oms/view/menus/widgets/menu_list_app_bar.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/view/setting_screen/setting_screen.dart';
import 'package:oms/widget/app_drawer.dart';

import '../../controller/menu_controller.dart';
import '../../model/menu_model/menu_list_model.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  bool _isMenuListLoading = false;
  String selectedMenu = "";

  List<MenuListResult> _menuList = [];
  void _getMenuList()async{
    setState(() => _isMenuListLoading = true);
    var res = await MenusController.getMenuList();
    for(var i in res.results!){
      setState(() {
        _menuList.add(i);
      });
    }
    setState(() => _isMenuListLoading = false);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.white,
          drawer: AppDrawer(currentPage: Menus()),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 230,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textindigo, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: _menuList.isNotEmpty ? MenuListDropDown(
                          isLoading: _isMenuListLoading,
                          menuList: _menuList,
                      ) : TextButton(onPressed: (){
                        _key.currentState!.openDrawer();
                      }, child: Text("Select restaurant & location")),
                  )


                ],
              ),
            ),
            actions: [
              SizedBox(
                width: 300,
                child: TabBar(
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textblack),
                    tabs: [
                      Tab(
                        text: "Availability",
                      ),
                      Tab(
                        text: "Hours",
                      ),
                    ]),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: TabBarView(
              children: [
            AvailabilityMenus(),
            HoursMenus(),
          ]),
        ),
      ),
    );
  }
}
