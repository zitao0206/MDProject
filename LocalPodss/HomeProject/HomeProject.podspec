
Pod::Spec.new do |s|
  s.name             = 'HomeProject'
  s.version          = '0.1.0'
  s.summary          = 'A short description of HomeProject.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Leon0206/MDProject'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon0206' => '634376133@qq.com' }
  s.source           = { :git => 'https://github.com/Leon0206/MDProject.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.pod_target_xcconfig = {
    'MARTIN_PACKAGE_VERSION' => '1.0',
    'GCC_PRECOMPILE_PREFIX_HEADER' => true,
    'CLANG_ENABLE_MODULES' => 'YES',
  }
  s.source_files = [
    'HomeProject.swift',
    'Classes/**/*'
  ]
  s.resource_bundles = {
     'HomeProject' => ['HomeProject/Assets/*.*']
  }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
   s.dependency 'MDPageMaster'
   s.dependency 'SSZipArchive'
   s.dependency 'MDCommonKit'
   s.dependency 'MDEasyCache'
   s.dependency 'MDStatePageKit'
   s.dependency 'ReactiveObjC'
   s.dependency 'SDWebImage'
   s.dependency 'Aspects'
   s.dependency 'AFNetworking'
   s.dependency 'SSZipArchive'
   s.dependency 'DemoProject'
   s.dependency 'SwiftDemoProject'

end
