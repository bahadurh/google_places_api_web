import 'package:nova_places_api/nova_places_api.dart';
import 'package:test/test.dart';

void main() {
  const apiKey = 'api-key';

  test('places autocomplete', () async {
    final placesApi = PlacesApi(apiKey: apiKey);
    final response = await placesApi.placeAutocomplete(
      input: 'Golden Gate Heights',
    );

    if (!response.isSuccess) {
      expect(response.errorMessage, anything);
    } else {
      final predictions = response.predictions;
      expect(predictions.length, greaterThan(0));
    }
  });

  test('query autocomplete', () async {
    final placesApi = PlacesApi(apiKey: apiKey);
    final response = await placesApi.queryAutocomplete(
      input: 'Pizza near San Francisco',
      location: LatLngLiteral(
        lat: 37.769722,
        lng: -122.476944,
      ),
      radius: 10000,
    );

    if (!response.isSuccess) {
      expect(response.errorMessage, anything);
    } else {
      final predictions = response.predictions;
      expect(predictions.length, greaterThan(0));
    }
  });

  test('get place detail', () async {
    final placesApi = PlacesApi(apiKey: apiKey);
    final response = await placesApi.getPlaceDetails(
      placeId: 'ChIJFS1XN4t9j4AR_QTufcmT4Go',
    );

    if (!response.isSuccess) {
      expect(response.status, anything);
    } else {
      final place = response.result;
      expect(place, isNotNull);
    }
  });
}
