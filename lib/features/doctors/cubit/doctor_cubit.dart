import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_tech/core/data_source/doctorAPIs/doctor_apiservice.dart';
import 'package:health_tech/features/doctors/cubit/doctor_state.dart';
import 'package:health_tech/features/doctors/models/doctor_model.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());

  final apiService = DoctorApiService(createDio());
  List<DoctorModel> favoriteDoctors = [];

  Future<void> getDoctors({String? specialization}) async {
    emit(DoctorLoading());
    try {
      final response = await apiService.getDoctors();
      List<DoctorModel> doctors = response.data;
      if (specialization != null && specialization.isNotEmpty) {
        doctors = doctors
            .where(
              (doc) =>
                  doc.specialization?.name.toLowerCase().contains(
                    specialization.toLowerCase(),
                  ) ??
                  false,
            )
            .toList();
      }

      emit(DoctorSuccess(doctors));
    } catch (e) {
      emit(DoctorError(e.toString()));
    }
  }

  void toggleFavorite(DoctorModel doctor) {
    final isFav = favoriteDoctors.any((d) => d.id == doctor.id);
    if (isFav) {
      favoriteDoctors.removeWhere((d) => d.id == doctor.id);
    } else {
      favoriteDoctors.add(doctor);
    }
    final currentState = state;
    if (currentState is DoctorSuccess) {
      emit(DoctorSuccess(List.from(currentState.doctors)));
    } else {
      emit(FavoritesUpdated(List.from(favoriteDoctors)));
    }
  }

  bool isFavorite(DoctorModel doctor) {
    return favoriteDoctors.any((d) => d.id == doctor.id);
  }
}
