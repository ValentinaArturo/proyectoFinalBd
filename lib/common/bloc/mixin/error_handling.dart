import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_bd/common/bloc/base_state.dart';

mixin ErrorHandling on Diagnosticable {
  BuildContext get context;

  void verifyServerError(
      final BaseState state,
      ) {
    if (state is UnknownError) {
      //TODO: Agregar Dialogo de error
    }
    }
}