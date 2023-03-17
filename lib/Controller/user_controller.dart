import '../Model/user.dart';

class UserController{
  String? newName;
  int? newAge;
  String? newGender;
  String? newLocation;

  User user = User();

  UserController({this.newName, this.newAge, this.newGender, this.newLocation}) {
    List userData = [{
      user.name = newName ?? 'Please Update Name',
      user.age = newAge ?? 0,
      user.gender = newGender  ?? 'Please Update Gender',
      user.location = newLocation  ?? 'Please Update Location'
      }
    ];
    userData.isNotEmpty;
  }
}
