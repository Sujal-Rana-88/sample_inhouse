import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/constants/style_constants.dart';
import 'package:sample_inhouse/app/core/screens/customer_profile_screen/views/order_history_tab.dart';
import 'package:sample_inhouse/app/core/screens/customer_profile_screen/views/transaction_history_tab.dart';
import '../../../constants/app_icon.dart';
import '../controller/customer_profile_screen_controller.dart';

class CustomerProfileView extends StatefulWidget {
   const CustomerProfileView({Key? key}) : super(key: key);

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  final CustomerProfileScreenController customerProfileScreenController = Get.find<CustomerProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final TabController tabController = TabController(length: 2, vsync: Scaffold.of(context) as TickerProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: screenWidth*0.19,
                      height: screenHeight*0.09,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFe0f2f1),
                      ),
                      child: const Icon(Icons.person, size: 20),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: screenWidth*0.13, top: screenHeight*0.04),
                      child: Container(
                        width: screenWidth*0.08,
                        height: screenHeight*0.05,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFA713F),
                        ),
                        child: SvgPicture.asset(
                          AppIcon.editIcon,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: screenHeight*0.01, left: screenWidth*0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return Text(
                        '${customerProfileScreenController.selectedUserName.value}',
                        style: StyleConstants.header6,
                      );
                    }),
                    Obx(() {
                      return Text(
                        '${customerProfileScreenController.selectedUserPhoneNumber.value}',
                        style: StyleConstants.blacktextcolor16W400,
                      );
                    }),
                    Obx(() {
                      return Text(
                        '${customerProfileScreenController.selectedUserAddress.value}',
                        style: StyleConstants.blacktextcolor16W400,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 30),
            child: Container(
              height: screenHeight * 0.09,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFA4D0EB),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(7),
                gradient: const LinearGradient(
                  colors: [Color(0xFFC9EAF8), Color(0xFFF6FBFF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() {
                          return Text(
                            '${customerProfileScreenController.selectedUserAmount.value}',
                            style: StyleConstants.blacktextcolor16W400,
                          );
                        }),
                        const Text(
                          'Current Balance',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Transfer Request',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.blue,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05, bottom: screenHeight*0.03),
            child: TabBar(
              controller: tabController,
              tabs:const [
                Tab(text: 'Order History'),
                Tab(text: 'Transaction History'),
              ],
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children:const [
               //!Order History Tab
                OrderHistoryTab(),

                //! Transaction History Tab
                TransactionHistoryTab()
              ],
            ),
          ),
        ],
      ),
    );
  }
}