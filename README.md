# iOS WeatherApp using VIPER Architecture

![WeatherApp](WeatherAppScreenshot.png)

This is an iOS WeatherApp that displays the current weather using the VIPER architecture. VIPER is a design pattern commonly used in iOS applications to achieve better separation of concerns and maintainability.

## Getting Started

To get started with this project, follow the steps below:

### Prerequisites

Before you begin, ensure you have the following installed on your development machine:

### Installation

1. Clone the repository to your local machine using the following command:
2. Open the project in Xcode by double-clicking the .xcodeproj file.
3. Build and run the app on a simulator or a physical iOS device.

## Architecture

This WeatherApp is built using the VIPER architecture, which stands for:

- **View:** The user interface layer responsible for displaying data and handling user interactions.
- **Interactor:** Contains the business logic of the app, responsible for fetching and processing data.
- **Presenter:** Acts as an intermediary between the Interactor and the View, responsible for formatting data for display.
- **Entity:** Represents the data models used in the app.
- **Router:** Handles navigation and routing between different modules.

Here's an overview of how the VIPER components are used in this project:

- **ForecastInteractor:** Contains the logic for fetching the current weather data and communicates with the GetForecastUseCase.

- **ForecastPresenter:** Acts as a bridge between the Interactor and the View, formatting and presenting weather data.

- **ForecastViewController:** The View layer, responsible for displaying the temperature and handling UI interactions.

- **ForecastConfigurator:** Configures and assembles the VIPER components.
