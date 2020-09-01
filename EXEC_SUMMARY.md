### Overview
* (Delete this bullet after you're done writing) Put this project in context, perhaps including a story or example. What is the problem it is trying to solve? Why does this problem exist?

### Target Users
Our project will serve people who currently have Type I and Type II diabetes, people with prediabetes, and their caretakers if they're not capable of using the application. More specifically, we aim to serve people of all ages, from children to young adults to older adults, as the measurements that people with diabetes have to be aware of tend to be similar regardless of age or type of diabetes.

### Value
One of the main things that will be changed by this project is that it will tie the app with the user's healthcare provider. A current problem with people who have diabetes is that getting data to their healthcare provider is often inconvenient to either the patient, the physician, or both. The data is either presented in the form of countless physical logs, which is inconvenient for the physician, or not presented at all, as it seems to inconvenient to the patient. With this project, we aim to improve this by making the data in the app easily exportable to healthcare providers, making it easier for both parties. 

Another change that we aim to bring with this project is to make the tracking of measurements much easier. Instead of making the target users manually log their measurements countless times per day, every single day, this app will integrate as many measurements as possible that the user has already taken, such as steps taken or quality of sleep from Apple Health, or glucose levels from Dexcom, in order for all of the relevant data to come together in one single place. Of course, if the user wants to manually input data, that will also be available, but even that will be implemented in such a way that it makes it very effortless. 

The ease of use will encourage the target users to track their measurements more often, and by tracking their measurements with this app, physicians will receive more better-documented data that will also make it easier for the physician to monitor and treat the user. 

### Functionality
The main point of this application is to provide a platform for tracking diabetes, along with serving as an integration point that increases the quality and ease of communication between a patient and their physician. The application will have features including tracking insulin levels, blood sugar levels, sleep, exercise, food intake, and other measures relevant to the condition. Glyco plans to integrate data from other applications and devices commonly used by patients with diabetes, including but not limited to their smartphone's Health app, glucose monitoring device, and calorie tracking app. Second priority features include incorporation with a web application that allows the physician or close contacts to monitor and suggest weekly challenges to the patient.

### Technical Recommendation
A main talking point for this project is ease of use for people with diabetes. As we want the most amount of people to be able to use our app, a cross-platform mobile application is the clear choice of technology for this project. In terms of technology, the framework that we will be using is Flutter. Another framework that we could have chosen was React Native, but because of Flutter's great flexibility with UI components, as well as its vast amount of out-of-the-box widgets, Flutter was chosen in the end. Currently, the team is thinking of saving user data locally on their phones, and so there are no expenses that currently come to mind. A kind of expense that may prop up is during testing: we may need to aquire a Dexcom transmitter.

