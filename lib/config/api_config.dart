/// Compile-time API settings.
///
/// [baseUrl] is read with [String.fromEnvironment], so the value is fixed
/// when the app is compiled. Hot reload and hot restart do not pick up a new
/// `--dart-define`. Change the URL, then rebuild (`flutter run` or
/// `flutter build`).
///
/// Default (no flag):
///   flutter run
///
/// Override:
///   flutter run --dart-define=API_BASE_URL=https://biztraqonline.com
class ApiConfig {
  const ApiConfig._();

  static const defaultBaseUrl = 'https://biztraqonline.com';

  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: defaultBaseUrl,
  );
}
