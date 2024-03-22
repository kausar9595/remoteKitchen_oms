import 'package:flutter/material.dart';
class AppInput extends StatelessWidget {
  const AppInput({
    super.key,required this.controller,this.title,
  });
  final TextEditingController controller;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${title}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Colors.black),),
        SizedBox(height: 10,),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width*0.25,
          height: MediaQuery.of(context).size.height*0.05,
          child: Center(
            child: TextFormField(
              controller:controller ,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixText: "Show",
                  suffixStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black,width: 1),
                  ),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black,),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black,),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}