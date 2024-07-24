
class CustomerModel{
  final String?id;
  final String name;
  final String address;
  final String phoneNumber;

  const CustomerModel({
  required this.id,
  required this.name,
  required this.address,
  required this.phoneNumber,
});

  toJson(){
    return{
    "name" : name,
    "phoneNumber" :phoneNumber,
      "Address" : address,
    };
  }

}