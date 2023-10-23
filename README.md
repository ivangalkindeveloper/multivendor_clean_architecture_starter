# multivendor_clean_architecture_starter
Multivendor starter and example for new Flutter project based on Clean Architecture.\
As an example, a display of facts about cats and dogs is implemented :)\
The starter uses an public [Cat-Facts API](https://alexwohlbruck.github.io/cat-facts/docs/) to get facts about animals.

## Getting Started
- [Vendor](#vendor)
  - [Benefits](#benefits)
  - [Requirements](#requirements)
  - [Before starting work with vendors](#before-starting-work-with-vendors)
  - [Add new vendor](#add-new-vendor)
  - [Switch vendor](#switch-vendor)
  - [Config registration](#config-registration)
  - [Why not flavors](#why-not-flavors)
- [Clean Architecture](#clean-architecture)
  - [Basis](#basis)
  - [Examples](#examples)
- [Project](#project)
  - [Used patterns](#used-patterns)
  - [Unrecommended patterns](#unrecommended-patterns)
  - [Structure](#structure)
- [Approaches](#approaches)
  - [Interfaces](#interfaces)
  - [Models](#models)
  - [Generation](#generation)
  - [Components](#components)
  - [Widget](#widget)
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
The environment change is implemented by [a shell script](https://github.com/ivangalkindeveloper/multivendor_clean_architecture_starter/blob/master/vendor/core/switch_vendor.sh).\
Current script changes the following environment properties:
- Project identificators (Android package, iOS bundleID, Linux applicationId, macOS bundleID);
- Application name (Android, iOS, Lunix, macOS, Web, Windows);
- Application icon (Android, iOS, Lunix, macOS, Web, Windows);
- Application splash screen (Android, iOS, Web);
- Third-party services.
And there are also examples of changing identifiers for [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk).
### Requirements
Make sure you have the [GNU sed](https://www.gnu.org/software/sed/) stream text editor installed.\
You can work with scripts from any available shell.
### Before starting work with vendors
Please carefully study how the core [script](https://github.com/ivangalkindeveloper/multivendor_clean_architecture_starter/blob/master/vendor/core/switch_vendor.sh) works to change the environment.\
You should modify this script to suit your needs so that the script uses only the materials and services you need.\
The script contains an example of using [Facebook Events](https://pub.dev/packages/facebook_app_events) and [FreshchatSDK](https://pub.dev/packages/freshchat_sdk) - these lines are commented out for your understanding, so that you also comment or add the necessary lines for your project to work.\
Also pay attention to [the vendor scripts](https://github.com/ivangalkindeveloper/multivendor_clean_architecture_starter/blob/master/vendor/VendorCat/switch.sh), which pass parameters for the operation of the core script.
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
The required names - splash_logo_android_12.png, splash_logo_android_12_dark.png.
  2.5. Splash screen logo for light and dark theme:\
The recommended size - no more than 400 in height.\
The required names - splash_logo.png, splash_logo_dark.png.
3. Add a script to change the environment.\
Repeat already created scripts for the environment and fill in the parameters that need to be updated.\
The last line is sure to run the core script.\
The required name - switch.sh.
4. Add a command to change the vendor in this README in the CLI section for quick convenience:
```sh
bash ./vendor/<new-vendor-folder-name>/switch.sh
```

About launcher icon see details [here](https://pub.dev/packages/flutter_launcher_icons) or splash screen see details [here](https://pub.dev/packages/flutter_native_splash).
### Switch vendor
To start the vendor environment change, run:
```sh
bash ./vendor/<vendor-folder-name>/switch.sh
```
### Config registration
Registration of the config occurs in different main fucntions through the arguments of the runner and initializer utilities in order to be able to change the environment locally and look at the generated application materials by running only the development environment.\
Made for the convenience for launching in VSСode and not through run commands.
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
### Basis
The main concept - the allocation of business rules as the core, low connectivity of modules and interaction with dependency inversion.\
Main layers of architecture:

![](https://hsto.org/r/w1560/web/22b/033/c50/22b033c50a144c7491662c8cd292fbab.jpg)

There is a rule in architecture - Dependency Rule.\
The rule interprets that the inner layers should not depend on the outer ones. That is, our business logic and application logic should not depend on presenters, UI, databases, etc. On the original diagram, this rule is depicted with arrows pointing inward.\
If we cut the layers according to this rule, we will get the following picture:\
![](https://hsto.org/r/w1560/web/fe8/c82/a32/fe8c82a32b1548b1a297187e24ae755a.png)

When applied to real projects, we get the following scheme, which is more clearly reflected in the interaction of layers:\
![](https://hsto.org/r/w1560/web/531/04c/89d/53104c89d9cf44a59c95e351b7485574.png)
### Examples
Many well-known companies and service products use clean architecture, for example:
* [Tivi](https://github.com/chrisbanes/tivi) - android application for watching series and movies. Tivi developers use the MVP architecture (Model-View-Presenter) for the practical implementation of Clean Architecture. They use the main activity, which is the View component, the Presenter component, which is in the middle layer and contains the business logic of the application, and the model component, which is in the lowest layer and processes data and network requests. Each of the layers in a Tivi application is as independent as possible from each other, so changes in one layer do not lead to unpredictable results in other components.
* [Saleor](https://github.com/saleor/saleor) - Python project, which is an open source electronic trading platform.
It is fully consistent with the principles and concepts of clean architecture. This project uses the Django framework as a complete model for implementing the Clean Architecture. In a Saleor project, each of the application components is divided into separate layers that manage separate aspects of the application logic.
* Draw - example of using Clean Architecture in C# projects. The developers decided to divide the system into three separate layers. The first layer contains the user interface and the data presentation layer. The next layer includes the application logic and the business logic application. The last layer contains classes related to data storage. Each of the layers in Draw is completely independent and can be easily changed without changing other layers.

If we are talking about a flutter project, there are repositories with good examples:
* [flutter-tdd-clean-architecture-course](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course);
* [flutter_clean_architecture](https://github.com/ShadyBoukhary/flutter_clean_architecture).

## Project
The main project directories are well suited for separating them into separate application modules.\
The project does not use the Presenter pattern, logic controllers using the popular BLoC state management are allocated as a separate directory.\
The BLoC is not a presenter, but is distinguished as a separate business application layer:

![](https://madewithflutter.net/wp-content/uploads/2022/11/architecture.png)

### Used patterns
The starter used the following programming patterns:
* Command - class-commands that explicitly display the purpose of use. Use cases are a special case of this pattern. Use cases are used in the layer as application business rules to explicitly show the entire operation of the application at the interaction level with all business rules embedded.
* Interactor - business logic implementation class, used as a replacement for use cases in favor of multiple class commands;
* Repository - a layer of interaction with data from different data sources;
* Data Access Object (DAO) - separates a data resource's client interface from its data access mechanisms.
### Unrecommended patterns
* Singletone - it is always better to control the necessary instances of the right classes, rather than making one for the entire life cycle of the application;
* Service Locator - the global typemap is an antipattern, since anything can happen to the objects inside the locator during the entire life cycle of the program, which leads to weakly tracked errors.
### Structure
The current state of the project is great for small to medium projects.\
The structure of the project clearly reflects the interaction of the layers of the architecture:
```
├─ asset/
│  ├──── font/    - text and icon fonts directory;
│  ├──── icon/    - application icon (reserved for vendor script);
│  ├──── l10n/    - localization arb files and untranslated fields;
│  ├──── splash/  - application splash screen (reserved for vendor script);
│  ├──── svg/     - svg files directory;
│  └──── vec/     - vec fiels directory;
│
├─ lib/
│  ├── generated/ - directory of all generated files (should be in .gitignore);
│  ├── main/      - main functions that launch the runner/initializer utility;
│  └── src/       - source directory;
│      │
│      ├── application/                   - application layer of widgets/elements/renderObjects and other view dependencies;
│      │   ├────────── router/            - router(s) of application;
│      │   └────────── widget/            - main directory of widgets;
│      │               ├──── application/ - root application widgets;
│      │               ├──── component/   - components directory/library;
│      │               ├──── dialog/      - dialogs directory;
│      │               ├──── modal/       - modals directory;
│      │               ├──── page/        - pages directory;
│      │               ├──── picker/      - dateTime/timeOfDay pickers directory;
│      │               ├──── scope/       - inherited scopes;
│      │               └──── snack_bar/    - snack bars directory;
│      │
│     <I>-<IEvent & IState>
│      ├── bloc/ - directory of application business logic;
│      │
│      ├── core/ - core directory, here is two independent layers - data and domain, as common data and datasources from the point of view of the program core, and domain - business entities and rules from the point of view of architecture;
│      │   │
│      │  <I>--<IHttpClient & IRepository & IApi & IDao>
│      │   ├─── data/                       - common data and datasources of the program core;
│      │   │    ├─── client/                - clents classes, for example - HTTP client;
│      │   │    │    └───── interceptor/    - interceptors for HTTP client;
│      │   │    ├─── data/                  - all core data models;
│      │   │    ├─── data_source/           - data sources directory;
│      │   │    │    ├───── api/            - api directory;
│      │   │    │    └───── database/       - database directory;
│      │   │    │           ├─────── dao/   - DAO(CRUD) database models;
│      │   │    │           └─────── table/ - tables of database;
│      │   │    └─── repository/            - repositories for working with datasources;
│      │   │
│      │  <I>--<IUseCase / IInteractor>
│      │   └─── domain/            - directory of domain (enterprise) business entities and rules;
│      │        ├───── entity/     - entities directory;
│      │        ├───── interactor/ - interactors directory;
│      │        └───── use_case/   - use cases directory;
│      │
│      └── utility/                 - utilities or helpers directory;
│          ├────── extension/       - extension directory (BuildContext, types and other);
│          ├────── initializer/     - initialization utility;
│          ├────── logger/          - application logger;
│          ├────── mixin/           - classes mixins;
│          ├────── platform/        - platform utilities or libraries;
│          │       ├─────── opener/ - open datasources library-utility;
│          │       └─────── runner/ - runner application library-utility;
│          └────── scope/           - scopes utilities;
│
├─ vendor/ - directory vendor for materials and scripts;
```
In the further development of the project, scalability is inevitable, so the necessary layers and components of the system are separated into separate packages and their changes are handled by individual developers or employees.\
Full batch scalability might look like this:
```
├─ asset/
├─ lib/
│  ├── generated/
│  ├── main/
│  └── src/
│      ├── application/
│      │   ├────────── router/
│      │   └────────── widget/
│      │               ├──── application/
│      │               ├──── dialog/
│      │               ├──── modal/
│      │               ├──── page/
│      │               ├──── picker/
│      │               ├──── scope/
│      │               └──── snackbar/
│      ├── core/
│      │   ├─── client/
│      │   │    └───── interceptor/
│      │   └─── database/
│      │        └─────── table/
│      └── utility/
│          └────── extension/
├─ package/
│  ├────── bloc/ <IEvent & IState>
│  ├────── component/
│  ├────── core/ 
│  │       ├── api/ <IApi>
│  │       ├── dao/ <IDao>
│  │       └── repository/ <IRepository>
│  ├────── domain/ 
│  │       ├───── entity/
│  │       ├───── interactor/ <IInteractor>
│  │       └───── use_case/ <IUseCase>
│  ├────── localization/
│  └────── utility/
│          ├────── initializer/
│          ├────── logger/
│          ├────── mixin/
│          ├────── platform/
│          │       ├─────── opener/
│          │       └─────── runner/
│          └────── scope/
├─ vendor/
```
### Adaptation
Each project is unique in its own way, both in its purpose, potential scale, ease of development and its developers.\
This repository contains only the essentials to get started, but there are some notes to understand development needs:
1) You can use Interactors instead of UseCases, or not use anything of this if you don’t see a need for them and use only BLoCs.\
In most cases, use cases are needed when a project is being developed using the Agile methodology and has properties that change periodically depending on the needs of the business.\
But do not forget what domain UseCase/Interactor can give:
- Displaying the interprayz logic will help the development to quickly figure out what the application should do;
- Generalization of large logic inside the BLoC instead of large functions;
- UseCase/Interactor interfaces can help implement polymorphic business logic behavior.\
If one BLoC is enough for you - use only BLoC.\
You can also describe it as application logic and enterprise logic, getting something like this:
```
├─ lib/
│  └── src/
│      └── core/
│          └─── domain/
│               ├───── bloc/
│               └───── entity/
```
2) Remember that all technologies used are implementation details, therefore, tying to the names in the directories with the packages used (bloc, provider, widget) is not always good, since technologies can change, and the project can continue to exist from business needs .

## Approaches
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
"Config" / "InitializatonStep" / "Database" - only core data of program;\
"Profile" / "Remittance"  "DocumentRequirements" - only domain business models and business rules;\
"Runner" / "Initializer" / "Mapper" / "Parser" - only utilities or helpers. 
#### Generation
Never mix generation code with main code.\
Keep the generation in a separate directory that is not tracked by GIT.
#### Components
Always make widget components with a prefix that specifies only the name of the project or target group of projects to understand that this component is custom from the standard Flutter widgets.\
For example, project name "financial_wallet" - FW:\
FWAppBar, FWPrimaryButton, FWText...\
Components should not contain business logic, but should only provide an API to manage them.\
You can pass any model to a component only if the model properties are needed only to display the component.
#### Widget
No need to create separate services for modals, dialogs and pickers.\
You just need separate widget classes, with static "show" method, in which the required field will be BuildContext.

## Misconceptions
A few misconceptions about Clean Architecture:
#### "Mandatory mapping between layers"
If you have a complex application with business logic and application logic, and/or different people working on different layers, then it's better to separate the data between layers (and map them).\
It is also worth doing if the server API is clumsy.\
But if you are working on a project alone, and it is a simple application, then do not complicate it with unnecessary mapping.\
This project has only DTO, DAO and business entities, ViewModels here, since this function is essentially performed by the BLoC as a presenter.
#### "Mapping only in the interactor"
Mapping of models should take place in the layer that should be provided to another in a form convenient for him.\
This is stated in [the original article](https://blog.cleancoder.com/uncle-bob/2011/11/22/Clean-Architecture.html).
```
So when we pass data across a boundary, it is always in the form that is most convenient for the inner circle.
```
Therefore, the data should get into the Interactor in the form it needs. Mapping takes place in the Interface Adapters layer, that is, in the Presenter and Repository.
#### "UseCases is useless"
The main problem is that use cases are special cases of the command pattern and a legacy of screaming architecture.\
This pattern and architecture are designed to explicitly display by classes which business functions and rules your application uses, so the options used are required to solve not technical problems, but architectural ones.\
If it seems to the developer that this approach is too tedious and useless, in this case, he can always combine all the business rules into an interactor.
Keep in mind that the book itself about Clean Architecture says just about the variety of use cases:
```
USE CASES
The first bullet—use cases—means that the architecture of the system must support the intent of the system. If the system is a shopping cart application, then the architecture must support shopping cart use cases. Indeed, this is the first concern of the architect, and the first priority of the architecture. The architecture must support the use cases. However, as we discussed previously, architecture does not wield much influence over the behavior of the system. There are very few behavioral options that the architecture can leave open. But influence isn’t everything. The most important thing a good architecture can do to support behavior is to clarify and expose that behavior so that the intent of the system is visible at the architectural level.
A shopping cart application with a good architecture will look like a shopping cart application. The use cases of that system will be plainly visible within the structure of that system. Developers will not have to hunt for behaviors, because those behaviors will be first-class elements visible at the top level of the system. Those elements will be classes or functions or modules that have prominent positions within the architecture, and they will have names that clearly describe their function.
Chapter 21, “Screaming Architecture,” will make this point much clearer.
```
And also about their decoupling and change for several reasons due to business needs:
```
DECOUPLING USE CASES
What else changes for different reasons? The use cases themselves! The use case for adding an order to an order entry system almost certainly will change at a different rate, and for different reasons, than the use case that deletes an order from the system. Use cases are a very natural way to divide the system. At the same time, use cases are narrow vertical slices that cut through the horizontal
layers of the system. Each use case uses some UI, some application-specific business rules, some application-independent business rules, and some database functionality. Thus, as we are dividing the system in to horizontal layers, we are also dividing the system into thin vertical use cases that cut through those layers. To achieve this decoupling, we separate the UI of the add-order use case from the UI of the delete-order use case. We do the same with the business rules, and with the database. We keep the use cases separate down the vertical height of the system. You can see the pattern here. If you decouple the elements of the system that change for different reasons, then you can continue to add new use cases without interfering with old ones. If you also group the UI and database in support of those use cases, so that each use case uses a different aspect of the UI and database, then adding new use cases will be unlikely to affect older ones.
```
For more on this approach, see [Ivar Jakobson](https://www.ivarjacobson.com/).
#### "Clean Architecture is not needed in small projects"
There is an opinion that it is not desirable to implement Clean Architecture on small projects, since its implementation can lead to a lot of time and effort spent on a small project that does not require much architectural attention.\
The author of this package does not agree with this opinion and believes that it is better to implement architecture on absolutely any applications, since any project will always be subject to scaling, development or just refinement.
#### "Clean Architecture is the correct construction of project directories"
Clean Architecture does not interpret the principles of building folders and directories.\
The main concept is written in the chapter above.

## Packages
### Recomended packages
Utility:
- [build_runner](https://pub.dev/packages/build_runner);

Data:
- [freezed](https://pub.dev/packages/freezed);
- [json_annotation](https://pub.dev/packages/json_annotation);
- [equatable](https://pub.dev/packages/equatable);

Asynchrony:
- [stream_transform](https://pub.dev/packages/stream_transform);
- [rxdart](https://pub.dev/packages/rxdart);
- [isolated_worker](https://pub.dev/packages/isolated_worker);

Networking:
- [dio](https://pub.dev/packages/dio);
- [web_socket_channel](https://pub.dev/packages/web_socket_channel);
- [signalr_core](https://pub.dev/packages/signalr_core);

Database:
- [sqflite](https://pub.dev/packages/sqflite);
- [drift](https://pub.dev/packages/drift);
- [shared_preferences](https://pub.dev/packages/shared_preferences);

State managment:
- [bloc](https://pub.dev/packages/bloc);
- [flutter_bloc](https://pub.dev/packages/flutter_bloc);

Widget:
- [flutter_platform_component](https://pub.dev/packages/flutter_platform_component);
- [animations](https://pub.dev/packages/animations);
- [flutter_staggered_animations](https://pub.dev/packages/flutter_staggered_animations);
- [rive](https://pub.dev/packages/rive);
- [funvas](https://pub.dev/packages/funvas);
- [graphx](https://pub.dev/packages/graphx);
- [auto_size_text](https://pub.dev/packages/auto_size_text);
- [pinput](https://pub.dev/packages/pinput);
- [flutter_svg](https://pub.dev/packages/flutter_svg);
- [lottie](https://pub.dev/packages/lottie);
- [dotted_border](https://pub.dev/packages/dotted_border);
- [badges](https://pub.dev/packages/badges);

Platform:
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash);
- [geolocator](https://pub.dev/packages/geolocator);
- [permission_handler](https://pub.dev/packages/permission_handler);
- [camera](https://pub.dev/packages/camera);
- [url_launcher](https://pub.dev/packages/url_launcher);
- [path](https://pub.dev/packages/path);
- [path_provider](https://pub.dev/packages/path_provider);
- [intl](https://pub.dev/packages/intl);
- [connectivity_plus](https://pub.dev/packages/connectivity_plus);
- [share_plus](https://pub.dev/packages/share_plus);
- [package_info_plus](https://pub.dev/packages/package_info_plus);
- [device_info_plus](https://pub.dev/packages/device_info_plus);
- [image_picker](https://pub.dev/packages/image_picker);
- [file_picker](https://pub.dev/packages/file_picker);

Service:
- [firebase_messaging](https://pub.dev/packages/firebase_messaging);
- [firebase_analytics](https://pub.dev/packages/firebase_analytics);
- [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics);
- [firebase_performance](https://pub.dev/packages/firebase_performance);
- [firebase_app_check](https://pub.dev/packages/firebase_app_check);
- [sentry](https://pub.dev/packages/sentry);

Test:
- [mockito](https://pub.dev/packages/mockito);
- [golden_toolkit](https://pub.dev/packages/golden_toolkit);
### Unrecomended packages
Data:
- [get_it](https://pub.dev/packages/get_it):\
A global type map that implements the Service-Locator pattern.\
Flutter is a DI framework that has a build context, so locator templates for these applications make no sense.

Database:
- [hive](https://pub.dev/packages/hive):\
A huge set of problems - complex testing, complex queries, migrations, performance and reliability problems (a known problem with database crashes in production).
- [isar](https://pub.dev/packages/isar):\
The problematic legacy of Hive.

State managment:
- [get](https://pub.dev/packages/get):\
The whole package is an anti-pattern, which itself is also based on the Service Locator.\
The package tries to be a state manager, a configurator and a repository at the same time. A huge bastard object, which is already a ban for use.\
Previously, it also had bugs that could only be discovered in production.
- [riverpod](https://pub.dev/packages/riverpod):\
Implementation of global variables and states.
- [hydrated_bloc](https://pub.dev/packages/hydrated_bloc):\
Implementation and stores of global states from database.

Widget:
- [flutter_hooks](https://pub.dev/packages/flutter_hooks):\
Violation of the functional programming paradigm, which in turn talks about the clean of functions, which should be clean, not affect any external variables and states.\
The build function in widgets should always be clean.

## CLI
#### Build runner
```
dart run build_runner build --delete-conflicting-outputs
dart run build_runner build
```
#### Vendor switch
```sh
bash ./vendor/vendor_cat/switch.sh
bash ./vendor/vendor_dog/switch.sh
```
#### Vendor build
```sh
bash ./vendor/vendor_cat/build_apk.sh
bash ./vendor/vendor_cat/build_appbundle.sh
bash ./vendor/vendor_cat/build_ipa.sh
bash ./vendor/vendor_cat/build_web.sh

bash ./vendor/vendor_dog/build_apk.sh
bash ./vendor/vendor_dog/build_appbundle.sh
bash ./vendor/vendor_dog/build_ipa.sh
bash ./vendor/vendor_dog/build_web.sh
```