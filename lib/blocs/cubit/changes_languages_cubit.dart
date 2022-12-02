import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mult_language_application/blocs/cubit/changes_languages_state.dart';

class ChangesLanguagesCubit extends Cubit<ChangesLanguagesState> {
  ChangesLanguagesCubit()
      : super(ChangesLanguagesState(localeLanguage: const Locale('en')));

  changeLanguage({required Locale localeLanguage}) {
    emit(ChangesLanguagesState(localeLanguage: localeLanguage));
  }
}
