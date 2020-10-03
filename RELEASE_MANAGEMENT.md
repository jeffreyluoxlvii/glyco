### Release Environments 

The plan for Glyco is a mobile app on both Android and iOS. As we are using Flutter to build the app, there will be both minimum hardware requirements, as well as OS requirements. In terms of hardware, Flutter requires iPhone 4S or newer and ARM Android devices. The minimum specs for mobile operating systems will be Android Jelly Bean, v16, 4.1.x or newer, and iOS 8 or newer. As these minimum specs are quite low, we expect almost everyone to be able to use our app. In terms of a plan for separating the production environment from the test environment, as soon as we release our alpha build, the master branch will stay as the alpha build until long term support is achieved for the beta build (which will be built on a different branch). At that point, the master branch will become the beta build. 

### Release Packaging 

The dependencies of our project can all be found in the pubspec.yaml file of the project. Current and expected dependencies are: Provider, Intl, Http, FontAwesome, and Health. Since these dependencies are listed in the pubspect.yaml, future mantainers simply need to run 'flutter pub get' to fetch all dependencies needed for the project.

### Release Build Management 

For a development release, we use several branches in our GIT workflow in order to build and develop different features without disrupting the code or progress of another feature. While we develop in these branches, we will continuously be testing our software and testing bugs in our code until it is ready to be combined with the other features being developed. Once a feature has been thoroughly tested, we will release it and merge it with master in order to piece together the software. Once we have all final versions merged with master, we can go through some additional testing and bug fixes to ensure our code works as flawlessly as possible. Once we feel confident, we will release the product. Once we release, we can continuously add features and repeat this process in order to maintain stability and make sure there are no issues with our code.
If we need to reference a past push or merge, we can use the appropriate tags in order to find the point where we want to access. Once a branch is merged, we will need to pull from master in order to have the code being worked on by others as well.

### Release Deployment 

Glyco will be deployed as an app for both Android and iOS. As discussed previously, the minimum specs for Flutter applications are quite low, so we believe our application will be widely available. Flutter takes care of a lot of the deployment process already, as it is a cross-platform framework and has streamlined the release process. We can use flutter build to automate the actual release process. However, we have a lot of manual configuring to make sure that our application is correctly deployed, and this differs for both iOS and Android applications. 

* For iOS, we must create a Bundle ID through our developer account and create an application record on App Store Connect to register a new app. We must also input the necessary information in Xcode by selecting the Runner project and adding the application's display name, bundle ID, Apple Developer account, and deployment info (i.e. the minimum iOS version that the application supports, which is 8.0). The command "flutter build ios" creates a release build - then we can create a build archive and validate the application, which will make it available for release on TestFlight and, later, the App Store.

* For Android, we must create a keystore so that we can release Glyco to the Play Store. Creating the keystore is automated, but we must manually create a file including all the necessary configuration information, though there is a lot of documentation on that. We can then run flutter run appbundle to build the application, but must thoroughly review the build configuration to make sure that the appid and version information are correct. After that, we can follow the rules for publishing the app to the Google Play Store.

### Defect Tracking 

* We would create new issues that contain what the bug is, and link them with the issues that pertain to the feature that the bug is related to, so that we can easily find bugs and see which feature they pertain to. We would also have commits that are solely dedicated to the fixing of bugs so that there is no confusion when a team member decides to work on a new feature, or on fixing bugs. There would also be commits that are dedicated solely to the creation of separate tests for these fixed bugs, as well. 

### Software Configuration/Change Management (SCM) 

* The team will consult with every member to discuss any potential changes to a feature, but if the feature has essentially been finished as planned, the team would have no problem with releasing it. Regarding changes, each case will be reviewed individually by the team as a whole, and an action will be decided if everyone agrees with it. 

* The overall process for managing which features are in which releases will be at the start of every sprint, by checking which features are to be implemented by the end of the sprint, and to what extent they would be functional in the next release of the app.

* With regards to how we will track which changes have been applied, we will keep track of each release in our Gitlab, possibly as a milestone, as certain issues would be features, or related to certain features.

* Regarding how we will verify if a change works in the current production release, we would test its implementation into the current production release, and if the testing results are satisfactory, we would see it as working/functional.

* Regarding how we would determine when a current release should be replaced by a new release, we would analyze the number of features or changes to features that we have implemented since the last release, and the team would decide if the changes have been significant enough to warrant a new release. If the team decides that there are enough changes, then we would determine that the current release should be replaced by a new one.