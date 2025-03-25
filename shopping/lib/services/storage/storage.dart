class UserStorage {
  static String _userId = "";

  static int _cartId = 0;

  static String getUserId() {
    return _userId;
  }

  static int getCartId() {
    return _cartId;
  }

  static void setUserId(String? currentUserId) {
    if (currentUserId != null &&
        currentUserId.isNotEmpty &&
        currentUserId != _userId) {
      _userId = currentUserId;
    }
  }

  static void setCartId(int? currentCartId) {
    if (currentCartId != null && currentCartId != _cartId) {
      _cartId = currentCartId;
    }
  }
}
