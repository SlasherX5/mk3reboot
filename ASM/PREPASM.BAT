detab %1
rep "\," " \, " %1
rep "\-" " \- " %1
rep "\+" " \+ " %1
grep EXTERN %1 >foo.bat
grep PUBLIC %1 >>foo.bat
rep PUBLIC "call ubar " foo.bat 
rep EXTERN "call ubar " foo.bat 
echo rep "\n%%1" "\n_%%1" %1 >ubar.bat
echo rep " %%1" " _%%1" %1 >>ubar.bat
call globals
call foo
rep .. . %1
grep include %1 >foo.bat
rep include "call doit " foo.bat

