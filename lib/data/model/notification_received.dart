class ReceivedNotification {
  final int? id;
  final String? body;
  final String? title;
  final String? payload;

  ReceivedNotification({
    this.id,
    this.body,
    this.title,
    required this.payload,
  });
}
