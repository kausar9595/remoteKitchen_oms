import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:oms/controller/menu_controller.dart';
import 'package:oms/utility/app_const.dart';

import '../../../model/menu_model/menu_list_model.dart';
import '../../../utility/appcolor.dart';
import '../../../widget/app_shemmer.dart';

class MenuListDropDown extends StatefulWidget {
  final bool isLoading;
  final List<MenuListResult> menuList;
  const MenuListDropDown({super.key, required this.isLoading, required this.menuList});

  @override
  State<MenuListDropDown> createState() => _MenuListDropDownState();
}

class _MenuListDropDownState extends State<MenuListDropDown> {

  String selectedMenu = "";

  @override
  Widget build(BuildContext context) {
    return  widget.isLoading ? AppShimmer(width: 130,)
        : DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Menu Select',
                style: TextStyle(
                  fontSize: normalFontSize,
                  color: AppColors.textindigo,
                ),
              ),
              items: widget.menuList.map((value) {
                return DropdownMenuItem<String>(
                  value: value.id!.toString(),
                  child: Text(value.title.toString(),
                    style: TextStyle(
                        fontSize: normalFontSize
                    ),
                  ),
                );
              }).toList(),
              value: selectedMenu.isNotEmpty ? selectedMenu : null, // Ensure value is null or non-empty
              onChanged: (v) {
                setState(() {
                  selectedMenu = v!;
                });
                //After that back to the
                ///Get.to(widget.currentPage, transition: Transition.fade);
                //call here menus future ///TODO:

              },
            ),
    );
  }
}

