### High-Level Architecture
* Describe the high-level architecture of our design

On a high level, our app utilizes providers in the form of Measurements, HealthKit, Settings, and Auth to create an app-wide state. It is through these providers that we interact with Firebase, which means no calls to the database are made through our front-end widgets. Rather, our widgets get the information from Firebase through calling on the providers.

### Goals of Our Design
With our design, we hope to create clear distinctions between the various components of our app. This was done by making sure that widgets never directly called on the database, and instead were passed arguments from the providers. We also wanted to make certain that our widgets could all easily access the database, since all of the screens of our application depend on the database. This was accomplished by creating the various providers to implement app-wide state.

### User Stories and Design
* Use stories to justify or explain design choices

### Significant Decisions
* Justify significant decisions your team has made in relation to the project's design goals using the following template:
* the issue requiring a decision
* the choice that was ultimately made
* the justification for the choice
* the other alternatives considered
* the trade-offs evaluated
* any assumptions that may have had an impact on the decision
* any dependencies on the decision that impacted other issues