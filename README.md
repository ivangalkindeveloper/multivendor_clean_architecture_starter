# multivendor_clean_architecture_starter
Multivendor starter and example for new Flutter project based on Clean Architecture.\
As an example, a display of facts about cats and dogs is implemented :)\
The starter uses an public [Cat-Facts API](https://alexwohlbruck.github.io/cat-facts/docs/) to get facts about animals.

## Getting Started
- [Vendor](#vendor)
  - [Benefits](#benefits)
  - [Requirements](#requirements)
  - [Before starting work with vendors](#before-starting-work-with-vendors)
  - [Add new vendor environment](#add-new-vendor)
  - [Switch vendor](#switch-vendor)
  - [Config registration](#config-registration)
  - [Why not flavors](#why-not-flavors)
- [Clean Architecture](#clean-architecture)
  - [Examples](#examples)
  - [Used patterns](#used-patterns)
  - [Unrecommended patterns](#unrecommended-patterns)
  - [Structure](#structure)
  - [Approaches](#approaches)
    - [Interfaces](#interfaces)
    - [Models](#models)
    - [Generation](#generation)
  - [Misconceptions](#misconceptions)
- [Packages](#packages)
  - [Recomended packages](#recomended-packages)
  - [Unrecommended packages](#unrecomended-packages)
- [CLI](#cli)
  - [Build runner](#build-runner)
  - [Vendor](#vendor)
  - [Build](#build)

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
- Third-party services.

And there are also examples of changing identifiers for [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk).
### Requirements
Make sure you have the [GNU sed](https://www.gnu.org/software/sed/) stream text editor installed.\
You can work with scripts from any available shell.
### Before starting work with vendors
Please carefully study how the core [script](https://github.com/ivangalkindeveloper/multi_vendor_starter/blob/master/lib/vendor/core/switch_vendor.sh) works to change the environment.\
You should modify this script to suit your needs so that the script uses only the materials and services you need.\
The script contains an example of using [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk) - these lines are commented out for your understanding, so that you also comment or add the necessary lines for your project to work.\
Also pay attention to [the vendor scripts](https://github.com/ivangalkindeveloper/multi_vendor_starter/blob/master/lib/vendor/VendorCat/switch.sh), which pass parameters for the operation of the core script.
### Add new vendor
In order to create a new vendor environment, you need the following:
1. Create a folder with the vendor name in the directory ./lib/vendor/;
2. Collect the following materials in the created folder:\
  2.1. Firebase services files - google-services.json, GoogleService-Info.plist.\
  2.2. Application icon:\
The recommended size - 1024x1024.\
The required name - icon.png.\
  2.3. Splash screen background for light and dark theme:\
The recommended size - 375x812.\
The required names - splash_background.png, splash_background_dark.png.\
  2.4. Splash screen logo for Android 12 for light and dark theme:\
The recommended size - 1152x1152.\
The required names - splash_logo_android_12.png, splash_logo_android_12_dark.png.\
  2.5. Splash screen logo for light and dark theme:\
The recommended size - no more than 400 in height.\
The required names - splash_logo.png, splash_logo_dark.png.\
3. Add a script to change the environment.\
Repeat already created scripts for the environment and fill in the parameters that need to be updated.\
The last line is sure to run the core script.\
The required name - switch.sh.\
4. Add a command to change the vendor in this README in the CLI section for quick convenience:
```sh
bash ./lib/vendor/<new-vendor-folder-name>/switch.sh
```

About launcher icon see details [here](https://pub.dev/packages/flutter_launcher_icons) or splash screen see details [here](https://pub.dev/packages/flutter_native_splash).
### Switch vendor
To start the vendor environment change, run:
```sh
bash ./lib/vendor/<vendor-folder-name>/switch.sh
```
### Config registration
Registration of the config occurs in different main fucntions through the arguments of the runner and initializer utilities in order to be able to change the environment locally and look at the generated application materials by running only the development environment.\
Made for the convenience for launching in VS Сode and not through run commands.
### Why not flavors
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

## Clean Architecture
The starter is based on [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).\
Clean Architecture - a combination of concepts, principles and approaches taken from all past architectures (Layered, Screaming, DDD, Hexagonal and Onion) to be combined into one architecture that ensures the correct delegation of responsibility and, as a result, easy scaling of the project.\
This is clearly reflected in the interaction of the main layers of the project, the chosen dependency stack and even the directory structure.\
At the moment, this is the best architecture that is suitable not only for enterprise projects, but also for any Flutter projects for proper project scalability.
### Examples
Many well-known companies and service products use clean architecture, for example:\
* [Tivi](https://github.com/chrisbanes/tivi) - android application for watching series and movies. Tivi developers use the MVP architecture (Model-View-Presenter) for the practical implementation of Clean Architecture. They use the main activity, which is the View component, the Presenter component, which is in the middle layer and contains the business logic of the application, and the model component, which is in the lowest layer and processes data and network requests. Each of the layers in a Tivi application is as independent as possible from each other, so changes in one layer do not lead to unpredictable results in other components.
* [Saleor](https://github.com/saleor/saleor) - Python project, which is an open source electronic trading platform.
It is fully consistent with the principles and concepts of clean architecture. This project uses the Django framework as a complete model for implementing the Clean Architecture. In a Saleor project, each of the application components is divided into separate layers that manage separate aspects of the application logic.\
* Draw - example of using Clean Architecture in C# projects. The developers decided to divide the system into three separate layers. The first layer contains the user interface and the data presentation layer. The next layer includes the application logic and the business logic application. The last layer contains classes related to data storage. Each of the layers in Draw is completely independent and can be easily changed without changing other layers.

If we are talking about a flutter project, there are repositories with good examples:
* [flutter-tdd-clean-architecture-course](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course);
* [flutter_clean_architecture](https://github.com/ShadyBoukhary/flutter_clean_architecture).
### Layers




### Used patterns
The starter used the following programming patterns:
* Presenter - classes that implement logic only for representing data;
* Command - class-commands that explicitly display the purpose of use. Use cases are a special case of this pattern. Use cases are used in the layer as application business rules to explicitly show the entire operation of the application at the interaction level with all business rules embedded.
* Interactor - business logic implementation class, used as a replacement for use cases in favor of multiple class commands.
* Repository - a layer of interaction with data from different data sources;
* Data Access Object (DAO) - separates a data resource's client interface from its data access mechanisms.
### Unrecommended patterns
* Service Locator - the global typemap is an antipattern, since anything can happen to the objects inside the locator during the entire life cycle of the program, which leads to weakly tracked errors.
### Structure
The structure of the project clearly reflects the interaction of the layers of the architecture:
```
lib/
    generated/    - directory of all generated files (should be in .gitignore);
    main/     - main functions that launch the runner/initializer utility.
    src/    - main source directory;
        core/     - core directory, here is two independent layers - data and domain, as common data and datasources from the point of view of the program core, and domain - business entities and rules from the point of view of architecture;
    -----------------------------------------
            data/     - common data and datasources of the program core;
                client/     - clents classes, for example - API client;
                      interceptor/    - interceptors for api client;
                data/   - data models;
                repository/     - repositories for working with datasources;
                source/     - datasources directory;
                      api/    - api datasources;
                      database/     - database directory;
                              dao/    - DAO(CRUD) database models;
                              table/    - tables of database;
    <I>-----------------------------------------<I>
            domain/     - business entities and rules;
                  entity/     - entities directory;
                  interactor/     - interactor directory;
                  use_case/     - use cases directory;
    <I>-----------------------------------------<I>
        presentation/     - presentation/view layer;
                    application/    - root application widget;
                    component/    - components directory;
                    feature/    - main directory of presentation activities and presenters;
                            dialog/     -  dialogs directory;
                            modal/    -  modals directory;
                            page/     - pages and presenters directory;
                            picker/     -  dateTime or timeOfDay pickers directory;
                    l10n/     - localization arb files and untranslated fields;
                    router/     - router(s) of application;
    -----------------------------------------
    utility/    - utilities or helpers directory;
            extension/    - extension directory (BuildContext, types and other);
            initializer/    - initialization library-utility;
            logger/     - application ligger;
            mixin/    - classes mixins;
            opener/     - open datasources library-utility;
            runner/     - runner application library-utility;
    vendor/     - directory vendor for materials and scripts;
```

### Approaches
Existing good approaches to the implementation of the project, which help to better navigate the project code:
#### Interfaces
All interface classes are written with an "I" prefix.\
This helps to determine that a given class is definitely an interface and cannot be an object.\
there is also an approach to add the "Impl" postfix for classes that are implementations of this interface, but the author does not consider this mandatory, since it is clear that any class without the "I" prefix is ​​some kind of implementation and model, even without an interface.
It makes no sense to separate the interfaces on which implementations in the singular are implemented into different files.\
Put the interface itself and its only implementation in one file, it's more convenient.
#### Models
It is desirable to use the generation of deserialization and serialization of models - that gives minimization of errors associated with this process.\
It is customary to share the following data names and their responsibility:\
Data Tranfser Object (DTO postfix) - data received only from the API;\
Data Access Object (DAO postfix) - data access only from database;\
"Config" \ "InitializatonStep" \ "Database" - only core data of program;\
"Profile" \ "Remittance" \ "DocumentFlow" - only domain business models and rules;\
"Runner" \ "Initializer" \ "Mapper" - only utilities or helpers.
#### Generation
Never mix generation code with main code.\
Keep the generation in a separate directory that is not tracked by GIT.
#### Components
Always make widget components with a prefix that specifies only the name of the project or target group of projects to understand that this component is custom from the standard Flutter widgets.\
For example, project name "financial_wallet" - FW:\
FWAppbar, FWrimaryButton, FWText...\
Components should not contain business logic, but should only provide an API to manage them.\
You can pass any model to a component only if the model properties are needed only to display the component.

### Misconceptions
A few misconceptions about Clean Architecture:
#### "Mandatory mapping between layers"
If you have a complex application with business logic and application logic, and/or different people working on different layers, then it's better to separate the data between layers (and map them).\
It is also worth doing if the server API is clumsy.\
But if you are working on a project alone, and it is a simple application, then do not complicate it with unnecessary mapping.\
This project has only DTO, DAO and business entities, ViewModels here, since this function is essentially performed by the BLoC as a presenter.
#### "Mapping only in the interactor"
Mapping of models should take place in the layer that should be provided to another in a form convenient for him.\
This is stated in [the original article](https://blog.cleancoder.com/uncle-bob/2011/11/22/Clean-Architecture.html).\
"So when we pass data across a boundary, it is always in the form that is most convenient for the inner circle."\
Therefore, the data should get into the Interactor in the form it needs. Mapping takes place in the Interface Adapters layer, that is, in the Presenter and Repository.
#### "UseCases is useless"
The main problem is that use cases are special cases of the command pattern and a legacy of flashy architecture.\
This pattern and architecture are designed to explicitly display by classes which business functions and rules your application uses, so the options used are required to solve not technical problems, but architectural ones.\
If it seems to the developer that this approach is too tedious and useless, in this case, he can always combine all the business rules into an interactor.
#### "Clean Architecture is not needed in small projects"
There is an opinion that it is not desirable to implement Clean Architecture on small projects, since its implementation can lead to a lot of time and effort spent on a small project that does not require much architectural attention.\
The author of this package does not agree with this opinion and believes that it is better to implement architecture on absolutely any applications, since any project will always be subject to scaling, development or just refinement.

## Packages
### Recomended packages
### Unrecomended packages


## CLI
#### Build runner
```
dart run build_runner build --delete-conflicting-outputs
dart run build_runner build
```
#### Vendor
```sh
bash ./lib/vendor/VendorCat/switch.sh
bash ./lib/vendor/VendorDog/switch.sh
```
#### Build
```
flutter build web -t lib/main/main_vendor_cat.dart --release --no-tree-shake-icons
flutter build web -t lib/main/main_vendor_dog.dart --release --no-tree-shake-icons

flutter build web -t lib/main/main_vendor_cat.dart --release
flutter build web -t lib/main/main_vendor_dog.dart --release

flutter build web -t lib/main/main_vendor_cat.dart
flutter build web -t lib/main/main_vendor_dog.dart
```