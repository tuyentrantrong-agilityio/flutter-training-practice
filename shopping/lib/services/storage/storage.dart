class UserStorage {
  static String _userId = "";

  static String getUserId() {
    return _userId;
  }

  static void setUserId(String? currentUserId) {
    if (currentUserId != null &&
        currentUserId.isNotEmpty &&
        currentUserId != _userId) {
      _userId = currentUserId;
    }
  }
}
