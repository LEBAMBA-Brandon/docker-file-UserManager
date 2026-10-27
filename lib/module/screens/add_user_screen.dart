import 'package:flutter/material.dart';
import 'package:get_x/get.dart';
import 'package:usermanager/core/widget/my_button_form.dart';
import 'package:usermanager/core/widget/my_text_form.dart';
import 'package:usermanager/module/controller/add_user_controller.dart';
import 'package:usermanager/module/controller/user_controller.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddUserController>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              backgroundColor: Theme.of(context).colorScheme.primary,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Ajouter un utilisateur',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                centerTitle: true,
              ),
            ),
            SliverSafeArea(
              top: false,
              minimum: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rentrez les coordonées de l’utilisateur',
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 30),

                          //champ de nom
                          MyTextForm(
                            controller: controller.nameController,
                            label: 'Nom',
                            hint: 'entrer votre nom complet',
                            textInputAction: TextInputAction.next,
                            focus: controller.nameFocus,
                            focusScope: (_) {
                              FocusScope.of(
                                context,
                              ).requestFocus(controller.usernameFocus);
                            },
                            iconGauche: const Icon(Icons.person_outline),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un nom valide';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          //champ de pseudo
                          MyTextForm(
                            controller: controller.usernameController,
                            label: 'Pseudo',
                            hint: 'entrer un pseudo',
                            textInputAction: TextInputAction.next,
                            focus: controller.usernameFocus,
                            focusScope: (_) {
                              FocusScope.of(
                                context,
                              ).requestFocus(controller.emailFocus);
                            },
                            iconGauche: const Icon(Icons.person_outline),
                            validator: (value) {
                              if (value == null) {
                                return 'Entrer un pseudo valide';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          //champ d’email
                          MyTextForm(
                            controller: controller.emailController,
                            label: 'Email',
                            hint: 'entrer votre email',
                            textInputAction: TextInputAction.next,
                            focus: controller.emailFocus,
                            focusScope: (_) {
                              FocusScope.of(
                                context,
                              ).requestFocus(controller.phoneFocus);
                            },
                            iconGauche: const Icon(Icons.email_outlined),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'Entrer un email valide';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          //champ de phone
                          MyTextForm(
                            controller: controller.phoneController,
                            label: 'Téléphone',
                            hint: 'entrer un numéro de téléphone',
                            textInputAction: TextInputAction.done,
                            focus: controller.phoneFocus,
                            iconGauche: const Icon(Icons.call_outlined),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrer un numéro de téléphone valide';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Expanded(
                                child: MyButtonForm(
                                  label: 'Annuler',
                                  onPressed: () {
                                    controller.nameController.clear();
                                    controller.usernameController.clear();
                                    controller.emailController.clear();
                                    controller.phoneController.clear();
                                    Get.back();
                                  },
                                  minimumSize: const Size(double.maxFinite, 50),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: MyButtonForm(
                                  label: 'Confirmer',
                                  onPressed: () async {
                                    if (controller.formKey.currentState
                                            ?.validate() ??
                                        false) {
                                      final ok = await controller.postUsers();
                                      if (ok) {
                                        Get.find<UserController>().addUserLocal(
                                          controller.currentUser.value!,
                                        );
                                        controller.nameController.clear();
                                        controller.usernameController.clear();
                                        controller.emailController.clear();
                                        controller.phoneController.clear();
                                        Get.back();

                                        Get.snackbar(
                                          'Message de confirmation',
                                          'Utilisateur créé avec succès',
                                          snackPosition: SnackPosition.bottom,
                                          backgroundColor: Colors.green
                                              .withGreen(12),
                                          duration: const Duration(seconds: 2),
                                        );
                                      }
                                    }
                                  },
                                  minimumSize: const Size(double.maxFinite, 50),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
