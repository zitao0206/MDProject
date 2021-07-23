
require 'cocoapods'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Leon0206/MDSpecs.git'

platform :ios, '9.0'

inhibit_all_warnings!
use_modular_headers!

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
  ENV['use_binary'] = '0'
  ENV['MDCommonKit_use_binary'] = '0'
  ENV['EasyLayout_use_binary'] = '0'
  
  #业务代码库
  pod 'HomeProject', :path => './LocalPods/HomeProject', :inhibit_warnings => false
  pod 'DemoProject', :path => './LocalPods/DemoProject', :inhibit_warnings => false
  
  #组件库
  pod 'MDPageMaster', '2.0.18'
  pod 'MDStatePageKit', '~> 1.0.0'
  pod 'ReactiveDataBoard', '~> 4.0.0'
  pod 'MDReactPageKit', '~> 1.0.0'
  pod 'MDEasyCache', '~> 1.0.0'
  pod 'EasyLayout', '~> 1.0.0'
  pod 'MDCommonKit', '~> 1.0.0'
  
  #第三方组件库
  pod 'ReactiveObjC', '3.1.0'
  pod 'TMCache', '2.1.0'
  pod 'PINCache', '2.0'
  pod 'SDWebImage', '4.4.2'
  pod 'Masonry', '0.6.1'
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
