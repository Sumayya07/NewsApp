# 📰 News App

Stay updated with the latest news related to Tesla with this beautifully crafted iOS app. Powered by Swift and enhanced with Roboto Slab, a custom font to enhance readability and user experience.

<p align="center">
 <img src="https://github.com/Sumayya07/QuantumItAssignment/assets/95580926/43a8d340-9f01-4a6c-a140-3ed775995b6e" width="27.3%">
 <img src="https://github.com/Sumayya07/QuantumItAssignment/assets/95580926/21c0b197-da86-4bf3-9aae-af0a27322303" width="27.3%">
 <img src="https://github.com/Sumayya07/QuantumItAssignment/assets/95580926/b9fd4eec-8118-43f1-a8f3-496139652755" width="27.3%">
</p>

## 🚀 Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Technical Details](#technical-details)
  - [Models](#models)
  - [Custom Cell](#custom-cell)
  - [API Manager](#api-manager)
- [API Used](#api-used)
- [Extensions & Custom Views](#extensions--custom-views)
- [Contributing](#contributing)

## 🌟 Features

- **Robust API Integration**: Get real-time news updates directly from trusted sources.
- **Custom Design**: Incorporating the elegance of Roboto Slab font, making the reading experience pleasant.
- **Responsive UI**: Articles presented neatly with detailed views that include images, headlines, authors, and more.
- **Firebase Authentication**:
  - **Email Login**: Securely log in using your email credentials through Firebase.
  - **Google Sign-In**: Conveniently access the app with your Google account, thanks to Firebase integration.

## 📖 Usage

- **Launch the App:** Open the News App on your device.
- **Browse Articles:** The main screen presents a collection of the latest Tesla-related news articles. Each article showcases an image, a headline, the name of the author, and the publication date.
- **Detailed View:** Tap on any article to read more about it. The detailed view will display the complete content of the news article along with its source.
- **Refresh:** Pull down the list to refresh and fetch the latest articles.

## 🔧 Technical Details

### Models

#### News

This struct represents the main API's response. It consists of:
- status
- totalResults
- articles

#### Article

Represents individual news items. It contains:
- source
- author
- title
- description
- url
- urlToImage
- publishedAt
- content

#### Source

Holds information about the originating news source. It comprises:
- id
- name

### Custom Cell

#### NewsCollectionViewCell

This is a custom UICollectionViewCell designed for the application. It contains outlets for the news image, headline, author name, and publication date. The design includes rounded corners for the image and utilizes the Roboto Slab font for the headline and author name.

### API Manager

#### APIManager

A singleton class (`shared`) responsible for API requests. It uses the `load` method to fetch data from the News API and parse it into Swift Codable structs. The `load` function uses a generic approach, meaning it can decode any Decodable type, ensuring versatility and reusability.

## 🌐 API Used

Fetching data from the News API, the endpoint is tailored to retrieve Tesla-centric news:

https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=YOUR_API_KEY

🔐 Make sure to replace YOUR_API_KEY with your actual News API key.

## 🎨 Extensions & Custom Views

The provided code highlights the use of custom views like UIImageView and UILabels in the NewsCollectionViewCell. Enhanced with the Roboto Slab font, they ensure a captivating visual experience. The image views come with rounded corners, elevating the aesthetic quality of the news thumbnails.

## 🤝 Contributing

Contributions are heartily welcome! Please follow these steps:

- 🍴 Fork this repository.
- 👯 Clone it to your local machine.
- 🔧 Make your changes and commit: git commit -m 'Describe your changes here'.
- 🚀 Push your branch: git push origin your-branch-name.
- 📝 Open a pull request.

