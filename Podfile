
#source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'
source 'https://github.com/Leon0206/MDSpecs.git'


platform :ios, '10.0'
inhibit_all_warnings!
use_modular_headers!
use_frameworks! :linkage => :static


workspace 'MDProject.xcworkspace'
project 'MDProject'

fast_mode = ENV['fast_mode']
if fast_mode

plugin 'cocoapods-project-hmap'

install! 'cocoapods',
          :preserve_pod_file_structure => true,
          :deterministic_uuids => false,
          :generate_multiple_pod_projects => true,
#          :skip_pods_project_generation => true,
          :incremental_installation => true,
          :lock_pod_sources => false,
          :disable_input_output_paths => true
else

install! 'cocoapods',
          :preserve_pod_file_structure => true,
          :deterministic_uuids => false,
          :generate_multiple_pod_projects => false
end

target 'MDProject' do
#  ENV['use_binary'] = '0'
#  ENV['MDCommonKit_use_binary'] = '0'
#  ENV['EasyLayout_use_binary'] = '0'
  
  #业务代码库
  pod 'HomeProject', :path => './LocalPods/HomeProject', :inhibit_warnings => false
  pod 'DemoProject', :path => './LocalPods/DemoProject', :inhibit_warnings => false
  pod 'SwiftDemoProject', :path => './LocalPods/SwiftDemoProject', :inhibit_warnings => false
  pod 'MDBaseHallCollectionModule', :path => './LocalPods/MDBaseHallCollectionModule', :inhibit_warnings => false
 
 #多源pod测试
#  pod 'MDMultiSourceDemo', '~> 0.0.1'
#  pod 'MDMultiSourceDemo_A', '~> 0.0.1'
#  pod 'MDMultiSourceDemo_B', '~> 0.0.1'
#  pod 'MDMultiSourceDemo_C', '~> 0.0.1'
#  pod 'MDMultiSourceDemo', :path => '/Users/Leon0206/Desktop/MDProject/MDMultiSourceDemo', :inhibit_warnings => false
#  pod 'MDMultiSourceDemo_B', :path => '/Users/Leon0206/Desktop/MDProject/MDMultiSourceDemo', :inhibit_warnings => false

  #组件库
  # level 3

  pod 'MDEasyCache', '~> 1.0.0'
  pod 'MDPageMaster', '2.0.19'
  
  # level 2
  pod 'StateMachinePageKit', '~> 1.0.11'
  pod 'ReactivePageKit', '~> 1.0.15'
  pod 'ReactiveDataBoard', '4.0.7'
  
  # level 1
  pod 'AKOCommonToolsKit', '0.0.9'
  pod 'EasyLayout', '~> 1.0.0'
 
  # level 0
  pod 'CommonCrypto'
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'
  pod 'ReactiveObjC', '3.1.0'
  pod 'TMCache', '2.1.0'
  pod 'PINCache', '2.0'
  pod 'SDWebImage', '4.4.2'
#  pod 'Masonry', '0.6.1'
  pod 'JSPatch'
  pod 'Aspects', '1.4.1'
  pod 'SSZipArchive', '0.4.0'
  pod 'AFNetworking','3.2.1'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if config.name == 'DailyBuild'
                config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', 'TEST=1']
            end
        end
    end
end
