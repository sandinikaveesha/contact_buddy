
class ContactModel {
  ContactModel({
    required this.id,
    required this.name,
    required this.contactNo,
    this.email,
  });

  int id;
  String name;
  int contactNo;
  String? email;

}