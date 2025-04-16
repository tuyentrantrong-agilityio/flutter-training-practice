import '../models/profile.dart';
import '../services/profile_service.dart';

abstract class ProfileRepository {
  Future<Profile?> fetchProfile(String userId);
  Future<void> createProfile(Profile profile);
  Future<void> updateProfile(Profile profile);
  Future<void> deleteProfile(String userId);
  Future<void> setFcmToken(String userId, String fcmToken);
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService _profileService;

  ProfileRepositoryImpl(this._profileService);

  @override
  Future<Profile?> fetchProfile(String userId) async {
    return _profileService.fetchProfile(userId);
  }

  @override
  Future<void> createProfile(Profile profile) async {
    await _profileService.createProfile(profile);
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await _profileService.updateProfile(profile);
  }

  @override
  Future<void> deleteProfile(String userId) async {
    await _profileService.deleteProfile(userId);
  }

  @override
  Future<void> setFcmToken(String userId, String fcmToken) async {
    await _profileService.setFcmToken(userId, fcmToken);
  }
}
