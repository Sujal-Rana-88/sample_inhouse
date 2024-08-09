import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/views/add_new_customers.dart';
import '../../../constants/style_constants.dart';
import '../controllers/add_page_controller.dart';
import 'customers_info.dart';

class AddExistingCustomer extends StatefulWidget {
  const AddExistingCustomer({super.key});

  @override
  State<AddExistingCustomer> createState() => _AddExistingCustomerState();
}

class _AddExistingCustomerState extends State<AddExistingCustomer>{
  var searchController = TextEditingController();
  final AddPageController addPageController = Get.find<AddPageController>();
  bool flag = false;
  double containerHeight = 30;
  bool itemSelected = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height:25 ,),
                Text(
                  'Existing Customer Info',
                  style: StyleConstants.normalblacktextstyle700,
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          addPageController.selectedCustomer.value = "";
                          itemSelected = false;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name',
                        hintStyle: const TextStyle(color: Colors.black),
                        suffixIcon: const Icon(Icons.person, color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        counterText: "",
                      ),
                    ),
                  ),
                  Expanded(
                    child: AddNewCustomers(),
                  ),
                ],
              ),
            ),

            // AddNewCustomers(),
            SizedBox (
              height: MediaQuery.of(context).size.height * 0.23,
              child: searchController.text.isEmpty || itemSelected
                  ? Container()
                  : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('clients')
                    .where('name',
                    isGreaterThanOrEqualTo: searchController.text.trim().toLowerCase())
                    .where('name',
                    isLessThanOrEqualTo: '${searchController.text.trim().toLowerCase()}\uf8ff')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  //   return itemSelected ? Container() : ;
                  // }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(data['name']),
                        subtitle: Text(data['phoneNumber']),
                        onTap: () {
                          setState(() {
                            addPageController.selectedCustomer.value = data['phoneNumber'];
                            searchController.text = data['name'];
                            addPageController.userPhoneNumber.value = data['phoneNumber'];
                            print(addPageController.userPhoneNumber.value);
                            itemSelected = true;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
           const CustomersInfo()
          ],
        ),
      ),
    );
  }
}
