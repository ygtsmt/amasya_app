// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `login`
  String get loginTitle {
    return Intl.message(
      'login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your credentials to login.`
  String get loginDescription {
    return Intl.message(
      'Please enter your credentials to login.',
      name: 'loginDescription',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Oops! Something went wrong!`
  String get common_error {
    return Intl.message(
      'Oops! Something went wrong!',
      name: 'common_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get email_error {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'email_error',
      desc: '',
      args: [],
    );
  }

  /// `Please fill out this field.`
  String get empty_error {
    return Intl.message(
      'Please fill out this field.',
      name: 'empty_error',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password.`
  String get password_error {
    return Intl.message(
      'Please enter a valid password.',
      name: 'password_error',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get signup_button_text {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'signup_button_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup_button_link {
    return Intl.message(
      'Sign up',
      name: 'signup_button_link',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `12 123 12 12`
  String get phone_number_mask_hint_text {
    return Intl.message(
      '12 123 12 12',
      name: 'phone_number_mask_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is not valid`
  String get phone_number_error {
    return Intl.message(
      'Phone number is not valid',
      name: 'phone_number_error',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `VIN`
  String get vin_number {
    return Intl.message(
      'VIN',
      name: 'vin_number',
      desc: '',
      args: [],
    );
  }

  /// `This field is invalid`
  String get form_field_invalid_error {
    return Intl.message(
      'This field is invalid',
      name: 'form_field_invalid_error',
      desc: '',
      args: [],
    );
  }

  /// `Type Certification`
  String get type_certification {
    return Intl.message(
      'Type Certification',
      name: 'type_certification',
      desc: '',
      args: [],
    );
  }

  /// `Mileage`
  String get mileage {
    return Intl.message(
      'Mileage',
      name: 'mileage',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get date_mask_hint_text {
    return Intl.message(
      'DD/MM/YYYY',
      name: 'date_mask_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Internal Number`
  String get internal_number {
    return Intl.message(
      'Internal Number',
      name: 'internal_number',
      desc: '',
      args: [],
    );
  }

  /// `Select Color`
  String get select_color {
    return Intl.message(
      'Select Color',
      name: 'select_color',
      desc: '',
      args: [],
    );
  }

  /// `Select Brand`
  String get select_brand {
    return Intl.message(
      'Select Brand',
      name: 'select_brand',
      desc: '',
      args: [],
    );
  }

  /// `Select Model`
  String get select_model {
    return Intl.message(
      'Select Model',
      name: 'select_model',
      desc: '',
      args: [],
    );
  }

  /// `Select Fuel Type`
  String get select_fuel_type {
    return Intl.message(
      'Select Fuel Type',
      name: 'select_fuel_type',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit_button {
    return Intl.message(
      'Submit',
      name: 'submit_button',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get confirm_password_error {
    return Intl.message(
      'Passwords do not match',
      name: 'confirm_password_error',
      desc: '',
      args: [],
    );
  }

  /// `Invite Code`
  String get invite_code {
    return Intl.message(
      'Invite Code',
      name: 'invite_code',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `continue`
  String get continue_text {
    return Intl.message(
      'continue',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the form below to create an account`
  String get create_account_form {
    return Intl.message(
      'Please fill in the form below to create an account',
      name: 'create_account_form',
      desc: '',
      args: [],
    );
  }

  /// `Capture Vehicle`
  String get captureVehicle {
    return Intl.message(
      'Capture Vehicle',
      name: 'captureVehicle',
      desc: '',
      args: [],
    );
  }

  /// `My Vehicle`
  String get myVehicle {
    return Intl.message(
      'My Vehicle',
      name: 'myVehicle',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get collection {
    return Intl.message(
      'Collection',
      name: 'collection',
      desc: '',
      args: [],
    );
  }

  /// `P&E`
  String get pAndE {
    return Intl.message(
      'P&E',
      name: 'pAndE',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Employee`
  String get employee {
    return Intl.message(
      'Employee',
      name: 'employee',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Archive`
  String get vehicleArchive {
    return Intl.message(
      'Vehicle Archive',
      name: 'vehicleArchive',
      desc: '',
      args: [],
    );
  }

  /// `Bought Vehicles`
  String get boughtVehicles {
    return Intl.message(
      'Bought Vehicles',
      name: 'boughtVehicles',
      desc: '',
      args: [],
    );
  }

  /// `Invite Dealer`
  String get inviteDealer {
    return Intl.message(
      'Invite Dealer',
      name: 'inviteDealer',
      desc: '',
      args: [],
    );
  }

  /// `Drives`
  String get drives {
    return Intl.message(
      'Drives',
      name: 'drives',
      desc: '',
      args: [],
    );
  }

  /// `Vehicles`
  String get vehicles {
    return Intl.message(
      'Vehicles',
      name: 'vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Customers`
  String get customers {
    return Intl.message(
      'Customers',
      name: 'customers',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message(
      'SMS',
      name: 'sms',
      desc: '',
      args: [],
    );
  }

  /// `Market Date`
  String get market_date {
    return Intl.message(
      'Market Date',
      name: 'market_date',
      desc: '',
      args: [],
    );
  }

  /// `Auction`
  String get auction {
    return Intl.message(
      'Auction',
      name: 'auction',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message(
      'Birth Date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Driving Licence Number`
  String get drivingLicenceNumber {
    return Intl.message(
      'Driving Licence Number',
      name: 'drivingLicenceNumber',
      desc: '',
      args: [],
    );
  }

  /// `The client accepts receiving SMS messages`
  String get theClientAcceptsReceivingSmsMessages {
    return Intl.message(
      'The client accepts receiving SMS messages',
      name: 'theClientAcceptsReceivingSmsMessages',
      desc: '',
      args: [],
    );
  }

  /// `The client accepts receiving E-mail messages`
  String get theClientAcceptsReceivingEmailMessages {
    return Intl.message(
      'The client accepts receiving E-mail messages',
      name: 'theClientAcceptsReceivingEmailMessages',
      desc: '',
      args: [],
    );
  }

  /// `SAVE`
  String get save {
    return Intl.message(
      'SAVE',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Garage Name`
  String get garage_name {
    return Intl.message(
      'Garage Name',
      name: 'garage_name',
      desc: '',
      args: [],
    );
  }

  /// `Create Garage`
  String get create_garage {
    return Intl.message(
      'Create Garage',
      name: 'create_garage',
      desc: '',
      args: [],
    );
  }

  /// `Tire Brand`
  String get tire_brand {
    return Intl.message(
      'Tire Brand',
      name: 'tire_brand',
      desc: '',
      args: [],
    );
  }

  /// `Dimensions`
  String get dimensions {
    return Intl.message(
      'Dimensions',
      name: 'dimensions',
      desc: '',
      args: [],
    );
  }

  /// `Rims`
  String get rims {
    return Intl.message(
      'Rims',
      name: 'rims',
      desc: '',
      args: [],
    );
  }

  /// `Profile Front`
  String get profile_front {
    return Intl.message(
      'Profile Front',
      name: 'profile_front',
      desc: '',
      args: [],
    );
  }

  /// `Profile Rear`
  String get profile_rear {
    return Intl.message(
      'Profile Rear',
      name: 'profile_rear',
      desc: '',
      args: [],
    );
  }

  /// `Plate Name`
  String get plateName {
    return Intl.message(
      'Plate Name',
      name: 'plateName',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Rights`
  String get rights {
    return Intl.message(
      'Rights',
      name: 'rights',
      desc: '',
      args: [],
    );
  }

  /// `Create Right`
  String get createRight {
    return Intl.message(
      'Create Right',
      name: 'createRight',
      desc: '',
      args: [],
    );
  }

  /// `Right Name`
  String get rightName {
    return Intl.message(
      'Right Name',
      name: 'rightName',
      desc: '',
      args: [],
    );
  }

  /// `Right Description`
  String get rightDescription {
    return Intl.message(
      'Right Description',
      name: 'rightDescription',
      desc: '',
      args: [],
    );
  }

  /// `Damage Name`
  String get damage_name {
    return Intl.message(
      'Damage Name',
      name: 'damage_name',
      desc: '',
      args: [],
    );
  }

  /// `Upload Photo`
  String get upload_photo {
    return Intl.message(
      'Upload Photo',
      name: 'upload_photo',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get take_photo {
    return Intl.message(
      'Take Photo',
      name: 'take_photo',
      desc: '',
      args: [],
    );
  }

  /// `SELECT PICTURE`
  String get select_picture {
    return Intl.message(
      'SELECT PICTURE',
      name: 'select_picture',
      desc: '',
      args: [],
    );
  }

  /// `Damage Cost`
  String get damage_cost {
    return Intl.message(
      'Damage Cost',
      name: 'damage_cost',
      desc: '',
      args: [],
    );
  }

  /// `Damage Note`
  String get damage_note {
    return Intl.message(
      'Damage Note',
      name: 'damage_note',
      desc: '',
      args: [],
    );
  }

  /// `Active Auctions`
  String get active_auctions {
    return Intl.message(
      'Active Auctions',
      name: 'active_auctions',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Only One Picture`
  String get please_select_only_one_picture {
    return Intl.message(
      'Please Select Only One Picture',
      name: 'please_select_only_one_picture',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Details`
  String get vehicle_details {
    return Intl.message(
      'Vehicle Details',
      name: 'vehicle_details',
      desc: '',
      args: [],
    );
  }

  /// `User Summary Screen`
  String get user_summary_screen {
    return Intl.message(
      'User Summary Screen',
      name: 'user_summary_screen',
      desc: '',
      args: [],
    );
  }

  /// `Basic Details`
  String get basic_details {
    return Intl.message(
      'Basic Details',
      name: 'basic_details',
      desc: '',
      args: [],
    );
  }

  /// `Tire Details`
  String get tire_details {
    return Intl.message(
      'Tire Details',
      name: 'tire_details',
      desc: '',
      args: [],
    );
  }

  /// `Damage Details`
  String get damage_details {
    return Intl.message(
      'Damage Details',
      name: 'damage_details',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message(
      'Photos',
      name: 'photos',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Photos`
  String get vehicle_photos {
    return Intl.message(
      'Vehicle Photos',
      name: 'vehicle_photos',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Control-Light`
  String get control_light {
    return Intl.message(
      'Control-Light',
      name: 'control_light',
      desc: '',
      args: [],
    );
  }

  /// `Create Damage`
  String get create_damage {
    return Intl.message(
      'Create Damage',
      name: 'create_damage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Big`
  String get big {
    return Intl.message(
      'Big',
      name: 'big',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Break Front`
  String get break_front {
    return Intl.message(
      'Break Front',
      name: 'break_front',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get good {
    return Intl.message(
      'Good',
      name: 'good',
      desc: '',
      args: [],
    );
  }

  /// `Damage`
  String get damage {
    return Intl.message(
      'Damage',
      name: 'damage',
      desc: '',
      args: [],
    );
  }

  /// `Replace`
  String get replace {
    return Intl.message(
      'Replace',
      name: 'replace',
      desc: '',
      args: [],
    );
  }

  /// `Break Rear`
  String get break_rear {
    return Intl.message(
      'Break Rear',
      name: 'break_rear',
      desc: '',
      args: [],
    );
  }

  /// `Engine Oil Leak`
  String get engine_oil_leak {
    return Intl.message(
      'Engine Oil Leak',
      name: 'engine_oil_leak',
      desc: '',
      args: [],
    );
  }

  /// `MFK`
  String get mfk {
    return Intl.message(
      'MFK',
      name: 'mfk',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Services`
  String get vehicle_service {
    return Intl.message(
      'Vehicle Services',
      name: 'vehicle_service',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Tire`
  String get vehicle_tire {
    return Intl.message(
      'Vehicle Tire',
      name: 'vehicle_tire',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Damage`
  String get vehicle_damage {
    return Intl.message(
      'Vehicle Damage',
      name: 'vehicle_damage',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Basic Details`
  String get vehicle_basic {
    return Intl.message(
      'Vehicle Basic Details',
      name: 'vehicle_basic',
      desc: '',
      args: [],
    );
  }

  /// `Licence Plates`
  String get licence_plates {
    return Intl.message(
      'Licence Plates',
      name: 'licence_plates',
      desc: '',
      args: [],
    );
  }

  /// `Create Licence Plate`
  String get create_licence_plates {
    return Intl.message(
      'Create Licence Plate',
      name: 'create_licence_plates',
      desc: '',
      args: [],
    );
  }

  /// `Template Name`
  String get template_name {
    return Intl.message(
      'Template Name',
      name: 'template_name',
      desc: '',
      args: [],
    );
  }

  /// `No photos`
  String get no_photos {
    return Intl.message(
      'No photos',
      name: 'no_photos',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Remove from P&E?`
  String get remove_from_p_and_e {
    return Intl.message(
      'Remove from P&E?',
      name: 'remove_from_p_and_e',
      desc: '',
      args: [],
    );
  }

  /// `Add to P&E?`
  String get add_to_p_and_e {
    return Intl.message(
      'Add to P&E?',
      name: 'add_to_p_and_e',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle`
  String get vehicle {
    return Intl.message(
      'Vehicle',
      name: 'vehicle',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to remove this vehicle from Archive?`
  String get do_you_want_to_remove_this_vehicle_from_archive {
    return Intl.message(
      'Do you want to remove this vehicle from Archive?',
      name: 'do_you_want_to_remove_this_vehicle_from_archive',
      desc: '',
      args: [],
    );
  }

  /// `FRONT`
  String get front {
    return Intl.message(
      'FRONT',
      name: 'front',
      desc: '',
      args: [],
    );
  }

  /// `Summer`
  String get summer {
    return Intl.message(
      'Summer',
      name: 'summer',
      desc: '',
      args: [],
    );
  }

  /// `Winter`
  String get winter {
    return Intl.message(
      'Winter',
      name: 'winter',
      desc: '',
      args: [],
    );
  }

  /// `All Seasons`
  String get all_season {
    return Intl.message(
      'All Seasons',
      name: 'all_season',
      desc: '',
      args: [],
    );
  }

  /// `REAR`
  String get rear {
    return Intl.message(
      'REAR',
      name: 'rear',
      desc: '',
      args: [],
    );
  }

  /// `SMS Text`
  String get sms_text {
    return Intl.message(
      'SMS Text',
      name: 'sms_text',
      desc: '',
      args: [],
    );
  }

  /// `Create SMS Template`
  String get create_sms_template {
    return Intl.message(
      'Create SMS Template',
      name: 'create_sms_template',
      desc: '',
      args: [],
    );
  }

  /// `SMS Templates`
  String get sms_templates {
    return Intl.message(
      'SMS Templates',
      name: 'sms_templates',
      desc: '',
      args: [],
    );
  }

  /// `You cannot upload more than 5 photos`
  String get you_cannot_upload_more_than_five_photos {
    return Intl.message(
      'You cannot upload more than 5 photos',
      name: 'you_cannot_upload_more_than_five_photos',
      desc: '',
      args: [],
    );
  }

  /// `CHF`
  String get chf {
    return Intl.message(
      'CHF',
      name: 'chf',
      desc: '',
      args: [],
    );
  }

  /// `Create Customer`
  String get create_customer {
    return Intl.message(
      'Create Customer',
      name: 'create_customer',
      desc: '',
      args: [],
    );
  }

  /// `Add additional photos`
  String get add_additional_photos {
    return Intl.message(
      'Add additional photos',
      name: 'add_additional_photos',
      desc: '',
      args: [],
    );
  }

  /// `This file type is not supported`
  String get file_type_is_not_supported {
    return Intl.message(
      'This file type is not supported',
      name: 'file_type_is_not_supported',
      desc: '',
      args: [],
    );
  }

  /// `Add Photo`
  String get add_photo {
    return Intl.message(
      'Add Photo',
      name: 'add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Choose From Gallery`
  String get choose_from_gallery {
    return Intl.message(
      'Choose From Gallery',
      name: 'choose_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `You cannot upload more than 3 photos`
  String get you_cannot_upload_more_than_three_photos {
    return Intl.message(
      'You cannot upload more than 3 photos',
      name: 'you_cannot_upload_more_than_three_photos',
      desc: '',
      args: [],
    );
  }

  /// `Tire Front`
  String get tire_front {
    return Intl.message(
      'Tire Front',
      name: 'tire_front',
      desc: '',
      args: [],
    );
  }

  /// `Tire Rear`
  String get tire_rear {
    return Intl.message(
      'Tire Rear',
      name: 'tire_rear',
      desc: '',
      args: [],
    );
  }

  /// `Summer Tire`
  String get summer_tire {
    return Intl.message(
      'Summer Tire',
      name: 'summer_tire',
      desc: '',
      args: [],
    );
  }

  /// `Winter Tire`
  String get winter_tire {
    return Intl.message(
      'Winter Tire',
      name: 'winter_tire',
      desc: '',
      args: [],
    );
  }

  /// `All Seasons`
  String get all_seasons {
    return Intl.message(
      'All Seasons',
      name: 'all_seasons',
      desc: '',
      args: [],
    );
  }

  /// `P&E Vehicles`
  String get pande_vehicles {
    return Intl.message(
      'P&E Vehicles',
      name: 'pande_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Occupied`
  String get occupied {
    return Intl.message(
      'Occupied',
      name: 'occupied',
      desc: '',
      args: [],
    );
  }

  /// `I Accept, that only invite dealer not private person.`
  String get accept_that_only_invite_dealer {
    return Intl.message(
      'I Accept, that only invite dealer not private person.',
      name: 'accept_that_only_invite_dealer',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS`
  String get send_sms {
    return Intl.message(
      'Send SMS',
      name: 'send_sms',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the terms and conditions before sending the invitation.`
  String get please_accept_terms_conditions_before_sending_invitation {
    return Intl.message(
      'Please accept the terms and conditions before sending the invitation.',
      name: 'please_accept_terms_conditions_before_sending_invitation',
      desc: '',
      args: [],
    );
  }

  /// `Check that the number is correct before inviting the dealer.`
  String get check_number_correct_before_inviting_dealer {
    return Intl.message(
      'Check that the number is correct before inviting the dealer.',
      name: 'check_number_correct_before_inviting_dealer',
      desc: '',
      args: [],
    );
  }

  /// `Invite a dealer with code.Set the number and fill in the phone number to sent the verifications code.`
  String get invite_dealer_with_code {
    return Intl.message(
      'Invite a dealer with code.Set the number and fill in the phone number to sent the verifications code.',
      name: 'invite_dealer_with_code',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Create Employee`
  String get create_employee {
    return Intl.message(
      'Create Employee',
      name: 'create_employee',
      desc: '',
      args: [],
    );
  }

  /// `Select a role`
  String get select_role {
    return Intl.message(
      'Select a role',
      name: 'select_role',
      desc: '',
      args: [],
    );
  }

  /// `Please select role`
  String get please_select_role {
    return Intl.message(
      'Please select role',
      name: 'please_select_role',
      desc: '',
      args: [],
    );
  }

  /// `Owner / Admin Garage`
  String get owner_admin_garage {
    return Intl.message(
      'Owner / Admin Garage',
      name: 'owner_admin_garage',
      desc: '',
      args: [],
    );
  }

  /// `Sale`
  String get sale {
    return Intl.message(
      'Sale',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Workshop / Reconditioning`
  String get workshop_reconditioning {
    return Intl.message(
      'Workshop / Reconditioning',
      name: 'workshop_reconditioning',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Replacement`
  String get replacement {
    return Intl.message(
      'Replacement',
      name: 'replacement',
      desc: '',
      args: [],
    );
  }

  /// `Handover KM`
  String get handover_km {
    return Intl.message(
      'Handover KM',
      name: 'handover_km',
      desc: '',
      args: [],
    );
  }

  /// `Handover Liter`
  String get handover_liter {
    return Intl.message(
      'Handover Liter',
      name: 'handover_liter',
      desc: '',
      args: [],
    );
  }

  /// `Return KM`
  String get return_km {
    return Intl.message(
      'Return KM',
      name: 'return_km',
      desc: '',
      args: [],
    );
  }

  /// `Return Liter`
  String get return_liter {
    return Intl.message(
      'Return Liter',
      name: 'return_liter',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Clear Signature`
  String get clear_signature {
    return Intl.message(
      'Clear Signature',
      name: 'clear_signature',
      desc: '',
      args: [],
    );
  }

  /// `Pick File`
  String get pick_file {
    return Intl.message(
      'Pick File',
      name: 'pick_file',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Bought Vehicles`
  String get bought_vehicles {
    return Intl.message(
      'Bought Vehicles',
      name: 'bought_vehicles',
      desc: '',
      args: [],
    );
  }

  /// `Send Short SMS`
  String get send_short_sms {
    return Intl.message(
      'Send Short SMS',
      name: 'send_short_sms',
      desc: '',
      args: [],
    );
  }

  /// `Add Recipients`
  String get add_recipients {
    return Intl.message(
      'Add Recipients',
      name: 'add_recipients',
      desc: '',
      args: [],
    );
  }

  /// `Recipients`
  String get recipients {
    return Intl.message(
      'Recipients',
      name: 'recipients',
      desc: '',
      args: [],
    );
  }

  /// `Pick Recipients or Group`
  String get pick_recipients_or_group {
    return Intl.message(
      'Pick Recipients or Group',
      name: 'pick_recipients_or_group',
      desc: '',
      args: [],
    );
  }

  /// `Checks Group`
  String get checks_group {
    return Intl.message(
      'Checks Group',
      name: 'checks_group',
      desc: '',
      args: [],
    );
  }

  /// `Add as recipients`
  String get add_as_recipients {
    return Intl.message(
      'Add as recipients',
      name: 'add_as_recipients',
      desc: '',
      args: [],
    );
  }

  /// `SMS Groups`
  String get sms_groups {
    return Intl.message(
      'SMS Groups',
      name: 'sms_groups',
      desc: '',
      args: [],
    );
  }

  /// `Add Members to a group`
  String get add_members_to_group {
    return Intl.message(
      'Add Members to a group',
      name: 'add_members_to_group',
      desc: '',
      args: [],
    );
  }

  /// `Name Of Group`
  String get name_of_group {
    return Intl.message(
      'Name Of Group',
      name: 'name_of_group',
      desc: '',
      args: [],
    );
  }

  /// `Create Group`
  String get create_group {
    return Intl.message(
      'Create Group',
      name: 'create_group',
      desc: '',
      args: [],
    );
  }

  /// `Pick Members Of The Group`
  String get pick_members_of_the_group {
    return Intl.message(
      'Pick Members Of The Group',
      name: 'pick_members_of_the_group',
      desc: '',
      args: [],
    );
  }

  /// `Add to group`
  String get add_to_group {
    return Intl.message(
      'Add to group',
      name: 'add_to_group',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least two members to create a group.`
  String get please_select_at_least_to_members_to_create_group {
    return Intl.message(
      'Please select at least two members to create a group.',
      name: 'please_select_at_least_to_members_to_create_group',
      desc: '',
      args: [],
    );
  }

  /// `Recipients is selected`
  String get recipients_is_selected {
    return Intl.message(
      'Recipients is selected',
      name: 'recipients_is_selected',
      desc: '',
      args: [],
    );
  }

  /// `Please select members`
  String get please_select_members {
    return Intl.message(
      'Please select members',
      name: 'please_select_members',
      desc: '',
      args: [],
    );
  }

  /// `Use This Template`
  String get use_this_template {
    return Intl.message(
      'Use This Template',
      name: 'use_this_template',
      desc: '',
      args: [],
    );
  }

  /// `Send SMS Template`
  String get send_sms_template {
    return Intl.message(
      'Send SMS Template',
      name: 'send_sms_template',
      desc: '',
      args: [],
    );
  }

  /// `Edit SMS Template`
  String get edit_template {
    return Intl.message(
      'Edit SMS Template',
      name: 'edit_template',
      desc: '',
      args: [],
    );
  }

  /// `Price according to euroTax`
  String get price_according_to_eurtax {
    return Intl.message(
      'Price according to euroTax',
      name: 'price_according_to_eurtax',
      desc: '',
      args: [],
    );
  }

  /// `Set Auction Time`
  String get set_auction_time {
    return Intl.message(
      'Set Auction Time',
      name: 'set_auction_time',
      desc: '',
      args: [],
    );
  }

  /// `Time can be set max 5 days and min can be set to 1 day`
  String get set_auction_max_and_min_day {
    return Intl.message(
      'Time can be set max 5 days and min can be set to 1 day',
      name: 'set_auction_max_and_min_day',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Minute`
  String get minute {
    return Intl.message(
      'Minute',
      name: 'minute',
      desc: '',
      args: [],
    );
  }

  /// `Realase Auction`
  String get realase_auction {
    return Intl.message(
      'Realase Auction',
      name: 'realase_auction',
      desc: '',
      args: [],
    );
  }

  /// `You mark this car as P&E`
  String get you_mark_this_car_as_pande {
    return Intl.message(
      'You mark this car as P&E',
      name: 'you_mark_this_car_as_pande',
      desc: '',
      args: [],
    );
  }

  /// `You are adding this car to the archive`
  String get you_adding_car_in_archive {
    return Intl.message(
      'You are adding this car to the archive',
      name: 'you_adding_car_in_archive',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get no_data {
    return Intl.message(
      'No data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle Type`
  String get vehicle_type {
    return Intl.message(
      'Vehicle Type',
      name: 'vehicle_type',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get new_car {
    return Intl.message(
      'New',
      name: 'new_car',
      desc: '',
      args: [],
    );
  }

  /// `Used`
  String get used_car {
    return Intl.message(
      'Used',
      name: 'used_car',
      desc: '',
      args: [],
    );
  }

  /// `Manually add`
  String get manually_add {
    return Intl.message(
      'Manually add',
      name: 'manually_add',
      desc: '',
      args: [],
    );
  }

  /// `Scan License`
  String get scan_license {
    return Intl.message(
      'Scan License',
      name: 'scan_license',
      desc: '',
      args: [],
    );
  }

  /// `Scan Card`
  String get scan_card {
    return Intl.message(
      'Scan Card',
      name: 'scan_card',
      desc: '',
      args: [],
    );
  }

  /// `Loading Camera...`
  String get loading_camera {
    return Intl.message(
      'Loading Camera...',
      name: 'loading_camera',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get duration {
    return Intl.message(
      'Duration',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Duration KM`
  String get duratin_km {
    return Intl.message(
      'Duration KM',
      name: 'duratin_km',
      desc: '',
      args: [],
    );
  }

  /// `Car Type`
  String get carType {
    return Intl.message(
      'Car Type',
      name: 'carType',
      desc: '',
      args: [],
    );
  }

  /// `Car type should be selected`
  String get carTypeError {
    return Intl.message(
      'Car type should be selected',
      name: 'carTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Signature`
  String get signature {
    return Intl.message(
      'Signature',
      name: 'signature',
      desc: '',
      args: [],
    );
  }

  /// `Signature is required`
  String get signatureError {
    return Intl.message(
      'Signature is required',
      name: 'signatureError',
      desc: '',
      args: [],
    );
  }

  /// `Archive`
  String get archive {
    return Intl.message(
      'Archive',
      name: 'archive',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Send PDF`
  String get send_pdf {
    return Intl.message(
      'Send PDF',
      name: 'send_pdf',
      desc: '',
      args: [],
    );
  }

  /// `PDF sent successfully`
  String get pdf_success {
    return Intl.message(
      'PDF sent successfully',
      name: 'pdf_success',
      desc: '',
      args: [],
    );
  }

  /// `Handover Date`
  String get handover_date {
    return Intl.message(
      'Handover Date',
      name: 'handover_date',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get return_date {
    return Intl.message(
      'Return Date',
      name: 'return_date',
      desc: '',
      args: [],
    );
  }

  /// `Edit Employee`
  String get edit_employee {
    return Intl.message(
      'Edit Employee',
      name: 'edit_employee',
      desc: '',
      args: [],
    );
  }

  /// `Edit Right`
  String get edit_right {
    return Intl.message(
      'Edit Right',
      name: 'edit_right',
      desc: '',
      args: [],
    );
  }

  /// `Edit Licence Plate`
  String get edit_licence_plate {
    return Intl.message(
      'Edit Licence Plate',
      name: 'edit_licence_plate',
      desc: '',
      args: [],
    );
  }

  /// `Edit Customer`
  String get edit_customer {
    return Intl.message(
      'Edit Customer',
      name: 'edit_customer',
      desc: '',
      args: [],
    );
  }

  /// `Edit Damage`
  String get edit_damage {
    return Intl.message(
      'Edit Damage',
      name: 'edit_damage',
      desc: '',
      args: [],
    );
  }

  /// `Create Drive Form`
  String get create_drive_form {
    return Intl.message(
      'Create Drive Form',
      name: 'create_drive_form',
      desc: '',
      args: [],
    );
  }

  /// `Edit Drive Form`
  String get edit_drive_form {
    return Intl.message(
      'Edit Drive Form',
      name: 'edit_drive_form',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password`
  String get login_error {
    return Intl.message(
      'Incorrect email or password',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Create Maintenance Cost`
  String get create_maintenance_cost {
    return Intl.message(
      'Create Maintenance Cost',
      name: 'create_maintenance_cost',
      desc: '',
      args: [],
    );
  }

  /// `Edit Maintenance Cost`
  String get edit_maintenance_cost {
    return Intl.message(
      'Edit Maintenance Cost',
      name: 'edit_maintenance_cost',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Cost`
  String get maintenance_cost {
    return Intl.message(
      'Maintenance Cost',
      name: 'maintenance_cost',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance Costs`
  String get maintenance_costs {
    return Intl.message(
      'Maintenance Costs',
      name: 'maintenance_costs',
      desc: '',
      args: [],
    );
  }

  /// `Binds`
  String get binds {
    return Intl.message(
      'Binds',
      name: 'binds',
      desc: '',
      args: [],
    );
  }

  /// `Current Price`
  String get current_price {
    return Intl.message(
      'Current Price',
      name: 'current_price',
      desc: '',
      args: [],
    );
  }

  /// `Insert Price`
  String get insert_price {
    return Intl.message(
      'Insert Price',
      name: 'insert_price',
      desc: '',
      args: [],
    );
  }

  /// `Close Deal`
  String get close_deal {
    return Intl.message(
      'Close Deal',
      name: 'close_deal',
      desc: '',
      args: [],
    );
  }

  /// `Extend Auction Time`
  String get extend_auction_time {
    return Intl.message(
      'Extend Auction Time',
      name: 'extend_auction_time',
      desc: '',
      args: [],
    );
  }

  /// `Damages`
  String get damages {
    return Intl.message(
      'Damages',
      name: 'damages',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle already in use`
  String get vehicle_already_in_use {
    return Intl.message(
      'Vehicle already in use',
      name: 'vehicle_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Drive Archive`
  String get drive_archive {
    return Intl.message(
      'Drive Archive',
      name: 'drive_archive',
      desc: '',
      args: [],
    );
  }

  /// `Drive Archive Form`
  String get drive_archive_form {
    return Intl.message(
      'Drive Archive Form',
      name: 'drive_archive_form',
      desc: '',
      args: [],
    );
  }

  /// `Select a damage area`
  String get select_damage {
    return Intl.message(
      'Select a damage area',
      name: 'select_damage',
      desc: '',
      args: [],
    );
  }

  /// `Roof`
  String get roof {
    return Intl.message(
      'Roof',
      name: 'roof',
      desc: '',
      args: [],
    );
  }

  /// `Rear Bumper Right`
  String get rearBumperRight {
    return Intl.message(
      'Rear Bumper Right',
      name: 'rearBumperRight',
      desc: '',
      args: [],
    );
  }

  /// `Rear Bumper Center`
  String get rearBumperCenter {
    return Intl.message(
      'Rear Bumper Center',
      name: 'rearBumperCenter',
      desc: '',
      args: [],
    );
  }

  /// `Rear Bumper Left`
  String get rearBumperLeft {
    return Intl.message(
      'Rear Bumper Left',
      name: 'rearBumperLeft',
      desc: '',
      args: [],
    );
  }

  /// `Front Bumper Right`
  String get frontBumperRight {
    return Intl.message(
      'Front Bumper Right',
      name: 'frontBumperRight',
      desc: '',
      args: [],
    );
  }

  /// `Front Bumper Center`
  String get frontBumperCenter {
    return Intl.message(
      'Front Bumper Center',
      name: 'frontBumperCenter',
      desc: '',
      args: [],
    );
  }

  /// `Front Bumper Left`
  String get frontBumperLeft {
    return Intl.message(
      'Front Bumper Left',
      name: 'frontBumperLeft',
      desc: '',
      args: [],
    );
  }

  /// `Hood`
  String get hood {
    return Intl.message(
      'Hood',
      name: 'hood',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Front Left`
  String get wheelFrontLeft {
    return Intl.message(
      'Wheel Front Left',
      name: 'wheelFrontLeft',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Front Right`
  String get wheelFrontRight {
    return Intl.message(
      'Wheel Front Right',
      name: 'wheelFrontRight',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Rear Left`
  String get wheelRearLeft {
    return Intl.message(
      'Wheel Rear Left',
      name: 'wheelRearLeft',
      desc: '',
      args: [],
    );
  }

  /// `Wheel Rear Right`
  String get wheelRearRight {
    return Intl.message(
      'Wheel Rear Right',
      name: 'wheelRearRight',
      desc: '',
      args: [],
    );
  }

  /// `Door Front Left`
  String get doorFrontLeft {
    return Intl.message(
      'Door Front Left',
      name: 'doorFrontLeft',
      desc: '',
      args: [],
    );
  }

  /// `Door Rear Left`
  String get doorReaerLeft {
    return Intl.message(
      'Door Rear Left',
      name: 'doorReaerLeft',
      desc: '',
      args: [],
    );
  }

  /// `Door Front Right`
  String get doorFrontRight {
    return Intl.message(
      'Door Front Right',
      name: 'doorFrontRight',
      desc: '',
      args: [],
    );
  }

  /// `Door Rear Right`
  String get doorReaerRight {
    return Intl.message(
      'Door Rear Right',
      name: 'doorReaerRight',
      desc: '',
      args: [],
    );
  }

  /// `Windscreen`
  String get windscreen {
    return Intl.message(
      'Windscreen',
      name: 'windscreen',
      desc: '',
      args: [],
    );
  }

  /// `Front Interior`
  String get frontInterior {
    return Intl.message(
      'Front Interior',
      name: 'frontInterior',
      desc: '',
      args: [],
    );
  }

  /// `Rear Interior`
  String get rearInterior {
    return Intl.message(
      'Rear Interior',
      name: 'rearInterior',
      desc: '',
      args: [],
    );
  }

  /// `TEST LOCAL`
  String get test_local {
    return Intl.message(
      'TEST LOCAL',
      name: 'test_local',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delete`
  String get confirmDelete {
    return Intl.message(
      'Confirm Delete',
      name: 'confirmDelete',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password to confirm account deletion`
  String get confirmDeleteDescription {
    return Intl.message(
      'Please enter your password to confirm account deletion',
      name: 'confirmDeleteDescription',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `This car has already been sent to auction.`
  String get this_car_has_already_been_sent__auction {
    return Intl.message(
      'This car has already been sent to auction.',
      name: 'this_car_has_already_been_sent__auction',
      desc: '',
      args: [],
    );
  }

  /// `Release Auction`
  String get release_auction {
    return Intl.message(
      'Release Auction',
      name: 'release_auction',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
