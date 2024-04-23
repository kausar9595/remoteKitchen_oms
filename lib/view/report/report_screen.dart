import 'package:flutter/material.dart';

import '../../widget/app_drawer.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: const AppDrawer(
        currentPage: ReportScreen(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: kToolbarHeight + 20,
        backgroundColor: Colors.white,
        title: const Text(
          "Business Performance",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
        ),
        actions: [
          SizedBox(
            width: 250,
            child: TimeFrameDropdown(
              inputDecoration: _dropdownDecoration(),
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
              width: 250,
              child: FullfillmentModeDropdown(
                inputDecoration: _dropdownDecoration(),
              )),
          const SizedBox(width: 20),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [],
        ),
      ),
    ));
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(10))),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(10))),
      border: const OutlineInputBorder(borderSide: BorderSide(width: 0, color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}

class TimeFrameDropdown extends StatefulWidget {
  const TimeFrameDropdown({
    super.key,
    required this.inputDecoration,
  });

  final InputDecoration inputDecoration;

  @override
  State<TimeFrameDropdown> createState() => _TimeFrameDropdownState();
}

class _TimeFrameDropdownState extends State<TimeFrameDropdown> {
  final List<String> _timeframes = const [
    "Today",
    "Yesterday",
    "Last 7 Days",
    "Last 14 Days",
    "Last 21 Days",
    "Last 28 Days",
    "Last 30 Days",
    "Last 60 Days",
    "Custom Range",
  ];

  late String _selectedTimeFrame = _timeframes.first;
  void _onSelected(String? value) {
    _selectedTimeFrame = value.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: _onSelected,
      decoration: widget.inputDecoration,
      value: _selectedTimeFrame,
      items: _timeframes.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
    );
  }
}

class FullfillmentModeDropdown extends StatefulWidget {
  const FullfillmentModeDropdown({
    super.key,
    required this.inputDecoration,
  });

  final InputDecoration inputDecoration;

  @override
  State<FullfillmentModeDropdown> createState() => _FullfillmentModeDropdownState();
}

class _FullfillmentModeDropdownState extends State<FullfillmentModeDropdown> {
  final List<String> _modes = const [
    "Delivery",
    "Pickup",
    "Dine In",
  ];

  late String? _selectedMode = _modes.first;

  void _onSelect(String? value) {
    _selectedMode = value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: widget.inputDecoration,
      value: _selectedMode,
      items: _modes.map((e) => DropdownMenuItem(child: Text(e))).toList(),
      onChanged: (value) {},
    );
  }
}
