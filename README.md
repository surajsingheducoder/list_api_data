User List Flutter App
Project Description: The User List Flutter App is a simple app that fetches and displays a list of users from an API. Users can view detailed information about each user by tapping on a list item. The app also provides a search functionality to filter users by name. It's built using Flutter and follows the MVC (Model-View-Controller) architecture pattern with provider for state management.

Features
Fetch and display a list of users from an API.
View detailed information about individual users.
Search functionality to filter users by name.
Pull-to-refresh functionality for the user list.
Clean and responsive UI.
Instructions to Run the App

Flutter SDK
Android Studio (or another preferred IDE like Visual Studio Code)
Android/iOS device or emulator for testing
Steps to Run
Clone the repository:

bash
Copy code
git clone https://github.com/surajsingheducoder/list_api_data.git
cd user-list-flutter-app
Install dependencies:

bash
Copy code
flutter pub get
Run the app on an emulator or connected device:

bash
Copy code
flutter run
This will launch the app either in an Android/iOS simulator or on a connected physical device.

Assumptions and Decisions Made During Development
The app assumes the API for fetching users returns data in a consistent format. The user details, such as name, email, address, and company, are fetched as described in the User model.
The app has basic error handling, where it shows a message if the data fails to load.
Search functionality is case-insensitive and filters users based on their names.
Pull-to-refresh functionality allows users to reload the list of users.
Screenshots Added in Project lavel assets/screen_shout
1. User List Screen

2. Search Functionality

3. User Details Screen

Evaluation Criteria
1. Functionality
Requirements Met: The app fetches and displays users from the API, includes search functionality, displays user details, and supports pull-to-refresh.
Testing: Ensure all functionalities are thoroughly tested on both Android and iOS.

2. Code Quality
Code Organization: The code is well-structured with separate files for models, controllers, and views.
Naming Conventions: Meaningful names are used for classes, methods, and variables.
Documentation: Code is documented with comments and doc comments to explain complex logic and functionality.

3. UI/UX
User-Friendly Interface: The UI is intuitive with clear buttons, icons, and text.
Visual Appeal: Consistent colors, fonts, and padding are used. The layout adjusts to different screen sizes for responsiveness.

4. Error Handling
Network Errors: Appropriate error messages are displayed if the user list fails to load, with options for retry or refresh.
Empty Search Results: Displays a message when no search results are found.
Form Validations: Input fields, if any, are validated appropriately.
5. Bonus Features
Additional Features: search user by name.
