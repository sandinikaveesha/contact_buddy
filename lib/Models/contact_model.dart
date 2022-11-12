
class ContactModel {

  //Entity Migration Structure
  static const tblName = 'contacts';
  static const columnID = 'id';
  static const columnName = 'name';
  static const columnContact = 'contact';
  static const columnEmail = 'email';


  ContactModel({
    this.id,
    this.name,
    this.contact,
    this.email,
  });

  int? id;
  String? name;
  String? contact;
  String? email;

  ContactModel.fromMap(Map<dynamic, dynamic> map){
    id = map[columnID];
    name = map[columnName];
    contact = map[columnContact];
    email = map[columnEmail];
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      columnName: name,
      columnContact: contact,
      columnEmail: email
    };
    if( id != null) map[columnID] = id;
    return map;
  }

}