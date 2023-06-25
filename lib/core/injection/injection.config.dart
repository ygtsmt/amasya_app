// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:revogarageapp/app/bloc/app_bloc.dart' as _i68;
import 'package:revogarageapp/app/data/app_usecase.dart' as _i36;
import 'package:revogarageapp/app/features/auth/features/create_account/bloc/create_account_bloc.dart'
    as _i69;
import 'package:revogarageapp/app/features/auth/features/create_account/data/create_account_usecase.dart'
    as _i37;
import 'package:revogarageapp/app/features/auth/features/create_garage/bloc/create_garage_bloc.dart'
    as _i70;
import 'package:revogarageapp/app/features/auth/features/create_garage/data/create_garage_usecase.dart'
    as _i39;
import 'package:revogarageapp/app/features/auth/features/login/bloc/login_bloc.dart'
    as _i50;
import 'package:revogarageapp/app/features/auth/features/login/data/login_usecase.dart'
    as _i18;
import 'package:revogarageapp/app/features/auth/features/splash/bloc/splash_bloc.dart'
    as _i57;
import 'package:revogarageapp/app/features/auth/features/splash/data/splash_usecase.dart'
    as _i25;
import 'package:revogarageapp/app/features/collection/features/vehicle_basic_form/bloc/vehicle_basic_form_bloc.dart'
    as _i59;
import 'package:revogarageapp/app/features/collection/features/vehicle_basic_form/data/vehicle_basic_form_usecase.dart'
    as _i27;
import 'package:revogarageapp/app/features/collection/features/vehicle_cost_form/bloc/vehicle_cost_form_bloc.dart'
    as _i60;
import 'package:revogarageapp/app/features/collection/features/vehicle_cost_form/data/vehicle_cost_form_usecase.dart'
    as _i28;
import 'package:revogarageapp/app/features/collection/features/vehicle_cost_list/bloc/vehicle_cost_list_bloc.dart'
    as _i61;
import 'package:revogarageapp/app/features/collection/features/vehicle_cost_list/data/vehicle_cost_list_usecase.dart'
    as _i29;
import 'package:revogarageapp/app/features/collection/features/vehicle_damage_form/bloc/vehicle_damage_form_bloc.dart'
    as _i62;
import 'package:revogarageapp/app/features/collection/features/vehicle_damage_form/data/vehicle_damage_form_usecase.dart'
    as _i30;
import 'package:revogarageapp/app/features/collection/features/vehicle_damage_list/bloc/vehicle_damage_list_bloc.dart'
    as _i63;
import 'package:revogarageapp/app/features/collection/features/vehicle_damage_list/data/vehicle_damage_list_usecase.dart'
    as _i31;
import 'package:revogarageapp/app/features/collection/features/vehicle_detail/bloc/bloc/vehicle_detail_bloc.dart'
    as _i64;
import 'package:revogarageapp/app/features/collection/features/vehicle_detail/data/vehicle_detail_usecase.dart'
    as _i32;
import 'package:revogarageapp/app/features/collection/features/vehicle_list/bloc/vehicle_list_bloc.dart'
    as _i65;
import 'package:revogarageapp/app/features/collection/features/vehicle_list/data/vehicle_list_usecase.dart'
    as _i33;
import 'package:revogarageapp/app/features/collection/features/vehicle_photo/bloc/vehicle_photo_bloc.dart'
    as _i66;
import 'package:revogarageapp/app/features/collection/features/vehicle_photo/data/vehicle_photo_usecase.dart'
    as _i34;
import 'package:revogarageapp/app/features/collection/features/vehicle_tire_screen/bloc/vehicle_tire_bloc.dart'
    as _i67;
import 'package:revogarageapp/app/features/collection/features/vehicle_tire_screen/data/vehicle_tire_usecase.dart'
    as _i35;
import 'package:revogarageapp/app/features/dashboard/features/haber_list/bloc/haber_list_bloc.dart'
    as _i47;
import 'package:revogarageapp/app/features/dashboard/features/haber_list/data/haberler_usecase.dart'
    as _i13;
import 'package:revogarageapp/app/features/pe/features/customer_form/bloc/customer_form_bloc.dart'
    as _i71;
import 'package:revogarageapp/app/features/pe/features/customer_form/data/customer_form_usecase.dart'
    as _i40;
import 'package:revogarageapp/app/features/pe/features/customer_list/bloc/customer_list_bloc.dart'
    as _i72;
import 'package:revogarageapp/app/features/pe/features/customer_list/data/customer_list_usecase.dart'
    as _i41;
import 'package:revogarageapp/app/features/pe/features/drive/features/drive_form/bloc/drive_form_bloc.dart'
    as _i74;
import 'package:revogarageapp/app/features/pe/features/drive/features/drive_form/data/drive_form_usecase.dart'
    as _i43;
import 'package:revogarageapp/app/features/pe/features/drive/features/drive_list/bloc/drive_list_bloc.dart'
    as _i75;
import 'package:revogarageapp/app/features/pe/features/drive/features/drive_list/data/drive_list_usecase.dart'
    as _i44;
import 'package:revogarageapp/app/features/pe/features/licence_plate_form/bloc/bloc/licence_plate_form_bloc.dart'
    as _i48;
import 'package:revogarageapp/app/features/pe/features/licence_plate_form/data/licence_plate_form_usecase.dart'
    as _i16;
import 'package:revogarageapp/app/features/pe/features/licence_plate_list/bloc/licence_plate_list_bloc.dart'
    as _i49;
import 'package:revogarageapp/app/features/pe/features/licence_plate_list/data/licence_plate_list_usecase.dart'
    as _i17;
import 'package:revogarageapp/app/features/pe/features/pe_vehicle_list/bloc/pe_vehicle_list_bloc.dart'
    as _i51;
import 'package:revogarageapp/app/features/pe/features/pe_vehicle_list/data/pe_vehicle_list_usacase.dart'
    as _i19;
import 'package:revogarageapp/app/features/pe/features/right_form/bloc/right_form_bloc.dart'
    as _i52;
import 'package:revogarageapp/app/features/pe/features/right_form/data/right_form_usecase.dart'
    as _i20;
import 'package:revogarageapp/app/features/pe/features/right_list/bloc/right_list_bloc.dart'
    as _i53;
import 'package:revogarageapp/app/features/pe/features/right_list/data/right_list_usecase.dart'
    as _i21;
import 'package:revogarageapp/app/features/pe/features/sms_template_form/bloc/sms_template_form_bloc.dart'
    as _i55;
import 'package:revogarageapp/app/features/pe/features/sms_template_form/data/sms_template_form_usecase.dart'
    as _i23;
import 'package:revogarageapp/app/features/pe/features/sms_template_list/bloc/sms_template_list_bloc.dart'
    as _i56;
import 'package:revogarageapp/app/features/pe/features/sms_template_list/data/sms_template_list_usecase.dart'
    as _i24;
import 'package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/bloc/send_short_sms_bloc.dart'
    as _i54;
import 'package:revogarageapp/app/features/pe/ui/screens/send_short_sms_screen/data/send_short_sms_usecase.dart'
    as _i22;
import 'package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/bloc/drive_archive_list_bloc.dart'
    as _i73;
import 'package:revogarageapp/app/features/profile/features/drive_archive/drive_archive_list/data/drive_archive_list_usecase.dart'
    as _i42;
import 'package:revogarageapp/app/features/profile/features/employee_form/bloc/employee_form_bloc.dart'
    as _i45;
import 'package:revogarageapp/app/features/profile/features/employee_form/data/create_employee_usecase.dart'
    as _i38;
import 'package:revogarageapp/app/features/profile/features/employee_list_screen/bloc/employee_list_bloc.dart'
    as _i76;
import 'package:revogarageapp/app/features/profile/features/employee_list_screen/data/employee_list_usecase.dart'
    as _i46;
import 'package:revogarageapp/app/features/profile/features/vehicle_archive_list/bloc/vehicle_archive_list_bloc.dart'
    as _i58;
import 'package:revogarageapp/app/features/profile/features/vehicle_archive_list/data/vehicle_archive_list_usecase.dart'
    as _i26;
import 'package:revogarageapp/core/core.dart' as _i14;
import 'package:revogarageapp/core/data_sources/http_data_source/http_data_source.dart'
    as _i15;
import 'package:revogarageapp/core/data_sources/local_data_source/secure_data_storage.dart'
    as _i10;
import 'package:revogarageapp/core/injection/modules/dio_module.dart' as _i77;
import 'package:revogarageapp/core/injection/modules/image_picker_module.dart'
    as _i79;
import 'package:revogarageapp/core/injection/modules/secure_storage_module.dart'
    as _i78;
import 'package:revogarageapp/core/routes/app_router.dart' as _i4;
import 'package:revogarageapp/core/services/account_permission_service.dart'
    as _i3;
import 'package:revogarageapp/core/services/bottom_sheet_service.dart' as _i5;
import 'package:revogarageapp/core/services/image_picker_service.dart' as _i9;
import 'package:revogarageapp/core/services/snackbar_service.dart' as _i11;
import 'package:revogarageapp/core/services/theme_service.dart' as _i12;

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
    gh.factory<_i13.HaberListUseCase>(
        () => _i13.HaberListUseCase(gh<_i14.SnackBarService>()));
    gh.singleton<_i15.HttpDataSource>(_i15.HttpDataSource(
      gh<_i6.Dio>(),
      gh<_i14.SecureDataStorage>(),
    ));
    gh.factory<_i16.LicencePlateFormUseCase>(() => _i16.LicencePlateFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i17.LicencePlateListUseCase>(() => _i17.LicencePlateListUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i18.LoginUseCase>(() => _i18.LoginUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SecureDataStorage>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i19.PeVehicleListUseCase>(() => _i19.PeVehicleListUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i20.RightFormUseCase>(() => _i20.RightFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i21.RightListUseCase>(() => _i21.RightListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i22.SendShortSmsShortSmsUseCase>(
        () => _i22.SendShortSmsShortSmsUseCase(
              gh<_i14.HttpDataSource>(),
              gh<_i14.SnackBarService>(),
            ));
    gh.factory<_i23.SmsTemplateFormUseCase>(() => _i23.SmsTemplateFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i24.SmsTemplateListUseCase>(() => _i24.SmsTemplateListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i25.SplashUseCase>(() => _i25.SplashUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i10.SecureDataStorage>(),
        ));
    gh.factory<_i26.VehicleArchiveListUseCase>(
        () => _i26.VehicleArchiveListUseCase(
              gh<_i15.HttpDataSource>(),
              gh<_i11.SnackBarService>(),
            ));
    gh.factory<_i27.VehicleBasicFormUseCase>(() => _i27.VehicleBasicFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i28.VehicleCostFormUseCase>(() => _i28.VehicleCostFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i29.VehicleCostListUseCase>(() => _i29.VehicleCostListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i30.VehicleDamageFormUseCase>(
        () => _i30.VehicleDamageFormUseCase(
              gh<_i15.HttpDataSource>(),
              gh<_i11.SnackBarService>(),
              gh<_i9.ImagePickerService>(),
            ));
    gh.factory<_i31.VehicleDamageListUseCase>(
        () => _i31.VehicleDamageListUseCase(
              gh<_i15.HttpDataSource>(),
              gh<_i11.SnackBarService>(),
            ));
    gh.factory<_i32.VehicleDetailUseCase>(() => _i32.VehicleDetailUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i33.VehicleListUseCase>(() => _i33.VehicleListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i34.VehiclePhotoUseCase>(() => _i34.VehiclePhotoUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
          gh<_i9.ImagePickerService>(),
        ));
    gh.factory<_i35.VehicleTireUseCase>(() => _i35.VehicleTireUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i36.AppUseCase>(() => _i36.AppUseCase(
          gh<_i10.SecureDataStorage>(),
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i37.CreateAccountUseCase>(() => _i37.CreateAccountUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i38.CreateEmployeeUseCase>(() => _i38.CreateEmployeeUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i39.CreateGarageUseCase>(() => _i39.CreateGarageUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i40.CustomerFormUseCase>(() => _i40.CustomerFormUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i41.CustomerListUseCase>(() => _i41.CustomerListUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i42.DriveArchiveListUseCase>(() => _i42.DriveArchiveListUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.factory<_i43.DriveFormUseCase>(() => _i43.DriveFormUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.factory<_i44.DriveListUseCase>(() => _i44.DriveListUseCase(
          gh<_i15.HttpDataSource>(),
          gh<_i11.SnackBarService>(),
        ));
    gh.singleton<_i45.EmployeeFormBloc>(
        _i45.EmployeeFormBloc(gh<_i38.CreateEmployeeUseCase>()));
    gh.factory<_i46.EmployeeListUseCase>(() => _i46.EmployeeListUseCase(
          gh<_i14.HttpDataSource>(),
          gh<_i14.SnackBarService>(),
        ));
    gh.singleton<_i47.HaberListBloc>(
        _i47.HaberListBloc(gh<_i13.HaberListUseCase>()));
    gh.singleton<_i48.LicencePlateFormBloc>(
        _i48.LicencePlateFormBloc(gh<_i16.LicencePlateFormUseCase>()));
    gh.singleton<_i49.LicencePlateListBloc>(
        _i49.LicencePlateListBloc(gh<_i17.LicencePlateListUseCase>()));
    gh.singleton<_i50.LoginBloc>(_i50.LoginBloc(
      gh<_i18.LoginUseCase>(),
      gh<_i36.AppUseCase>(),
    ));
    gh.singleton<_i51.PeVehicleListBloc>(
        _i51.PeVehicleListBloc(gh<_i19.PeVehicleListUseCase>()));
    gh.singleton<_i52.RightFormBloc>(
        _i52.RightFormBloc(gh<_i20.RightFormUseCase>()));
    gh.singleton<_i53.RightListBloc>(
        _i53.RightListBloc(gh<_i21.RightListUseCase>()));
    gh.singleton<_i54.SendShortSmsBloc>(
        _i54.SendShortSmsBloc(gh<_i22.SendShortSmsShortSmsUseCase>()));
    gh.singleton<_i55.SmsTemplateFormBloc>(
        _i55.SmsTemplateFormBloc(gh<_i23.SmsTemplateFormUseCase>()));
    gh.singleton<_i56.SmsTemplateListBloc>(
        _i56.SmsTemplateListBloc(gh<_i24.SmsTemplateListUseCase>()));
    gh.singleton<_i57.SplashBloc>(_i57.SplashBloc(gh<_i25.SplashUseCase>()));
    gh.singleton<_i58.VehicleArchiveListBloc>(
        _i58.VehicleArchiveListBloc(gh<_i26.VehicleArchiveListUseCase>()));
    gh.singleton<_i59.VehicleBasicFormBloc>(
        _i59.VehicleBasicFormBloc(gh<_i27.VehicleBasicFormUseCase>()));
    gh.singleton<_i60.VehicleCostFormBloc>(
        _i60.VehicleCostFormBloc(gh<_i28.VehicleCostFormUseCase>()));
    gh.singleton<_i61.VehicleCostListBloc>(
        _i61.VehicleCostListBloc(gh<_i29.VehicleCostListUseCase>()));
    gh.singleton<_i62.VehicleDamageFormBloc>(
        _i62.VehicleDamageFormBloc(gh<_i30.VehicleDamageFormUseCase>()));
    gh.singleton<_i63.VehicleDamageListBloc>(
        _i63.VehicleDamageListBloc(gh<_i31.VehicleDamageListUseCase>()));
    gh.singleton<_i64.VehicleDetailBloc>(
        _i64.VehicleDetailBloc(gh<_i32.VehicleDetailUseCase>()));
    gh.singleton<_i65.VehicleListBloc>(
        _i65.VehicleListBloc(gh<_i33.VehicleListUseCase>()));
    gh.singleton<_i66.VehiclePhotoBloc>(
        _i66.VehiclePhotoBloc(gh<_i34.VehiclePhotoUseCase>()));
    gh.singleton<_i67.VehicleTireBloc>(
        _i67.VehicleTireBloc(gh<_i35.VehicleTireUseCase>()));
    gh.singleton<_i68.AppBloc>(_i68.AppBloc(gh<_i36.AppUseCase>()));
    gh.singleton<_i69.CreateAccountBloc>(_i69.CreateAccountBloc(
      gh<_i37.CreateAccountUseCase>(),
      gh<_i18.LoginUseCase>(),
    ));
    gh.singleton<_i70.CreateGarageBloc>(
        _i70.CreateGarageBloc(gh<_i39.CreateGarageUseCase>()));
    gh.singleton<_i71.CustomerFormBloc>(
        _i71.CustomerFormBloc(gh<_i40.CustomerFormUseCase>()));
    gh.singleton<_i72.CustomerListBloc>(
        _i72.CustomerListBloc(gh<_i41.CustomerListUseCase>()));
    gh.singleton<_i73.DriveArchiveListBloc>(
        _i73.DriveArchiveListBloc(gh<_i42.DriveArchiveListUseCase>()));
    gh.singleton<_i74.DriveFormBloc>(_i74.DriveFormBloc(
      gh<_i41.CustomerListUseCase>(),
      gh<_i19.PeVehicleListUseCase>(),
      gh<_i17.LicencePlateListUseCase>(),
      gh<_i21.RightListUseCase>(),
      gh<_i43.DriveFormUseCase>(),
      gh<_i14.SnackBarService>(),
    ));
    gh.singleton<_i75.DriveListBloc>(
        _i75.DriveListBloc(gh<_i44.DriveListUseCase>()));
    gh.singleton<_i76.EmployeeListBloc>(
        _i76.EmployeeListBloc(gh<_i46.EmployeeListUseCase>()));
    return this;
  }
}

class _$DioModule extends _i77.DioModule {}

class _$SecureStorageModule extends _i78.SecureStorageModule {}

class _$ImagePickerModule extends _i79.ImagePickerModule {}
