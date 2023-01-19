# Weather

## About
The Weather application, in which the user can see a list of cities with a degree of temperature and rainfall. You can also add new cities, delete and search for already added ones. By clicking on the cell, you can go to the detailed information screen. 
The application takes into account two languages (Localizable.strings): English and Russian.

[URL for request](https://yandex.ru/dev/weather/doc/dg/concepts/forecast-test.html)

## Application Structure
1. LaunchScreen (Animation)
2. MainScreen
    * Searching
    * Adding
3. DetailScreen

## Stack
* UIKit
* Lottie
* SwiftSVG
* CoreLocation

## Start
1. Run the project
2. Click on the searchBar on the navigationBar or addIcon
4. To go to the Detail, click the cell

## Implementation details:
- [X] MainTableViewController. UITableView with searchBar and addIcon.
- [X] DetailViewController. Detailed information about the weather in the city.

## Screen
<img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 01 21" src="https://user-images.githubusercontent.com/99760600/213398337-f723f08f-beee-462c-b15f-9ab3f428b8e9.png"> <img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 01 18" src="https://user-images.githubusercontent.com/99760600/213398364-89b1dd6f-6d4d-4921-b51a-f8d52973c36f.png"> 
<img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 01 26" src="https://user-images.githubusercontent.com/99760600/213398411-2042db8e-1f5d-451e-8560-14f16d947966.png"> <img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 01 42" src="https://user-images.githubusercontent.com/99760600/213398452-9da679f1-ba2b-4676-820a-220eefa0c285.png"> 
<img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 02 01" src="https://user-images.githubusercontent.com/99760600/213398511-16d830cb-839f-4823-ad32-2c9a190b6971.png"> <img width="200" alt="Simulator Screen Shot - iPhone 11 - 2023-01-18 at 22 03 51" src="https://user-images.githubusercontent.com/99760600/213398533-3ded7a96-06ed-46e7-8cdc-cbb6b0963863.png"> 
