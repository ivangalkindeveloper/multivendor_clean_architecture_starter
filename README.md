# multi_vendor_starter
Multi vendor starter(example) for new project based on Clean Architecture.\
As an example, a display of facts about cats and dogs is implemented :)

## Vendor
This project has the ability to completely change the vendor environment.\
Under vendors, not only specific vendors of one application can be implemented (for example, as an implementation of an "white-label" application), but also a canonical approach to "Development" and "Production" environments.
### Benefits
It allows you to have one project that can change the complete application environment depending on the vendor, while having only one Dart codebase.\
The environment change is implemented by [a shell script](https://github.com/ivangalkindeveloper/multi_vendor_starter/blob/master/lib/vendor/core/switch_vendor.sh).\
Current script changes the following environment properties:
- Android package;
- iOS and macOS bundleID;
- Application name;
- Application icon;
- Application splash screen (light & dark theme);
- Firebase services.
And there are also examples of changing identifiers for [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk).
### Requirements
Make sure you have the [GNU sed](https://www.gnu.org/software/sed/) stream text editor installed.\
You can work with scripts from any available shell.
### Before starting work with vendors
Please carefully study how the core [script](https://github.com/ivangalkindeveloper/multi_vendor_starter/blob/master/lib/vendor/core/switch_vendor.sh) works to change the environment.\
You should modify this script to suit your needs so that the script uses only the materials and services you need.\
The script contains an example of using [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk) - these lines are commented out for your understanding, so that you also comment or add the necessary lines for your project to work.\
Also pay attention to [the vendor scripts](https://github.com/ivangalkindeveloper/multi_vendor_starter/blob/master/lib/vendor/VendorCat/switch.sh), which pass parameters for the operation of the core script.
### Add new vendor environment
In order to create a new vendor environment, you need the following:

1) Create a folder with the vendor name in the directory ./lib/vendor/;
2) Collect the following materials in the created folder:\
2.1) Firebase services files - google-services.json, GoogleService-Info.plist.\
2.2) Application icon:\
The recommended size - 1024x1024.\
The required name - icon.png.\
2.3) Splash screen background for light and dark theme:\
The recommended size - 375x812.\
The required names - splash_background.png, splash_background_dark.png.\
2.4) Splash screen logo for Android 12 for light and dark theme:\
The recommended size - 1152x1152.\
The required names - splash_logo_android_12.png, splash_logo_android_12_dark.png.\
2.5) Splash screen logo for light and dark theme:\
The recommended size - no more than 400 in height.\
The required names - splash_logo.png, splash_logo_dark.png.\
3) Add a script to change the environment.\
Repeat already created scripts for the environment and fill in the parameters that need to be updated.\
The last line is sure to run the core script.\
The required name - switch.sh.\
4) Add a command to change the vendor in this README in the CLI section for quick convenience:
```sh
bash ./lib/vendor/<new-vendor>/switch.sh
```
About launcher icon see details [here](https://pub.dev/packages/flutter_launcher_icons) or splash screen see details [here](https://pub.dev/packages/flutter_native_splash).
### Switch vendor environment
To start the vendor change, run:
```sh
bash ./lib/vendor/<vendor-name>/switch.sh
```
### Config registration
Registration of the config occurs in different main fucntions through the arguments of the runner and initializer utilities in order to be able to change the environment locally and look at the generated application materials by running only the development environment.\
Made for the convenience for launching in VS Сode and not through run commands.
### Why not flavors?
Flavors are not able to generate vendor application materials and do not know how to work with third-party services, but simply control the launch of the application only in the config part.\
This applies to the following packages:
* [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr);
* [flutter_flavor](https://pub.dev/packages/flutter_flavor);
* [flavor](https://pub.dev/packages/flavor);
* [flavor_text](https://pub.dev/packages/flavor_text);
* [enviroment_flavor](https://pub.dev/packages/enviroment_flavor);
* [go_flavor](https://pub.dev/packages/go_flavor);
* [flavor_config](https://pub.dev/packages/flavor_config);
* [flutter_app_environment](https://pub.dev/packages/flutter_app_environment);
* [environment_config](https://pub.dev/packages/environment_config).


## Architecture
The project is based on [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).\
This is clearly reflected in the interaction of the main layers of the project, the chosen dependency stack and even the directory structure.\
At the moment, this is the best architecture that is suitable not only for enterprise projects, but also for any flutter projects for proper project scalability.
### Clean Architecture examples
Many well-known companies and service products use clean architecture, for example:\
* [Tivi](https://github.com/chrisbanes/tivi) - android application for watching series and movies. Tivi developers use the MVP architecture (Model-View-Presenter) for the practical implementation of Clean Architecture. They use the main activity, which is the View component, the Presenter component, which is in the middle layer and contains the business logic of the application, and the model component, which is in the lowest layer and processes data and network requests. Each of the layers in a Tivi application is as independent as possible from each other, so changes in one layer do not lead to unpredictable results in other components.
* [Saleor](https://github.com/saleor/saleor) - Python project, which is an open source electronic trading platform.
It is fully consistent with the principles and concepts of clean architecture. This project uses the Django framework as a complete model for implementing the Clean Architecture. In a Saleor project, each of the application components is divided into separate layers that manage separate aspects of the application logic.\
Draw - example of using Clean Architecture in C# projects. The developers decided to divide the system into three separate layers. The first layer contains the user interface and the data presentation layer. The next layer includes the application logic and the business logic application. The last layer contains classes related to data storage. Each of the layers in Draw is completely independent and can be easily changed without changing other layers.\

If we are talking about a flutter project, then there are repositories with good examples:
* [flutter-tdd-clean-architecture-course](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course);
* [flutter_clean_architecture](https://github.com/ShadyBoukhary/flutter_clean_architecture).
### Used patterns
The project uses the following programming patterns:
* Presenter - classes that implement logic only for representing data;
* Command - class-commands that explicitly display the purpose of use. Use cases are a special case of this pattern. Use cases are used in the layer as application business rules to explicitly show the entire operation of the application at the interaction level with all business rules embedded.
* Interactor - business logic implementation class, used as a replacement for use cases in favor of multiple class commands.
* Repository - a layer of interaction with data from different data sources.
### Unrecommended patterns
* Service Locator - the global typemap is an antipattern, since anything can happen to the objects inside the locator during the entire life cycle of the program, which leads to weakly tracked errors.

## Package dependecies
### Recomended packages
### Unrecomended packages


## CLI
### Build
```
flutter build web -t lib/main/main_vendor_cat.dart --release --no-tree-shake-icons
flutter build web -t lib/main/main_vendor_dog.dart --release --no-tree-shake-icons

flutter build web -t lib/main/main_vendor_cat.dart --release
flutter build web -t lib/main/main_vendor_dog.dart --release

flutter build web -t lib/main/main_vendor_cat.dart
flutter build web -t lib/main/main_vendor_dog.dart
```
### Build runner
```
dart run build_runner build --delete-conflicting-outputs
dart run build_runner build
```
### Vendor
```sh
bash ./lib/vendor/VendorCat/switch.sh
bash ./lib/vendor/VendorDog/switch.sh
```