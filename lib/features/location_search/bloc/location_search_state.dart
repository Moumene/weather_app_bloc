import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/location_model.dart';

part 'location_search_state.freezed.dart';

@freezed
sealed class LocationSearchState with _$LocationSearchState {
  const factory LocationSearchState.initial() = LocationSearchInitial;
  const factory LocationSearchState.loading() = LocationSearchLoading;
  const factory LocationSearchState.loaded(List<LocationModel> locations) =
      LocationSearchLoaded;
  const factory LocationSearchState.failure() = LocationSearchFailure;
}
