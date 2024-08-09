import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final homeController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        DateTime? datePicked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2025),
        );
        if (datePicked != null) {
          print(
              'Date Selected ${datePicked.day}-${datePicked.month}-${datePicked.year} ');
          homeController.day.value = datePicked.day.toString();
          homeController.month.value = datePicked.month.toString();
          homeController.year.value = datePicked.year.toString();
          homeController.getUserOrdersByDate();
        }
      },
      child: Text('Select'),
    );
  }
}
