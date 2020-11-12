### Purpose

The purpose of Glyco is to provide a platform for tracking diabetes, along with serving as a user friendly service to consolidate, analyze, and improve the user's wellbeing. The application has features including tracking glucose levels, A1C levels, food intake, exercise, and step amounts. Glyco provides an innovative and efficient way of inputting these measurements - shortcuts provide ease of access and encourage its users to track their measurements by cutting down the time it takes to input them, a quality that distinguishes it from other diabetes-tracking applications. It also acts as an integration point by grabbing data from applications that the patient already uses to consolidate all of that information into one place (e.g. incorporating glucose levels and steps from Apple Health). 

By analyzing past data, Glyco also encourages better health habits by generating health challenges for the patient to improve their condition and provides intuitive data analysis so the patient can track their progress over both week and month time periods. Glyco serves people who currently have Type I and Type II diabetes, people with prediabetes, and their caretakers if they're not capable of using the application. More specifically, it aims to serve people of all ages - from children to young adults to older adults - as the measurements that people with diabetes have to be aware of tend to be similar regardless of age or type of diabetes.

With time-efficient measurement tracking, data consolidation and visualization, and health challenge generation, Glyco serves as an application that not only provides ease to their users but also attempts to improve their wellbeing.

### Dependencies

More information about versions can be found in the pubspec.yaml file.

* Flutter
* Font Awesome for Flutter
* Nano Healthkit
* fl_chart
* Cupertino Icons
* Mockito

### Deployment

For build and deployment, our team relied on Flutter's automated building and fastlane. For more detailed instruction, visit: https://medium.com/@pavel.sulimau/deliver-flutter-ios-app-to-testflight-with-fastlane-1513ae047cd9.

1. Ensure that you have an Apple Developer account
2. Install fastlane on your device. "brew install fastlane" for macOS, or visit https://docs.fastlane.tools/getting-started/ios/setup/ for instructions on installing fastlane
3. Ensure that the bundle ID written in the /ios/Runner.xcodeproj/project.pbxproj file is correct
4. Open /ios/Runner.xcodeproj in Xcode. Ensure that the correct team and bundle ID are displayed, and that iOS deployment target is set to 12.0
5. "cd glyco/" and run the command "flutter build ios --release --no-codesign"
6. "cd ios/" and run the command "bundle exec fastlane beta". The application should then be placed on AppStoreConnect