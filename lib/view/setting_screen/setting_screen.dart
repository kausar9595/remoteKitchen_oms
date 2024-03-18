
import 'package:flutter/material.dart';
import 'package:oms/view/setting_screen/widget/app_input.dart';

import '../../utility/appcolor.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _currentpassword = TextEditingController();
  final _newpassword = TextEditingController();
  final _confirmpassword = TextEditingController();
  bool _isCheck = false;
  bool _isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.menu,size: 30,color: Colors.black),
            title: Text("Settings",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),

          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(left: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Store settings",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,color: Colors.black),
                      ),
                     Text("Account information and workflow configuration ",
                       style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                     ),
                      SizedBox(height: 10,),
                      Text("Account info",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Text("Time Zone",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      Text("America / Vancouver",
                        style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Text("Account",
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      Text("bd@heyremotekitchen.com",
                        style: TextStyle(fontWeight:FontWeight.w600,fontSize: 18,color: Colors.black),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height:MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width*0.10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.selectgrey,
                          ),
                          child: Text("Sign Out",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Reset Password",
                        style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      AppInput(
                        title: "Current Password",
                        controller: _currentpassword,
                      ),
                      SizedBox(height: 10,),
                      AppInput(
                        title: "New Password",
                        controller: _newpassword,
                      ),
                      SizedBox(height: 10,),
                      AppInput(
                        title: "Confirm New Password",
                        controller: _confirmpassword,
                      ),
                      Text("Logout all other sessions",
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                      ),
                      Checkbox(
                        activeColor:AppColors.textindigo,
                          checkColor: Colors.white,
                          value: _isCheck,
                          onChanged: (values){
                            setState(() {
                              _isCheck = values!;
                            });
                          },
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width*0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.selectgrey,
                          ),
                          child: Text("Reset Password",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                          ),

                        ),
                      )
                    ],

                  ),
                ),
                Expanded(
                  flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.13,),
                        Text("Workflow Settings",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black),
                        ),
                        SizedBox(height: 10,),
                        Text("Using a POS for Delivery Orders",
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text("If you use a POS, we’ll let you track whether"
                            "\n orders has been entered or still need to be input.",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Switch(
                              activeColor: AppColors.textindigo,
                                value: _isSwitch,
                                onChanged: (value){
                                  setState(() {
                                    _isSwitch = value;
                                  });
                                }),
                            Text("You are using POS",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Your POS: Revel",
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),
                        ),
                        //SizedBox(height: 5,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            height:MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.selectgrey,
                            ),
                            child: Text("Edit POS",
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text("New order alerts",
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text("If you are not receiving new order notification, "
                            "please check your device time zones in your device’s "
                            "settings and  make sure it is correct.",
                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Switch(
                                activeColor: AppColors.textindigo,
                                value: _isSwitch,
                                onChanged: (value){
                                  setState(() {
                                    _isSwitch = value;
                                  });
                                }),
                            Text("Full screen notifications",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Print prices on receipts",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Switch(
                                activeColor: AppColors.textindigo,
                                value: _isSwitch,
                                onChanged: (value){
                                  setState(() {
                                    _isSwitch = value;
                                  });
                                }),
                            Text("Show prices on printed tickets",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Test Audio",
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height*0.06,
                            width: MediaQuery.of(context).size.width*0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.selectgrey,
                            ),
                            child: Text("Play Test Sound",
                              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                            ),

                          ),
                        )


                      ],
                    ))
              ],
            ),
          ),
        ),
    );
  }
}


