// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:amasyaapp/app/bloc/app_bloc.dart' as _i30;
import 'package:amasyaapp/app/data/app_usecase.dart' as _i22;
import 'package:amasyaapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart'
    as _i31;
import 'package:amasyaapp/app/features/auth/features/create_account/data/create_account_usecase.dart'
    as _i23;
import 'package:amasyaapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart'
    as _i32;
import 'package:amasyaapp/app/features/auth/features/create_garage/data/create_garage_usecase.dart'
    as _i24;
import 'package:amasyaapp/app/features/auth/features/login/bloc/login_bloc.dart'
    as _i27;
import 'package:amasyaapp/app/features/auth/features/login/data/login_usecase.dart'
    as _i19;
import 'package:amasyaapp/app/features/auth/features/splash/bloc/splash_bloc.dart'
    as _i28;
import 'package:amasyaapp/app/features/auth/features/splash/data/splash_usecase.dart'
    as _i20;
import 'package:amasyaapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart'
    as _i29;
import 'package:amasyaapp/app/features/collection/features/vehicle_list/data/vehicle_list_usecase.dart'
    as _i21;
import 'package:amasyaapp/app/features/dashboard/features/duyuru_list/bloc/duyuru_list_bloc.dart'
    as _i25;
import 'package:amasyaapp/app/features/dashboard/features/duyuru_list/data/duyuru_usecase.dart'
    as _i13;
import 'package:amasyaapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart'
    as _i26;
import 'package:amasyaapp/app/features/dashboard/features/haber_list/data/haberler_usecase.dart'
    as _i15;
import 'package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/bloc/hal_fiyatlari_list_bloc.dart'
    as _i17;
import 'package:amasyaapp/app/features/dashboard/features/hal_fiyatlari_list/data/hal_fiyatlari_usecase.dart'
    as _i16;
import 'package:amasyaapp/core/core.dart' as _i14;
import 'package:amasyaapp/core/data_sources/http_data_source/http_data_source.dart'
    as _i18;
import 'package:amasyaapp/core/data_sources/local_data_source/secure_data_storage.dart'
    as _i10;
import 'package:amasyaapp/core/injection/modules/dio_module.dart' as _i33;
import 'package:amasyaapp/core/injection/modules/image_picker_module.dart'
    as _i35;
import 'package:amasyaapp/core/injection/modules/secure_storage_module.dart'
    as _i34;
import 'package:amasyaapp/core/routes/app_router.dart' as _i4;
import 'package:amasyaapp/core/services/account_permission_service.dart' as _i3;
import 'package:amasyaapp/core/services/bottom_sheet_service.dart' as _i5;
import 'package:amasyaapp/core/services/image_picker_service.dart' as _i9;
import 'package:amasyaapp/core/services/snackbar_service.dart' as _i11;
import 'package:amasyaapp/core/services/theme_service.dart' as _i12;
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final secureStorageModule = _$SecureStorageModule();
    final imagePickerModule = _$ImagePickerModule();
    gh.factory<_i3.AccountPermissionService>(
        () => _i3.AccountPermissionService());
    gh.factory<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i4.AuctionGuard>(() => _i4.AuctionGuard());
    gh.lazySingleton<_i5.BottomSheetService>(() => _i5.BottomSheetService());
    gh.singleton<_i6.Dio>(dioModule.dio());
    gh.singleton<_i7.FlutterSecureStorage>(secureStorageModule.storage());
    gh.factory<_i8.ImagePicker>(() => imagePickerModule.imagePicker());
    gh.factory<_i9.ImagePickerService>(
        () => _i9.ImagePickerService(gh<_i8.ImagePicker>()));
    gh.singleton<_i10.SecureDataStorage>(
        _i10.SecureDataStorage(gh<_i7.FlutterSecureStorage>()));
    gh.factory<_i11.SnackBarService>(() => _i11.SnackBarService());
    gh.factory<_i12.ThemeService>(() => _i12.ThemeService());
    gh.factory<_i13.DuyuruListUseCase>(
        () => _i13.DuyuruListUseCase(gh<_i14.SnackBarService>()));
    gh.factory<_i15.HaberListUseCase>(
        () => _i15.HaberListUseCase(gh<_i14.SnackBarService>()));
    gh.factory<_i16.HalFIyatlariListUseCase>(
        () => _i16.HalFIyatlariListUseCase(gh<_i14.SnackBarService>()));
    gh.singleton<_i17.HalFiyatlariListBloc>(
        _i17.HalFiyatlariListBloc(gh<_i16.HalFIyatlariListUseCase>()));
    gh.singleton<_i18.HttpDataSource>(_i18.HttpDataSource(
      gh<_i6.Dio>(),
      gh<_i14.SecureDataStorage>(),
    ));
    gh.factory<_i19.LoginUseCase>(() => _i19.LoginUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SecureDataStorage>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i20.SplashUseCase>(() => _i20.SplashUseCase(
          gh<_i18.HttpDataSource>(),
          gh<_i10.SecureDataStorage>(),
        ));
    gh.factory<_i21.VehicleListUseCase>(() => _i21.VehicleListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i22.AppUseCase>(() => _i22.AppUseCase(
          gh<_i10.SecureDataStorage>(),
          gh<_i18.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i23.CreateAccountUseCase>(() => _i23.CreateAccountUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i24.CreateGarageUseCase>(() => _i24.CreateGarageUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.singleton<_i25.DuyuruListBloc>(
        _i25.DuyuruListBloc(gh<_i13.DuyuruListUseCase>()));
    gh.singleton<_i26.HaberListBloc>(
        _i26.HaberListBloc(gh<_i15.HaberListUseCase>()));
    gh.singleton<_i27.LoginBloc>(_i27.LoginBloc(
      gh<_i19.LoginUseCase>(),
      gh<_i22.AppUseCase>(),
    ));
    gh.singleton<_i28.SplashBloc>(_i28.SplashBloc(gh<_i20.SplashUseCase>()));
    gh.singleton<_i29.VehicleListBloc>(
        _i29.VehicleListBloc(gh<_i21.VehicleListUseCase>()));
    gh.singleton<_i30.AppBloc>(_i30.AppBloc(gh<_i22.AppUseCase>()));
    gh.singleton<_i31.CreateAccountBloc>(_i31.CreateAccountBloc(
      gh<_i23.CreateAccountUseCase>(),
      gh<_i19.LoginUseCase>(),
    ));
    gh.singleton<_i32.CreateGarageBloc>(
        _i32.CreateGarageBloc(gh<_i24.CreateGarageUseCase>()));
    return this;
  }
}

class _$DioModule extends _i33.DioModule {}

class _$SecureStorageModule extends _i34.SecureStorageModule {}

class _$ImagePickerModule extends _i35.ImagePickerModule {}
