import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/constants/ui_constants.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../profile/controller/profile_controller.dart';

class ProfileBottomSheet extends StatelessWidget {
  final ProfileController profileController;
  const ProfileBottomSheet({super.key, required this.profileController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UiConstants.spacingXL),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: UiConstants.radiusSheet,
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.close_rounded),
                ),
              ),
              const SizedBox(height: UiConstants.spacingXS),
              Obx(() {
                final imagePath = profileController.state.value.profile.imagePath;
                return Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: imagePath == null
                            ? const LinearGradient(
                                colors: [
                                  Color(0xFF3B82F6),
                                  Color(0xFF9333EA),
                                ],
                              )
                            : null,
                      ),
                      child: imagePath != null
                          ? ClipOval(
                              child: Image.file(
                                File(imagePath),
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                              size: 42,
                            ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          profileController.pickProfileImage();
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: UiConstants.spacingXL),
              TextField(
                controller: profileController.nameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit_rounded,
                    size: 18,
                  ),
                ),
              ),
              TextField(
                controller: profileController.emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.edit_rounded,
                    size: 18,
                  ),
                ),
              ),
              const SizedBox(height: UiConstants.spacingXL),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton.icon(
                  onPressed: () async {
                    await profileController.saveProfile();
                  },
                  icon: const Icon(Icons.save_rounded),
                  label: const Text('Save Changes'),
                ),
              ),
              const SizedBox(height: UiConstants.spacingM),
              TextButton.icon(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close_rounded),
                label: const Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
