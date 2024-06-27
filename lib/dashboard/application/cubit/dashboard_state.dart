part of 'dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
   @Default(false) bool isLoading,
  @Default([]) List<FileMetadata> lastSeenFiles,
  @Default(null)  FileMetadata? openPdf,
  }) = _DashboardState;
}
