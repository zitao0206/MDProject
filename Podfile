source 'https://github.com/CocoaPods/Specs.git' 

platform :ios, '8.0'

eval(File.open('PodDevExtension.rb').read) if File.exist? 'PodDevExtension.rb'

target 'MDProject' do
    
    pod 'MDCommonKit', '1.0.6'
    pod 'ReactiveObjC', '3.1.0'
    pod 'TMCache', '2.1.0'
    pod 'PINCache', '2.0'
    pod 'SDWebImage', '4.0.0'
    pod 'Masonry', '0.6.1'

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
