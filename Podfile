
require 'cocoapods'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/Leon0206/MDSpecs.git'

platform :ios, '9.0'

inhibit_all_warnings!
use_modular_headers!

fast_mode = ENV['fast_mode']
if fast_mode

plugin 'cocoapods-project-hmap'

else

end

eval(File.open('PodDevExtension.rb').read) if File.exist? 'PodDevExtension.rb'

def shared_pods
  
  ENV['use_binary'] = '1'
  ENV['MDCommonKit_use_binary'] = '0'
  ENV['EasyLayout_use_binary'] = '0'
  #业务代码库
#  pod 'MDHomeProject', '~> 0.0.1'
  pod 'MDHomeProject', :path => '/Users/lizitao/Desktop/MDProject/MDHomeProject'
  
  #组件库

  pod 'MDPageMaster', '2.0.18'
   
  pod 'MDStatePageKit', '~> 1.0.0'
  
  pod 'ReactiveDataBoard', '~> 4.0.0'
  
  pod 'MDReactPageKit', '~> 1.0.0'

  pod 'MDEasyCache', '~> 1.0.0'
  
  pod 'EasyLayout', '~> 1.0.0'
  
  pod 'MDCommonKit', '~> 1.0.0'
  
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

target 'MDProject' do
    shared_pods
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
