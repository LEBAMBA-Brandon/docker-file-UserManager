import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:get_x/state_manager.dart';
import 'package:usermanager/module/controller/user_controller.dart';

class UserBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
  }
}
