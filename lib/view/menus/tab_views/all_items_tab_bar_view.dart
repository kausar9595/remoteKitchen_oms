import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:oms/controller/menu_controller.dart';
import '../../../model/menu_model/menu_items_list_model.dart';
import '../../../model/menu_model/menu_list_model.dart';
import '../../../utility/appcolor.dart';
import '../../../widget/app_alert.dart';

class AllItemsTabBarView extends StatefulWidget {
  const AllItemsTabBarView({
    super.key,
    required this.menuList,
    required this.menuitemSet,
    required this.loadingMenu,
    required this.selectedMenu,
    required this.onRefresh,
    required this.onMenuSelect,
    required this.menuItemSearch,
    required this.menuitemSetFiltered,
    required this.loadingMenuItems,
    required this.changeMenuItemAvailableStatus,
  });
  final List<MenuListResult> menuList;
  final List<MenuitemSet> menuitemSet;
  final List<MenuitemSet> menuitemSetFiltered;
  final bool loadingMenu;
  final bool loadingMenuItems;
  final MenuListResult? selectedMenu;
  final VoidCallback onRefresh;
  final Function(int id) onMenuSelect;
  final Function(String value) menuItemSearch;
  final Function(int id, bool value) changeMenuItemAvailableStatus;
  @override
  State<AllItemsTabBarView> createState() => _AllItemsTabBarViewState();
}

class _AllItemsTabBarViewState extends State<AllItemsTabBarView> {
  final _searchController = TextEditingController();

  bool isSearchEmpty = true;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        widget.onRefresh();
      },
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      isSearchEmpty = value.isEmpty;
                    });
                    widget.menuItemSearch(value);
                  },
                  decoration: _searchDecoration(),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 300,
                child: widget.loadingMenu
                    ? const Text("Loading")
                    : DropdownButtonFormField(
                        decoration: _dropdownDecoration(),
                        value: widget.selectedMenu?.id,
                        items: widget.menuList.map((e) => DropdownMenuItem(value: e.id!, child: Text(e.title!))).toList(),
                        onChanged: (value) {
                          if (value != widget.selectedMenu?.id) {
                            widget.onMenuSelect(value!);
                          }
                          widget.onMenuSelect(value!);
                        },
                      ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          widget.loadingMenuItems
              ? const Center(
                  child: Text("Loading"),
                )
              : widget.menuitemSetFiltered.isEmpty && isSearchEmpty == true
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: widget.menuitemSet.length + 1,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Text("${widget.menuitemSet.length} Items");
                          }
                          return AllItemsListTile(
                            menuitemSet: widget.menuitemSet[index - 1],
                            changeMenuItemAvailableStatus: widget.changeMenuItemAvailableStatus,
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      ),
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: widget.menuitemSetFiltered.length + 1,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Text("${widget.menuitemSetFiltered.length} Items");
                          }
                          return AllItemsListTile(
                            menuitemSet: widget.menuitemSetFiltered[index - 1],
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

class ItemAvailabilityPopup extends StatefulWidget {
  const ItemAvailabilityPopup({
    super.key,
    required this.id,
    required this.available,
    required this.changeMenuItemAvailableStatus,
  });

  final int id;
  final bool available;
  final Function(int id, bool value) changeMenuItemAvailableStatus;

  @override
  State<ItemAvailabilityPopup> createState() => _ItemAvailabilityPopupState();
}

class _ItemAvailabilityPopupState extends State<ItemAvailabilityPopup> {
  late String _selectedText = widget.available ? "in_stock" : "sold_out_today";
  void changeSelect(String value) {
    _selectedText = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      title: SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Change Availability",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                changeSelect("in_stock");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _selectedText == "in_stock" ? AppColors.textindigo : AppColors.grey200),
                ),
                child: ListTile(
                  title: const Text("In Stock"),
                  trailing: _selectedText == "in_stock"
                      ? const Icon(
                          Icons.check_circle_outlined,
                          color: AppColors.textindigo,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                changeSelect("sold_out_today");
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: _selectedText == "sold_out_today" ? AppColors.textindigo : AppColors.grey200),
                ),
                child: ListTile(
                  title: const Text("Sold Out Today"),
                  trailing: _selectedText == "sold_out_today"
                      ? const Icon(
                          Icons.check_circle_outlined,
                          color: AppColors.textindigo,
                        )
                      : const Icon(
                          Icons.circle_outlined,
                        ),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // InkWell(
            //   onTap: () {
            //     changeSelect("sold_out_indefinately");
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: _selectedText == "sold_out_indefinately" ? AppColors.textindigo : AppColors.grey200),
            //     ),
            //     child: ListTile(
            //       title: const Text("Sold Out Indefinately"),
            //       trailing: _selectedText == "sold_out_indefinately"
            //           ? const Icon(
            //               Icons.check_circle_outlined,
            //               color: AppColors.textindigo,
            //             )
            //           : const Icon(
            //               Icons.circle_outlined,
            //             ),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: _isLoading ? null : _changeAvailability,
              child: const Text("Change"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  bool _isLoading = false;

  _changeAvailability() async {
    if (widget.available == (_selectedText == "in_stock")) {
      return;
    }
    _isLoading = true;
    setState(() {});

    final response = await MenusController.changeAvailability([widget.id], _selectedText == "in_stock");

    _isLoading = false;
    setState(() {});

    if (response == 200) {
      widget.changeMenuItemAvailableStatus(widget.id, _selectedText == "in_stock");
      Navigator.pop(context);
    } else {
      AppSnackBar(context, "Failed To Change Status", Colors.red);
    }
  }
}
