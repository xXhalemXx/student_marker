# Student Marker
Student Marker is an app designed to simplify the process of taking attendance for students. used with [E-sheet](https://github.com/xXhalemXx/E-sheet) where students using it to mark attendance.

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Installation](#installation)
- [Credits](#credits)
- [Contributing](#contributing)
- [Contact](#contact)

## Introduction

Student marker addresses the challenge of taking attendance without access to faculty database. It offers a novel method to input data without relying on a database and establishes efficient device-to-device communication. During the development of this app, I acquired skills in clean architecture, component separation, responsive screen design, local database management, accessing phone storage, and handling required permissions.

  20. result in excel file will be like.
## Usage

### Initial Setup
1. Upon the first launch, you will see the initial setup screen.
<p align="center">
<img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image1.jpg"  width="300" height="600">
 
2. Once you enter your ID will ask for permissions if required.
<p align="center">
<img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image2.jpg"  width="300" height="600">

 3. After providing all required permissions will open this page..
<p align="center">
<img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image3.jpg"  width="300" height="600">
 
### Editing Your ID
4. To edit your ID ,press on edit button.
<p align="center">
<img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image4.jpg"  width="300" height="600">

 ### Taking Attendance
5. To take attendance press on connection button ,will start scan to available course created by [E-sheet](https://github.com/xXhalemXx/E-sheet) .
<p align="center">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image5.jpg"  width="300" height="600">
 
6. Once course found will show like this.
<p align="center">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image6.jpg"  width="300" height="600">

7. Loading while connecting and check if u rolled in this course.
<p align="center">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image7.jpg"  width="300" height="600">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image8.jpg"  width="300" height="600">

8. Different respond message depend in your state .
<p align="center">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image9.jpg"  width="300" height="600">
 <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image10.jpg"  width="300" height="600">
  <img src="https://github.com/xXhalemXx/student_marker/blob/master/AppScreenShots/image11.jpg"  width="300" height="600">

## Credits
one of most important helpers third-party packages i will list them in next table 
| Dependency              | Version   | Purpose                                 |
|-------------------------|-----------|-----------------------------------------|
| build_runner            | ^2.4.6    | Code generation for Flutter             |
| nearby_connections      | ^4.0.1    | Establishing nearby device connections  |
| flutter_bloc            | ^8.1.3    | State management with BLoC pattern     |
| auto_size_text          | ^3.0.0    | Dynamically size text in UI             |
| flutter_styled_toast    | ^2.2.1    | Custom toast notifications              |
| bloc                    | ^8.1.2    | State management library (BLoC)        |
| freezed                 | ^2.4.3    | Code generation for immutable classes  |
| get_it                  | ^7.6.4    | Dependency injection                    |
| shared_preferences      | ^2.2.1    | Persistent key-value storage            |
| flutter_native_splash   | ^2.3.2    | Custom splash screens                   |
| flutter_gen             | 5.3.2     | Code generation for asset management   |
| device_preview          | ^1.1.0    | Preview UI on different devices         |
| device_information      | ^0.0.4    | Access device information               |
| permission_handler      | ^11.0.0   | Manage runtime permissions              |


 
 
## Installation

To run this app, you need to have Flutter installed on your machine. You can follow the  [official documentation](https://www.freecodecamp.org/news/how-to-write-a-good-readme-file/)  to set up Flutter.

To run the app on an emulator or a physical device, run the following command in the terminal:

```bash
flutter run

```


To build the app for production, run the following command in the terminal:

```bash
flutter build apk

```


## Contributing

This project is open for contributions. If you want to contribute to this project, please follow these steps:

-   Fork this repository
-   Create a branch with your feature or bug fix name
-   Commit and push your changes
-   Create a pull request

## Contact

If you have any questions or feedback, please feel free to contact me at mohamedhalem909@gmail.com.
