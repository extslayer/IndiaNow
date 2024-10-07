India Now

India Now is an iOS app that displays the latest news headlines from Indian sources using the MediaStack API. The app fetches news data and presents it in a user-friendly format. It also handles potential API errors and sanitizes article titles and descriptions by removing unwanted special characters and gibberish.

Features

	•	Fetches real-time news articles from Indian sources via the MediaStack API.
	•	Displays news articles with a title, description, image, source, and URL link.
	•	Handles API errors gracefully by showing fallback messages.
	•	Removes unwanted characters and gibberish from article titles and descriptions.
	•	Uses the MVVM (Model-View-ViewModel) architecture for clean separation of concerns and easy-to-maintain code.
	•	Refresh functionality to reload news data.


Screenshots


![Simulator Screenshot - iPhone 16 Pro - 2024-10-07 at 20 52 35 Medium](https://github.com/user-attachments/assets/83dacbd7-132f-4091-b1c9-efa57d270b0a)




![Simulator Screenshot - iPhone 16 Pro - 2024-10-07 at 20 52 20 Medium](https://github.com/user-attachments/assets/0a939b74-8a9f-4a1b-9ede-dce46f64f0cc)


Usage

	•	The app will automatically fetch the latest news articles upon launch.
	•	Pull down to refresh the news articles.
	•	Click on any article to open its full content in a browser.

Code Overview

	•	Architecture: The app follows the MVVM (Model-View-ViewModel) architecture. This design pattern separates the app logic into three key components:
	•	NewsAPI.swift: The core API client that fetches news data from the MediaStack API using URLSession.
	•	NewsData.swift: The Codable struct representing each news article. It includes methods to sanitize titles and descriptions.
	•	Error Handling: The app gracefully handles errors like network failures or malformed data, displaying appropriate messages to users.
	•	Data Sanitization: Titles and descriptions are cleaned up to remove any unwanted characters using regular expressions.

 Requirements

	•	Xcode 14+
	•	Swift 5.7+
	•	iOS 15.0 or later

License

This project is licensed under the MIT License - see the LICENSE file for details.

Credits

	•	API: MediaStack
	•	Developed by: Manmohan Shrivastava

This README provides an overview of the project, including setup instructions, features, and usage information. Let me know if you’d like to add or modify any sections!

