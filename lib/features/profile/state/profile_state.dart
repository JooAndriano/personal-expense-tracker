import '../../../data/models/profile_model.dart';

class ProfileState {
  final bool isLoading;
  final ProfileModel profile;

  const ProfileState({
    required this.isLoading,
    required this.profile,
  });

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      profile: ProfileModel(
        name: 'John Doe',
        email: 'john.doe@email.com',
      ),
    );
  }

  ProfileState copyWith({
    bool? isLoading,
    ProfileModel? profile,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
    );
  }
}