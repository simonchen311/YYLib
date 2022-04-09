#!/bin/sh

#  Script.sh
#  Pods
#
#  Created by 陈晟豪 on 2022/4/4.
#  

#把这段脚本增加到Jenkin构建步骤中，所以不是

PB_MD5_FILE_NAME="pb-md5.txt"
PB_FILE_PATH="./PBFiles/"
PB_OBJC_PATH_NAME="Classes"
PB_BRANCH_NAME=$1


# 拉取pb最新的源文件
if [ ! -d $PB_FILE_PATH ]
then
    echo "-- PB源文件夹不存在，开始从git同步 --"
    git clone git@github.com:simonchen311/PBFiles.git
fi

# 判断是否clone成功
if [ ! -d $PB_FILE_PATH ]
then
    echo "-- PB源文件git clone失败 -- "
    exit 1
fi

echo "-- 进入文件夹 --"
cd $PB_FILE_PATH

# 打开目录后先清空暂存区
echo "-- 清空暂存 --"
git reset --hard HEAD@{0}
git clean -xdf

# 判断远端是否有分支
git branch -a | grep -E "remotes/origin/${PB_BRANCH_NAME}$"
if [[ $? != 0 ]]
then
    echo "-- 没有找到 ${PB_BRANCH_NAME}分支，结束同步 --"
    exit 0
fi

# 同步分支
echo "-- 开始同步分支 ${PB_BRANCH_NAME} --"
git checkout $PB_BRANCH_NAME
git pull

# 检查同步是否成功
GIT_CHECK=`git pull`
if [[ ${GIT_CHECK} = "Already up to date." ]]
then
    echo "-- 分支${PB_BRANCH_NAME}同步成功 --"
else
    echo "-- 分支${PB_BRANCH_NAME}同步失败，请检查 --"
    exit 0
fi

#获取最新的commit id
PB_GIT_COMMIT_ID=`git rev-parse --short HEAD`

# 计算md5，按文件名升序排列，输入文件名和md5到文件中
rm -rf $PB_MD5_FILE_NAME
touch $PB_MD5_FILE_NAME
PB_FILES=$(ls *.proto | sort -k9)
for file in $PB_FILES
do
    echo $file >> $PB_MD5_FILE_NAME
    echo $(md5 $file) | cut -d ' ' -f 4 >> $PB_MD5_FILE_NAME # cut按空格截取最后一段
done

# 找到上一级目录保存的旧md5，用diff比较文件是否不同
if [ -f "../$PB_MD5_FILE_NAME" ]
then
    result=$(echo $(diff $PB_MD5_FILE_NAME ../$PB_MD5_FILE_NAME))
    if [[ $result == "" ]]
    then
        echo "-- PB文件没有变化，无需更新 --"
        cd ..
        rm -rf $PB_FILE_PATH
        exit 0
    fi
fi

echo "-- 检测到更新，开始更新PB --"
## 删除旧md5文件，拷贝新文件
rm -rf "../$PB_MD5_FILE_NAME"
cp $PB_MD5_FILE_NAME "../$PB_MD5_FILE_NAME"
## 删除旧目录，新建输出目录
rm -rf "../../$PB_OBJC_PATH_NAME"
mkdir "../../$PB_OBJC_PATH_NAME"
# 遍历所有proto文件，执行转换
for proto_file in `ls ./`
do
    if [ ${proto_file##*.} = "proto" ]
    then
        CHECK_PROTOC=`protoc $proto_file --objc_out="../../$PB_OBJC_PATH_NAME"`
        if [[ ${CHECK_PROTOC} != "" ]]
        then
            echo "-- ${proto_file}编译失败，请检查 --"
            exit 0
        fi
    fi
done

# 回到根目录
echo "-- PB文件全部编译完成 --"
cd ..
rm -rf $PB_FILE_PATH
cd ..
cd ..

## 获取podspec
POD_FILE_NAME=""
for dir in `ls ${pwd}`
do
    path=${pwd}"/"$dir
    if [ ! -d path ] && [ ${path##*.} = "podspec" ]
    then
        POD_FILE_NAME=$dir
    fi
done
echo "-- 找到文件$POD_FILE_NAME --"

# 查找podspec版本，并修改版本号
OLD_VERSION_LINE=""
NEW_VERSION_LINE=""
NEW_TAG=""

while read line
do
    # 查找到包含的内容，正则表达式获取以 ${search_str} 开头的内容
    result=$(echo ${line} | grep "^spec.version")
    if [[ "$result" != "" ]]
    then
        OLD_VERSION_LINE=$line
        # 分割字符串，是变量名称，不是变量的值; 前面的空格表示分割的字符，后面的空格不可省略
        array=(${result// / })
        # 数组长度
        count=${#array[@]}
        # 获取最后一个元素内容
        last=${array[count - 1]}
        # 去掉 "
        old_version=${last//\"/}
        echo "-- podspec当前版本版本$old_version --"
        # 更新版本
        version_array=(${old_version//./ })
        last=${version_array[count - 1]}
        new_version="0.0.$((10#$last+1))"
        echo "-- podspec更新版本$new_version --"
        NEW_TAG=$new_version
        NEW_VERSION_LINE=${OLD_VERSION_LINE/$old_version/$new_version}
    fi
done < $POD_FILE_NAME

# 替换podspec文本
sed -i "" "s/$OLD_VERSION_LINE/$NEW_VERSION_LINE/g" $POD_FILE_NAME

# 更新pod，自动上传，这里一定是有文件变动，所以可以直接提交
git add .
git status
git commit -am"文件更新，对应COMMIT ID为$PB_GIT_COMMIT_ID"
pod lib lint --allow-warnings --use-libraries

git tag -a $NEW_TAG -m"升级$NEW_TAG, 对应COMMIT ID为$PB_GIT_COMMIT_ID"
git push git@github.com:simonchen311/YYLib.git HEAD:master
git push git@github.com:simonchen311/YYLib.git --tags

pod repo push LibsRepo $POD_FILE_NAME --allow-warnings --use-libraries


