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


### Definition of Done

* How will you verify features are complete and working in a replicable manner? Note, strategies may differ across features (e.g., some may be automated using different tools, but some may need to be manual)?

### Resources

* What do you need to support your tests (i.e., data files, scripts, mock databases, etc.)?


We will need test users in our Firebase database, as well as authentication database. Unit tests will need to be written to make sure our Providers are working properly, and we will use Flutter Driver (Flutter's version of Selenium WebDriver)to perform automated tests.
