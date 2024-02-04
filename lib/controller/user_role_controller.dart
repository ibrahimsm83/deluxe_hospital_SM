// Enum representing user roles
import 'package:get/get.dart';

enum UserRole {Patient, HealthProfessional }

class UserController extends GetxController {
  var userRole = UserRole.Patient.obs;

  void setUserRole(UserRole role) {
    userRole.value = role;
  }
}