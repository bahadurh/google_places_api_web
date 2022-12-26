class PlaceAutocompleteMatchedSubstring {
  const PlaceAutocompleteMatchedSubstring({
    required this.length,
    required this.offset,
  });

  /// Length of the matched substring in the prediction result text.
  final int length;

  /// Start location of the matched substring in the prediction result text.
  final int offset;

  @override
  String toString() {
    return 'PlaceAutocompleteMatchedSubstring{ length: $length, offset: $offset,}';
  }

  factory PlaceAutocompleteMatchedSubstring.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompleteMatchedSubstring(
      length: map['length'] as int,
      offset: map['offset'] as int,
    );
  }
}

///
///
///
List<PlaceAutocompleteMatchedSubstring>?
    parsePlaceAutocompleteMatchedSubstringArray(List? data) {
  if (data == null) return null;

  final items = <PlaceAutocompleteMatchedSubstring>[];
  for (final d in data) {
    final item = PlaceAutocompleteMatchedSubstring.fromMap(d);
    items.add(item);
  }
  return items;
}
