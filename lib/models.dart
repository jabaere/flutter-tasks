import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id = 0;
  String? name;
  String mobile;
  String location;
  String password;

  User({
    this.name,
    required this.mobile,
    required this.location,
    required this.password,
  });
}