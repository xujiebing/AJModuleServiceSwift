Pod::Spec.new do |s|
  s.name             = 'AJModuleServiceSwift'
  s.version          = '0.2.1'
  s.summary          = 'A short description of AJModuleServiceSwift.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xujiebing/AJModuleServiceSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xujiebing' => 'xujiebing1992@gmail.com' }
  s.source           = { :git => 'https://github.com/xujiebing/AJModuleServiceSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'AJModuleServiceSwift/Classes/*.{h,swift}'
#  s.public_header_files = 'AJModuleServiceSwift/Classes/AJModuleServiceSwift.h'
  s.dependency 'AJFoundation'
  s.dependency 'KakaJSON'
  
end
