source 'https://github.com/CocoaPods/Specs.git'
platform:ios, '15.0'

use_frameworks!
inhibit_all_warnings!

def common_pods
  use_frameworks!
  pod 'Alamofire'
  pod 'SnapKit', '~> 5.0.0'
end


target 'UITest' do
  project 'UITest.xcodeproj'
  workspace 'UITest.xcworkspace'
  common_pods
end
