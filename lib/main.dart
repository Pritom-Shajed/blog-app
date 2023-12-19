import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background/flutter_background.dart';
//import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_app/ui/app/my_app/my_app_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:rxdart/rxdart.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/note_model.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
BehaviorSubject<String>();



NotificationAppLaunchDetails? notificationAppLaunchDetails;


void main()  async{
  runApp(MyAppPage());
}



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
  await Firebase.initializeApp();
  var _currentUuid =  Uuid().v4();
  var params = <String, dynamic>{
    'id': _currentUuid,
    'nameCaller': 'XYZ',
    'appName': 'my_app',
    'avatar': '',
    'handle': '01234567890911',
    'type': 0,
    'textAccept': 'Accept',
    'textDecline': 'Decline',
    'textMissedCall': 'Missed call',
    'textCallback': 'Call back',
    'duration': 30000,
    'extra': <String, dynamic>{'userId': '1a2b3c4d'},
    'headers': <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
    'android': <String, dynamic>{
      'isCustomNotification': false,
      'isShowLogo': false,
      'isShowCallback': false,
      'isShowMissedCallNotification': true,
      'ringtonePath': 'system_ringtone_default',
      'backgroundColor': '#0099FF',
      'backgroundUrl': '',
      'actionColor': '#4CAF50'
    },
    'ios': <String, dynamic>{
      'iconName': 'CallKitLogo',
      'handleType': 'generic',
      'supportsVideo': true,
      'maximumCallGroups': 2,
      'maximumCallsPerCallGroup': 1,
      'audioSessionMode': 'default',
      'audioSessionActive': true,
      'audioSessionPreferredSampleRate': 44100.0,
      'audioSessionPreferredIOBufferDuration': 0.005,
      'supportsDTMF': true,
      'supportsHolding': true,
      'supportsGrouping': false,
      'supportsUngrouping': false,
      'ringtonePath': 'system_ringtone_default'
    }
  };
  //await FlutterCallkitIncoming.showCallkitIncoming(params);
}


Future<void> setPushNotification() async {

  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "flutter_background example app",
    notificationText: "Background notification for keeping the example app running in the background",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(name: 'background_icon', defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );

  await Firebase.initializeApp();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );


  firebaseMessaging.getToken().then((String? token) async {
    assert(token != null);
    print("Push Messaging token: $token");
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.notification?.title}');
    print('Message data: ${message.notification?.body}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }

    if (message.notification != null) {
      String body = message.notification!.body??'';
      String title = message.notification!.title??'';

      var _currentUuid =  Uuid().v4();
      var params = <String, dynamic>{
        'id': _currentUuid,
        'nameCaller': 'XYZ',
        'appName': 'my_app',
        'avatar': '',
        'handle': '01234567890911',
        'type': 0,
        'textAccept': 'Accept',
        'textDecline': 'Decline',
        'textMissedCall': 'Missed call',
        'textCallback': 'Call back',
        'duration': 30000,
        'extra': <String, dynamic>{'userId': '1a2b3c4d'},
        'headers': <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
        'android': <String, dynamic>{
          'isCustomNotification': false,
          'isShowLogo': false,
          'isShowCallback': false,
          'isShowMissedCallNotification': true,
          'ringtonePath': 'system_ringtone_default',
          'backgroundColor': '#0099FF',
          'backgroundUrl': '',
          'actionColor': '#4CAF50'
        },
        'ios': <String, dynamic>{
          'iconName': 'CallKitLogo',
          'handleType': 'generic',
          'supportsVideo': true,
          'maximumCallGroups': 2,
          'maximumCallsPerCallGroup': 1,
          'audioSessionMode': 'default',
          'audioSessionActive': true,
          'audioSessionPreferredSampleRate': 44100.0,
          'audioSessionPreferredIOBufferDuration': 0.005,
          'supportsDTMF': true,
          'supportsHolding': true,
          'supportsGrouping': false,
          'supportsUngrouping': false,
          'ringtonePath': 'system_ringtone_default'
        }
      };
      //await FlutterCallkitIncoming.showCallkitIncoming(params);
    }
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


}

class PushNotificationResp {
  late String sessionName = '';
  late String sessionId = '';
  //String userName = "";

  PushNotificationResp({required this.sessionName, required this.sessionId});

  PushNotificationResp.fromJson(Map<String, dynamic> json) {
    sessionName = json['sessionName'];
    sessionId = json['sessionId'];
    //userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sessionName'] = this.sessionName;
    data['sessionId'] = this.sessionId;
    //data['userName'] = this.userName;
    return data;
  }
}

class ReceivedNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });
}
