import 'package:get_x/get_instance/src/extension_instance.dart';
import 'package:get_x/state_manager.dart';
import 'package:usermanager/module/controller/add_user_controller.dart';

class AddUserBinding extends Binding {
  @override
  void dependencies() {
    Get.lazyPut<AddUserController>(() => AddUserController(), fenix: true);
  }
}
