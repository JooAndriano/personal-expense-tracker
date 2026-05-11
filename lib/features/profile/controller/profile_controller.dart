import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/profile_model.dart';
import '../../../data/repositories/profile_repository.dart';
import '../state/profile_state.dart';

class ProfileController extends GetxController {
  final repository = ProfileRepository();

  final state =
      ProfileState.initial().obs;

  final nameController =
  TextEditingController();

  final emailController =
  TextEditingController();

  final picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    loadProfile();
  }

  void loadProfile() {
    final profile =
    repository.getProfile();

    nameController.text =
        profile.name;

    emailController.text =
        profile.email;

    state.value = state.value.copyWith(
      profile: profile,
    );
  }

  Future<void> pickProfileImage() async {
    final pickedFile =
    await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile == null) return;

    final updatedProfile =
    state.value.profile.copyWith(
      imagePath: pickedFile.path,
    );

    await repository.saveProfile(
      updatedProfile,
    );

    state.value = state.value.copyWith(
      profile: updatedProfile,
    );
  }

  Future<void> saveProfile() async {
    final profile = ProfileModel(
      name:
      nameController.text.trim(),
      email:
      emailController.text.trim(),
      imagePath:
      state.value.profile.imagePath,
    );

    await repository.saveProfile(
      profile,
    );

    state.value = state.value.copyWith(
      profile: profile,
    );

    Get.back();
  }
}