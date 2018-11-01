#
# Be sure to run `pod lib lint kratos_framework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'kratos_framework'
  s.version          = '0.1.0'
  s.summary          = 'A short description of kratos_framework.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://www.baidu.com'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kratos_framework' => '461400226@qq.com' }
  s.source           = { :git => '/Users/7yao.top/Desktop/kratos_framework', :tag => '0.1.0' ,
                        :git => 'https://github.com/Kratos28/DropDown.git', :tag => '2.3.12'}
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'kratos_framework/Classes/cls/**/*.{h,m,swift}'
  
  s.resource = 'kratos_framework/Classes/cls/**/*.{xib}'




  s.resource_bundles = {
    'kratos_framework' => ['kratos_framework/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'IQKeyboardManager'
  s.dependency 'KratosDropDown'
end
