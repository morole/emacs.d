rem .emacs.d�ļ�������Ŀ¼
set emacs_d_path="%APPDATA%\.emacs.d\"

rem ���pythonִ��·������������path
set python_install_path="D:\programs\Python27\"
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%python_install_path%;%python_install_path%\Scripts\"

rem install pygments
python %emacs_d_path%\win_apps\python get-pip.py
pip install Pygments

rem ��ӵ���������·����path��������
wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;%emacs_d_path%\win_apps;%emacs_d_path%\glo65wb\bin\"

rem ���gnu globalʹ�õĻ�������
wmic ENVIRONMENT create name="GTAGSCONF",username="<system>",VariableValue="%emacs_d_path%\win_apps\glo65wb\share\gtags\gtags.conf"
wmic ENVIRONMENT create name="GTAGSLABEL",username="<system>",VariableValue="pygment"

rem ��ѹGNU Global
unzip -o glo65wb.zip


echo Done successfully!
echo Restart emacs and wait a moment for installing dependency packages from ELPA;
