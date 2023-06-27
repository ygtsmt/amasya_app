import "package:injectable/injectable.dart";
import "package:amasyaapp/app/bloc/app_bloc.dart";
import "package:amasyaapp/core/data_sources/local_data_source/secure_data_storage.dart";
import "package:amasyaapp/core/injection/injection.dart";

@injectable
class ThemeService {
  Future<void> setSavedThemeMode() async {
    final savedThemeMode = await getIt<SecureDataStorage>().getThemeMode();
    getIt<AppBloc>().add(SetThemeEvent(savedThemeMode));
  }
}
