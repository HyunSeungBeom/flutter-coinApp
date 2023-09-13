import 'package:http/http.dart' as http;

const baseUrl =
    "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=30&page=1&sparkline=false";

class API {
  static Future getCoins() {
    return http.get(Uri.parse(baseUrl));
  }
}
