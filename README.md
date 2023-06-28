# PowerShell Archive Encryption/Decryption Module

This PowerShell script module provides two functions for compressing and decompressing files into a password-protected archive. The functions utilize the 7-Zip command-line tool to perform the encryption and decryption operations.

## Table of Contents

- [Introduction](#introduction)
- [Function: Protect-Archive](#function-protect-archive)
- [Function: Unprotect-Archive](#function-unprotect-archive)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This module contains two PowerShell functions that enable the compression and decompression of files using the 7-Zip program, while applying password protection to the resulting archive file. The functions are as follows:

1. **Protect-Archive**: Compresses files within a specified source folder and generates a password-protected ZIP archive at the provided destination path. The resulting archive can be easily accessed through Windows Explorer.

2. **Unprotect-Archive**: Extracts files from a password-protected ZIP archive to a specified destination folder. The function utilizes the provided password to decrypt the archive and make its contents accessible.

Please note that this module relies on the 7-Zip command-line tool, which should be installed on the system for the functions to work properly.

## Function: Protect-Archive

The `Protect-Archive` function compresses files within a specified source folder into a password-protected ZIP archive.

### Parameters

- `PassWord`: The password used to protect the archive file.
- `Source`: The fully qualified path to the source folder.
- `Destination`: The fully qualified path to the destination file with a ".zip" extension.

### Usage

```powershell
Protect-Archive -PassWord "<password>" -Source "<source_folder_path>" -Destination "<destination_file_path>"
```

### Example

```powershell
Protect-Archive -PassWord "mypassword" -Source "C:\Source\Folder\" -Destination "C:\Destination\Folder\Archive.zip"
```

## Function: Unprotect-Archive

The `Unprotect-Archive` function extracts files from a password-protected ZIP archive.

### Parameters

- `PassWord`: The password used to protect the files.
- `Source`: The fully qualified path to the source file with a ".zip" extension.
- `Destination`: The fully qualified path to the destination folder.

### Usage

```powershell
Unprotect-Archive -PassWord "<password>" -Source "<source_file_path>" -Destination "<destination_folder_path>"
```

### Example

```powershell
Unprotect-Archive -PassWord "mypassword" -Source "C:\Source\Folder\Archive.zip" -Destination "C:\Destination\Folder\"
```

## Installation

To use this module, you need to ensure that the 7-Zip command-line tool is installed on your system. You can download it from the official website: [https://www.7-zip.org/](https://www.7-zip.org/)

1. Download and install the 7-Zip command-line tool.
2. Clone or download the PowerShell script module from the GitHub repository.
3. Copy the module files to a desired location on your system.

## Usage

1. Locate an appropriate PowerShell module folder.

2. Create a new directory within a module folder of the same name as this module (i.e., `ProtectingArchives`).

3. Place the script inside the new folder.

4. Import the module into your PowerShell session using the `Import-Module` cmdlet.

```powershell
Import-Module "<module_path>"
```

5. Use the available functions in your scripts or interactive sessions.

Note: Follow the first three steps only on first use.

## Examples

**Example 1: Protect-Archive**

This example compresses the files within the "C:\Source\Folder\" directory and creates a password-protected ZIP archive named "

Archive.zip" in the "C:\Destination\Folder\" directory.

```powershell
Protect-Archive -PassWord "mypassword" -Source "C:\Source\Folder\" -Destination "C:\Destination\Folder\Archive.zip"
```

**Example 2: Unprotect-Archive**

This example extracts the files from the password-protected ZIP archive "Archive.zip" located in the "C:\Source\Folder\" directory and extracts them to the "C:\Destination\Folder\" directory.

```powershell
Unprotect-Archive -PassWord "mypassword" -Source "C:\Source\Folder\Archive.zip" -Destination "C:\Destination\Folder\"
```

## Contributing

Contributions to this project are welcome. Feel free to submit bug reports, feature requests, or pull requests on the [GitHub repository](<repository_link>).

## License

This project is licensed under the [MIT License](<license_link>).
