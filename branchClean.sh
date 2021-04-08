#!/bin/bash

function deleLocalBranch()
{
    read -r -p "Are You Sure to delete the Local branch? [Y/N] " input
    case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        git branch -D $1
        ;;
    [nN][oO]|[nN])
        echo "No"
        exit 1
           ;;
    *)
        exit 1
        ;;
    esac
}

function deleRemoteBranch()
{
    read -r -p "Are You Sure to delete the Remote branch? [Y/N] " input
    case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        git push -u origin :$1
        ;;
    [nN][oO]|[nN])
        echo "No"
        exit 1
           ;;
    *)
        exit 1
        ;;
    esac
}

function deleLocalAndRemoteBranch()
{
    read -r -p "Are You Sure to delete the Local and Remote branch? [Y/N] " input
    case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        git branch -D $1
        git push -u origin :$1
        ;;
    [nN][oO]|[nN])
        echo "No"
        exit 1
           ;;
    *)
        exit 1
        ;;
    esac
}

function deleOneBranch()
{
    echo "\033[32m要删除的分支如下: \n$1\033[0m"
    if [[ $2 = 0 ]] && [[ $3 = 0 ]] ; then
#        echo "\033[32m要删除远端和本地分支1\033[0m"
        deleLocalAndRemoteBranch $1
        
    elif [[ $2 = 1 ]] && [[ $3 = 1 ]]; then
#        echo "\033[32m要删除远端和本地分支2\033[0m"
        deleLocalAndRemoteBranch $1
                
    elif [[ $2 = 1 ]] && [[ $3 = 0 ]]; then
#        echo "\033[32m要删除本地分支3\033[0m"
        deleLocalBranch $1
        
    elif [[ $2 = 0 ]] && [[ $3 = 1 ]]; then
#        echo "\033[32m要删除远端分支4\033[0m"
        deleRemoteBranch $1
    else
#        echo "\033[32m要删除远端和本地分支5\033[0m $2 $3"
        deleLocalAndRemoteBranch $1
    fi
#    git branch -D $1
#    git push -u origin :$1
}

function checkMaster()
{
    A="master"
    B="Master"
    C="MASTER"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkRelease()
{
    A="release"
    B="Release"
    C="RELEASE"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkDevelop()
{
    A="develop"
    B="Develop"
    C="DEVELOP"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function checkHead()
{
    A="head"
    B="Head"
    C="HEAD"
    if [[ $var == *$A* ]] || [[ $var == *$B* ]] || [[ $var == *$C* ]];
    then
        return 0
    else
        return 1
    fi
}

function deleAllBranches()
{
    branch_all=()
    if [[ $1 = 0 ]] && [[ $2 = 0 ]] ; then
#        echo "\033[32m要删除远端和本地分支1\033[0m"
        branch_all=$(git branch --all --format='%(refname:short)')
        
    elif [[ $1 = 1 ]] && [[ $2 = 1 ]]; then
#        echo "\033[32m要删除远端和本地分支2\033[0m"
        branch_all=$(git branch --all --format='%(refname:short)')
                
    elif [[ $1 = 1 ]] && [[ $2 = 0 ]]; then
#        echo "\033[32m要删除本地分支3\033[0m"
        branch_all=$(git branch --format='%(refname:short)')
        
    elif [[ $1 = 0 ]] && [[ $2 = 1 ]]; then
#        echo "\033[32m要删除远端分支4\033[0m"
        branch_all=$(git branch --remote --format='%(refname:short)')
    else
#        echo "\033[32m要删除远端和本地分支5\033[0m $2 $3"
        branch_all=$(git branch --all --format='%(refname:short)')
    fi
    
    OLD_IFS="$IFS"
    IFS=" "
    original_array=($branch_all)
    IFS="$OLD_IFS"
    in_result=()
    ex_result=()
    for var in ${original_array[@]}
    do
        if checkMaster || checkRelease || checkDevelop || checkHead
        then
            ex_result+=($var)
        else
            in_result+=($var)
        fi
    done
    echo "\033[33m屏蔽的分支如下（可尝试手动清理）：\033[0m"
        for obj in ${ex_result[@]}
    do
        echo "\033[33m$obj\033[0m"
    done
    echo "\n"
    echo "\033[32m可删除的分支如下:\033[0m"
    for obj in ${in_result[@]}
    do
        echo "\033[32m$obj\033[0m"
    done
    
    #确认是否要全部删除
    read -r -p "Are You Sure to delete all the above branches? [Y/N] " input
    case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        for obj in ${in_result[@]}
        do
             if [[ $obj == origin/* ]];
             then
                echo ${obj:7}
                git push origin :${obj:7}
             else
                git branch -D $obj
             fi
        done
        ;;
    [nN][oO]|[nN])
        echo "No"
        exit 1
           ;;
    *)
        exit 1
        ;;
    esac
}

function deleKeywordBranches()
{
    branch_all=()
    if [[ $1 = 0 ]] && [[ $2 = 0 ]] ; then
#        echo "\033[32m要删除远端和本地分支1\033[0m"
        branch_all=$(git branch --all --format='%(refname:short)')
        
    elif [[ $1 = 1 ]] && [[ $2 = 1 ]]; then
#        echo "\033[32m要删除远端和本地分支2\033[0m"
        branch_all=$(git branch --all --format='%(refname:short)')
                
    elif [[ $1 = 1 ]] && [[ $2 = 0 ]]; then
#        echo "\033[32m要删除本地分支3\033[0m"
        branch_all=$(git branch --format='%(refname:short)')
        
    elif [[ $1 = 0 ]] && [[ $2 = 1 ]]; then
#        echo "\033[32m要删除远端分支4\033[0m"
        branch_all=$(git branch --remote --format='%(refname:short)')
    else
#        echo "\033[32m要删除远端和本地分支5\033[0m $2 $3"
        branch_all=$(git branch --all --format='%(refname:short)')
    fi
    ret=$?
    branchCleanExit $ret
    
    OLD_IFS="$IFS"
    IFS=" "
    original_array=($branch_all)
    IFS="$OLD_IFS"
    in_result=()
    ex_result=()
    for var in ${original_array[@]}
    do
        if checkMaster || checkRelease || checkDevelop || checkHead
        then
            ex_result+=($var)
        else
            A=$1
            if [[ $var == *$A* ]];
            then
                in_result+=($var)
            fi
        fi
    done
    echo "\033[33m屏蔽的分支如下：\033[0m"
        for obj in ${ex_result[@]}
    do
        echo "\033[33m$obj\033[0m"
    done
    echo "\n"
    echo "\033[32m包含关键字'$1'分支如下:\033[0m"
    for obj in ${in_result[@]}
    do
        echo "\033[32m$obj\033[0m"
    done
    
    #确认是否要全部删除
    read -r -p "Are You Sure to delete all the above branches? [Y/N] " input
    case $input in
    [yY][eE][sS]|[yY])
        echo "Yes"
        for obj in ${in_result[@]}
        do
             if [[ $obj == origin/* ]];
             then
                echo ${obj:7}
                git push origin :${obj:7}
             else
                git branch -D $obj
             fi
        done
        ;;
    [nN][oO]|[nN])
        echo "No"
        exit 1
           ;;
    *)
        exit 1
        ;;
    esac
}


fetchAndCheckout()
{
    echo "正在执行git fetch..."
    git fetch
    echo "Already fetched..."
    echo "默认切到master分支上进行操作..."
    git checkout master
    ret=$?
    branchCleanExit $ret
}

branchCleanExit()
{
    if [ $1 -eq "1" ]
    then
        echo $MSG_ERR ;
        exit ;
    fi
}

if [ ! $1 ]; then
    echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
    exit 0
fi

if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]; then
    
    echo "\033[37m这是一个git分支清理工具，默认包含:\033[0m"
    echo "\033[37m  'master'、'Master'、'MASTER'\033[0m"
    echo "\033[37m  'head'、'Head'、'HEAD'\033[0m"
    echo "\033[37m  'develop'、'Develop'、'DEVELOP'\033[0m"
    echo "\033[37m  'release'、'Release'、'RELEASE'字符串的分支不会清理\033[0m"
    echo "\033[34m使用命令如下：\033[0m"
    echo "\033[34m  -h, --help 查看帮助 \033[0m"
    echo "\033[34m  -a, -A, --all，--All 查找所有可以删除的分支 \033[0m"
    echo "\033[34m  -k, -K, --key，--Key 根据关键字查找可以删除的分支 \033[0m"
    echo "\033[34m  --specific，--Specific 根据分支名查找可以删除的分支 \033[0m"
    echo "\033[34m  --local 删除本地分支 \033[0m"
    echo "\033[34m  --remote 删除远端分支 \033[0m"
    exit 0
else

    loca="0"
    remote="0"
    delete_all=""
    branchName=""
    branchKeyword=""
    # -o 接收短参数， -l 接收长参数， 需要参数值的在参数后面添加:
    set -- $(getopt -o Aa:k:K: -l all,All,key,Key,specific,Specific,local,Local,remote,Remote "$@")

    while [ -n "$1" ]; do
        case "$1" in
        --Specific|--specific)
            if [ ! $2 ]; then
                echo "\033[31m错误的输入参数，请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
            else
                branchName=$2
            fi
            ;;
        -k|-K|--key|--Key)
            if [ ! $2 ]; then
                echo "\033[31m错误的输入参数，请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
            else
                branchKeyword=$2
            fi
            ;;
        -a|-A|--all|--All)
            delete_all="1"
            ;;
        --local|--Local)
            loca="1"
            ;;
        --remote|--Remote)
            remote="1"
        shift ;;
        esac
        shift
    done
#    echo "${branchName}--${branchKeyword}--local:${loca}--remote:${remote}--delete_all:${delete_all}"
    #删除分支操作
    if [ $branchName ]; then
        fetchAndCheckout
        deleOneBranch $branchName $loca $remote
        exit 0
    fi
    if [ $delete_all ]; then
        fetchAndCheckout
        deleAllBranches $loca $remote
        exit 0
    fi
    if [ $branchKeyword ]; then
        fetchAndCheckout
        deleKeywordBranches $branchKeyword $loca $remote
        exit 0
    fi
    echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
    exit 0
fi
echo "\033[31m请使用命令'sh branch_clear.sh --help'查看相关参数设置\033[0m"
