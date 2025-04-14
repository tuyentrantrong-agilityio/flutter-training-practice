import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopping/providers/repository_provider.dart';
import '../models/profile.dart';
import '../repositories/profile_repository.dart';
import '../services/storage/storage.dart';

part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  late final ProfileRepository _profileRepository;
  late String _userId;

  @override
  Future<Profile?> build() async {
    _userId = UserStorage.getUserId();
    _profileRepository = ref.read(profileServiceProvider);
    return _profileRepository.fetchProfile(_userId);
  }

  Future<void> setFcmToken(String fcmToken) async {
    await _profileRepository.setFcmToken(_userId, fcmToken);
  }
}
