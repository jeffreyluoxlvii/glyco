### Overall Goals and Feature Scope
* What features the project will (and will not) deliver, in order to avoid future shifts in the level of ambition. These goals can be anything you have discussed with the client, such as functional, strategic, technological, quality, or ethical. Note, this may involve some negotiation about the team or Client's priorities.

Features that this project will deliver are: UI that is very easy and simple to use, and integration between different measurement apps such as the iOS Health App or glucose monitoring apps. Another feature that we will keep as a secondary focus will be a direct way to get this information to healthcare providers, and give them the ability to participate in the app somehow, be it through daily or weekly goals that they assign to their patients, or "healthcare provider" accounts that they can use to observe their patients' measurements and progress. 

### Design Goals
* The overall very high level design of the project, emphasizing the priorities regarding flexibility and maintenance, rather than what classes implement what features. From this section, it should be clear: what features you view as core and integral to the app versus what can be added later, what will be easily changeable in the future and what will require programming expertise, and what changes the client will need to be responsible for in the future.

### Dependencies

A library that our app will definitely use is the flutter health library. Using this library will allow our application to communicate with both GoogleFit and AppleHealthKit, giving us access to important health values stored in user phones. An API that we may use is the Dexcom API, with a specific interest in the statistics endpoint, and the egvs endpoint. As we will most likely use Firebase in our project, we will also rely on the http library to make our HTTP requests. 

### Concerns
* At least three concerns or risks about getting the project done. To help you brainstorm possible issues, do a premortem as a team to imagine ways in which the project might not be a success (here are some common team project issues to consider).

### Team Organization
* The external team roles each person will take on and the internal parts of the project each person will focus on (e.g., frontend, backend, data wrangler, etc.) and who will be the backup/understudy for each role.

Justin Wu - Business Analyst, Primary: Backend, Secondary: Design/Data Wrangler
Jeffrey Luo - Technical Lead, Primary: Backend, Secondary: Frontend
Herleen Kaur - Project Manager, Primary: Design, Secondary: Frontend