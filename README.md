## Requirements

### General

- NeoVim
- Git (Lazy)
- Curl (idk)
- ripgrep (Telescope)
- C-Compiler, gcc (Linux), clang (Windows)
- Python 3 (hererocks)
- Java (nvim-java)

### Windows
- PowerShell 7 (optional)
- Visual Studio build tools / Visual Studio with "Desktop development with C++"

> **_NOTE:_** Installing packages from mason with these versions may lead to conflict (e.g. cmake-language-server requires Python < 3.13)

```
winget install Neovim.Neovim Git.Git BurntSushi.ripgrep.GNU LLVM.LLVM Python.Python.3.13 EclipseAdoptium.Temurin.23.JDK
```
