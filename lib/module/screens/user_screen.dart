import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:usermanager/core/widget/my_button_form.dart';
import 'package:usermanager/core/widget/my_card_form.dart';
import 'package:usermanager/core/widget/my_text_form.dart';
import 'package:usermanager/module/controller/user_controller.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('UserManager'),
        actions: [
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  controller.theme.value
                      ? Get.changeThemeMode(ThemeMode.light)
                      : Get.changeThemeMode(ThemeMode.dark);
                  controller.changeTheme();
                },
                child: controller.theme.value
                    ? Icon(Icons.wb_sunny_outlined)
                    : Icon(Icons.dark_mode),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Chargement des utilisateurs',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            );
          }

          if (controller.errorMessage.value != null) {
            return Center(
              child: Text(
                'Erreur: ${controller.errorMessage}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.users.value.length,
                    itemBuilder: (c, i) {
                      final user = controller.users[i];
                      return MyCardForm(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.name,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${user.username} | ${user.email} | ${user.phone}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),

                            Spacer(),

                            //supprimer utilisateur
                            IconButton(
                              onPressed: () {
                                Get.bottomSheet(
                                  enterBottomSheetDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                  exitBottomSheetDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                  MyCardForm(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Voulez-vous vraiment supprimer l’utilisateur ?',
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,

                                            children: [
                                              TextButton(
                                                child: Text('Annuler'),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                              const SizedBox(width: 5),

                                              TextButton(
                                                child: Text('Confirmer'),
                                                onPressed: () {
                                                  controller.deleteUsers(
                                                    user.id,
                                                  );
                                                  Navigator.pop(context);

                                                  Get.snackbar(
                                                    'Message de confirmation',
                                                    'Utilisateur supprimé avec succès',
                                                    snackPosition:
                                                        SnackPosition.bottom,
                                                    backgroundColor: Colors.red
                                                        .withRed(200),

                                                    duration: const Duration(
                                                      seconds: 2,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.delete_outline,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                            const SizedBox(width: 3),

                            //modifier utilisateur
                            IconButton(
                              onPressed: () {
                                controller.nameUpdateController.text =
                                    user.name;
                                controller.usernameUpdateController.text =
                                    user.username;
                                controller.emailUpdateController.text =
                                    user.email;
                                controller.phoneUpdateController.text =
                                    user.phone;

                                Get.bottomSheet(
                                  enterBottomSheetDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                  exitBottomSheetDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                  MyCardForm(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                    child: SingleChildScrollView(
                                      child: Form(
                                        key: controller.formKey,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Modifier les coordonées de l’utilisateur',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge!
                                                  .copyWith(
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                  ),
                                              maxLines: 1,
                                            ),
                                            const SizedBox(height: 30),

                                            //champ de nom
                                            MyTextForm(
                                              controller: controller
                                                  .nameUpdateController,
                                              label: 'Nom',
                                              hint: 'entrer votre nom complet',
                                              focus: controller.nameUpdateFocus,
                                              textInputAction:
                                                  TextInputAction.next,
                                              focusScope: (_) {
                                                FocusScope.of(
                                                  context,
                                                ).requestFocus(
                                                  controller
                                                      .usernameUpdateFocus,
                                                );
                                              },
                                              iconGauche: const Icon(
                                                Icons.person_outline,
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Entrer un nom valide';
                                                }
                                                return null;
                                              },
                                            ),
                                            const SizedBox(height: 20),

                                            //champ de pseudo
                                            MyTextForm(
                                              controller: controller
                                                  .usernameUpdateController,
                                              label: 'Pseudo',
                                              hint: 'entrer un pseudo',
                                              textInputAction:
                                                  TextInputAction.next,
                                              focus: controller
                                                  .usernameUpdateFocus,
                                              focusScope: (_) {
                                                FocusScope.of(
                                                  context,
                                                ).requestFocus(
                                                  controller.emailUpdateFocus,
                                                );
                                              },
                                              iconGauche: const Icon(
                                                Icons.person_outline,
                                              ),
                                            ),
                                            const SizedBox(height: 20),

                                            //champ d’email
                                            MyTextForm(
                                              controller: controller
                                                  .emailUpdateController,
                                              label: 'Email',
                                              hint: 'entrer votre email',
                                              textInputAction:
                                                  TextInputAction.next,
                                              focus:
                                                  controller.emailUpdateFocus,
                                              focusScope: (_) {
                                                FocusScope.of(
                                                  context,
                                                ).requestFocus(
                                                  controller.phoneUpdateFocus,
                                                );
                                              },
                                              iconGauche: const Icon(
                                                Icons.email_outlined,
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Entrer une email valide';
                                                }
                                                return null;
                                              },
                                            ),
                                            const SizedBox(height: 20),

                                            //champ de phone
                                            MyTextForm(
                                              controller: controller
                                                  .phoneUpdateController,
                                              label: 'Téléphone',
                                              hint:
                                                  'entrer un numéro de téléphone',
                                              textInputAction:
                                                  TextInputAction.done,
                                              focus:
                                                  controller.phoneUpdateFocus,
                                              iconGauche: const Icon(
                                                Icons.call_outlined,
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Entrer un numéro de téléphone valide';
                                                }
                                                return null;
                                              },
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                MyButtonForm(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  label: 'Annuler',
                                                ),
                                                const SizedBox(width: 20),

                                                MyButtonForm(
                                                  onPressed: () {
                                                    if (controller
                                                            .formKey
                                                            .currentState
                                                            ?.validate() ??
                                                        false) {
                                                      controller.updateUsers(
                                                        user.id,
                                                      );
                                                      Navigator.pop(context);
                                                      controller
                                                          .nameUpdateController
                                                          .clear();
                                                      controller
                                                          .usernameUpdateController
                                                          .clear();
                                                      controller
                                                          .emailUpdateController
                                                          .clear();
                                                      controller
                                                          .phoneUpdateController
                                                          .clear();

                                                      Get.snackbar(
                                                        'Message de confirmation',
                                                        'Informations de l’utilisateur ont été modifiées avec succès',
                                                        snackPosition:
                                                            SnackPosition
                                                                .bottom,
                                                        backgroundColor: Colors
                                                            .green
                                                            .withGreen(200),
                                                        duration:
                                                            const Duration(
                                                              seconds: 2,
                                                            ),
                                                      );
                                                    }
                                                  },
                                                  label: 'Confirmer',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FloatingActionButton(
                  onPressed: () => Get.toNamed('/addUser'),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(Icons.add),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
