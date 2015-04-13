# weather-yesterday
Personal project to compare today's weather with yesterday's.

## Usage

Before compiling, create a .plist file in the main project directory (File->New->File->Property List) named 'APIKeys.plist'. Edit the plist file source code to match the following format, filling in API Keys as required:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>OpenWeatherAPI</key>
    <dict>
        <key>APIKey</key>
        <string>YOUR_KEY_HERE</string>
    </dict>
</dict>
</plist>
```

Built by Brittany and Chris
