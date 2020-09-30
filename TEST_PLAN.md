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


### Definition of Done

* How will you verify features are complete and working in a replicable manner? Note, strategies may differ across features (e.g., some may be automated using different tools, but some may need to be manual)?

### Resources

* What do you need to support your tests (i.e., data files, scripts, mock databases, etc.)?


We will need test users in our Firebase database, as well as authentication database. Unit tests will need to be written to make sure our Providers are working properly, and we will use Flutter Driver (Flutter's version of Selenium WebDriver)to perform automated tests.

Regarding Firebase, we would use mock accounts, with mock data tied to them, in our database to do many of our unit tests for the functionality of the features in our measurements and settings screens. 
