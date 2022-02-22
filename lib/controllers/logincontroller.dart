import 'package:get/get.dart';
import 'package:login_test/models/user.dart';

class LoginController extends GetxController {
  var myUser = "".obs;
  var myPassword = "".obs;

  UserFunc(username) async {
    if (username == null) {
      Get.snackbar("warning".tr, "check_username_and_pass".tr);
    } else {
      myUser.value = username;

      if (Get.isDialogOpen!) Get.back();
    }
  }

  PasswordFunc(password) async {
    if (password == null) {
      Get.snackbar("warning".tr, "check_username_and_pass".tr);
    } else {
      myPassword.value = password;

      if (Get.isDialogOpen!) Get.back();
    }
  }
}
