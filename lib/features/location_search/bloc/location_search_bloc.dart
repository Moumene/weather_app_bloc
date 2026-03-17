import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/weather_repository.dart';

import 'location_search_event.dart';
import 'location_search_state.dart';

export 'location_search_event.dart';
export 'location_search_state.dart';

class LocationSearchBloc extends Bloc<LocationSearchEvent, LocationSearchState> {
  LocationSearchBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepo = weatherRepository,
        super(const LocationSearchState.initial()) {
    on<LocationSearchQueryChanged>(_onQueryChanged);
    on<LocationSearchCleared>(_onCleared);
  }

  final WeatherRepository _weatherRepo;

  Future<void> _onQueryChanged(
    LocationSearchQueryChanged event,
    Emitter<LocationSearchState> emit,
  ) async {
    final query = event.query.trim();
    if (query.isEmpty) {
      emit(const LocationSearchState.initial());
      return;
    }

    emit(const LocationSearchState.loading());

    try {
      final locations = await _weatherRepo.searchLocations(query);
      emit(LocationSearchState.loaded(locations));
    } catch (_) {
      emit(const LocationSearchState.failure());
    }
  }

  void _onCleared(
    LocationSearchCleared event,
    Emitter<LocationSearchState> emit,
  ) {
    emit(const LocationSearchState.initial());
  }
}
