### Release Environments 

* List all the places you expect the app to be deployed (e.g., app and server, app on multiple platforms, web or mobile app, etc.) and your ideal production environment for each (note, include in your planning the minimal version of the software you can use, i.e., deploying only to the latest version of iOS or Android limits your app to only those users that have upgraded recently). How do you plan to separate the production environment(s) from the test environment(s) (i.e., there should always be a current stable version of your app available to demo)?

### Release Packaging 

* List the current and expected project dependencies. How do you plan to make them known and easily gettable for future maintainers (e.g., Docker container, maven or package-info file or other dependency manager, VM, etc.)?

### Release Build Management 

* What is your pipeline (i.e., process and tools) used for building a development versus a production release? How are these integrated with your GIT workflow (i.e., the branches you merge and pull from and the tags you use)?

### Release Deployment 

* How do you plan to deploy to each release environment? What parts of the process can be automated and what cannot?

### Defect Tracking 

* How do you plan to track project bugs from open to close? We are not suggesting learning true bug-tracking software, but you should at least make bugs into actual Gitlab issues, using this template, that are fixed in separate commits with separate tests (ideally made before the bug is fixed to better verify the bug and the fix).

### Software Configuration/Change Management (SCM) 

* How will the team collectively determine if a feature is ready to be released or a change (e.g., a bug or security fix or a feature update) should (or should not) be added to the current production release? What is the overall process for managing which features are in which releases, tracking which changes have been applied to which releases, verifying a change works in the current production release, and determining when the current release should be replaced by a new release?