import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@Freezed(copyWith: false)
abstract class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String name,
    required double lat,
    required double lon,
    required String country,
    String? state,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
