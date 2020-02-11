# SwiftlyJeffHyde

## Requirements
Xcode 11.3.1 or later
iOS 13.2 or later
OS X v10.15.2 or later

## Overview
This app uses a CollectionView to display data retrieved from an endpoint using the MVVM pattern. 

CollectionView Cells are scaled based on the canvas unit, item width & item height property from the given endpoint, 
Width: (screen width ÷ canvas unit × item width)
Height: (screen width ÷ canvas unit × item height)

