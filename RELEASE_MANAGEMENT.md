### Release Environments 

The plan for Glyco is a mobile app on both Android and iOS. As we are using Flutter to build the app, there will be both minimum hardware requirements, as well as OS requirements. In terms of hardware, Flutter requires iPhone 4S or newer and ARM Android devices. The minimum specs for mobile operating systems will be Android Jelly Bean, v16, 4.1.x or newer, and iOS 8 or newer. As these minimum specs are quite low, we expect almost everyone to be able to use our app. In terms of a plan for separating the production environment from the test environment, as soon as we release our alpha build, the master branch will stay as the alpha build until long term support is achieved for the beta build (which will be built on a different branch). At that point, the master branch will become the beta build. 

### Release Packaging 

The dependencies of our project can all be found in the pubspec.yaml file of the project. Current and expected dependencies are: Provider, Intl, Http, FontAwesome, and Health. Since these dependencies are listed in the pubspect.yaml, future mantainers simply need to run 'flutter pub get' to fetch all dependencies needed for the project.

### Release Build Management 

* What is your pipeline (i.e., process and tools) used for building a development versus a production release? How are these integrated with your GIT workflow (i.e., the branches you merge and pull from and the tags you use)?

### Release Deployment 

* How do you plan to deploy to each release environment? What parts of the process can be automated and what cannot?

### Defect Tracking 

* How do you plan to track project bugs from open to close? We are not suggesting learning true bug-tracking software, but you should at least make bugs into actual Gitlab issues, using this template, that are fixed in separate commits with separate tests (ideally made before the bug is fixed to better verify the bug and the fix).

### Software Configuration/Change Management (SCM) 

* How will the team collectively determine if a feature is ready to be released or a change (e.g., a bug or security fix or a feature update) should (or should not) be added to the current production release? What is the overall process for managing which features are in which releases, tracking which changes have been applied to which releases, verifying a change works in the current production release, and determining when the current release should be replaced by a new release?