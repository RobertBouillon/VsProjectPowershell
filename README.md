# Visual Studio Project Powershell
A Powershell script for adding script utilities to your projects in Visual Studio.

Visual Studio includes a PowerShell tool window that's can be used for macros and project utilities, with a little help.

This script is designed for "Clone-to-own"; to provide a baseline for your project for you to customize.

> TIP: `CTRL+~` is the default keybind for viewing the terminal window!

![intro](Docs/intro.gif?raw=true)

### Highlights

1. Creates a location for commonly-used scripts, such as `build` and `deploy`
2. Shortens the prompt so you can use the window docked to the side, where there's typically more screen real-estate
3. Provides a few helper functions, such as `popout`, which opens a full-sized powershell window with Visual Studio environment, optionally elevated.


### Built-in Commands 

| Command | Description
|-|-|
| `popout` | Opens a new powershell window with the current environment. Use the `-admin` switch to elevate
| `clean`  | Force-Deletes all `bin` and `obj` folders
| `build`  | Publishes the solution in release-mode to the `$root_path\Builds\Working` directory
| `builds` | Opens explorer window to the `$root_path\Builds` directory
| `assets` | Opens explorer window to the `$root_path\Assets` directory
| `docs`   | Opens VS Code `$root_path\docs` directory


### Built-in Variables

| Command | Description
|-|-|
| `$root_path`     | The root path of the GIT project
| `$solution_path` | Path to the first directory containing a solution file (`.sln`)
| `$source_path`   | Path to the folder containing source code (implemented as a copy of $solution_path, but can be changed per-project)  



# Installation

![intro](./docs/install.gif?raw=true)


### Prerequisites

1. Git for Windows
2. Project uses GIT for source control

### Installation Steps

1. Add `Builds/` to your `.gitignore`
2. Copy the `ideenv.ps1` file to a `Scripts` directory located in the same directory as your solution file (e.g. `Repos\MyProject\Source\MySolution.sln` & `Repos\MyProject\Source\Scripts\ideenv.ps1`)
3. In Visual Studio **Options > Environment > Terminal**, add a new profile with the following settings:


|Option|Value|
|-|-|
|Name| Project PowerShell |
|Shell Location | &lt;Use Default&gt;
|Arguments| `-NoExit -Command "& { Import-Module """$env:VSAPPIDDIR\..\Tools\Microsoft.VisualStudio.DevShell.dll"""; Enter-VsDevShell -SkipAutomaticLocation -SetDefaultWindowTitle -InstallPath $env:VSAPPIDDIR\..\..\}"; clear; if (Test-Path .\utils.ps1) { . .\utils.ps1 }; if (Test-Path .\Scripts\ideenv.ps1) { . .\Scripts\ideenv.ps1 };` |

4. Click the **Set as Default** button to set **Project Powershell** as default



# Tips


## Using the script in other versions of VS or other IDEs
The **Arguments** passed in the **Project Powershell** profile are the defaults with the below string appended. This command simply dot-sources the script, but assumes the IDE will start the shell with the working directory within the current project. Visual studio sets the working directory to the location of the solution file in all versions.

To use this script with a previous version of Visual Studio, simply append the following string to the end of the default arguments.

`clear; if (Test-Path .\utils.ps1) { . .\utils.ps1 }; if (Test-Path .\Scripts\ideenv.ps1) { . .\Scripts\ideenv.ps1 };`

## Add the script as an external file to your solution
By default, the script won't be included in your solution's view. Give yourself and your team the ability to modify the script by adding it to the solution as an external file. I usually add it to the `\Tools\Scripts\` folder in the solution.

## What else can this thing do?
Check out the [Utilities](./Utilities) folder for common utilities!