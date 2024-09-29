# Temperature Converter App

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Architecture](#architecture)
4. [Components](#components)
5. [Installation](#installation)
6. [Usage](#usage)
7. [Contributing](#contributing)
8. [License](#license)

## Introduction

The Temperature Converter App is a Flutter-based mobile application designed to convert temperatures between Fahrenheit and Celsius. This app provides a user-friendly interface for quick and accurate temperature conversions, making it useful for students, travelers, or anyone needing to switch between these two common temperature scales.

## Features

- Convert temperatures from Fahrenheit to Celsius and vice versa
- User-friendly interface with radio buttons for selecting conversion type
- Input field for entering temperature values
- Conversion button to trigger the calculation
- Display of converted temperature with two decimal places
- Conversion history log
- Responsive design that adapts to both portrait and landscape orientations

## Architecture

The app follows a simple, single-page architecture typical of small Flutter applications. It consists of:

1. **Main App Widget (`MyApp`)**: Sets up the application theme and initial route.
2. **Temperature Converter Widget (`TemperatureConverter`)**: The primary stateful widget that contains all the UI elements and logic for the converter.

The app uses Flutter's built-in state management solution with `StatefulWidget` and `setState()` for handling user interactions and updating the UI.

## Components

### MyApp (StatelessWidget)
- Serves as the root of the application
- Sets up the MaterialApp with the app's theme and home page

### TemperatureConverter (StatefulWidget)
- The main page of the application
- Contains all UI elements and conversion logic

#### State Variables
- `isFahrenheitToCelsius`: Boolean to track the selected conversion type
- `_temperatureController`: TextEditingController for managing input
- `_result`: String to store the conversion result
- `_history`: List of strings to maintain conversion history

#### Methods
- `_convert()`: Performs the temperature conversion based on the input and selected conversion type
- `build()`: Constructs the UI of the application

#### UI Elements
- Radio buttons for selecting conversion type
- Text field for temperature input
- Convert button
- Result display
- Scrollable history log

## Installation

1. Ensure you have Flutter installed on your system. If not, follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. Clone this repository:
   ```
   git clone https://github.com/yourusername/temperature_converter_app.git
   ```
3. Navigate to the project directory:
   ```
   cd temperature_converter_app
   ```
4. Get the dependencies:
   ```
   flutter pub get
   ```
5. Run the app:
   ```
   flutter run
   ```

## Usage

1. Launch the app on your device or emulator.
2. Select the desired conversion type using the radio buttons (F to C or C to F).
3. Enter the temperature value you wish to convert in the text field.
4. Press the "Convert" button to see the result.
5. The converted temperature will be displayed, and the conversion will be added to the history log.

## Contributing

Contributions to improve the Temperature Converter App are welcome. Please follow these steps to contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
5. Push to the branch (`git push origin feature/AmazingFeature`)
6. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
