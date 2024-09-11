import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_pdf/dashboard/domain/file_metadata.dart';
import 'package:just_pdf/printing/domain/i_printing_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'pdf_viewer_state.dart';
part 'pdf_viewer_cubit.freezed.dart';

class PdfViewerCubit extends Cubit<PdfViewerState> {
  final IPrintingRepository printingRepository;
  PdfViewerCubit({required this.printingRepository})
      : super(const PdfViewerState());

  void print(FileMetadata fileMetadata) async =>
      await printingRepository.print(fileMetadata);

  void share(FileMetadata fileMetadata) async =>
      await printingRepository.share([fileMetadata]);

  void uriLaunch(Uri? uri) async {
    if (uri != null) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
