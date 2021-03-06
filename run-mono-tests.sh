# restore nuget packages
mono .nuget/nuget.exe restore Unquote.sln

# run .net 4.5 tests (current broken due to https://github.com/xunit/xunit/issues/158)
# xbuild UnquoteTests/UnquoteTests.fsproj
# mono packages/xunit.runner.console.2.0.0/tools/xunit.console.exe UnquoteTests/bin/Debug/UnquoteTests.dll

# run .net 4.0 tests
xbuild /p:Configuration=Release /t:Clean UnquoteTests.Net40/UnquoteTests.Net40.fsproj
xbuild /p:Configuration=Release /p:DefineConstants="NET40%3bMONO" UnquoteTests.Net40/UnquoteTests.Net40.fsproj
mono tools/xunit-1.9.2/xunit.console.clr4.exe "UnquoteTests.Net40/bin/Release/UnquoteTests.Net40.dll"
