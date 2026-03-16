part of 'location_search_bloc.dart';

sealed class LocationSearchEvent extends Equatable {
  const LocationSearchEvent();

  @override
  List<Object?> get props => [];
}

class LocationSearchQueryChanged extends LocationSearchEvent {
  const LocationSearchQueryChanged({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];
}

class LocationSearchCleared extends LocationSearchEvent {
  const LocationSearchCleared();
}
