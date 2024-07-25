import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/controllers/customers_screen_controller.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/views/get_customers_info.dart';

import '../../../constants/app_icon.dart';
import '../../../constants/style_constants.dart';

class CustomersScreen extends GetView<CustomersScreenController> {
  const CustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,


        appBar: AppBar(
          backgroundColor: Colors.white,

          title: Text('Customers Info', style: StyleConstants.black20w700,),
          leading: IconButton(
            icon: SvgPicture.asset(
              AppIcon.backIcon,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

      body:const Column(
        children: [
          Expanded(
        child: GetCustomersInfo()
        //     child: CustomersProfile(),

          )
        ],
      ),
    );
  }
}
