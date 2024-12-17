import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @inform.
  ///
  /// In vi, this message translates to:
  /// **'Thông Báo'**
  String get inform;

  /// No description provided for @ok.
  ///
  /// In vi, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In vi, this message translates to:
  /// **'Hủy'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In vi, this message translates to:
  /// **'Xác Nhận'**
  String get confirm;

  /// No description provided for @ignore.
  ///
  /// In vi, this message translates to:
  /// **'Bỏ Qua'**
  String get ignore;

  /// No description provided for @sessionExpired.
  ///
  /// In vi, this message translates to:
  /// **'Phiên bản quá hạn. Vui lòng đăng nhập lại!'**
  String get sessionExpired;

  /// No description provided for @skip.
  ///
  /// In vi, this message translates to:
  /// **'Bỏ Qua'**
  String get skip;

  /// No description provided for @fullName.
  ///
  /// In vi, this message translates to:
  /// **'Họ và tên'**
  String get fullName;

  /// No description provided for @enterFullName.
  ///
  /// In vi, this message translates to:
  /// **'Nhập họ và tên'**
  String get enterFullName;

  /// No description provided for @email.
  ///
  /// In vi, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In vi, this message translates to:
  /// **'Nhập địa chỉ email'**
  String get enterEmail;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng nhập email'**
  String get pleaseEnterEmail;

  /// No description provided for @finish.
  ///
  /// In vi, this message translates to:
  /// **'Hoàn thành'**
  String get finish;

  /// No description provided for @appVersion.
  ///
  /// In vi, this message translates to:
  /// **'Phiên bản: %s'**
  String get appVersion;

  /// No description provided for @loginRequired.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng đăng nhập để tiếp tục'**
  String get loginRequired;

  /// No description provided for @login.
  ///
  /// In vi, this message translates to:
  /// **'Đăng Nhập'**
  String get login;

  /// No description provided for @homepage.
  ///
  /// In vi, this message translates to:
  /// **'Trang chủ'**
  String get homepage;

  /// No description provided for @accountPage.
  ///
  /// In vi, this message translates to:
  /// **'Tài khoản'**
  String get accountPage;

  /// No description provided for @forceUpdate.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng tải ngay phiên bản mới nhất %s'**
  String get forceUpdate;

  /// No description provided for @update.
  ///
  /// In vi, this message translates to:
  /// **'Cập Nhật'**
  String get update;

  /// No description provided for @close.
  ///
  /// In vi, this message translates to:
  /// **'Đóng'**
  String get close;

  /// No description provided for @createForm.
  ///
  /// In vi, this message translates to:
  /// **'Tạo biểu mẫu'**
  String get createForm;

  /// No description provided for @formListing.
  ///
  /// In vi, this message translates to:
  /// **'Danh sách biểu mẫu'**
  String get formListing;

  /// No description provided for @save.
  ///
  /// In vi, this message translates to:
  /// **'Lưu'**
  String get save;

  /// No description provided for @discardFormConfirmMsg.
  ///
  /// In vi, this message translates to:
  /// **'Biểu mẩu chưa được lưu, bạn có chắc chăn muốn thoát'**
  String get discardFormConfirmMsg;

  /// No description provided for @mulitpleChoice.
  ///
  /// In vi, this message translates to:
  /// **'Chọn nhiều'**
  String get mulitpleChoice;

  /// No description provided for @paragraph.
  ///
  /// In vi, this message translates to:
  /// **'Đoạn văn'**
  String get paragraph;

  /// No description provided for @question.
  ///
  /// In vi, this message translates to:
  /// **'Câu hỏi'**
  String get question;

  /// No description provided for @addQuestion.
  ///
  /// In vi, this message translates to:
  /// **'Thêm câu hỏi'**
  String get addQuestion;

  /// No description provided for @inputQuestion.
  ///
  /// In vi, this message translates to:
  /// **'Nhập câu hỏi'**
  String get inputQuestion;

  /// No description provided for @longAnswerText.
  ///
  /// In vi, this message translates to:
  /// **'Văn bản trả lời'**
  String get longAnswerText;

  /// No description provided for @or.
  ///
  /// In vi, this message translates to:
  /// **'hoặc'**
  String get or;

  /// No description provided for @option.
  ///
  /// In vi, this message translates to:
  /// **'Tuỳ chọn'**
  String get option;

  /// No description provided for @addOption.
  ///
  /// In vi, this message translates to:
  /// **'Thêm tuỳ chọn'**
  String get addOption;

  /// No description provided for @add.
  ///
  /// In vi, this message translates to:
  /// **'thêm'**
  String get add;

  /// No description provided for @other.
  ///
  /// In vi, this message translates to:
  /// **'khác'**
  String get other;

  /// No description provided for @required.
  ///
  /// In vi, this message translates to:
  /// **'Bắt buộc'**
  String get required;

  /// No description provided for @untitledForm.
  ///
  /// In vi, this message translates to:
  /// **'Chưa đặt tên'**
  String get untitledForm;

  /// No description provided for @questions.
  ///
  /// In vi, this message translates to:
  /// **'Câu hỏi'**
  String get questions;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
