# Description

Repository dedicated to a class project for an Adavance Programming: iOS course. It provides a simple yet efficient swift-based App - for iOS - to add and store movie titles and their most important information. It includes a TableView Display, segues, and CoreData performance among its most relevant features.

## Application

This native iOS app was fully developed using swift language. It uses basic packages such as:
- Foundation
- UIKit
- Core Data

In terms of data storing it uses two different sources for fast querying and unexpected-shut-down data loss prevention.
1. When started for the first time, the app retrieves the contents included in the **movieData.json** via `bundle`.
2. Anything that shall be edited, added, or deleted from this point on is handled and stored through core data to provide a faster and more secure data storing performance.

## Deployment

For the Swift Application to work properly, it is assumed you have already installed the following on your Macintosh machine:

- XCode 9.2 or superior
- Swift 3

Simply download this repository, open **movies.xcodeproj** with XCode, and proceed to run the project on the XCode Simulator

## Additional Info

This is a beginner's swift app and therefore, various improvements could be implemented as well as design modifications.
Its main purpose is to show how TableView and segues are implemented, how to handle data through screens and how to store and edit user data.
