import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegularHoursSetting extends StatefulWidget {
  const RegularHoursSetting({super.key});

  @override
  State<RegularHoursSetting> createState() => _RegularHoursSettingState();
}

class _RegularHoursSettingState extends State<RegularHoursSetting> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 3,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Monday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Tuesday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Wednesday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Thursday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Friday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Saturday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border:
                  Border(bottom: BorderSide(width: 1, color: Colors.grey))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                      SizedBox(width: 10,),
                      Text("Sunday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black),)
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,

                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                            child: Text("11:30 AM",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.black),),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.more_vert,color: Colors.black,),
                          SizedBox(height: 20,),
                          Icon(Icons.delete,color: Colors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

          ],
        ));
  }
}
