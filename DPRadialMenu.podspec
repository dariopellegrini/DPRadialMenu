#
# Be sure to run `pod lib lint DPRadialMenu.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DPRadialMenu'
  s.version          = '0.0.1'
  s.summary          = 'A simple from 1 to 3 buttons radial menu, to display radial button inside a view after a long press on that'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Create your radial menu with a maximum of 3 buttons. You can add your own button and insert it inside a view with a single line of code.
                       DESC

  s.homepage         = 'https://github.com/dariopellegrini/DPRadialMenu'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dario Pellegrini' => 'pellegrini.dario.1303@gmail.com' }
  s.source           = { :git => 'https://github.com/dariopellegrini/DPRadialMenu.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/dario_p89'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DPRadialMenu/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DPRadialMenu' => ['DPRadialMenu/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
