#
# Be sure to run `pod lib lint ios-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SmoopeSDK"
  s.version          = "1.0.0-SNAPSHOT"
  s.summary          = "Swift implementation of smoope RESTful API."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Swift implementation of smoope RESTful API. All the documentation located at Smoope developers portal.
                       DESC

  s.homepage         = "https://github.com/smoope/ios-sdk"
  s.license          = 'Apache v2.0 license'
  s.author           = { "Victor Mosin" => "victor@smoope.com" }
  s.source           = { :git => "https://github.com/smoope/ios-sdk.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'ios-sdk' => ['Pod/Assets/*.png']
  }

  s.dependency 'SwiftyTraverson'
  s.dependency 'Alamofire', '~> 3.0'
end
