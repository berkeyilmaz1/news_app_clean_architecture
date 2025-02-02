# 📰 News App Clean Architecture

This is a basic **"News App"** project that uses **Clean Architecture** and **Riverpod** for state management. 🚀


## 🎥 App Video

 https://github.com/user-attachments/assets/ffc7eea9-dbe4-4dca-aabd-156bb8f9b30a



## ✨ Features

✅ **News List:** Displays the related news that given query from the user with **pagination**.  
✅ **News Detail:** Displays the basic information and images of the selected news.



## 📂 Project Structure

The project is organized into the following layers:

📌 **Data Layer:** Handles data sources such as APIs and local databases.  
📌 **Domain Layer:** Contains the business logic.  
📌 **Presentation Layer:** The UI components, using the Flutter framework.  



## 🛠 The Libraries and Technologies

### 🔹 **State Management**
- 🏗 **flutter_riverpod:** A flexible and powerful state management solution for Flutter.

### 🔹 **Dependency Injection**
- 🧩 **get_it:** A simple service locator for dependency injection.

### 🔹 **Networking & API**
- 🌐 **dio:** A powerful HTTP client for making API requests.
- 📜 **pretty_dio_logger:** Adds logging capabilities to Dio requests for better debugging.

### 🔹 **Cache**
- 📦 **hive:** A lightweight and fast key-value database for Flutter.
- 🐝 **hive_flutter:** Hive integration with Flutter.
- 🖼 **cached_network_image:** A widget that downloads and caches network images.

### 🔹 **Value Equality**
- ⚖️ **equatable:** Simplifies value comparison for objects by overriding equality methods.

### 🔹 **Code Quality**
- 🏆 **very_good_analysis:** Enforces lint rules for Flutter projects to ensure high-quality code.

### 🔹 **UI & Animations**
- 🎨 **lottie:** Displays Lottie animations in Flutter for rich, interactive UI elements.

### 🔹 **Functional Programming**
- 🎭 **dartz:** A library for functional programming concepts like Option and Either.

### 🔹 **Config**
- 🛠 **envied:** A package for managing environment variables in a strongly typed manner.

### 🔹 **Build & Code Generation**
- ⚡ **build_runner:** A tool for generating code, including serializers and more.
- 🏗 **hive_generator:** Code generator for Hive type adapters.
- 🔑 **envied_generator:** Code generator for environment variable classes.



## 🌍 API Usage

### 📡 Get All News

```http
GET /everything
Base URL: newsapi.org/v2
```

| 🏷 Parameter | 🔠 Type     | 📖 Explanation                |
| :---------- | :-------- | :------------------------- |
| `api_key`  | `string`  | 🔑 **API KEY** |
| `q`        | `string`  | 🔎 **The query that will be searched** |
| `page`     | `string`  | 📄 The page number will be provided by the app.|
| `pageSize` | `string`  | 📏 The page size will be provided by the app.|

