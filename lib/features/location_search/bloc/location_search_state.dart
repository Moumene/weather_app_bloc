part of 'location_search_bloc.dart';

@freezed
sealed class LocationSearchState with _$LocationSearchState {
  const factory LocationSearchState.initial() = LocationSearchInitial;
  const factory LocationSearchState.loading() = LocationSearchLoading;
  const factory LocationSearchState.loaded(List<LocationModel> locations) =
      LocationSearchLoaded;
  const factory LocationSearchState.failure() = LocationSearchFailure;
}
