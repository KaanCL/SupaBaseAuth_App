class UserModel {

  final String _name;
  final String _lastName;
  final String _password;
  final String _email;

  UserModel(this._name, this._lastName, this._password, this._email);

  String get email => _email;

  String get password => _password;

  String get lastName => _lastName;

  String get name => _name;

 
}