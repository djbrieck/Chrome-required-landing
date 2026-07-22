# Google Chrome Required Landing Page  

This repository contains a simple web page that displays the message **“Google Chrome is Required!”**. It is packaged and deployed using an IPFS cluster (via `ipfs-cluster-ctl`). The purpose of this page is to act as a  landing page place holder for links saved in [The landing page project](https://github.com/djbrieck/landingPage/tree/js-dynamic-claude) that require Google Chrome to work properly. Since I now I maintain a separe list of bookmarks for chrome, this is reminder to use chrome.

---

## Project Structure

| File | Description |
|------|-------------|
| **index.html** | HTML page that prompts users to open Google Chrome. It includes a “Go back” button linked to the browser history. |
| **deploy.sh**   | Bash script that validates the presence of `index.html`, adds it to an IPFS cluster, and prints the resulting public hash. |

---

## How It Works

1. **`index.html`**  
   - The page is centered on a light‑gray background.  
   - Title: *Google Chrome is Required!*  
   - Body text instructs users to open Google Chrome and try again.  
   - A single button (`Go back`) triggers `history.back()` to navigate to the previous page.

2. **`deploy.sh`**  
   - Checks that `index.html` exists; aborts if missing.  
   - Uses `ipfs-cluster-ctl` to upload the file as a website‑type entry.  
   - Stores a custom metadata name: `"Google Chrome Required Landing Page"` and prints the public hash.

---

## Usage

### 1️⃣ Verify & Run the HTML Locally  
```bash
# No dependencies required – just open in a browser
open index.html   # macOS
xdg-open index.html   # Linux
start index.html       # Windows PowerShell
```

You should see the landing page displayed.

### 2️⃣ Deploy to IPFS Cluster  

Assuming you have an `ipfs-cluster-ctl` binary configured:

```bash
chmod +x deploy.sh          # make script executable (optional)
./deploy.sh                 # runs the upload and prints the hash
```

Output example:
```
Attempting to add selected files to IPFS cluster...
Successfully added selected files.
Received public hash of: QmXyZ...abc123
```

The file is now stored at `https://&lt;cluster&gt;.ipfs.tech/&lt;public-hash&gt;`.

---

## Customisation

- **Message/Title** – Edit the `&lt;title&gt;` and heading text inside `index.html`.  
- **Button Action** – Replace `history.back()` with any JavaScript you wish (e.g., redirect to another URL).  
- **IPFS Name** – The script uses a fixed name (`Google Chrome Required Landing Page`). Change it in the command line if needed, e.g.:
  ```bash
  ipfs-cluster-ctl add index.html --name "My Custom Landing" ...
  ```

---

## Dependencies

| Component | Purpose |
|-----------|---------|
| `ipfs-cluster-ctl` | CLI to interact with an IPFS cluster; must be installed and running. |
| Bash (POSIX) | `deploy.sh` relies on standard shell commands (`[`, `chmod`). |

No other Python, Node, or front‑end libraries are required.