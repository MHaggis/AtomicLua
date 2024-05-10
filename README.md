![AtomicLua Logo](/assets/atomiclua_logo.png)


# LuaJIT for Defenders: AtomicLua

## Introduction

Welcome to the LuaJIT for Defenders project! This repository is dedicated to providing cybersecurity defenders with the tools and knowledge to utilize LuaJIT in a Windows environment effectively. By leveraging GitHub Actions, this project automates the build and compilation process of LuaJIT, making it accessible and easy to integrate into security practices.

## Project Overview

The primary goal of this project is to facilitate an understanding and utilization of LuaJIT for security applications. LuaJIT is a Just-In-Time Compiler for the Lua programming language, offering substantial performance benefits. This project uses GitHub Actions to automate the building and testing of LuaJIT on Windows, ensuring that every push and pull request is verified against our rigorous standards.

## Getting Started

### Prerequisites

To run and build this project, you will need:
- Windows OS with administrative access.
- Microsoft Visual C++ (MSVC) installed.
- Access to GitHub to fork and clone the repository.
- [Microsoft Visual C++ Redistributable](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170) latest version.

### Installation and Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/MHaggis/AtomicLua.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd AtomicLua
   ```

### Automated Workflow Details

Our GitHub Actions workflow performs the following steps automatically:

- **Environment Setup**: Configures a Microsoft Visual C++ environment essential for building LuaJIT.
- **LuaJIT Compilation**: Utilizes the `msvcbuild.bat` script within the `AtomicLua` directory to compile LuaJIT.
- **Path Configuration**: Integrates the LuaJIT `AtomicLua` directory into the GitHub Actions path to streamline executable access.
- **Bytecode Compilation**: Transforms the `.lua` scripts into bytecode, saving the output as `.byte` files to be ran with the loader.
- **Loader Compilation**: Builds the `LuaLoader.c` source file to create an executable capable of running the Lua bytecode.
- **Artifact Archiving**: Stores essential binaries such as `lua51.dll`, `LuaLoader.exe`, and the bytecode file for easy access and distribution.

## Key Components

- **hello.lua**: This script showcases the use of the FFI library to invoke native C functions directly from Lua, providing a powerful example of how Lua can interact with the underlying operating system for advanced tasks. This is particularly useful for defenders who need to extend Lua's capabilities to interact with system-level APIs and perform complex operations. [View hello.lua](AtomicLua/hello/hello.lua)
- **LuaLoader.c**: An advanced version of our basic bytecode loader, designed to handle complex loading scenarios and provide additional runtime options. It is particularly useful in security contexts where different Lua scripts might require distinct runtime environments or initialization parameters. [View ultiloader.c](AtomicLua/lualoader/LuaLoader.c)
- **OffensiveLua-Main files**: These files contain Lua scripts tailored for offensive security tasks, such as simulating system attacks, extracting information, and automating the exploitation of vulnerabilities. They demonstrate the versatility of LuaJIT in both defensive and offensive cybersecurity roles. Source may be found [here on OffensiveLua by Hackerhouse-Opensource](https://github.com/hackerhouse-opensource/OffensiveLua) 
  - **bin2hex.lua**: Convert a binary to hex for binrun.lua. [View bin2hex.lua](AtomicLua/OffensiveLua-Main/bin2hex.lua)
  - **binrun.lua**: Writes a hex of EXE to a random location and executes it. [View binrun.lua](AtomicLua/OffensiveLua-Main/binrun.lua)
  - **bindshell.lua**: Bind a shell on TCP port 5000. [View bindshell.lua](AtomicLua/OffensiveLua-Main/bindshell.lua)
  - **ComputerDefaultsUACBypass.lua**: Bypass UAC restrictions via ms-settings. [View ComputerDefaultsUACBypass.lua](AtomicLua/OffensiveLua-Main/ComputerDefaultsUACBypass.lua)
  - **console.lua**: Console App Example. [View console.lua](AtomicLua/OffensiveLua-Main/console.lua)
  - **downloadexec.lua**: Download & Exec over HTTP. [View downloadexec.lua](AtomicLua/OffensiveLua-Main/downloadexec.lua)
  - **downloadexec_UACbypass.lua**: Download & Bypass UAC & Exec over HTTP. [View downloadexec_UACbypass.lua](AtomicLua/OffensiveLua-Main/downloadexec_UACbypass.lua)
  - **efspotato.lua**: Incomplete efspotato. [View efspotato.lua](AtomicLua/OffensiveLua-Main/efspotato.lua)
  - **eventcode.lua**: Example of Windows Event handler. [View eventcode.lua](AtomicLua/OffensiveLua-Main/eventcode.lua)
  - **filewrite.lua**: Write a file. [View filewrite.lua](AtomicLua/OffensiveLua-Main/filewrite.lua)
  - **howami.lua**: Simulates the "whoami.exe" command to list username, SID, and privileges. [View howami.lua](AtomicLua/OffensiveLua-Main/howami.lua)
  - **luajit.exe**: LuaJIT compiled from our internal source tree. [View luajit.exe](AtomicLua/OffensiveLua-Main/luajit.exe)
  - **memorysearch.lua**: Searches memory for passwords. [View memorysearch.lua](AtomicLua/OffensiveLua-Main/memorysearch.lua)
  - **messagebox.lua**: MessageBox Example. [View messagebox.lua](AtomicLua/OffensiveLua-Main/messagebox.lua)
  - **regread.lua**: Read from Registry. [View regread.lua](AtomicLua/OffensiveLua-Main/regread.lua)
  - **regwrite.lua**: Write to Registry. [View regwrite.lua](AtomicLua/OffensiveLua-Main/regwrite.lua)
  - **regwritedel.lua**: Write and Delete from Registry. [View regwritedel.lua](AtomicLua/OffensiveLua-Main/regwritedel.lua)
  - **rickroll.lua**: Open a browser on URL. [View rickroll.lua](AtomicLua/OffensiveLua-Main/rickroll.lua)
  - **runcmd.lua**: Run a command popen. [View runcmd.lua](AtomicLua/OffensiveLua-Main/runcmd.lua)
  - **runcmd2.lua**: Run a command os.execute. [View runcmd2.lua](AtomicLua/OffensiveLua-Main/runcmd2.lua)
  - **runswhide.lua**: Run a command via CreateProcess with SW_HIDE. [View runswhide.lua](AtomicLua/OffensiveLua-Main/runswhide.lua)
## Workflow Automation

Explore the automated build process configured for this project:
- **GitHub Actions Workflow**: [View Build Workflow](.github/workflows/build.yml)

This project is designed to be a starting point for defenders to learn and integrate LuaJIT into their security toolset. By understanding and using LuaJIT, defenders can enhance their capabilities in scripting and automating security tasks efficiently.

