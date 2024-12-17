import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'core_localizations_en.dart';
import 'core_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CoreLocalizations
/// returned by `CoreLocalizations.of(context)`.
///
/// Applications need to include `CoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CoreLocalizations.localizationsDelegates,
///   supportedLocales: CoreLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CoreLocalizations.supportedLocales
/// property.
abstract class CoreLocalizations {
  CoreLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CoreLocalizations? of(BuildContext context) {
    return Localizations.of<CoreLocalizations>(context, CoreLocalizations);
  }

  static const LocalizationsDelegate<CoreLocalizations> delegate =
      _CoreLocalizationsDelegate();

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

  /// No description provided for @noInternet.
  ///
  /// In vi, this message translates to:
  /// **'Kết nối thất bại.\nVui lòng kiểm tra lại kết nối và thử lại'**
  String get noInternet;

  /// No description provided for @technicalIssues.
  ///
  /// In vi, this message translates to:
  /// **'Oops! .Đã có sự cố xảy ra.\nVui lòng kiểm tra lại kết nối hoặc thử lại sau'**
  String get technicalIssues;

  /// No description provided for @requestRestricted.
  ///
  /// In vi, this message translates to:
  /// **'Gửi yêu cầu quá nhiều lần\\nVui lòng chờ trong giây lát để thử lại'**
  String get requestRestricted;

  /// No description provided for @serverMaintenance.
  ///
  /// In vi, this message translates to:
  /// **'Server đang bảo trì. Vui lòng thử lại sau.'**
  String get serverMaintenance;

  /// No description provided for @connectionTimeout.
  ///
  /// In vi, this message translates to:
  /// **'Kết nối quá hạn.'**
  String get connectionTimeout;

  /// No description provided for @unknownError.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi.\nVui lòng thử lại sau'**
  String get unknownError;

  /// No description provided for @sessionExpired.
  ///
  /// In vi, this message translates to:
  /// **'Phiên bản quá hạn. Vui lòng đăng nhập lại!'**
  String get sessionExpired;

  /// No description provided for @loading.
  ///
  /// In vi, this message translates to:
  /// **'Đang tải'**
  String get loading;

  /// No description provided for @male.
  ///
  /// In vi, this message translates to:
  /// **'Nam'**
  String get male;

  /// No description provided for @female.
  ///
  /// In vi, this message translates to:
  /// **'Nữ'**
  String get female;

  /// No description provided for @pleaseEnableGPS.
  ///
  /// In vi, this message translates to:
  /// **'Vui lòng bật định vị để tiếp tục trải nghiệm'**
  String get pleaseEnableGPS;

  /// No description provided for @avatar.
  ///
  /// In vi, this message translates to:
  /// **'Hình đại diện'**
  String get avatar;

  /// No description provided for @camera.
  ///
  /// In vi, this message translates to:
  /// **'Máy Ảnh'**
  String get camera;

  /// No description provided for @choosePhoto.
  ///
  /// In vi, this message translates to:
  /// **'Chọn ảnh'**
  String get choosePhoto;

  /// No description provided for @choosePhotoOrVideo.
  ///
  /// In vi, this message translates to:
  /// **'Chọn ảnh hoặc video'**
  String get choosePhotoOrVideo;

  /// No description provided for @chooseVideo.
  ///
  /// In vi, this message translates to:
  /// **'Chọn video'**
  String get chooseVideo;

  /// No description provided for @close.
  ///
  /// In vi, this message translates to:
  /// **'Đóng'**
  String get close;

  /// No description provided for @error.
  ///
  /// In vi, this message translates to:
  /// **'Lỗi'**
  String get error;

  /// No description provided for @gallery.
  ///
  /// In vi, this message translates to:
  /// **'Thư Viện'**
  String get gallery;

  /// No description provided for @orderByAsc.
  ///
  /// In vi, this message translates to:
  /// **'Giá Thấp'**
  String get orderByAsc;

  /// No description provided for @orderByDesc.
  ///
  /// In vi, this message translates to:
  /// **'Giá Cao'**
  String get orderByDesc;

  /// No description provided for @search.
  ///
  /// In vi, this message translates to:
  /// **'Tìm Kiếm'**
  String get search;

  /// No description provided for @selectPhoto.
  ///
  /// In vi, this message translates to:
  /// **'Chọn hình'**
  String get selectPhoto;

  /// No description provided for @takePhoto.
  ///
  /// In vi, this message translates to:
  /// **'Chụp hình'**
  String get takePhoto;

  /// No description provided for @warning.
  ///
  /// In vi, this message translates to:
  /// **'Chú Ý'**
  String get warning;

  /// No description provided for @haveNoPermission.
  ///
  /// In vi, this message translates to:
  /// **'Không có quyền truy cập. Vui lòng vào cài đặt và cấp quyền cho ứng dụng để tiếp tục'**
  String get haveNoPermission;

  /// No description provided for @openSetting.
  ///
  /// In vi, this message translates to:
  /// **'Mở Cài Đặt'**
  String get openSetting;

  /// No description provided for @openInExternalBrowser.
  ///
  /// In vi, this message translates to:
  /// **'Mở bằng trình duyệt'**
  String get openInExternalBrowser;

  /// No description provided for @copyLink.
  ///
  /// In vi, this message translates to:
  /// **'Sao chép đường dẫn'**
  String get copyLink;

  /// No description provided for @copied.
  ///
  /// In vi, this message translates to:
  /// **'Đã sao chép'**
  String get copied;

  /// No description provided for @featureUnderDevelopment.
  ///
  /// In vi, this message translates to:
  /// **'Tính năng đang được phát triển'**
  String get featureUnderDevelopment;

  /// No description provided for @termAndCondition.
  ///
  /// In vi, this message translates to:
  /// **'Terms and Conditions'**
  String get termAndCondition;

  /// No description provided for @privacyPolicy.
  ///
  /// In vi, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @requestPermission.
  ///
  /// In vi, this message translates to:
  /// **'Yêu cầu cấp quyền'**
  String get requestPermission;

  /// No description provided for @firebaseAuthExceptionTypeAccountExistsWithDifferentCredential.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi khi đăng nhập.'**
  String get firebaseAuthExceptionTypeAccountExistsWithDifferentCredential;

  /// No description provided for @firebaseAuthExceptionTypeInvalidCredential.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi khi đăng nhập.'**
  String get firebaseAuthExceptionTypeInvalidCredential;

  /// No description provided for @firebaseAuthExceptionTypeOperationNotAllowed.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi khi đăng nhập.'**
  String get firebaseAuthExceptionTypeOperationNotAllowed;

  /// No description provided for @firebaseAuthExceptionTypeUserDisabled.
  ///
  /// In vi, this message translates to:
  /// **'Người dùng liên kết với thông tin này đã bị vô hiệu hóa.'**
  String get firebaseAuthExceptionTypeUserDisabled;

  /// No description provided for @firebaseAuthExceptionTypeUserNotFound.
  ///
  /// In vi, this message translates to:
  /// **'Người dùng không tồn tại. Vui lòng kiểm tra thông tin đăng nhập và thử lại.'**
  String get firebaseAuthExceptionTypeUserNotFound;

  /// No description provided for @firebaseAuthExceptionTypeInvalidVerificationCode.
  ///
  /// In vi, this message translates to:
  /// **'Mã xác minh không hợp lệ.'**
  String get firebaseAuthExceptionTypeInvalidVerificationCode;

  /// No description provided for @firebaseAuthExceptionTypeInvalidVerificationId.
  ///
  /// In vi, this message translates to:
  /// **'ID xác minh không hợp lệ.'**
  String get firebaseAuthExceptionTypeInvalidVerificationId;

  /// No description provided for @firebaseAuthExceptionTypeWrongPassword.
  ///
  /// In vi, this message translates to:
  /// **'Sai mật khẩu. Vui lòng kiểm tra thông tin đăng nhập và thử lại.'**
  String get firebaseAuthExceptionTypeWrongPassword;

  /// No description provided for @firebaseAuthExceptionTypeUnknown.
  ///
  /// In vi, this message translates to:
  /// **'Đã xảy ra lỗi khi đăng nhập.'**
  String get firebaseAuthExceptionTypeUnknown;

  /// No description provided for @firebaseAuthExceptionSessionExpired.
  ///
  /// In vi, this message translates to:
  /// **'Mã OTP đã hết hạn. Vui lòng gửi lại OTP mới để thử lại.'**
  String get firebaseAuthExceptionSessionExpired;

  /// No description provided for @today.
  ///
  /// In vi, this message translates to:
  /// **'Hôm nay'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In vi, this message translates to:
  /// **'Hôm qua'**
  String get yesterday;

  /// No description provided for @thisWeek.
  ///
  /// In vi, this message translates to:
  /// **'Tuần này'**
  String get thisWeek;

  /// No description provided for @weekAgo.
  ///
  /// In vi, this message translates to:
  /// **'Tuần trước'**
  String get weekAgo;

  /// No description provided for @thisMonth.
  ///
  /// In vi, this message translates to:
  /// **'Tháng này'**
  String get thisMonth;

  /// No description provided for @monthAgo.
  ///
  /// In vi, this message translates to:
  /// **'Tháng trước'**
  String get monthAgo;

  /// No description provided for @selectDate.
  ///
  /// In vi, this message translates to:
  /// **'Chọn ngày'**
  String get selectDate;

  /// No description provided for @fromDate.
  ///
  /// In vi, this message translates to:
  /// **'Từ ngày'**
  String get fromDate;

  /// No description provided for @toDate.
  ///
  /// In vi, this message translates to:
  /// **'Đến ngày'**
  String get toDate;

  /// No description provided for @month.
  ///
  /// In vi, this message translates to:
  /// **'Tháng'**
  String get month;

  /// No description provided for @threeDaysAgo.
  ///
  /// In vi, this message translates to:
  /// **'3 ngày trước'**
  String get threeDaysAgo;

  /// No description provided for @sevenDaysAgo.
  ///
  /// In vi, this message translates to:
  /// **'7 ngày trước'**
  String get sevenDaysAgo;

  /// No description provided for @thirtyDaysAgo.
  ///
  /// In vi, this message translates to:
  /// **'30 ngày trước'**
  String get thirtyDaysAgo;

  /// No description provided for @thisQuarter.
  ///
  /// In vi, this message translates to:
  /// **'Quý này'**
  String get thisQuarter;

  /// No description provided for @quarterAgo.
  ///
  /// In vi, this message translates to:
  /// **'Quý trước'**
  String get quarterAgo;

  /// No description provided for @thisYear.
  ///
  /// In vi, this message translates to:
  /// **'Năm này'**
  String get thisYear;

  /// No description provided for @yearAgo.
  ///
  /// In vi, this message translates to:
  /// **'Năm trước'**
  String get yearAgo;

  /// No description provided for @selectTimePeriod.
  ///
  /// In vi, this message translates to:
  /// **'Chọn khoảng thời gian'**
  String get selectTimePeriod;

  /// No description provided for @reset.
  ///
  /// In vi, this message translates to:
  /// **'Đặt lại'**
  String get reset;

  /// No description provided for @apply.
  ///
  /// In vi, this message translates to:
  /// **'Áp dụng'**
  String get apply;

  /// No description provided for @manual.
  ///
  /// In vi, this message translates to:
  /// **'Tuỳ chọn'**
  String get manual;

  /// No description provided for @day.
  ///
  /// In vi, this message translates to:
  /// **'Ngày'**
  String get day;

  /// No description provided for @viewMore.
  ///
  /// In vi, this message translates to:
  /// **'Xem thêm'**
  String get viewMore;

  /// No description provided for @seeLess.
  ///
  /// In vi, this message translates to:
  /// **'Thu gọn'**
  String get seeLess;

  /// No description provided for @fullTime.
  ///
  /// In vi, this message translates to:
  /// **'Toàn thời gian'**
  String get fullTime;
}

class _CoreLocalizationsDelegate
    extends LocalizationsDelegate<CoreLocalizations> {
  const _CoreLocalizationsDelegate();

  @override
  Future<CoreLocalizations> load(Locale locale) {
    return SynchronousFuture<CoreLocalizations>(
        lookupCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_CoreLocalizationsDelegate old) => false;
}

CoreLocalizations lookupCoreLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return CoreLocalizationsEn();
    case 'vi':
      return CoreLocalizationsVi();
  }

  throw FlutterError(
      'CoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
