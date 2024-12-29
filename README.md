# YT2MP3 Downloader

YT2MP3 Downloader is a lightweight script for macOS that allows you to easily download audio from YouTube videos and convert it to MP3 format.

## Features
- Downloads the best available audio from YouTube.
- Converts audio to high-quality MP3 format.
- Automatically embeds thumbnails in the MP3 file.
- Provides notifications when the download is complete.
- Integrates with macOS Services for quick use.

## Requirements
- **yt-dlp** – Used to download audio from YouTube.
- **ffmpeg** – Used to convert the downloaded audio to MP3 format.

> **Note:** Please ensure these tools are installed and accessible via your system’s `PATH`. You may install them using any method you prefer (e.g., package managers, direct downloads from official sites, etc.).


### Step 1: Install yt-dlp and ffmpeg

#### Option 1: Using Homebrew (Recommended for most macOS Users)
Homebrew simplifies the installation of these tools:

1. Install Homebrew if it’s not already installed:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"    
2. Install yt-dlp and ffmpeg
   ```bash
   brew install yt-dlp ffmpeg   
   

### Step 2: Set Up the Script as a macOS Service
1. **Download** the `yt2mp3.sh` script from this repository.
2. **Open** the macOS **Automator** app.
3. **Create** a new **Quick Action** (sometimes listed as “Service” on older macOS versions).
4. **Set Workflow** as 'Receives text' in 'any application'.
5. **Add** a **Run Shell Script** action.
6. **Copy and Paste** the script contents into the Shell Script editor.
7. **Double check** that Pass Input drop down is set to 'as arguments'
8. **Set the Shell** I wrote the script to use /bin/bash.
9. **Save** the Quick Action with the name **YT2MP3**.

## How to Use YT2MP3

YT2MP3 integrates into macOS as a Service, allowing you to quickly download and convert YouTube videos to MP3 files.

### Using the Right-Click Menu
1. **Highlight** the YouTube Video ID or the full URL. For example:
   - Video ID: `exampleID`
   - URL: `https://www.youtube.com/watch?v=exampleID`
2. **Right-click** the highlighted text.
3. **Navigate** to **Services** in the context menu.
4. **Select** **YT2MP3**.

### Using a Keyboard Shortcut (Optional)
1. Open **System Preferences** (or **System Settings** on newer macOS versions).
2. Navigate to **Keyboard > Shortcuts > Services**.
3. Find **YT2MP3** in the list and assign a custom shortcut (e.g., `Ctrl+Shift+Y`).

## Output Location
- By default, MP3 files will be saved in the `~/Music/yt` directory.
- To change this, edit the `DOWNLOAD_DIR` variable at the top of the script:
- DOWNLOAD_DIR=~/Music/yt
  
  
## Troubleshooting
- Missing Dependencies: If you see an error about missing yt-dlp or ffmpeg, refer to the Installation section above.
- Permission Issues: Make sure the script is executable:
- chmod +x yt2mp3.sh
- No Output or Errors: Verify that yt-dlp and ffmpeg are correctly installed and accessible in your system's PATH.  

## Disclaimer
This tool is provided for convenience to simplify processes that could otherwise be performed manually using publicly available tools like yt-dlp and ffmpeg. However, it is your responsibility to ensure that your usage complies with the copyright laws and regulations in your country or region.

### Respect Copyright: 
Do not use this tool to download or convert copyrighted material unless you own the rights or have explicit permission from the copyright holder.

### For Personal Use Only: 
This tool is intended to assist with personal, legal use cases, such as downloading and managing publicly available, non-copyrighted content or content you have legal rights to access.

### No Liability: 
The author of this tool is not responsible for any misuse or illegal activity arising from its use.
By using this tool, you agree to take full responsibility for ensuring that your actions comply with all applicable laws and regulations.

This script is provided "as is" without warranty of any kind, express or implied. While every effort has been made to ensure the tool functions as intended, the author is not responsible for:

* Any unintended behavior or errors caused by the script.
* Data loss, corruption, or damage to your system or files.
* Misuse of the tool or any actions taken by the user.
* By using this tool, you accept full responsibility for any outcomes, including unintended or adverse effects. 

The author encourages everyone to always review the source code of the script and understand what it is doing and claiming to do, So, always review the script, test in a safe environment, and back up important data before use.
