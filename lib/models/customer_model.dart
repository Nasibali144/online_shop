class Customer {
  String phoneNumber;
  String gender;
  String username;
  String password;

  Customer({this.phoneNumber, this.gender, this.username, this.password});

  Customer.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}

class CustomerList{
  List<Customer> customers;

  CustomerList.fromJson(List<dynamic> json)
      : customers = List<Customer>.from(json.map((x) => Customer.fromJson(x)));

  List<dynamic> toJson() => [
    List<Customer>.from(customers.map((x) => x.toJson()))
  ];
}