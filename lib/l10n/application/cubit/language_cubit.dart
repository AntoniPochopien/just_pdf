import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_pdf/l10n/l10n.dart';
import 'package:just_pdf/local_storage/domain/i_local_storage_repository.dart';

part 'language_state.dart';
part 'language_cubit.freezed.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final ILocalStorageRepository localStorageRepository;
  LanguageCubit({required this.localStorageRepository})
      : super(const LanguageState());

  void init() {
    final phoneLocale = Locale(Platform.localeName.substring(0, 2));
    final savedLocale = localStorageRepository.readLocale();
    if (savedLocale == null) {
      if (L10n.supported.contains(phoneLocale)) {
        emit(state.copyWith(locale: phoneLocale));
      } else {
        emit(state.copyWith(locale: L10n.supported.first));
      }
    } else {
      emit(state.copyWith(locale: savedLocale));
    }
  }

  void setLocale({required Locale locale}) {
    localStorageRepository.saveLocale(locale);
    emit(state.copyWith(locale: locale));
  }
}
