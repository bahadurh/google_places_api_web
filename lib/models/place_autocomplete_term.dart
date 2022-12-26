class PlaceAutocompleteTerm {
  const PlaceAutocompleteTerm({
    required this.offset,
    required this.value,
  });

  /// Defines the start position of this term in the description, measured in Unicode characters
  final int offset;

  /// The text of the term.
  final String value;

  @override
  String toString() {
    return 'PlaceAutocompleteTerm{ offset: $offset, value: $value,}';
  }

  factory PlaceAutocompleteTerm.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompleteTerm(
      offset: map['offset'] as int,
      value: map['value'] as String,
    );
  }
}

///
///
///
List<PlaceAutocompleteTerm>? parsePlaceAutocompleteTerm(List? data) {
  if (data == null) return null;

  final items = <PlaceAutocompleteTerm>[];
  for (final d in data) {
    final item = PlaceAutocompleteTerm.fromMap(d);
    items.add(item);
  }
  return items;
}
