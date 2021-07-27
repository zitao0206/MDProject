
Pod::Spec.new do |s|
  s.name             = 'MDBaseHallCollectionModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MDProject.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/Leon0206/MDProject'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Leon0206' => '634376133@qq.com' }
  s.source           = { :git => 'https://github.com/Leon0206/MDProject.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'

  s.source_files = 'Classes/**/*'
  
   s.resource_bundles = {
     'MDBaseHallCollectionModule' => ['MDBaseHallCollectionModule/Assets/*.*']
   }
  s.prefix_header_file = 'MDBaseHallCollectionModule.pch'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

   s.dependency 'MDPageMaster'
   s.dependency 'SSZipArchive'
   s.dependency 'MDCommonKit'
   s.dependency 'ReactiveObjC'
   s.dependency 'EasyLayout'
   s.dependency 'ReactiveDataBoard'

end