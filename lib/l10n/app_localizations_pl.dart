// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get app_name => 'JustPDF';

  @override
  String get search_on_your_phone => 'Szukaj w telefonie';

  @override
  String get recently_viewed => 'Ostatnio przeglądane';

  @override
  String get a_z => 'A-Z';

  @override
  String get last_seen => 'Ostatnio widziane';

  @override
  String get name => 'Nazwa';

  @override
  String get size => 'Rozmiar';

  @override
  String get no_access_to_external_memory =>
      'Brak dostępu do pamięci zewnętrznej urządzenia.';

  @override
  String get give_permission => 'Udziel zgody';

  @override
  String get favorite => 'Ulubione';

  @override
  String get print => 'Drukuj';

  @override
  String get share => 'Udostępnij';
}
