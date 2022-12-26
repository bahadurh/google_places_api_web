import 'place_autocomplete_matched_substring.dart';
import 'place_autocomplete_structured_format.dart';
import 'place_autocomplete_term.dart';

class PlaceAutocompletePrediction {
  const PlaceAutocompletePrediction({
    required this.description,
    required this.matchedSubstrings,
    required this.structuredFormatting,
    required this.terms,
    this.distanceMeters,
    this.placeId,
    this.types,
  });

  /// Contains the human-readable name for the returned result. For establishment results, this is usually the business name. This content is meant to be read as-is. Do not programmatically parse the formatted address.
  final String description;

  /// A list of substrings that describe the location of the entered term in the prediction result text, so that the term can be highlighted if desired.
  final List<PlaceAutocompleteMatchedSubstring> matchedSubstrings;

  /// Provides pre-formatted text that can be shown in your autocomplete results. This content is meant to be read as-is. Do not programmatically parse the formatted address.
  final PlaceAutocompleteStructuredFormat structuredFormatting;

  /// Contains an array of terms identifying each section of the returned description (a section of the description is generally terminated with a comma). Each entry in the array has a value field, containing the text of the term, and an offset field, defining the start position of this term in the description, measured in Unicode characters.
  final List<PlaceAutocompleteTerm> terms;

  /// The straight-line distance in meters from the origin. This field is only returned for requests made with an origin.
  final int? distanceMeters;

  /// A textual identifier that uniquely identifies a place. To retrieve information about the place, pass this identifier in the placeId field of a Places API request.
  final String? placeId;

  /// Contains an array of types that apply to this place. For example: [ "political", "locality" ] or [ "establishment", "geocode", "beauty_salon" ].
  final List<String>? types;

  @override
  String toString() {
    return 'PlaceAutocompletePrediction{ description: $description, matchedSubstrings: $matchedSubstrings, structuredFormatting: $structuredFormatting, terms: $terms, distanceMeters: $distanceMeters, placeId: $placeId, types: $types,}';
  }

  factory PlaceAutocompletePrediction.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompletePrediction(
      description: map['description'] as String,
      matchedSubstrings: parsePlaceAutocompleteMatchedSubstringArray(
          map['matched_substrings'])!,
      structuredFormatting: PlaceAutocompleteStructuredFormat.fromMap(
          map['structured_formatting']),
      terms: parsePlaceAutocompleteTerm(map['terms'])!,
      distanceMeters: map['distance_meters'],
      placeId: map['place_id'],
      types: map['types']?.cast<String>(),
    );
  }
}

///
///
///
List<PlaceAutocompletePrediction>? parsePlaceAutocompletePrediction(
    List? data) {
  if (data == null) return null;

  final items = <PlaceAutocompletePrediction>[];
  for (final d in data) {
    try{
      final item = PlaceAutocompletePrediction.fromMap(d);
      items.add(item);
    }catch(e){}

  }
  return items;
}