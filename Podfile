# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def set_pods
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for login

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'Bolts'
pod 'FBSDKCoreKit'
pod 'FBSDKShareKit'
pod 'FBSDKLoginKit'
pod 'PDFGenerator', '~> 1.3.0'
pod 'SDWebImage', '~>3.8'
pod 'Alamofire', '~> 3.4'
pod 'SwiftValidator', :git => 'https://github.com/jpotts18/SwiftValidator.git', :tag => '4.0.0'

end

target 'login' do
    set_pods
end

target 'login Dev' do
    set_pods
end
