import re
import pyperclip

# Pattern to match email addresses
EMAIL_PATTERN = re.compile(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b')

def remove_emails(text):
    """Remove all email addresses from the given text."""
    return EMAIL_PATTERN.sub('', text)

def main():
    text = pyperclip.paste()
    cleaned = remove_emails(text)
    pyperclip.copy(cleaned)
    print("Removed email addresses from clipboard.")

if __name__ == "__main__":
    main()

