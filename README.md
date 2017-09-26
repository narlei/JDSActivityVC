# JDSActivityViewController

JDSActivityViewController is a lightweight UIActivityViewController subclass,
which can be configured to display a URL to be shared. This was inspired by
Tweetbot and Tumblr's usage of this customization.

## Screenshots

![](http://oi67.tinypic.com/11sjyom.jpg)

## Installation

### CocoaPods

`pod 'JDSActivityVC', :git=> 'https://github.com/narlei/JDSActivityVC.git', :branch => "master"`

## Usage

```swift
import JDSActivityVC

/* Inside of a UIViewController */

// Normal UIActivityViewController initializer
let sampleActivityViewController = JDSActivityViewController(activityItems: ["Two Dogs", imageURL], applicationActivities: nil)

// Set display URL
sampleActivityViewController.link = "Title Here"

presentViewController(sampleActivityViewController, animated: true, completion: nil)
```

Started by [@jasdev](https://twitter.com/jasdev)


Improved by by [@narleimoreira](https://twitter.com/narleimoreira)
