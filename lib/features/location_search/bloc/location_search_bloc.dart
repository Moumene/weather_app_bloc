import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/location_model.dart';
import '../../../domain/repositories/weather_repository.dart';

part 'location_search_event.dart';
part 'location_search_state.dart';

class LocationSearchBloc extends Bloc<LocationSearchEvent, LocationSearchState> {
  LocationSearchBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepo = weatherRepository,
        super(const LocationSearchInitial()) {
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
      emit(const LocationSearchInitial());
      return;
    }

    emit(const LocationSearchLoading());

    try {
      final locations = await _weatherRepo.searchLocations(query);
      emit(LocationSearchLoaded(locations));
    } catch (_) {
      emit(const LocationSearchFailure());
    }
  }

  void _onCleared(
    LocationSearchCleared event,
    Emitter<LocationSearchState> emit,
  ) {
    emit(const LocationSearchInitial());
  }
}
