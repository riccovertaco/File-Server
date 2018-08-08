$sourceRoot = "E:\Profilstest"
$javaroot = "\\toto.lan\netlogon\java"
 
foreach( $dir in (Get-ChildItem -Path $sourceRoot) )
{
     Copy $javaroot -Destination $dir.FullName\appdata\roaming -Recurse
}



