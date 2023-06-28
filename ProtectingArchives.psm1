### This PowerShell script module comprises functions that can be used to compress and decompress password protected archives.

<#
.SYNOPSIS
    The function "Protect-Archive" is used to compress files into a password protected ZIP archive.

.DESCRIPTION
    The "Protect-Archive" function makes use of the 7-Zip command-line tool to generate a ZIP archive with password protection. By specifying the path to the source folder, the function compresses the files within using 7-Zip's command-line arguments and applies the provided password. Once the compression process is complete, the function creates an archive file with a ".zip" extension at the specified destination path. Notably, it conveniently opens the resulting file in Windows Explorer, enabling easy access to the newly created password-protected archive.

.PARAMETER PassWord
    The password used to protect the archive file.

.PARAMETER Source
    The fully qualified path to the source folder (e.g., "C:\Source\Folder\").

.PARAMETER Destination
    The fully qualified path to the destination file with ".zip" extension (e.g., "C:\Destination\Folder\Archive.zip").

.EXAMPLE
    Protect-Archive -PassWord "password" -Source "C:\Source\Folder\" -Destination "C:\Destination\Folder\Archive.zip"
#>
function Protect-Archive 
{
    # Initialize the parameters
    param
    (
        [parameter(Mandatory=$true)][System.String]$PassWord,
        [parameter(Mandatory=$true)][System.String]$Source,
        [parameter(Mandatory=$true)][System.String]$Destination
    )
    
    # Compress files into archive
    $Arguments = "a -p$PassWord -r ""$Destination"" ""$Source"""
    Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList $Arguments -NoNewWindow -Wait

    # Opens the destination folder
    Invoke-Item -Path $Destination
}

<#
.SYNOPSIS
    The function "Unprotect-Archive" is used to extract compressed files from a password protected ZIP archive.

.DESCRIPTION
    The "Unprotect-Archive" function uses the 7-Zip command-line tool to extract files from a password-protected ZIP archive. By specifying the path to the source archive file, the function decompresses the files using 7-Zip's command-line arguments and applies the specified password. Once the decompression process is complete, the function extracts the files to the specified destination path. The destination folder is opened in Windows Explorer for easy access to the password-protected archive.

.PARAMETER PassWord
    The password used to protect the files.

.PARAMETER Source
    The fully qualified path to the source file with ".zip" extension (e.g., "C:\Source\Folder\Archive.zip").

.PARAMETER Destination
    The fully qualified path to the destination folder (e.g., "C:\Destination\Folder\").

.EXAMPLE
    Unprotect-Archive -PassWord "password" -Source "C:\Source\Folder\Archive.zip" -Destination "C:\Destination\Folder\"
#>
function Unprotect-Archive
{
    # Initialize the parameters
    param
    (
        [parameter(Mandatory=$true)][System.String]$PassWord,
        [parameter(Mandatory=$true)][System.String]$Source,
        [parameter(Mandatory=$true)][System.String]$Destination
    )

    # Decompress files into archive
    $Arguments = "x -p$PassWord ""$Source"" -o""$Destination"""
    Write-Host $Arguments
    Start-Process -FilePath "C:\Program Files\7-Zip\7z.exe" -ArgumentList $Arguments -NoNewWindow -Wait

    # Opens the destination folder
    Invoke-Item -Path $Destination
}