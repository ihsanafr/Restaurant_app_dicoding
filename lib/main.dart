import 'package:flutter/material.dart';
import 'static/route_navigation_state.dart';
import 'data/local/notification_service.dart';
import 'package:restaurant_app/restaurant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final notificationAppLaunchDetail =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  var route = NavigationRoute.mainRoute.name;
  String? payload;
  if (notificationAppLaunchDetail?.didNotificationLaunchApp ?? false) {
    payload = notificationAppLaunchDetail?.notificationResponse?.payload;
    route = NavigationRoute.detailRoute.name;
  }
  runApp(RestaurantApp(
    initialRoute: route,
    payload: payload,
  ));
}
