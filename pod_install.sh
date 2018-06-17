export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:/usr/bin:/usr/local/bin/"
export COCOAPODS_DISABLE_DETERMINISTIC_UUIDS=YES

#指定编译模式
build_model="Debug"

cd MDProject

#-----------------Pod update-------------
pod install

#----------------自动设置编译优化-------------
#参考文档：http://www.cocoachina.com/ios/20161118/18124.html
echo "正在设置编译优化选项: \c"
sleep 3
project=XiaoYing.xcodeproj/project.pbxproj
#更改线程数设置5
defaults write com.apple.Xcode PBXNumberOfParallelBuildSubtasks 8
defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
#设置Build Architecture
sed  -i "" "s/ONLY_ACTIVE_ARCH = NO/ONLY_ACTIVE_ARCH = YES/g"  $project
#设置编译优化等级
sed  -i "" "s/GCC_OPTIMIZATION_LEVEL = 0/GCC_OPTIMIZATION_LEVEL = 3/g"  $project
#设置符号表文件
sed  -i "" "s/dwarf-with-dsym/dwarf/g"  $project
#设置pch文件的预编译
sed  -i "" "s/GCC_PRECOMPILE_PREFIX_HEADER = NO/GCC_PRECOMPILE_PREFIX_HEADER = YES/g"  $project
echo "Done."

#----------------Open工程----------------
sleep 1
echo "正在准备打开工程: \c"
sleep 3
cd ..
open MDProject/MDProject.xcworkspace
sleep 1
echo "Done."
