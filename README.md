# IsacBannerSlide

[![CI Status](https://img.shields.io/travis/IsacShin/IsacBannerSlide.svg?style=flat)](https://travis-ci.org/IsacShin/IsacBanner)
[![Version](https://img.shields.io/cocoapods/v/IsacBannerSlide.svg?style=flat)](https://cocoapods.org/pods/IsacBanner)
[![License](https://img.shields.io/cocoapods/l/IsacBannerSlide.svg?style=flat)](https://cocoapods.org/pods/IsacBanner)
[![Platform](https://img.shields.io/cocoapods/p/IsacBannerSlide.svg?style=flat)](https://cocoapods.org/pods/IsacBanner)

## Features

- You can create an image banner slider using a collection view, where you can apply both images and click events simultaneously.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

The simplest use case is to call the createBanner function.
```ruby
IsacBannerSlide.createBanner(
            IsacBannerModel.getDummy(),
            bannerHeight: 90,                   // DefaultHeight: 90
            pageDotColor: .black,               // DefaultDotColor: black
            pageDotBorderColor: .black,         // DefaultDotBorderColor: black
            parentV: bannerWrapV)
```

## Requirements
- iOS 11.0+
  
## Installation

IsacBanner is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'IsacBannerSlide'
```

## Author

IsacShin, isac9305@gmail.com

## License

IsacBannerSlide is available under the MIT license. See the LICENSE file for more info.
