Shell 脚本编程练习
===================

* 00001 查找当前目录中所有大于 500M 的文件，将其文件名写入其他文本文件，并统计其个数

::

  find ./ -size +500M -type f|tee file_list|wc -l

 
*  00002 在目录 /tmp 下找到100个以 abc 开头的行，然后将这些文件的第一行保存待文件 new 中

::

  for filename in `find /tmp -type f -name "abc*"|head -n 100`
      do 
          sed -n '1p' $filename>>new
      done
     
*  00003 把文件 b 中有的，但 a 中没有的所有行，保存为文件 c,并统计 c 的行数

::

    grep -xvf a b |tee c|wc -l

* 00004 判断一文件是不是块或字符设备文件，如果是则将其 copy 到 /dev 目录下

::

  read -p "Please input a filename: " filename
  if [-b $filename -o -c $filename]
  then 
    cp $filename /dev/
  fi


* 00005 每隔10分钟监控一次，监控 /usr 下如果大于 5G ，发送邮件给管理员

:: 
  
  #!/bin/bash
    while true

* 00006 文件检索大于某尺寸并按尺寸排序

::
  
  find . -type f -size  +1M -print0 |xargs -0 du -h| sort -nr


* 00007 递归某个目录下的所有文件并将扩展名改为 bat，并以时间为文件名压缩打包存放到某个目录

::

  #!/bin/bash
  dst_path=$1
  for file in `ls $dst_path`
  do
    new_file=${file%.*}.bat 
    if [ -d $1/$file ]
      then echo `$0 $1/$file`
    elif [ -f $1/$file ]
      then mv ./$1/$file ./$1/$new_file
    else
      echo $1/${file} is unknow file type
    fi
  tmp=$(date +%y-%m-%d)
  tar czvf ./$tmp.tar ./$1
  done

* 00008 添加一个新组为class1，然后添加属于这个组的30个用户，用户名的形式为 stdxx，其中xx 从01到30

::

  #!/bin/bash
  groupadd class1
  for i in {01..30}
  do 
      useradd  -g class1 std$i -p ""
  done 

 
