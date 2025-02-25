import 'package:flutter/widgets.dart';
import 'package:restaurant_app/static/theme_state.dart';
import 'package:restaurant_app/data/local/shared_preferences_service.dart';

class SharedPreferenceProvider extends ChangeNotifier {
  final SharedPreferencesService _service;

  SharedPreferenceProvider(this._service);

  var _message = '';
  get message => _message;

  var _themeMode = ThemeState.system.name;
  get themeMode => _themeMode;

  var _lunchNotification = false;
  get lunchNotification => _lunchNotification;

  Future saveThemeMode(theme) async {
    try {
      await _service.saveThemeMode(theme);
      _themeMode = theme;
      _message = 'Theme mode has been changed to $_themeMode theme';
    } catch (e) {
      _message = 'Failed to change theme mode';
    }
    notifyListeners();
  }

  Future saveLunchNotification(notification) async {
    try {
      await _service.saveLunchNotification(notification);
      _lunchNotification = notification;
      if (notification) {
        _message = 'notification reminder has been enabled';
      } else {
        _message = 'notification reminder has been disabled';
      }
    } catch (e) {
      _message = 'Failed to enable notification';
    }
    notifyListeners();
  }

  getThemeValue() {
    try {
      _message = '';
      _themeMode = _service.getThemeMode();
    } catch (e) {
      _message = 'Failed to get theme value';
    }
    notifyListeners();
  }

  getLunchNotificationValue() {
    try {
      _message = '';
      _lunchNotification = _service.getLunchNotification();
    } catch (e) {
      _message = 'Failed to get notification value';
    }
    notifyListeners();
  }
}
