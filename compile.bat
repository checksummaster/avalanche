setlocal
set path=%cd%\tools;%path%
pushd kmk_firmware
python util\compile.py
popd