import 'package:nova_google_services_core/nova_google_services_core.dart';

import 'place_autocomplete_prediction.dart';

class PlacesAutocompleteResponse {
  const PlacesAutocompleteResponse({
    required this.predictions,
    required this.status,
    this.errorMessage,
    this.infoMessages,
  });

  /// Contains an array of predictions.
  final List<PlaceAutocompletePrediction> predictions;

  /// Contains the status of the request, and may contain debugging information to help you track down why the request failed.
  final ResponseStatus status;

  /// When the service returns a status code other than OK<, there may be an additional error_message field within the response object. This field contains more detailed information about thereasons behind the given status code. This field is not always returned, and its content is subject to change.
  final String? errorMessage;

  /// When the service returns additional information about the request specification, there may be an additional info_messages field within the response object. This field is only returned for successful requests. It may not always be returned, and its content is subject to change.
  final List<String>? infoMessages;

  bool get isSuccess =>
      status == ResponseStatus.ok || status == ResponseStatus.zeroResult;

  @override
  String toString() {
    return 'PlacesAutocompleteResponse{ predictions: $predictions, status: $status, errorMessage: $errorMessage, infoMessages: $infoMessages,}';
  }

  ///
  factory PlacesAutocompleteResponse.fromMap(Map<String, dynamic> map) {
    return PlacesAutocompleteResponse(
      predictions: parsePlaceAutocompletePrediction(map['predictions'])!,
      status: ResponseStatus.fromValue(map['status']),
      errorMessage: map['error_message'],
      infoMessages: map['info_messages']?.cast<String>(),
    );
  }

  ///
  factory PlacesAutocompleteResponse.fromError(String error) {
    return PlacesAutocompleteResponse(
      predictions: [],
      status: ResponseStatus.unknownError,
      errorMessage: error,
      infoMessages: [error],
    );
  }
}
