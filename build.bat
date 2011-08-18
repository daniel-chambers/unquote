set /p versionNumber=

REM preparing staging dirs

mkdir staging
mkdir staging\net40
mkdir staging\sl4
copy LICENSE staging
copy NOTICE staging

REM building for .NET 4.0 ...

"C:\Program Files (x86)\Microsoft F#\v4.0\fsc.exe" -o:staging\net40\Utils.dll --noframework --define:TRACE --optimize+ -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\FSharp\2.0\Runtime\v4.0\FSharp.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\mscorlib.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.Numerics.dll" --target:library --warn:3 --warnaserror:76 --LCID:1033 --utf8output --fullpaths --flaterrors "C:\Users\Stephen\AppData\Local\Temp\.NETFramework,Version=v4.0.AssemblyAttributes.fs" Utils\AssemblyInfo.fs Utils\MiscUtils.fs Utils\RegexUtils.fs Utils\PrintfUtils.fs Utils\ListExtensions.fs 

"C:\Program Files (x86)\Microsoft F#\v4.0\fsc.exe" -o:staging\net40\Unquote.dll --noframework --define:TRACE --doc:staging\net40\Unquote.xml --optimize+ -r:C:\Windows\Microsoft.Net\assembly\GAC_MSIL\FSharp.Compiler\v4.0_4.0.0.0__b03f5f7f11d50a3a\FSharp.Compiler.dll -r:C:\Windows\Microsoft.Net\assembly\GAC_MSIL\FSharp.Compiler.Interactive.Settings\v4.0_4.0.0.0__b03f5f7f11d50a3a\FSharp.Compiler.Interactive.Settings.dll -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\FSharp\2.0\Runtime\v4.0\FSharp.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\mscorlib.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.0\System.Numerics.dll" -r:"staging\net40\Utils.dll" --target:library --warn:3 --warnaserror:76 --LCID:1033 --utf8output --fullpaths --flaterrors --staticlink:Utils "C:\Users\Stephen\AppData\Local\Temp\.NETFramework,Version=v4.0.AssemblyAttributes.fs" Unquote\AssemblyInfo.fs Unquote\DynamicOperators.fs Unquote\Evaluation.fs Unquote\OperatorPrecedence.fs Unquote\ExtraReflection.fs Unquote\ExtraPatterns.fs Unquote\Decompilation.fs Unquote\Reduction.fs Unquote\Extensions.fs Unquote\Operators.fs Unquote\Assertions.fs 

REM building for sl4

"C:\Program Files (x86)\Microsoft F#\v4.0\fsc.exe" -o:staging\sl4\Utils.dll --noframework --define:TRACE --define:SILVERLIGHT --optimize+ -r:"C:\Program Files (x86)\Microsoft F#\Silverlight\Libraries\Client\v4.0\FSharp.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\mscorlib.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Net.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Windows.Browser.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Windows.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Xml.dll" --target:library --warn:3 --warnaserror:76 --LCID:1033 --utf8output --fullpaths --flaterrors "C:\Users\Stephen\AppData\Local\Temp\Silverlight,Version=v4.0.AssemblyAttributes.fs" Utils\AssemblyInfo.fs Utils\MiscUtils.fs Utils\RegexUtils.fs Utils\PrintfUtils.fs Utils\ListExtensions.fs 

"C:\Program Files (x86)\Microsoft F#\v4.0\fsc.exe" -o:staging\sl4\Unquote.dll --noframework --define:TRACE --define:SILVERLIGHT --doc:staging\sl4\Unquote.xml --optimize+ -r:"C:\Program Files (x86)\Microsoft F#\Silverlight\Libraries\Client\v4.0\FSharp.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\mscorlib.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Core.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Net.dll" -r:"C:\Program Files (x86)\Microsoft SDKs\Silverlight\v4.0\Libraries\Client\System.Numerics.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Windows.Browser.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Windows.dll" -r:"C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\Silverlight\v4.0\System.Xml.dll" -r:"staging\sl4\Utils.dll" --target:library --warn:3 --warnaserror:76 --vserrors --LCID:1033 --utf8output --fullpaths --flaterrors --staticlink:Utils "C:\Users\Stephen\AppData\Local\Temp\Silverlight,Version=v4.0.AssemblyAttributes.fs" Unquote\AssemblyInfo.fs Unquote\DynamicOperators.fs Unquote\Evaluation.fs Unquote\OperatorPrecedence.fs Unquote\ExtraReflection.fs Unquote\ExtraPatterns.fs Unquote\Decompilation.fs Unquote\Reduction.fs Unquote\Extensions.fs Unquote\Operators.fs Unquote\Assertions.fs 

REM zip builds for .NET 4.0...

7z a -tzip builds\Unquote-%versionNumber%.zip staging\*

REM copy builds to nuget package for .NET 4.0...
copy LICENSE nuget
copy NOTICE nuget
copy staging\net40\Unquote.dll nuget\lib\net40\Unquote.dll
copy staging\net40\Unquote.xml nuget\lib\net40\Unquote.xml
copy staging\sl4\Unquote.dll nuget\lib\sl4\Unquote.dll
copy staging\sl4\Unquote.xml nuget\lib\sl4\Unquote.xml

REM create nuget package...

C:\NuGet\nuget.exe pack nuget\Unquote.nuspec

REM cleanup...

rd staging

pause