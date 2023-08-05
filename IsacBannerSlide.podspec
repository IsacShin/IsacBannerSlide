#
# Be sure to run `pod lib lint IsacBannerSlide.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'IsacBannerSlide'
  s.version          = '1.0.0'
  s.swift_version    = '4.0'
  s.summary          = 'You can create an image banner slider using a collection view, where you can apply both images and click events simultaneously.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!


  s.homepage         = 'https://github.com/IsacShin/IsacBannerSlide'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'IsacShin' => 'isac9305@gmail.com' }
  s.source           = { :git => 'https://github.com/IsacShin/IsacBannerSlide.git', :tag => s.version.to_s }
  s.description  = 'IsacBanner: A feature-rich banner slide library with UICollectionView for dynamic image banners, touch events, and page indicators.'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files  = ["Sources/**/*.swift"]
  s.dependency 'SnapKit'
  s.dependency 'Kingfisher'
  s.dependency 'Then'
  
  # s.resource_bundles = {
  #   'IsacBannerSlide' => ['IsacBannerSlide/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
