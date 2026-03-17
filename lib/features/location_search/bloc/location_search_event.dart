import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_search_event.freezed.dart';

@freezed
sealed class LocationSearchEvent with _$LocationSearchEvent {
  const factory LocationSearchEvent.queryChanged({required String query}) =
      LocationSearchQueryChanged;
  const factory LocationSearchEvent.cleared() = LocationSearchCleared;
}
