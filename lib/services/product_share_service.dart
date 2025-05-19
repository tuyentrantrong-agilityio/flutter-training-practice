import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:shopping/const/const.dart';

class ProductShareService {
  Future<String> createProductLink(int productId, String userId) async {
    final dynalinkUri = Uri.https('shopping.dynalinks.app', '/', {
      'link':
          'https://shopping.dynalinks.app/product/$productId?referrer=$userId',
      'ibi': AppConst.packageName,
      'apn': AppConst.packageName,
      'st': 'Share Product',
      'sd': 'This is product, i want to share it',
      'ifl': 'https://burnt-dolomite-duckling.glitch.me',
    });
    return dynalinkUri.toString();
  }

  Future<String> shorten(String longUrl) async {
    final response = await http.get(
      Uri.parse('https://tinyurl.com/api-create.php?url=$longUrl'),
    );
    if (response.statusCode != 200) {
      throw Exception('Short link creation failed');
    }
    return response.body;
  }

  Future<void> shareProduct(int productId, String userId) async {
    // Create dynalink link
    final link = await createProductLink(productId, userId);

    // Shorten link
    final shortLink = await shorten(link);

    // Share link
    await SharePlus.instance.share(
      ShareParams(
        subject: 'Check out this product',
        text: 'Here’s a product you might like: $shortLink',
      ),
    );
  }
}
