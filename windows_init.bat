rem��ӵ���������·����path��������
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%APPDATA%\.emacs.d\win_apps\;%APPDATA%\win_apps\glo65wb\bin"
rem ���gnu globalʹ�õĻ�������
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%APPDATA%\.emacs.d\win_apps\glo65wb\share\gtags\gtags.conf"
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygment"
rem ��ѹGNU Global
unzip -o glo65wb.zip


echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
