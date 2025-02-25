import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/local/notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationProvider extends ChangeNotifier {
  
  final LocalNotificationService localNotificationService;

  LocalNotificationProvider(this.localNotificationService);

  var _notificationPermission = false;
  var _notificationId = 0;
  get notificationPermission => _notificationPermission;

  var pendingNotificationRequests = <PendingNotificationRequest>[];

  Future requestPermissions() async {
    _notificationPermission =
        await localNotificationService.requestPermissions();
    notifyListeners();
  }

  Future scheduleDailyElevenAMNotification() async {
    _notificationId = DateTime.now().millisecondsSinceEpoch.hashCode;
    await localNotificationService.scheduleDailyElevenAMNotification(
      id: _notificationId,
      title: 'Daily Lunch Reminder',
      body: "It's time for lunch",
      payload: '',
    );
  }

  checkPendingNotificationsRequests() async {
    pendingNotificationRequests =
        await localNotificationService.pendingNotificationRequests();
    notifyListeners();
  }

  Future cancelAllNotifications() async =>
      await localNotificationService.cancelAllNotifications();
}
