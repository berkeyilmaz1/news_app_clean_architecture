
# News App Clean Architecture

This is a basic **"News App"** project that uses Clean Architecture and Riverpod for state management.

## Images

## Features

* **News List:** Displays the related news that given query from the user.

* **News Detail:** Display the basic informations and images of the selected news.
 

## Project Structure

 
The project is organized into the following layers:

**Data Layer:** Handles data sources such as APIs and local databases.

**Domain Layer:** Contains the business logic.

**Presentation Layer:** The UI components, using the flutter framework.
## The Libraries and Technologies

* **State Management**
  * **flutter_riverpod:** A flexible and powerful state management solution for Flutter.

* **Dependency Injection**
  * **get_it:** A simple service locator for dependency injection.

* **Networking & API**
  * **dio:** A powerful HTTP client for making API requests.
  * **pretty_dio_logger:** Adds logging capabilities to Dio requests for better debugging.

* **Cache**
  * **hive:** A lightweight and fast key-value database for Flutter.
  * **hive_flutter:** Hive integration with Flutter.
  * **cached_network_image:** A widget that downloads and caches network images.

* **Value Equality**
  * **equatable:** Simplifies value comparison for objects by overriding equality methods.

* **Code Quality**
  * **very_good_analysis:** Enforces lint rules for Flutter projects to ensure high-quality code.

* **UI & Animations**
  * **lottie:** Displays Lottie animations in Flutter for rich, interactive UI elements.

* **Functional Programming**
  * **dartz:** A library for functional programming concepts like Option and Either.

* **Config**
  * **envied:** A package for managing environment variables in a strongly typed manner.

 

* **Build & Code Generation**
  * **build_runner:** A tool for generating code, including serializers and more.
  * **hive_generator:** Code generator for Hive type adapters.
  * **envied_generator:** Code generator for environment variable classes.

## API Kullanımı

#### Tüm öğeleri getir

```http 
> newsapi.org/v2
  GET /everything
```

| Parametre | Tip     | Açıklama                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Gerekli**. API KEY|
| `q` | `string` | **Gerekli**. Query that will be search.|
| `page` | `string` | The page number will be provided by the app.|
| `pageSize` | `string` | The page size will be provided by the app.|



  
