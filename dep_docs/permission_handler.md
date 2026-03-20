# permission_handler

On most operating systems, permissions aren't just granted to apps at install time.
Rather, developers have to ask the user for permission while the app is running.

This plugin provides a cross-platform (iOS, Android) API to request permissions and check their status.
You can also open the device's app settings so users can grant permission.  
On Android, you can show a rationale for requesting permission.

See the [FAQ](#faq) section for more information on common questions when using the permission_handler plugin.

## Setup

While the permissions are being requested during runtime, you'll still need to tell the OS which permissions your app might potentially use. That requires adding permission configuration to Android* and iOS-specific files.

<details>
<summary>Android (click to expand)</summary>
  
**Upgrade pre-1.12 Android projects**
  
Since version 4.4.0 this plugin is implemented using the Flutter 1.12 Android plugin APIs. Unfortunately, this means App developers also need to migrate their Apps to support the new Android infrastructure. You can do so by following the [Upgrading pre 1.12 Android projects](https://github.com/flutter/flutter/wiki/Upgrading-pre-1.12-Android-projects) migration guide. Failing to do so might result in unexpected behavior. The most common known error is the permission_handler not returning after calling the `.request()` method on permission.

**AndroidX**

As of version 3.1.0, the <kbd>permission_handler</kbd> plugin switched to the AndroidX version of the Android Support Libraries. This means you need to make sure your Android project is also upgraded to support AndroidX. Detailed instructions can be found [here](https://flutter.dev/docs/development/packages-and-plugins/androidx-compatibility).

The TL;DR version is:

1. Add the following to your "gradle.properties" file:

```properties
android.useAndroidX=true
android.enableJetifier=true
```

2. Make sure you set the `compileSdkVersion` in your "android/app/build.gradle" file to 33:

```gradle
android {
  compileSdkVersion 35
  ...
}
```

3. Make sure you replace all the `android.` dependencies to their AndroidX counterparts (a full list can be found [here](https://developer.android.com/jetpack/androidx/migrate)).

Add permissions to your `AndroidManifest.xml` file.
There are `debug`, `main`, and `profile` versions which are chosen depending on how you start your app.
In general, it's sufficient to add permission only to the `main` version.
[Here](https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler/example/android/app/src/main/AndroidManifest.xml)'s an example `AndroidManifest.xml` with a complete list of all possible permissions.

</details>

## How to use

There are a number of [`Permission`](https://pub.dev/documentation/permission_handler_platform_interface/latest/permission_handler_platform_interface/Permission-class.html#constants)s.
You can get a `Permission`'s `status`, which is either `granted`, `denied`, `restricted`, `permanentlyDenied`, `limited`, or `provisional`.

```dart
var status = await Permission.camera.status;
if (status.isDenied) {
  // We haven't asked for permission yet or the permission has been denied before, but not permanently.
}

// You can also directly ask permission about its status.
if (await Permission.location.isRestricted) {
  // The OS restricts access, for example, because of parental controls.
}
```

Can use also this style for better readability of your code when using the `Permission` class.

```dart
await Permission.camera
  .onDeniedCallback(() {
    // Your code
  })
  .onGrantedCallback(() {
    // Your code
  })
  .onPermanentlyDeniedCallback(() {
    // Your code
  })
  .onRestrictedCallback(() {
    // Your code
  })
  .onLimitedCallback(() {
    // Your code
  })
  .onProvisionalCallback(() {
    // Your code
  })
  .request();
```

Call `request()` on a `Permission` to request it.
If it has already been granted before, nothing happens.  
`request()` returns the new status of the `Permission`.

```dart
if (await Permission.contacts.request().isGranted) {
  // Either the permission was already granted before or the user just granted it.
}

// You can request multiple permissions at once.
Map<Permission, PermissionStatus> statuses = await [
  Permission.location,
  Permission.storage,
].request();
print(statuses[Permission.location]);
```

Some permissions, for example, location or acceleration sensor permissions, have an associated service, which can be `enabled` or `disabled`.

```dart
if (await Permission.locationWhenInUse.serviceStatus.isEnabled) {
  // Use location.
}
```

You can also open the app settings:

```dart
if (await Permission.speech.isPermanentlyDenied) {
  // The user opted to never again see the permission request dialog for this
  // app. The only way to change the permission's status now is to let the
  // user manually enables it in the system settings.
  openAppSettings();
}
```

On Android, you can show a rationale for using permission:

```dart
bool isShown = await Permission.contacts.shouldShowRequestRationale;
```

Some permissions will not show a dialog asking the user to allow or deny the requested permission.  
This is because the OS setting(s) of the app are being retrieved for the corresponding permission.  
The status of the setting will determine whether the permission is `granted` or `denied`.

The following permissions will show no dialog:

- Notification
- Bluetooth

The following permissions will show no dialog, but will open the corresponding setting intent for the user to change the permission status:

- manageExternalStorage
- systemAlertWindow
- requestInstallPackages
- accessNotificationPolicy

The `locationAlways` permission can not be requested directly, the user has to request the `locationWhenInUse` permission first.
Accepting this permission by clicking on the 'Allow While Using App' gives the user the possibility to request the `locationAlways` permission.
This will then bring up another permission popup asking you to `Keep Only While Using` or to `Change To Always Allow`.

## FAQ

### Requesting "storage" permissions always returns "denied" on Android 13+. What can I do?

On Android, the `Permission.storage` permission is linked to the Android `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` permissions. Starting from Android 10 (API 29) the `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` permissions have been marked deprecated and have been fully removed/disabled since Android 13 (API 33).

If your application needs access to media files Google recommends using the `READ_MEDIA_IMAGES`, `READ_MEDIA_VIDEO`, or `READ_MEDIA_AUDIO` permissions instead. These can be requested using the `Permission.photos`, `Permission.videos`, and `Permission.audio` respectively. To request these permissions make sure the `compileSdkVersion` in the `android/app/build.gradle` file is set to `33`.

If your application needs access to Android's file system, it is possible to request the `MANAGE_EXTERNAL_STORAGE` permission (using `Permission.manageExternalStorage`). As of Android 11 (API 30), the `MANAGE_EXTERNAL_STORAGE` permission is considered a high-risk or sensitive permission. Therefore it is required to [declare the use of these permissions](https://support.google.com/googleplay/android-developer/answer/9214102) if you intend to release the application via the Google Play Store.

### Requesting `Permission.locationAlways` always returns "denied" on Android 10+ (API 29+). What can I do?

Starting with Android 10, apps are required to first obtain permission to read the device's location in the foreground, before requesting to read the location in the background as well. When requesting the 'location always' permission directly, or when requesting both permissions at the same time, the system will ignore the request. So, instead of calling only `Permission.location.request()`, make sure to first call either `Permission.location.request()` or `Permission.locationWhenInUse.request()`, and obtain permission to read the GPS. Once you obtain this permission, you can call `Permission.locationAlways.request()`. This will present the user with the option to update the settings so the location can always be read in the background. For more information, visit the [Android documentation on requesting location permissions](https://developer.android.com/training/location/permissions#request-only-foreground).

### onRequestPermissionsResult is called without results. What can I do?

It is probably caused by a difference between completeSdkVersion and targetSdkVersion. It can be depending on the flutter version that you use. `targetSdkVersion = flutter.targetSdkVersion` in the app/build.gradle indicates that the targetSdkVersion is flutter version dependant. For more information: [issue 1222](https://github.com/Baseflow/flutter-permission-handler/issues/1222)

### Checking or requesting a permission terminates the application on iOS. What can I do?

First of all make sure all that the `ios/Runner/Info.plist` file contains entries for all the permissions the application requires. If an entry is missing iOS will terminate the application as soon as the particular permission is being checked or requested.

If the application requires access to SiriKit (by requesting the `Permission.assistant` permission), also make sure to add the `com.apple.developer.siri` entitlement to the application configuration. To do so create a file (if it doesn't exists already) called `Runner.entitlements` in the `ios/Runner` folder that is part of the project. Open the file and add the following contents:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>com.apple.developer.siri</key>
	<true/>
</dict>
</plist>
```

The important part here is the `key` with value `com.apple.developer.siri` and the element `<true/>`. It is possible that this file also contains other entitlements depending on the needs of the application.

===

# Android Usage Guide: `permission_handler`

## 1. Overview
The `permission_handler` plugin provides a cross-platform API to request permissions and check their status. On Android, it handles standard dialog-based permissions, special intent-based permissions, and provides Android-specific features like checking if a permission rationale should be shown.

**Note:** The Android implementation (`permission_handler_android`) is federated and automatically included when you depend on `permission_handler: ^9.1.0` or higher in your `pubspec.yaml`.

## 2. Project Setup & Configuration

### Gradle Requirements
To use the latest versions of `permission_handler` (v13.0.0+), your Android project must meet specific Gradle and SDK requirements.

1. **Enable AndroidX:**
   Ensure the following flags are set in your `android/gradle.properties` file:
   ```properties
   android.useAndroidX=true
   android.enableJetifier=true
   ```

2. **Update SDK Versions:**
   Update your `android/app/build.gradle` file to use the required SDK versions. As of v13.0.0, the `compileSdkVersion` must be at least **35**.
   ```gradle
   android {
       compileSdkVersion 35
       // ...
       defaultConfig {
           // minSdkVersion is typically tied to flutter.minSdkVersion (19+)
           minSdkVersion flutter.minSdkVersion 
           targetSdkVersion flutter.targetSdkVersion
       }
   }
   ```

### AndroidManifest.xml
You must declare the permissions your app intends to request in the `android/app/src/main/AndroidManifest.xml` file. 

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.example.app">
    <!-- Example Permissions -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    
    <application>
        <!-- ... -->
    </application>
</manifest>
```

## 3. Core API Usage

### Checking Permission Status
```dart
import 'package:permission_handler/permission_handler.dart';

var status = await Permission.camera.status;
if (status.isDenied) {
  // Permission has not been asked yet, or was denied (but not permanently)
}
if (status.isRestricted) {
  // OS restricts access (e.g., parental controls)
}
```

### Requesting Permissions
```dart
// Request a single permission
PermissionStatus status = await Permission.contacts.request();

// Request multiple permissions at once
Map<Permission, PermissionStatus> statuses = await [
  Permission.location,
  Permission.storage,
].request();

print(statuses[Permission.location]);
```

### Android-Specific: Request Rationale
Android allows you to check if you should show a rationale (explanation) to the user before requesting a permission again.
```dart
bool showRationale = await Permission.contacts.shouldShowRequestRationale;
if (showRationale) {
  // Show a custom dialog explaining why the app needs this permission
}
```

### Opening App Settings
If a permission is `permanentlyDenied`, the only way to grant it is via the system settings.
```dart
if (await Permission.camera.isPermanentlyDenied) {
  await openAppSettings();
}
```

## 4. Special Android Permissions & Behaviors

### Intent-Based Permissions (No Dialog)
Some Android permissions do not show a standard popup dialog. Instead, requesting them opens a specific Android settings screen where the user must manually toggle the permission.
* `Permission.manageExternalStorage` (`MANAGE_EXTERNAL_STORAGE`)
* `Permission.systemAlertWindow` (`SYSTEM_ALERT_WINDOW`)
* `Permission.requestInstallPackages` (`REQUEST_INSTALL_PACKAGES`)
* `Permission.accessNotificationPolicy` (`ACCESS_NOTIFICATION_POLICY`)
* `Permission.scheduleExactAlarm` (`SCHEDULE_EXACT_ALARM`)

### Silent Permissions (No Dialog)
The following permissions will not show a dialog; their status is determined directly by the OS settings:
* `Permission.notification`
* `Permission.bluetooth`

## 5. Version-Specific Android Quirks (Crucial Context)

### Android 13+ (API 33+)
* **Storage / Media:** `READ_EXTERNAL_STORAGE` and `WRITE_EXTERNAL_STORAGE` are deprecated/removed. `Permission.storage` will always return `denied`. 
  * **Fix:** Use `Permission.photos`, `Permission.videos`, or `Permission.audio` (which map to `READ_MEDIA_IMAGES`, `READ_MEDIA_VIDEO`, and `READ_MEDIA_AUDIO`).
* **Notifications:** Requires the `POST_NOTIFICATIONS` permission in the manifest.
* **Wi-Fi:** Use `NEARBY_WIFI_DEVICES` for local network operations.
* **Sensors:** Background sensor access requires `BODY_SENSORS_BACKGROUND`.

### Android 12+ (API 31+)
* **Bluetooth:** Requires specific granular permissions: `BLUETOOTH_SCAN`, `BLUETOOTH_ADVERTISE`, and `BLUETOOTH_CONNECT`.
* **Alarms:** Requires `SCHEDULE_EXACT_ALARM`.

### Android 11+ (API 30+)
* **Full File System Access:** If your app requires broad file system access (e.g., a file manager), you must use `Permission.manageExternalStorage` (`MANAGE_EXTERNAL_STORAGE`). *Note: Google Play strictly enforces policies around this permission.*

### Android 10+ (API 29+)
* **Background Location:** You **cannot** request `Permission.locationAlways` directly. The system will ignore the request.
  * **Fix:** You must first request foreground location (`Permission.location` or `Permission.locationWhenInUse`). Only after foreground location is granted can you request `Permission.locationAlways`, which will prompt the user to "Change To Always Allow" in settings.

## 6. Troubleshooting

* **`onRequestPermissionsResult` is called without results:**
  This is usually caused by a mismatch between `compileSdkVersion` and `targetSdkVersion` in your `build.gradle`. Ensure both are updated to the required versions (e.g., 35).
* **App crashes/restarts when requesting special permissions:**
  Permissions like `ignoreBatteryOptimizations` or `manageExternalStorage` open a separate settings activity. If the device is low on memory, Android might kill the Flutter activity in the background. The plugin handles this gracefully in recent versions (v12.0.10+), but ensure your app state is properly saved/restored.
* **`Permission.phone` always returns denied:**
  Ensure you are requesting the correct specific phone permissions (like `READ_PHONE_STATE` or `READ_PHONE_NUMBERS`) in your manifest.