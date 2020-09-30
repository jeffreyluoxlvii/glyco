### Test scenarios

* List as many test scenarios as you can think of for each feature

##### Test Scenario #1: 
**Feature:** Tapping on shortcut icon in Measures screen
**Purpose:** This feature is very important because it will allow users to quickly update their measurements for the day.
**Preconditions:** Test uses a specific dummy user and its values in the database
**Scenario:** When a user taps on a shortcut icon (for example the meal icon) in the Measures screen. The appropriate measurement should be updated with the correct shortcut value.
**Given** User is on the measures screen of Glyco
**When** User taps on the Meal shortcut
**Then** nutrition widget should be updated with correct values.
**Post-conditions:** Nutrition widget and database should hold the correct updated values.

##### Test Scenario #2: 
**Feature:** Changing account information such as first name and last name, email, etc.
**Purpose:** This feature allows users to change any of their account's information, which allows them to correct their settings if they contain typos, or change their email in case they want to link their accounts to another email.
**Preconditions:** Test uses a specific dummy user and its account values in the database.
**Scenario:** When a user inputs data on the form in the settings screen for changing first name, last name, email, etc., and clicks save and exit, the user's account information should be updated with these values.
**Given** User is on the settings screen of Glyco
**When** User fills in the form and presses save and exit.
**Then** User's account information should be updated with the new values that were inputted in the form.
**Post-conditions:** Account information on any of the screens that use these values, and database, should hold the correct updated values.

##### Test Scenario #3:
**Feature:** Integrating HealthKit into the app so data can be pulled from users health app on phone to be displayed and used within Glyco.
**Purpose:** This feature is vital in grabbing the data we need from the users health app from both iOS and Android. The main data we would need is the users blood glucose levels and if possible their steps as well in order to be displayed on the measurements screen and be used in setting challenges for the user. 
**Preconditions:** Test uses a specific dummy user with data in their respective health app. 
**Scenario:** When a user signs into the app their blood glucose levels and their steps should automatically be fetched from the data provided from their helath app. In turn, the values displayed should be correct and their challenges should reflect their progress thusfar. 
**Given** User gives permission for Glyco to incorporate data from their Helath app
**When** User opens their Glyco app
**Then** User's measurements and challenges , specifically blood glucose and steps, should be displayed and reflect the correct information from the user's health app. 
**Post-conditions:** The data displayed in the app should accurately eately correlate to the data collected in the user's health app. 

##### Test Scenario #4:
**Feature:** Testing our internal challenge-generating function that is customized, displayed to the user, and progress-tracked.
**Purpose:** This function is vital and unique to our application, as it provides users with challenges that serve to improve user retention rate but also to motivate our users in response to their diabetic condition. Testing this feature will be essential to the application's success because it encompasses a major portion of our overall functionality and uniqueness.
**Preconditions:** Test uses a specific dummy user and its values in the database
**Scenario:** When a user navigates to the Challenges screen of the application, they will see a customized challenge generated for them based on the previous data the application has collected about their condition. For example, if they have had reduced steps in the last week compared to their usual steps average, Glyco will challenge them to increase the amount of daily steps the user takes this week.
**Given** User is on the Challenges screen on Glyco and has previous data stored in the applicatiion
**When** User navigates to the Challenges screen 
**Then** User should see a custom challenge generated for them that will improve their condition. This challenge will display the previous data that informed this challenge and suggest how to achieve improvement
**Post-conditions:** The data shown in the progress towards that challenge should be accurately updated as according to the measurements found in the Measures screen 

### Definition of Done

* How will you verify features are complete and working in a replicable manner? Note, strategies may differ across features (e.g., some may be automated using different tools, but some may need to be manual)?

We will make sure to exhaustively test each specific feauture to make sure they work in a variety of conditions and output reliable results everytime we test. We will also make sure to cross examine the results outputted by that feature with the expected results and make sure each exhaustive test yields not only reliable results but correct results as well. 

For example, we can run automated tests for the feature on the Measurements screen where tapping the the shortcut icons will update the appropriate values for that measurement. This updated value should be displayed in its respective widget and should be updated in the database as well. We will make sure that the widget updating by the correct value and that the data is also being updated in the database. This can be done for the feature on being able to update user settings from the settings screen. We can run an automated test that runs through ans changes the acount info and make sure that the changes are being reflected in the database for that user as well. 

We can use manual testing to ensure the HealthKit integration is working correctly by looking at the values in the respective platforms health app and looking at the data being pulled into our app and stored in the database. This way we can double check we are scraping the correct data and that when we pull from it, our database is correctly handling it and storing it as well. 

### Resources

* What do you need to support your tests (i.e., data files, scripts, mock databases, etc.)?

We will need test users in our Firebase database, as well as authentication database. Unit tests will need to be written to make sure our Providers are working properly, and we will use Flutter Driver (Flutter's version of Selenium WebDriver)to perform automated tests.

Regarding Firebase, we would use mock accounts, with mock data tied to them, in our database to do many of our unit tests for the functionality of the features in our measurements and settings screens. 
