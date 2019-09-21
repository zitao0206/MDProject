source 'https://github.com/CocoaPods/Specs.git'
source 'http://192.168.1.33:9090/Pods/Specs.git'
source 'https://github.com/Leon0206/MDSpecs.git'
#cdn
#source 'https://cdn.jsdelivr.net/cocoa/'

platform :ios, '9.0'

eval(File.open('PodDevExtension.rb').read) if File.exist? 'PodDevExtension.rb'

target 'MDProject' do
    
    #业务代码库
    pod 'MDHomeProject', '~> 0.0.1'
    
    #业务组件、解决方案
    #  pod 'XYFelix', '~> 1.0.0'
    pod 'MDEasyCache', '~> 1.0.0'
    pod 'MDStatePageKit', '~> 1.0.0'
    pod 'MDReactDataBoard', '~> 3.0.0'
    pod 'MDCommonKit', '~> 1.0.0'
    pod 'XYPageMaster', '5.0.1'
    #第三方
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
