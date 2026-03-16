part of 'location_search_bloc.dart';

sealed class LocationSearchState extends Equatable {
  const LocationSearchState();

  @override
  List<Object?> get props => [];
}

class LocationSearchInitial extends LocationSearchState {
  const LocationSearchInitial();
}

class LocationSearchLoading extends LocationSearchState {
  const LocationSearchLoading();
}

class LocationSearchLoaded extends LocationSearchState {
  const LocationSearchLoaded(this.locations);

  final List<LocationModel> locations;

  @override
  List<Object?> get props => [locations];
}

class LocationSearchFailure extends LocationSearchState {
  const LocationSearchFailure();
}
