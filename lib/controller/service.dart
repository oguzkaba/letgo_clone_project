import 'package:letgo_clone_project/model/product_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static String url = 'https://retoolapi.dev/tXzhd4/product';
  static Future<List<ProductModel>> fetchData() async {
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception(
        "İstek durumu başarısız oldu: ${response.statusCode}",
      );
    }
  }
}
