import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:usermanager/core/theme/black_theme.dart';
import 'package:usermanager/core/theme/light_theme.dart';
import 'package:usermanager/module/binding/add_user_binding.dart';
import 'package:usermanager/module/binding/user_binding.dart';
import 'package:usermanager/module/screens/add_user_screen.dart';
import 'package:usermanager/module/screens/user_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'UserManager',
      theme: LightTheme().lightTheme,
      darkTheme: BlackTheme().blackTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/user',
      transitionDuration: Duration(milliseconds: 500),

      getPages: [
        GetPage(
          name: '/user',
          page: () => const UserScreen(),
          binding: UserBinding(),
        ),

        GetPage(
          name: '/addUser',
          page: () => const AddUserScreen(),
          binding: AddUserBinding(),
        ),
      ],
    ),
  );
}
