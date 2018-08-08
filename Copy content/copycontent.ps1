$sourceRoot = "c:\temp"
$destinationRoot = "c:\temp2"
 
foreach( $dir in (Get-ChildItem -Path $sourceRoot) )
{
    # Creates \\destination\Folder1 path
    $destination = join-path $destinationRoot $dir.Name
    # Creates \\destination\Folder1\Archive path
    $destination = Join-Path $destination "Documents"
 
    # Recursively copies \\source\Folder1 to \\destination\Folder1\Documents
    if( (Test-Path -path $destination -PathType Container) )
    {
        foreach( $subItem in (Get-ChildItem -Path $dir.FullName) )
        {
            Copy-Item -Path $subItem.FullName -Destination $destination -Recurse
        }
    }
    else
    {
        Copy $dir.FullName -Destination $destination -Recurse
    }
}