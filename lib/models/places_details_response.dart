import 'package:nova_google_services_core/nova_google_services_core.dart';

import 'place.dart';

class PlacesDetailsResponse {
  const PlacesDetailsResponse({
    required this.htmlAttributions,
    this.result,
    required this.status,
    this.errorMessage,
    this.infoMessages,
  });

  /// May contain a set of attributions about this listing which must be displayed to the user (some listings may not have attribution).
  final List<String> htmlAttributions;

  /// Contains the detailed information about the place requested.
  final Place? result;

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
    return 'PlacesDetailsResponse{ htmlAttributions: $htmlAttributions, result: $result, status: $status, errorMessage: $errorMessage, infoMessages: $infoMessages,}';
  }

  ///
  factory PlacesDetailsResponse.fromMap(Map<String, dynamic> map) {
    return PlacesDetailsResponse(
      htmlAttributions: map['html_attributions'].cast<String>(),
      result: map['result'] == null ? null : Place.fromMap(map['result']),
      status: ResponseStatus.fromValue(map['status']),
      errorMessage: map['error_message'],
      infoMessages: map['info_messages']?.cast<String>(),
    );
  }

  ///
  factory PlacesDetailsResponse.fromError(String error) {
    return PlacesDetailsResponse(
      htmlAttributions: [],
      status: ResponseStatus.unknownError,
      errorMessage: error,
      infoMessages: [error],
    );
  }
}
