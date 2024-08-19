part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.lastSeenFiles({@Default([]) List<FileMetadata> lastSeenFiles}) = _LastSeenFiles;
  const factory DashboardState.alphabeticalOrderFiles({@Default([]) List<FileMetadata> alphabeticalFiles}) = _AlphabeticalOrderFiles;
  const factory DashboardState.openPdf({required FileMetadata file, DashboardState? previousState}) = _OpenPdf;
  const factory DashboardState.notPermitted() = _NotPermitted;
}
