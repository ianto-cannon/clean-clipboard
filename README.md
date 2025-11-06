# Remove Emails from Clipboard

A simple shell script that removes email addresses from your clipboard text.  
Run this before pasting email threads into AI tools such as ChatGPT so that you do not give away personal data.  
Can be used on macOS or Linux.

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

### **Before running `remove-emails`:**

```
From: Alice Johnson <alice.johnson@company.com>
To: Bob Smith <bob.smith@org.net>
Cc: Carol <carol_dev@startup.io>
Subject: Re: Conference Planning

Hi Bob,

Thanks for the update! I’ve attached the draft agenda. Could you ask Carol to confirm the catering details with the venue?  
I’ll follow up with the external speakers once we have the finalized schedule.

Best,  
Alice

On Tue, 4 Nov 2025 at 10:45, Bob Smith <bob.smith@org.net> wrote:
> Hi Alice,
> Just confirming that the hotel booking is complete. Carol will handle the transport arrangements.
> Best,
> Bob
```

### **After running `remove-emails`:**

```
From: Alice Johnson <>
To: Bob Smith <>
Cc: Carol <>
Subject: Re: Conference Planning

Hi Bob,

Thanks for the update! I’ve attached the draft agenda. Could you ask Carol to confirm the catering details with the venue?  
I’ll follow up with the external speakers once we have the finalized schedule.

Best,  
Alice

On Tue, 4 Nov 2025 at 10:45, Bob Smith <> wrote:
> Hi Alice,
> Just confirming that the hotel booking is complete. Carol will handle the transport arrangements.
> Best,
> Bob
```

Now the text can be safely pasted into an AI tool without exposing personal email addresses.

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
