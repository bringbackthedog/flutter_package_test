# my_auth_package

_Work in Progress_

## Motivation
The authentication process is often the same between project. The goal is to save having to write the boilerplate code to create the widget tree and much of the auth logic.

## Objective
Automate the authentication process in a new Flutter project.  
The package will take the following arguments:
    - a `LoginView` widget
    - a `RegisterView` widget
    - a `Loading` view
    - a `CustomUser` model class
    - a Firebase firestore query to get the user data in the database
    - a function to map the Firestore `DocumentSnapshot` to a `CustomUser` object

The package will generate the widget tree.

