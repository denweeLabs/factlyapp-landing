import 'package:factlyapp_landing/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

// Detect mobile browsers
bool isMobileWeb() {
  if (kIsWeb) {
    return [
      TargetPlatform.iOS,
      TargetPlatform.android,
    ].contains(defaultTargetPlatform);
  }

  return false;
}

// Detect desktop browsers
bool isDesktopWeb() {
  return kIsWeb && !isMobileWeb();
}

// Open email service
Future<bool> launchEmail({
  required List<String> to,
  String? subject,
  String? body,
}) async {
  final url = Uri(
    scheme: 'mailto',
    path: to.join(','),
    queryParameters: {
      if (subject != null && subject.isNotEmpty) 'subject': subject,
      if (body != null && body.isNotEmpty) 'body': body,
    },
  );
  return launchUrl(url);
}

Future<bool> launchSupportEmail() {
  return launchEmail(
    to: [AppConstants.supportEmail],
    subject: AppConstants.supportSubject,
  );
}
