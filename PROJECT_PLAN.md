### User Stories Backlog
- As a current member of Glyco, I sign into the application on a new phone to see my data.
- As a member of Glyco who is really forgetful, I click "Forgot password?" so I can reset my password and sign in.
- As someone who recently downloaded the application, I click "Create an Account" on Glyco so I can track my data.
- As someone who recently created an account, I click to integrate Glyco with two other apps I use, Dexcom and Apple Health, to make data input easier.
- As someone with diabetes, I wish to go into the app to view my current levels of steps, calories, and glucose levels.
- As someone who just ate, I press the shortcut icons to quickly input that I've eaten a snack, meal, and drink to update my data.
- As somone who wants to look back on my measurements yesterday, I click on the arrows near the data so I can switch to yesterday.
- As someone who wants to challenge myself to improve my condition, I switch to the Challenges screen and view the goals Glyco has set up for me.
- As someone who wants to improve my condition by following Glyco's challenges, I scroll down on the Challenges screen to view my progress towards the goals,
- As someone who mistyped my name, email, and/or password, I navigate to the Settings screen to change one of these.
- As someone who recently switched their diet and exercise routine to be more strict, I press "Click to Edit Shortcuts" in Settings to update my usual calorie intakes.
- As somone who recently switch from using Dexcom to Glooko, I press "Click to Edit Integrations" in Settings to update my integrations.
- As someone who is stuck at home due to COVID-19 but wants to send my data to my doctor, I press "Export Data" in Settings to email my analytics to my doctor.
- As someone who wants to view how my blood glucose levels and overall condition has varied over the last month, I press "View Analytics" in the Measures screen so I can view my data analytics.
- As someone who is done viewing my analytics, I press "View Measures" to switch back to my usual daily measurements.

### Feature Deliverables for each Sprint

**Sprint 2 - Prototype (Most Basic Features):** For this sprint, we plan to create the main interface. We will not worry about users for now, and will focus instead on creating the basic layout for the measures screen, challenges screen, and settings screen, using hard-coded data.
**Sprint 3 - Baseline Prototype (Core Functionality):** In this sprint, we will bring in Firebase, and create users and make it such that the data in the apps are pulled from and set to the database. We will also begin work on creating challenges that are computer generated.
**Sprint 4 - Alpha (Partial Full Functionality):** This sprint will focus on bringing in and integrating a selected API into our application, for example, the HealthKit, Glooco, or Dexcom APIs. We will begin working on and finishing the analytics function in the Measures page.
**Spring 5 - Beta (Full Functionality):** This sprint will involve working on exporting the data to health care officials in a concise way. 
**Sprint 6 - Production (Robust Full Functionality):** Additional front-end work, polishing up the code-base, and optimizing the code for efficiency.


### Data Needs
For our app, we will need to keep track of the users' meal portion and when they eat/drink, their exercise levels, their blood sugar and A1C levels, and what medication to take and when to take it. Some data measurements, like blood sugar and A1C levels and exercise, can be linked to and pulled from connected apps like the Health app or Dexcom. Obviously, the most vital piece of data will be tracking blood sugar and A1C levels since that is the most important in terms of people with diabetes. For people with type 2 and trying to lose weight, tracking exercise and being able to see what they've done in the past and the pregoress they're making can help motivate and push the user to continue to improve and reach their goals. Reminders of medication can prove beneficial to those living busy, active lifestyles where they're often forgetting when and what to take as well as older people who have a hard time remembering exactly what they need to take and at what time. Tracking meals is important in order to ensure the user is following their diet plan and eating what they need to be in order to keep their blood sugar and A1C levels in the correct range. Users should also be able to look back to the days where their levels were especially high/low and see if their diet had anything to do with the fluctuation. The tracking and collection of the other data will provide benefits to users in helping them live a more independent, controlled, and healthier life with less hassle than their current situations. This data will also be beneficial for the users primary care doctors in seeing the users data report and being able to look and see any trends and where the patient can improve or change.  

### Team Roles for each Sprint
* Take responsibility for specific team roles during each Sprint during the rest of the semester. These roles may be fixed, but more likely will rotate among team members during the entire semester.
Sprint 2
* Justin - Settings and Measures back-end
* Jeffrey - Settings and Measures front-end
* Herleen - Challenges front-end
* Nate - Challenges back-end
Sprint 3
* Justin - Setting up Firebase back-end
* Jeffrey - Creating Firebase databases
* Herleen - Adapting code to data from Firebase
* Nate - Adapting code to data from Firebase
Sprint 4
* Justin - Integrating APIs to app
* Jeffrey - Work on Analytics function
* Herleen - Work on Analytics function
* Nate - Integrating APIs to app 
Sprint 5
* Justin - Exporting data back-end
* Jeffrey - Exporting data front-end
* Herleen - Exporting data front-end
* Nate - Exporting data back-end
Sprint 6
* Justin - Optimizing code-base
* Jeffrey - Polishing front-end design
* Herleen - Polishing front-end design
* Nate - Optimizing code-base