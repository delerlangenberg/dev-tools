\# Universal Git Sync Tool

A cross-platform script that synchronizes **all Git repositories** within a folder hierarchy.

Works on **Windows (PowerShell/Git Bash)** and **Linux/macOS**, allowing you to keep your development environment in sync across multiple machines.

---

## 🚀 Features

- Scans a folder (and all subfolders) for Git repositories
- Automatically runs:
  - `git add .` — Stages all changes
  - `git commit -m "sync"` — Commits changes
  - `git pull --rebase` — Pulls remote changes
  - `git push` — Pushes local commits
- Cross-platform support:
  - **Windows**: PowerShell (use `sync-all.ps1` from root directory)
  - **Linux/macOS**: Bash (use `sync-all.sh`)
  - **Git Bash on Windows**: Also supports `sync-all.sh`
- Keeps all your projects synchronized between home and work

---

## 📦 Installation

### Linux/macOS

```bash
# Clone this repository
git clone <your-repo-url> dev-tools
cd dev-tools

# Make the script executable
chmod +x sync-all.sh

# Optionally, add to your PATH
sudo cp sync-all.sh /usr/local/bin/sync-all
```

### Windows (PowerShell)

```powershell
# Clone this repository
git clone <your-repo-url> dev-tools

# The PowerShell script is located in the parent directory
# You can create an alias in your PowerShell profile:
Set-Alias sync-all "C:\path\to\sync-all.ps1"
```

---

## 🔧 Usage

### Linux/macOS/Git Bash

```bash
# Sync all repos in the current directory
./sync-all.sh

# Sync all repos in a specific directory
./sync-all.sh /path/to/your/projects
```

### Windows (PowerShell)

```powershell
# Navigate to your projects folder
cd C:\Users\YourName\GitHub

# Run the sync script from parent directory
..\sync-all.ps1

# Or if you've set up the alias:
sync-all
```

---

## 📂 Example Folder Structure

```
GitHub/
├── project-one/     (.git/)
├── project-two/     (.git/)
├── project-three/   (.git/)
└── sync-all.ps1    (run this on Windows)

dev-tools/
└── sync-all.sh     (run this on Linux/macOS)
```

When you run the sync script, it will:
1. Find all directories containing `.git/`
2. Stage, commit, pull (with rebase), and push changes
3. Report progress for each repository

---

## ⚙️ How It Works

### Bash Script (`sync-all.sh`)

- Uses `find` to locate all `.git` directories recursively
- Iterates through each repository
- Executes git operations with error handling
- Continues even if a repository has no changes to commit

### PowerShell Script (`sync-all.ps1`)

- Uses `Get-ChildItem` to find all directories in the current folder
- Assumes each subdirectory is a Git repository
- Executes git operations with error suppression for commits (no changes = no error)
- Automatically pulls with rebase and pushes

---

## ⚠️ Important Notes

- **Commit Message**: All commits use the message "sync" by default
- **Destructive Operations**: This script will stage ALL changes in each repo
- **Network Required**: Requires internet connection for pull/push operations
- **Authentication**: Ensure Git credentials are configured (SSH keys or credential manager)
- **Conflicts**: If merge conflicts occur during rebase, the script will stop and require manual intervention

---

## 🛡️ Safety Tips

1. **Review changes first**: Always check `git status` before running the script
2. **Backup important work**: Consider branching before bulk operations
3. **Test on non-critical repos**: Try it on a test folder first
4. **Check your .gitignore**: Ensure sensitive files aren't being committed

---

## 📝 License

MIT License - Feel free to use and modify as needed.

---

## 🤝 Contributing

Suggestions and improvements welcome! Feel free to:
- Report issues
- Suggest features
- Submit pull requests

---

**Author**: Dr. Deler Langenberg



