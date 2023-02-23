import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/entity/station_entitiy.dart';
import 'package:blueex_emp_app_flutter/features/attendance/domain/usecase/station_usecase.dart';
import 'package:blueex_emp_app_flutter/shared/error/failures.dart';
import 'package:blueex_emp_app_flutter/shared/params/token_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'station_state.dart';

class StationCubit extends Cubit<StationState> with HydratedMixin {
  final StationUseCase stationUseCase;

  StationCubit({
    required this.stationUseCase,
  }) : super(StationState.initial());

  @override
  StationState? fromJson(Map<String, dynamic> json) {
    return StationState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(StationState state) {
    return state.toMap();
  }

  Future<void> get(String token) async {
    const jsonEncoder = JsonEncoder();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final Either<Failure, List<Station>> stationData =
        await stationUseCase.call(TokenParams(token: token));

    stationData.fold(
      (Failure failure) {},
      (List<Station> stations) async {
        emit(state.copyWith(stations: stations));
        List stationsList =
            stations.map((s) => [s.latitude, s.longtitude, s.radius]).toList();
        await preferences.setString(
          "stations",
          jsonEncoder.convert(stationsList),
        );
      },
    );
  }
}
