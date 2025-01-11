/// This file contains the network manager queries enum which is used to make queries for the network manager.
/// q is used to make a query for the news.
/// apiKey is used to make a query for the api key.
enum NetworkManagerQueries {
  q,
  apiKey;

  static MapEntry<String, String> makeQuery({
    required NetworkManagerQueries query,
    required String value,
  }) {
    return MapEntry(query.name, value);
  }
}
