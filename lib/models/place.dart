import 'package:nova_google_services_core/nova_google_services_core.dart';

class Place {
  const Place({
    this.placeId,
    this.addressComponents,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.name,
  });

  final String? placeId;
  final List<AddressComponent>? addressComponents;
  final String? formattedAddress;
  final String? formattedPhoneNumber;
  final Geometry? geometry;
  final String? name;

  @override
  String toString() {
    return 'Place{ placeId: $placeId, addressComponents: $addressComponents, formattedAddress: $formattedAddress, formattedPhoneNumber: $formattedPhoneNumber, geometry: $geometry, name: $name,}';
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      placeId: map['place_id'] as String,
      addressComponents: parseAddressComponentArray(map['address_components']),
      formattedAddress: map['formatted_address'],
      formattedPhoneNumber: map['formatted_phone_number'],
      geometry:
          map['geometry'] == null ? null : Geometry.fromMap(map['geometry']),
      name: map['name'],
    );
  }
}

///
///
///
class PlaceEditorialSummary {
  const PlaceEditorialSummary({
    this.language,
    this.overview,
  });

  final String? language;
  final String? overview;

  @override
  String toString() {
    return 'PlaceEditorialSummary{ language: $language, overview: $overview,}';
  }

  factory PlaceEditorialSummary.fromMap(Map<String, dynamic> map) {
    return PlaceEditorialSummary(
      language: map['language'],
      overview: map['overview'],
    );
  }
}
