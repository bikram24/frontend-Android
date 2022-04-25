import 'package:awesome_notifications/awesome_notifications.dart';

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(10000);
}

Future<void> createAddToCartNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: "basic_channel",
      title: "${Emojis.household_shopping_cart}  Product Added",
      body: "Your Products has been added to the cart!",
      notificationLayout: NotificationLayout.Default,
    ),
  );
}