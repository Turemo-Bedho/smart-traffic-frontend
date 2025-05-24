import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_flutter_application/app/presentation/widget/multiple_violation_select.dart';

class ViolationPage extends StatefulWidget {
  ViolationPage({super.key});

  @override
  State<ViolationPage> createState() => _ViolationPageState();
}

class _ViolationPageState extends State<ViolationPage> {
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Over Speeding – 250 ETB',
      'Driving Without a License – 500 ETB',
      'Driving Under the Influence – 1000 ETB',
      'Reckless Driving – 700 ETB',
      'Running a Red Light – 300 ETB',
      'Not Wearing a Seatbelt – 150 ETB',
      'Using Mobile Phone While Driving – 200 ETB',
      'Driving Without Insurance – 600 ETB',
      'Illegal Parking – 100 ETB',
      'Unregistered Vehicle – 800 ETB',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  final TextEditingController driverController =
      TextEditingController(text: 'Yohanse Mehabaw -- 12324242');

  final TextEditingController locationController = TextEditingController();

  final TextEditingController vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Violation Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        backgroundColor: Color(0xFF1F222A),
      ),
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
        child: Column(
          spacing: 20.h,
          children: [
            TextField(
              controller: driverController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Driver name -- License number',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: vehicleController,
              decoration: InputDecoration(
                labelText: 'Vehicle number',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _showMultiSelect,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Transparent background
                  elevation: 0, // Remove shadow
                  side: BorderSide(
                    color: Color(0xFF1F222A), // Border color
                    width: 2.w, // Border width
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Optional: rounded corners
                  ),
                ),
                child: const Text(
                  'Select Committed Offenses',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Wrap(
              children: _selectedItems
                  .map((e) => Chip(
                        label: Text(e),
                      ))
                  .toList(),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                labelStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: Color(0xFF1F222A),
                    width: 2.w,
                  ),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
