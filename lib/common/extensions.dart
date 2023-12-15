
extension QueryHelper on Map<String, dynamic> {
  ///
  /// Converts the map into something more
  /// manageable to be used in URL query params.
  ///
  Map<String, String> toQueryParam() {
    return map((key, value) => MapEntry(key, value.toString()));
  }
}