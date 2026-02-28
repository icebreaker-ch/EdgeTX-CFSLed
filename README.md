# EdgeTX-CFSBlink
A lua script class (library) to add blinking capabilities for the Customer Function Switch (CFS) Color LEDS on [EdgeTX](https://github.com/EdgeTX/edgetx) Radios, like the Radiomaster TX15 MAX.
## Features
The following parameters can be configured:
- Color for off state (default BLACK)
- Color for off state when blinking (default BLACK)
- Color for on state when blinking (default WHITE)
- Off-time when blinking (default 500 ms)
- On-time when blinking (defult 500 ms)
## Installation
- Copy the CFSBlink folder into your SD-Card SCRIPTS folder.
- Make copy of the file `template.lua` and rename it according to your needs (`sw4` in my example).
- Edit the copied file according to your requests and put it into the FUNCTIONS Folder
- The structure on your radios SD-Card should look like this now:
```
:
/SCREENSHOTS
/SCRIPTS
    /CFSBLINK
        cfsblink.lua
    /FUNCTIONS
        sw4.lua
:
```
## Configuration
- Allow Lua override for the Customizable Switch you want to control (check both boxes `Allow Lua override`):
 <img width="1015" height="177" alt="cfsconfig" src="https://github.com/user-attachments/assets/c1ce2e1f-0438-479f-87b6-8eb8829d8fdc" />

## Usage
- Add a call to your lua script for a special function:
  <img width="1276" height="177" alt="special-function-call" src="https://github.com/user-attachments/assets/62a0b4c9-ff2e-48eb-8fea-374dab326e18" />

