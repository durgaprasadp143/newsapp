# newsapp

A new Flutter project.

## Getting Started

Introduction
This is a simple news app built with Flutter that displays a list of news articles from a public
API. The app features pagination, offline caching, and a pull-to-refresh mechanism.
Setup and Run
To set up and run the app, follow these steps:

   1. Clone the repository:git clone https://github.com/your-username/news-app.git
   2. Navigate to the project directory:cd news-app
   3. Install dependencies:flutter pub get
   4. Run the app:flutter run
   

Libraries Used
   The following libraries are used in this app:

  * flutter_bloc for state management
  * hive and hive_flutter for offline caching
  * http for making API requests
  * fluttertoast for displaying toast messages
  * pull_to_refresh for implementing the pull-to-refresh mechanism
    Architectural Decisions
    The following architectural decisions were made while building this app:
  * Separation of Concerns: The app is divided into separate layers for data fetching, business logic,
    and UI. This makes it easier to maintain and extend the app.
  * Bloc Pattern: The Bloc pattern is used for state management. This allows for a clean and scalable
    way to manage the app's state.
  * Offline Caching: Offline caching is implemented using Hive. This allows the app to display news
    articles even when the user is offline.
  * Pagination: Pagination is implemented to limit the number of news articles fetched from the API at
    a time. This improves performance and reduces data usage.
  * Pull-to-Refresh: A pull-to-refresh mechanism is implemented to allow users to refresh the news
    feed manually.




