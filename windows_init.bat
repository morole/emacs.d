@echo off
echo Ĭ�Ͻ������ļ�����%APPDATA%\.emacs.d��
rem git clone git@github.com:phenix3443/emacs.d.git %APPDATA%\.emacs.d
cd %~dp0\

rem emacs.d��װ·��
set emacs_d_path=%APPDATA%\.emacs.d

echo ɾ�����е�HOME��������
wmic ENVIRONMENT where "name='HOME'" delete
echo ���HOME��������
wmic ENVIRONMENT create name="HOME",username="<system>",VariableValue=%APPDATA%

echo Path�������������Python27�Ŀ�ִ���ļ�·��������ͨ��pip��װ��
rem python27��װ·��
set python_install_path=C:\Python27
set path=%path%;%python_install_path%;%python_install_path%\Scripts\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"
echo ��װPygments
pip install Pygments

echo ��ӵ��������ߣ�es.exe,lua.exe�ȣ���path��������
set path=%path%;%emacs_d_path%\win_apps\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"

echo ��ѹGNU Global
rem %~dp0\win_apps\unzip -d %~dp0\win_apps\ -o %~dp0\win_apps\glo651wb.zip
win_apps\unzip -d win_apps\ -o win_apps\glo651wb.zip

echo ���GNU Global��path��������
set path=%path%;%emacs_d_path%\win_apps\glo651wb\bin\
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%"

echo ������������GTAGSCONF
rem ɾ�����е�GTAGSCONF��������
wmic ENVIRONMENT where "name='GTAGSCONF'" delete
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%emacs_d_path%\win_apps\glo651wb\share\gtags\gtags.conf"
echo ������������GTAGSLABEL
rem ɾ�����е�GTAGSLABEL��������
wmic ENVIRONMENT where "name='GTAGSLABEL'" delete
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygments"

gtags --debug

echo Done successfully!
echo ��������emacs֮���ȴ�elpa������Ӧ����չ���

pause
