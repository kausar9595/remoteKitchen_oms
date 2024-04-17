import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oms/controller/auth_controller.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/app_text.dart';
import 'package:oms/view/history/history_screen.dart';
import 'package:oms/view/menus/menus.dart';
import 'package:oms/view/order/screen/new_orders.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/widget/app_input.dart';
import 'package:oms/widget/app_snapcbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/auth_model/login_model.dart';
import '../../notifications/notification.dart';
import '../../widget/app_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm = GlobalKey<FormState>();
  bool _showpassword = false;

  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _email.text = "soumik9876@gmail.com";
    // _password.text = "19981998!";
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _loginForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
              ),
              Center(
                  child: Text(
                "LogIn",
                style: TextStyle(
                    fontSize: bigFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
              SizedBox(
                height: 20,
              ),
              AppInput(
                title: "Email :",
                hintText: "",
                controller: _email,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Email not be empty";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              AppInput(
                obscureText: _showpassword,
                controller: _password,
                title: "Password :",
                hintText: "Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showpassword = !_showpassword;
                    });
                  },
                  icon: Icon(
                    _showpassword ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black,
                  ),
                ),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Password not be empty ";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: AppButton(
                  onClick: () => _login(),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.25,
                  text: "Login",
                  isLoading: _isLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }


  //-------- login ---------
  _login() async{

    if(_loginForm.currentState!.validate()){
      SharedPreferences _pref = await SharedPreferences.getInstance();
      setState(() => _isLoading = true);
      var res = await AuthController.login(context: context, email: _email.text, password: _password.text);

      print("res === ${res.body}");
      //check if success
      if(res.statusCode == 200){
        //store data into a model
        LoginModel.fromJson(jsonDecode(res.body));

        //store token
        _pref.setString("token", jsonDecode(res.body)["token"]);
        AppSnackBar(context, loginSuccessText, Colors.green);

        //store device token
        NotificationController().getDeviceToken();

        //redirect to the home page
         Navigator.push(context, MaterialPageRoute(builder: (context)=>NewOrderScreen()));
      }else{
        AppSnackBar(context, loginErrorText, Colors.red);
      }

      setState(() => _isLoading = false);
    }
    }

  //----------end-----------//
}
