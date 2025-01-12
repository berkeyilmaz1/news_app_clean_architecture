/// [NetworkManagerQueries] is an enum class that contains all the queries that are used in the network manager.
/// This enum class is used to make the code more readable and maintainable.
enum NetworkManagerQueries {
  q,
  apiKey,
  page,
  pageSize;

  static MapEntry<String, String> makeQuery({
    required NetworkManagerQueries query,
    required String value,
  }) {
    return MapEntry(query.name, value);
  }
}
