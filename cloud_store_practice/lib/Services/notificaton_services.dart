import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
 static Future<void> initialize()async{
    FirebaseMessaging messaging=FirebaseMessaging.instance;
    NotificationSettings settings=await messaging.requestPermission();
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      print("Notifications are enabled!!!");
    }
  }
}