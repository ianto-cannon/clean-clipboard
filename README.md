# Remove Emails from Clipboard

A lightweight shell script that removes all email addresses from your clipboard — useful for better privacy when pasting email threads into ChatGPT or other AI tools. Can be used on macOS or Linux.

---

## Requirements

You need one clipboard tool installed:

| Platform | Clipboard tools supported | Install command |
|-----------|----------------------------|-----------------|
| **macOS** | `pbpaste`, `pbcopy` | *(preinstalled)* |
| **Linux (X11)** | `xclip` or `xsel` | `sudo apt install xclip` or `sudo apt install xsel` |
| **Linux (Wayland)** | `wl-copy`, `wl-paste` | `sudo apt install wl-clipboard` |
| **BSD** | `xclip` or `xsel` | via package manager |

---

## Installation

```bash
git clone https://github.com/ianto-cannon/clean-clipboard.git
cd clean-clipboard
chmod +x clean-clipboard.sh
sudo mv clean-clipboard.sh /usr/local/bin/clean-clipboard
```

This makes the script available system-wide as the `clean-clipboard` command.

---

## Usage

1. Copy any text containing one or more email addresses.  
2. Run:
   ```bash
   clean-clipboard
   ```
3. Paste — all email addresses will have been removed from the clipboard.

---

## Example

**Before:**
```
Contact alice@example.com or support@company.org for help.
```

**After:**
```
Contact  or  for help.
```

---

## Customization

If you prefer to **replace** email addresses with a placeholder rather than removing them completely, edit this line in the script:

Change:
```bash
cleaned=$(echo "$text" | sed -E 's/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}//g')
```

To:
```bash
cleaned=$(echo "$text" | sed -E 's/[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/[email removed]/g')
```

---

## License

MIT License
