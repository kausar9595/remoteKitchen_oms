import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/menu_model/menu_items_list_model.dart';
import '../../../model/menu_model/menu_list_model.dart';
import 'all_items_tab_bar_view.dart';

class SoldOutTabBarView extends StatefulWidget {
  const SoldOutTabBarView({
    super.key,
    required this.menuList,
    this.selectedMenu,
    required this.onMenuSelect,
    required this.menuItemSetSoldOut,
    required this.changeMenuItemAvailableStatus,
    required this.menuItemSearch,
  });

  final List<MenuListResult> menuList;
  final MenuListResult? selectedMenu;
  final Function(int id) onMenuSelect;
  final List<MenuitemSet> menuItemSetSoldOut;
  final Function(int id, bool value) changeMenuItemAvailableStatus;
  final Function(String value) menuItemSearch;

  @override
  State<SoldOutTabBarView> createState() => _SoldOutTabBarViewState();
}

class _SoldOutTabBarViewState extends State<SoldOutTabBarView> {
  bool isSearchEmpty = true;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Column(
        children: [
          const SizedBox(height: 20),
          // Row(
          //   children: [
          //     Expanded(
          //       child: TextFormField(
          //         onChanged: (value) {
          //           setState(() {
          //             isSearchEmpty = value.isEmpty;
          //           });
          //           widget.menuItemSearch(value);
          //         },
          //         decoration: _searchDecoration(),
          //       ),
          //     ),
          //     SizedBox(width: 20),
          //     SizedBox(
          //       width: 300,
          //       child: DropdownButtonFormField(
          //         decoration: _dropdownDecoration(),
          //         value: widget.selectedMenu?.id,
          //         items: widget.menuList.map((e) => DropdownMenuItem(value: e.id!, child: Text(e.title!))).toList(),
          //         onChanged: (value) {
          //           if (value != widget.selectedMenu?.id) {
          //             widget.onMenuSelect(value!);
          //           }
          //           widget.onMenuSelect(value!);
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: widget.menuItemSetSoldOut.length + 1,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text("${widget.menuItemSetSoldOut.length} Items");
                }
                return AllItemsListTile(
                  menuitemSet: widget.menuItemSetSoldOut[index - 1],
                  changeMenuItemAvailableStatus: widget.changeMenuItemAvailableStatus,
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _searchDecoration() {
    return const InputDecoration(
      hintText: "Search By Item Name",
      hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.blue), borderRadius: BorderRadius.all(Radius.circular(10))),
      border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  InputDecoration _dropdownDecoration() {
    return const InputDecoration(
      hintText: "Menu",
      hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
      border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}

class AllItemsListTile extends StatelessWidget {
  const AllItemsListTile({
    super.key,
    required this.menuitemSet,
    required this.changeMenuItemAvailableStatus,
  });

  final MenuitemSet menuitemSet;
  final Function(int id, bool value) changeMenuItemAvailableStatus;

  @override
  Widget build(BuildContext context) {
    final imageUrl = menuitemSet.originalImage?.workingUrl;
    return ListTile(
      leading: imageUrl == null ? null : CachedNetworkImage(imageUrl: imageUrl, width: 60),
      title: Text(menuitemSet.name),
      trailing: InkWell(
        onTap: () {
          showDialog(
            context: (context),
            builder: (context) => ItemAvailabilityPopup(
              id: menuitemSet.id,
              available: menuitemSet.isAvailable,
              changeMenuItemAvailableStatus: changeMenuItemAvailableStatus,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: menuitemSet.isAvailable ? Colors.blue : Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                menuitemSet.isAvailable ? "In Stock" : "Sold Out",
                style: TextStyle(fontSize: 16, color: menuitemSet.isAvailable ? Colors.blue : Colors.red),
              ),
              SizedBox(width: 10),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
      ),
    );
  }
}
