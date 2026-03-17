part of 'location_search_bloc.dart';

@freezed
sealed class LocationSearchEvent with _$LocationSearchEvent {
  const factory LocationSearchEvent.queryChanged({required String query}) =
      LocationSearchQueryChanged;
  const factory LocationSearchEvent.cleared() = LocationSearchCleared;
}
