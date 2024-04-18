import 'package:flutter/material.dart';
import 'package:oms/view/menus/tab_views/all_items_tab_bar_view.dart';
import 'package:oms/view/menus/tab_views/menu_tab_bar_view.dart';
import 'package:oms/widget/app_drawer.dart';

import '../../controller/menu_controller.dart';
import '../../model/menu_model/menu_items_list_model.dart';
import '../../model/menu_model/menu_list_model.dart';
import '../../utility/appcolor.dart';

class NewMenuScreen extends StatefulWidget {
  const NewMenuScreen({super.key});

  @override
  State<NewMenuScreen> createState() => _NewMenuScreenState();
}

class _NewMenuScreenState extends State<NewMenuScreen> {
  final List<MenuListResult> _menuList = [];
  MenuListResult? _selectedMenu;
  final List<MenuitemSet> _menuitemSet = [];
  List<MenuitemSet> _menuitemSetFiltered = [];
  bool _loadingMenu = false;
  _loadMenuList() async {
    _loadingMenu = true;
    setState(() {});

    final menuList = await MenusController.getMenuList();
    _menuList.clear();
    _menuList.addAll(menuList.results ?? []);
    setState(() {});

    if (_menuList.isEmpty) {
      _loadingMenu = false;
      setState(() {});
      return;
    } else {
      _selectedMenu = _menuList.first;
    }

    final menuItemsList = await MenusController.getMenuItemsList(_menuList.first.id!);
    _menuitemSet.clear();
    _menuitemSet.addAll(menuItemsList.menuitemSet);
    _loadingMenu = false;
    setState(() {});
  }

  _loadMenuItemList(int id) async {
    final menuItemsList = await MenusController.getMenuItemsList(id);
    _menuitemSet.clear();
    _menuitemSet.addAll(menuItemsList.menuitemSet);
    _loadingMenu = false;
    setState(() {});
  }

  _menuItemsSearch(String value) {
    _menuitemSetFiltered = _menuitemSet.where((element) => element.name.contains(value)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: const AppDrawer(currentPage: NewMenuScreen()),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Row(
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ],
              ),
            ),
            actions: const [
              SizedBox(
                width: 300,
                child: TabBar(labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textblack), tabs: [
                  Tab(
                    text: "All Items",
                  ),
                  Tab(
                    text: "Menu",
                  ),
                ]),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                AllItemsTabBarView(
                  onRefresh: _loadMenuList,
                  onMenuSelect: (id) {
                    _loadMenuItemList(id);
                  },
                  menuItemSearch: (value) {
                    _menuItemsSearch(value);
                  },
                  selectedMenu: _selectedMenu,
                  loadingMenu: _loadingMenu,
                  menuList: _menuList,
                  menuitemSet: _menuitemSet,
                  menuitemSetFiltered: _menuitemSetFiltered,
                ),
                const MenuTabBarView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
