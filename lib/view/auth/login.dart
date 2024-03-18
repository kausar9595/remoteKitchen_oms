import 'package:flutter/material.dart';
import 'package:oms/view/menus/menus.dart';
import 'package:oms/widget/app_input.dart';

import '../../utility/appcolor.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              width:double.infinity,
            ),
            Center(child: Text("LogIn",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)),
            SizedBox(height: 20,),
            AppInput(
              title: "Email :",
                hintText: "Jhon@gmail.com",
                controller: _email,
            ),
            SizedBox(height: 20,),
            AppInput(
              title: "Password :",
                hintText: "Password",
                controller: _password,
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Menus()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.textindigo,
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}




