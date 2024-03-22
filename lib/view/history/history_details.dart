import 'package:flutter/material.dart';

class HistoryDetail extends StatefulWidget {
  const HistoryDetail({super.key});

  @override
  State<HistoryDetail> createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Shakib Kabiraz"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Text("this is history detail screen")
        ],
      ),
    ));
  }
}
