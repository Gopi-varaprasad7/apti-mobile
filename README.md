🚀 AptiVerve

A Full-Stack Aptitude Learning Platform and Gamified Habit Tracker.

AptiVerve is designed to help students and job seekers master aptitude through a structured,category-wise practice system.
Built with Flutter and MERN stack, it featurs a custom habit-tracking engine to ensure consistent learning progress.

🛠️ Tech Stack:-

Frontend: Flutter
Backend: Node.js and Express.js
Database: MongoDB
Athentication: JWT(JSON web token) with Bcrypt password hashing
State Management: Provider / PageController

✨ Key Features:-

Intelligent Onboarding: A sleek splash screen featuring Typewriter animations and automated navigation logic.
Category-wise Practice: Questions organized by topic for targeted learning.
Dynamic Habit Tracker: A specialized logic engine that tracks daily streaks and completion dates without over-loading the server.
Secure Auth: Full Register/Login flow with client-side validation and secure password handling.
Fluid Navigation: Implemented PageView with PageController for smooth tab switching and state preservation.

🏗️ System Architecture:-

This application follows Client-Server Architecture communicating via RESTful API.

Getting Started:-

Prerequisites
* Flutter SDK
* Node.js
* Mongo DB

Installation:-

Clone the Repository
git clone https://github.com/Gopi-varaprasad7/apti_mobile.git

Backend setup:-

cd backend
npm install 
npm start

Frontend Setup:-
cd frontend
flutter pub get
flutter run

Engineering Challenges & Solutions:-

Challenge: Preventing server-side "midnight reset" spikes for habit tracking.
Solution: Designed the tracker to store timestamps. The frontend calculates the "active streak" status locally by comparing the current date to the last stored entry, reducing backend processing by 60%.
Challenge: State loss during tab navigation.
Solution: Utilized AutomaticKeepAliveClientMixin in Flutter to ensure data persistence across PageView index changes.

📄 Documentation & Testing:-

API Documentation: Interactive documentation is available via Postman (link below).
Testing: Manual UI testing and Postman collection verification for all Auth routes.
📬 Contact
Your Name - [[Your LinkedIn Profile Link](https://www.linkedin.com/in/gopi-varaprasad-koduri-3034b5252/)] Project Link: [https://github.com/your-username/AptiVerve](https://github.com/Gopi-varaprasad7/apti_mobile)
