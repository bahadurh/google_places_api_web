# Nova Places API [![Pub](https://img.shields.io/pub/v/nova_places_api.svg)](https://pub.dev/packages/nova_places_api)

The Places API lets you search for place information using a variety of categories, including establishments, prominent points of interest, and geographic locations. You can search for places either by proximity or a text string. A Place Search returns a list of places along with summary information about each place.

This package uses [Google Places API](https://developers.google.com/maps/documentation/places/web-service/search) and requires an API key. Please check [this link](https://developers.google.com/maps/documentation/places/web-service/get-api-key) out to obtain your API key.

🍭 Remember to enable `Places API` for your API key.

### Sample Usage

```dart
import 'package:nova_places_api/nova_places_api.dart';

final placesApi = PlacesApi(apiKey: 'api-key')..setLanguage('en');

// first
print('Places autocomplete');
final response1 = await placesApi.placeAutocomplete(
  input: 'amoeba',
  location: LatLngLiteral(
    lat: 37.76999,
    lng: -122.44696,
  ),
  radius: 500,
  strictBounds: true,
  types: ['establishment'],
  // sessionToken: generateSessionToken()
);

if (!response1.isSuccess) {
  print(response1.errorMessage);
} else {
  final predictions = response1.predictions;
  predictions.map((p) => p.description).forEach(print);
}

// second
print('\nQuery autocomplete');
final response2 = await placesApi.queryAutocomplete(
  input: 'pizza near San Francisco',
);
if (!response2.isSuccess) {
  print(response2.errorMessage);
} else {
  final predictions = response2.predictions;
  predictions.map((p) => p.description).forEach(print);
}

if (response1.isSuccess && response1.predictions.isNotEmpty) {
  // third;
  print('\nQuery place detail');
  final response3 = await placesApi.getPlaceDetails(
    placeId: response1.predictions.first.placeId!,
  );
  if (!response3.isSuccess) {
    print(response3.errorMessage);
  } else {
    print(response3.result!.formattedAddress);
    print(response3.result!.geometry!.location);
  }
}

placesApi.dispose();
```
