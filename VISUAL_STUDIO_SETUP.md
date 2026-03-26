# Visual Studio Setup for Windows Development

To build **Floodio** as a native Windows application, you must install the Visual Studio C++ toolchain. This is distinct from Visual Studio Code (VS Code), which is a lightweight editor.

## 📥 1. Download the Installer
Download the **Visual Studio 2022 Community** (Free) installer from the official website:
[visualstudio.microsoft.com/downloads/](https://visualstudio.microsoft.com/downloads/)

## 🛠 2. Select the Correct Workload
During the installation process, the "Visual Studio Installer" will ask you which "Workloads" to install. You **must** select:

*   **Desktop development with C++** (Found in the "Desktop & Mobile" section)

### Ensure these individual components are checked:
On the right-hand side, under "Installation details," verify that the following are selected:
1.  **MSVC v143 - VS 2022 C++ x64/x86 build tools** (Latest)
2.  **Windows 11 SDK** (or Windows 10 SDK)
3.  **C++ CMake tools for Windows**

## 🚀 3. Installation
1.  Click **Install** (the download is approximately 1.5GB - 3GB).
2.  Once the installation is complete, **restart your computer**.

## ✅ 4. Verification
After restarting, open your terminal (PowerShell or Command Prompt) and run:
```bash
flutter doctor
```
Under the **Visual Studio** section, it should now show a green checkmark `[√]`.

## 📦 5. Building the App
Now you can execute the Windows build command successfully:
```bash
# First, ensure code generation is complete
dart run build_runner build --delete-conflicting-outputs

# Build the Windows executable
flutter build windows
```

The output will be located in:
`build\windows\x64\runner\Release`
