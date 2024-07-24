import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/customer_profile_screen/views/customer_profile_view.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_icon.dart';

class CustomerProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            AppIcon.backIcon,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          children: [
            Text(
              'Customers Info',
              style: StyleConstants.black20w700,
            ),
            const Spacer(),
            const Text(
              'Edit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CustomColor.lightblue,
                decoration: TextDecoration.underline,
                decorationColor: CustomColor.lightblue,
              ),
            ),
          ],
        ),
      ),
      body: CustomerProfileView(),
    );
  }
}