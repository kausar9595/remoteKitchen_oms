import 'package:flutter/material.dart';

import '../../../../utility/appcolor.dart';

class RadioList extends StatefulWidget {
  const RadioList({super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text('Available',
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
          ),
          activeColor: AppColors.textindigo,
          value: 'Option 1',
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('Unavailable today',
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
          ),
          value: 'Option 2',
          activeColor: AppColors.textindigo,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),
        RadioListTile(
          title: Text('Unavailable indefinitely',
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.black),
          ),
          value: 'Option 3',
          activeColor: AppColors.textindigo,
          groupValue: selectedOption,
          onChanged: (value) {
            setState(() {
              selectedOption = value!;
            });
          },
        ),

      ],
    );
  }
}
