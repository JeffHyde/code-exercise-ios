# SwiftlyJeffHyde

## Requirements
Xcode 11.3.1 or later
iOS 13.2 or later
OS X v10.15.2 or later

## Overview
This app uses Storyboards with a CollectionView to display data retrieved from an endpoint using the MVVM pattern. 

Retrieving data will use a default url and fallback to a backup url in the event of a failure

CollectionView Cells are scaled based on the canvas unit, item width & item height property from the given endpoint, 
Width: (screen width ÷ canvas unit × item width)
Height: (screen width ÷ canvas unit × item height)

Line length greater that 100 characters are moved to the next line

Unit Tests are testing a mock json response

## Licence
MIT
