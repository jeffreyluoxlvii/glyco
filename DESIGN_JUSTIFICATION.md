### High-Level Architecture
* Describe the high-level architecture of our design

On a high level, our app utilizes providers in the form of Measurements, HealthKit, Settings, and Auth to create an app-wide state. It is through these providers that we interact with Firebase, which means no calls to the database are made through our front-end widgets. Rather, our widgets get the information from Firebase through calling on the providers.

### Goals of Our Design
With our design, we hope to create clear distinctions between the various components of our app. This was done by making sure that widgets never directly called on the database, and instead were passed arguments from the providers. We also wanted to make certain that our widgets could all easily access the database, since all of the screens of our application depend on the database. This was accomplished by creating the various providers to implement app-wide state.

### User Stories and Design
* "As an organized person, I want to see all my data in one place by opening this app". For this story, one of the design choices that we made was to incorporate providers for a user's data so that we could use that data wherever it was necessary in the app. 

* "As a user who wants to track my exercise, I want to see the steps that have been tracked in my Apple Health App inside this app". For this story, one of the design choices that we made was to incorporate data from Apple's Health app using a healthkit provider, so that we could put that data into our aggregate as well.

### Significant Decisions
* One significant decision that our team made was:
* - How to divide the editing functionalities such as editing profile, editing shortcut values, etc. 
* - We decided to make a separate screen for each functionality. Right now, there's a separate screen for forgot password, create account, edit shortcuts, edit profile, instead of having some of them in one place.
* - We decided that it would be easier for the user to edit certain aspects individually, as there might be an overload of information if there were multiple aspects of their account that they could edit in one single place. 
* - One other alternative that we considered was that in some cases, we could've grouped some of the editing together. For instance, we considered having a screen where the user could edit their profile and their measures as well, as the measures could be considered part of their profile settings. However, we thought it was too crowded so we decided to separate them.
* - The trade-off was that there would be more steps for this choice, as the user would have to click more buttons to get to the editing screen, but as a result, the editing would be more organized.
* - An assumption that we made was that the user would prefer to have a more organized way of editing their profile, even if it meant that they would have to click more times.
* - This decision impacted the issues of how users edit their data, because of the way editing is divided into different screens. 
