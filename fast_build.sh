export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$PATH:/usr/bin:/usr/local/bin/"
export COCOAPODS_DISABLE_DETERMINISTIC_UUIDS=YES

echo "\033[33m注意：默认执行pod install，建议仅临时快速编译时用用，脚本带来的任何修改不要提交！！！\033[0m"
sleep 3

#指定编译模式
project=Podfile

fast_mode=1 bundle install

fast_mode=1 bundle exec pod update --no-repo-update

#echo "正在设置编译优化选项: "

#更改线程数设置8
#defaults write com.apple.Xcode PBXNumberOfParallelBuildSubtasks 8
#defaults write com.apple.dt.Xcode ShowBuildOperationDuration YES
#echo  "增加Xcode执行线程数为8."

#echo "设置编译优化选项完毕."

echo "正在准备帮你打开工程: \c"
sleep 1
open MDProject.xcworkspace
