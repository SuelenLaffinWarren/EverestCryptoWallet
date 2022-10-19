import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// The coin
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get crypto;

  /// Total coin value
  ///
  /// In en, this message translates to:
  /// **'Total coin value'**
  String get totalCoinValue;

  /// Bottom navigation bar item
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// Bottom navigation bar item
  ///
  /// In en, this message translates to:
  /// **'Movimentations'**
  String get movimentations;

  /// Details page app bar
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// List tile details page item 1
  ///
  /// In en, this message translates to:
  /// **'Current price'**
  String get currentPrice;

  /// List tile details page item 2
  ///
  /// In en, this message translates to:
  /// **'24h variation'**
  String get twentyFourHVariation;

  /// List tile details page item 3
  ///
  /// In en, this message translates to:
  /// **'The amount'**
  String get theAmount;

  /// List tile details page item 4
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// Details page button
  ///
  /// In en, this message translates to:
  /// **'Convert currency'**
  String get convertCurrency;

  /// Convert page app bar
  ///
  /// In en, this message translates to:
  /// **'To Convert'**
  String get toConvert;

  /// Convert page info top
  ///
  /// In en, this message translates to:
  /// **'Balance available'**
  String get balanceAvailable;

  /// Convert page question
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get howLikeConvert;

  /// Convert page bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Estimated total'**
  String get estimatedTotal;

  /// Review page app bar
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// Review page question
  ///
  /// In en, this message translates to:
  /// **'Review your conversion data'**
  String get reviewQuestion;

  /// Review page list tile item 1
  ///
  /// In en, this message translates to:
  /// **'To receive'**
  String get toReceive;

  /// Review page list tile item 2
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// Review page button
  ///
  /// In en, this message translates to:
  /// **'Complete conversion'**
  String get completeConversion;

  /// Success page text 1
  ///
  /// In en, this message translates to:
  /// **'Conversion performed'**
  String get conversionPerformed;

  /// Success page text 2
  ///
  /// In en, this message translates to:
  /// **'Complete currency conversion successful'**
  String get currencyConversionSuccessful;

  /// Movimentations page proof movements
  ///
  /// In en, this message translates to:
  /// **'Proof'**
  String get proof;

  /// Movimentations page proof movements list item 1
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Movimentations page proof movements list item 2
  ///
  /// In en, this message translates to:
  /// **'Movement quantity'**
  String get movementQuantity;

  /// Conversion page balance unavailable
  ///
  /// In en, this message translates to:
  /// **'Balance unavailable'**
  String get balanceUnavailable;

  /// Conversion page balance unavailable
  ///
  /// In en, this message translates to:
  /// **'Invalid value'**
  String get invalidValue;

  /// Conversion page alertDialog
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Conversion page alertDialog
  ///
  /// In en, this message translates to:
  /// **'The value field is empty!'**
  String get valueFieldEmpty;

  /// Movimentations page empty
  ///
  /// In en, this message translates to:
  /// **'There are no movements'**
  String get noMovimentations;

  /// Date format
  ///
  /// In en, this message translates to:
  /// **'MM/dd/yyyy'**
  String get dateFormat;

  /// locale in numer format
  ///
  /// In en, this message translates to:
  /// **'en-US'**
  String get locale;

  /// coin locale from api
  ///
  /// In en, this message translates to:
  /// **'usd'**
  String get coinLocale;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
