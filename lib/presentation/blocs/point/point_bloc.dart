import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_hub/domain/entity/point.dart';

import 'package:my_store_hub/domain/usecases/point/get_all_point_history.dart';

part 'point_event.dart';
part 'point_state.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final GetAllPointsHistory getAllPointsHistory;

  PointBloc({required this.getAllPointsHistory}) : super(PointInitial()) {
    on<OnFetchAllPointsHistory>((event, emit) async {
      emit(PointLoading());

      final result = await getAllPointsHistory.execute();

      result.fold(
        (failure) => emit(PointFailure(failure.message)),
        (data) => emit(AllPointsLoaded(data)),
      );
    });
  }
}
