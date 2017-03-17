# PentagramHandshake

A pentagram shaped handshake written in Swift.

PentagramHandshake uses Carthage for distribution.

PentagramHandshake is available on iOS and requires 9.3

## To install this framework

Add Carthage files to .gitignore #Carthage Carthage/Build

Check your Carthage Version to make sure Carthage is installed locally: Carthage version

Create a CartFile to manage your dependencies: Touch CartFile

Open the Cartfile and add this as a dependency. (in OGDL): github "sevenapps/PentagramHandshake" "master"

Update your project to include the framework: Carthage update --platform iOS

Add the framework to 'Linked Frameworks and Libraries' in the Xcode Project by dragging and dropping the framework created in Carthage/Build/iOS/PentagramHandshake.framework

Add this run Script /usr/local/bin/carthage copy-frameworks

Add this input file to the run script $(SRCROOT)/Carthage/Build/iOS/PentagramHandshake.framework

If Xcode has issues finding your framework Add $(SRCROOT)/Carthage/Build/iOS To 'Framework Search Paths' in Build Settings

## To use this framework

Initilize this manager by conforming to its delegate, and setting a view for the gestures. You can also add an initial number of taps that is required before the pentagram pans will be recognized. The default is 6. You may also set the location of the taps. The default is 100 x 100 in the top middle of the view.
