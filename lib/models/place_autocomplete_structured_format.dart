import 'place_autocomplete_matched_substring.dart';

class PlaceAutocompleteStructuredFormat {
  const PlaceAutocompleteStructuredFormat({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
    this.secondaryTextMatchedSubstrings,
  });

  /// Contains the main text of a prediction, usually the name of the place.
  final String mainText;

  /// Contains an array with offset value and length. These describe the location of the entered term in the prediction result text, so that the term can be highlighted if desired.
  final List<PlaceAutocompleteMatchedSubstring> mainTextMatchedSubstrings;

  /// Contains the secondary text of a prediction, usually the location of the place.
  final String secondaryText;

  /// Contains an array with offset value and length. These describe the location of the entered term in the prediction result text, so that the term can be highlighted if desired.
  final List<PlaceAutocompleteMatchedSubstring>? secondaryTextMatchedSubstrings;

  @override
  String toString() {
    return 'PlaceAutocompleteStructuredFormat{ mainText: $mainText, mainTextMatchedSubstrings: $mainTextMatchedSubstrings, secondaryText: $secondaryText, secondaryTextMatchedSubstrings: $secondaryTextMatchedSubstrings,}';
  }

  factory PlaceAutocompleteStructuredFormat.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompleteStructuredFormat(
      mainText: map['main_text'] as String,
      mainTextMatchedSubstrings: parsePlaceAutocompleteMatchedSubstringArray(
          map['main_text_matched_substrings'])!,
      secondaryText: map['secondary_text'] as String,
      secondaryTextMatchedSubstrings:
          parsePlaceAutocompleteMatchedSubstringArray(
              map['secondary_text_matched_substrings']),
    );
  }
}
