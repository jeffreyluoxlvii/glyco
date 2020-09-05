### Overall Goals and Feature Scope

Features that this project will deliver are: UI that is very easy and simple to use and integration between different measurement apps, such as the iOS Health App or glucose monitoring apps. Another feature that we will keep as a secondary focus will be a direct way to get this information to healthcare providers, and give them the ability to participate in the app somehow, be it through daily or weekly goals that they assign to their patients, or "healthcare provider" accounts that they can use to observe their patients' measurements and progress. 

### Design Goals

Integration among different data and exportation of formatted data is integral to this application and will be accomplished with the use of multiple APIs (i.e. Dexcom for gluco monitoring, Calorie King for diet, Glooko or Tidepool for data formatting, etc.) All of this information will be housed within Glyco, and users can also input information manually if there is no integration - in which case the application will provide a simple and time-efficient way to do so. The mobile application will also include a counterpart on the web for healthcare providers, a platform in which the patients' physicians can monitor their data or provide challenges for the patient to attempt. This latter feature make take additional expertise and may fall outside of our abilities to accomplish in the given timeline, so will be passed back to the client if unfinished.

### Dependencies

A library that our app will definitely use is the flutter health library. Using this library will allow our application to communicate with both GoogleFit and AppleHealthKit, giving us access to important health values stored in user phones. An API that we may use is the Dexcom API, with a specific interest in the statistics endpoint, and the egvs endpoint. As we will most likely use Firebase in our project, we will also rely on the http library to make our HTTP requests. 

### Concerns
One concern we have about getting our application done would be being able to incorporate a central way for every user to record their data. We must take into account that some users may not have automatic glucose readers that input the data into its respective health app. We cannot exclude the fact that some people with diabetes may not be utilizing apps or devices that track the data our app needs. We must consider how to maintain simplicity and ease of use within our app while catering to the vast amount of input options. Another concern is making the user feel safe and confident in our app collecting their sensitive data. We must ensure that the user feels that their private data is being protected and that our app isn’t intruding their personal lives. Lastly, since we are using the user data for health and facilitating communication between patient and healthcare provider, we must keep in mid the ethical concerns and policy regulations that may hinder us. This is sensitive, private data and we must ensure we comply with the regulations of healthcare policies and not risk the privacy and well being of the users. 

### Team Organization

Justin Wu - Business Analyst, Primary: Backend, Secondary: Design/Data Wrangler
Jeffrey Luo - Technical Lead, Primary: Backend, Secondary: Frontend
Herleen Kaur - Project Manager, Primary: Design, Secondary: Frontend
Nathaniel Hartley - Quality Assurance Lead, Primary: Frontend, Secondary: Backend/Data Wrangler