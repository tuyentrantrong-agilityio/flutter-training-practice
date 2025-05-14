import 'package:flutter/material.dart';
import 'package:shopping/services/supabase_init.dart';

import '../models/profile.dart';

class ProfileService {
  Future<void> setFcmToken(String userId, String fcmToken) async {
    await supabaseClient
        .from('profiles')
        .update({'fcm_token': fcmToken}).eq('user_id', userId);
  }

  /// Fetch profile by userId
  Future<Profile?> fetchProfile(String userId) async {
    try {
      final response = await supabaseClient
          .from('profiles')
          .select()
          .eq('user_id', userId)
          .single();

      return Profile.fromJson(response);
    } catch (error) {
      debugPrint('Error fetching profile: $error');
      return null;
    }
  }

  /// Create a new profile
  Future<void> createProfile(Profile profile) async {
    try {
      await supabaseClient.from('profiles').insert(profile.toJson());
    } catch (error) {
      debugPrint('Error creating profile: $error');
    }
  }

  /// Update profile information
  Future<void> updateProfile(Profile profile) async {
    try {
      await supabaseClient
          .from('profiles')
          .update(profile.toJson())
          .eq('profile_id', profile.profileId!);
    } catch (error) {
      debugPrint('Error updating profile: $error');
    }
  }

  /// Delete profile by userId
  Future<void> deleteProfile(String userId) async {
    try {
      await supabaseClient.from('profiles').delete().eq('user_id', userId);
    } catch (error) {
      debugPrint('Error deleting profile: $error');
    }
  }
}
