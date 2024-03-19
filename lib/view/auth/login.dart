import 'package:flutter/material.dart';
import 'package:oms/view/menus/menus.dart';
import 'package:oms/widget/app_input.dart';
import '../../widget/app_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm =GlobalKey<FormState>();
  bool _isloading = false;
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
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(15),
        child: Form(
          key: _loginForm,
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
                validator: (v){
                  if(v!.isEmpty){
                    return "Email not be empty";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20,),
              AppInput(
                obscureText: _showpassword,
                controller: _password,
                title: "Password :",
                hintText: "Password",
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _showpassword = ! _showpassword;
                      });
                    },
                    icon: Icon(_showpassword?Icons.visibility:Icons.visibility_off,color: Colors.black,),
                ),
                validator: (v){
                  if(v!.isEmpty){
                    return "Password not be empty ";
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 40,
              ),
              Center(
                child: AppButton(
                  onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Menus()));
                  },
                  height:MediaQuery.of(context).size.height * 0.08,
                  width:MediaQuery.of(context).size.width * 0.25,
                  text: "Login",
                  isLoading: _isloading,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}






