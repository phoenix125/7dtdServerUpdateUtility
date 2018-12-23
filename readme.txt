7dtdServerUtility - A Utility To Keep Your 7 days To Die Dedicated Server updated (and schedule server restarts, download and install new server files, and more!)
- Latest version: 7dtdServerUtility_v1.4.1 (2018-12-22)
- By Phoenix125 | http://www.Phoenix125.com | http://discord.gg/EU7pzPs | kim@kim125.com
- Based on Dateranoth's ConanExilesServerUtility-3.2.3 and 7dServerUtility | https://gamercide.org/

-----------------
 GETTING STARTED (Two sets of instructions: one for existing servers and the other to use the 7dtdServerUtility tool to download and install the dedicated server)
-----------------

EXISTING SERVER:
1) Run 7dtdServerUtility.exe
- The file "7dtdServerUtility.ini" will be created and the program will exit.
2) Modify the default values in "7dtdServerUtility.ini" to point to your "serverconfig.xml" (or comparable file), install folder, and any other desired values.
3) Run 7dtdServerUtility.exe again.
- It will validate your files, install any updates, and start the server.
4) Your server should be up-to-date and running! 

FRESH SERVER: Use 7dtdServerUtility to download install a fresh dedicated server
1) Run 7dtdServerUtility.exe
- The file "7dtdServerUtility.ini" will be created and the program will exit.
2) Open the "7dtdServerUtility.ini" with Notepad and modify the follow values:
	"Serverdir=" 	[Enter your desired server folder]
	"steamcmddir="	[Enter desired SteamCMD folder] (SteamCMD is Steam's utility to download and install the Steam programs)
	"[Version: 0-Stable/1-Latest Experimental] ServerVer=0" [Select Stable or Experimental version]
- No need to make any other changes at this time.
3) Run 7dtdServerUtility.exe again.
- All the required files will be downloaded and installed.
- Once completed, your server will be running... Now it's time to config the server and utility.
4) Shut down the server by rt-clicking on the 7dtdServerUtility icon on the lower right.
5) Modify the remaining default values in "7dtdServerUtility.ini".
6) Modify default values in "serverconfig.xml" (or comparable file) within the 7DTD server folder.
7) Run 7dtdServerUtility.exe again.
8) Congrats! Your new server is running.

------------
 KNOWN BUGS
------------
- None reported at this time

--------------
 INSTRUCTIONS
-------------- 
Notes:	- It is suggested that you RENAME or COPY the default serverconfig.xml file as it will be overwritten with any updates
	- Telnet password can only contain letters and numbers.  

To Shutdown your server:
- Right-click on the 7dtdServerUtility icon and select EXIT.
To restart your server:
- Run 7dtdServerUtility.exe

----------
 FEATURES
----------
- Automatically download and install a new 7 Days To Die Dedicated Server: No need to do it manually.
- Automatically keeps server updated.
- Announce server updates and restarts on Discord, Twitch, and MCRCON.
- Works with both STABLE and EXPERIMENTAL versions
- Optionally automatically add version (ex: Alpha 17 (b239)) to server name with each update, so that users can quickly identify that you are running the latest server.
- Optionally automatically rename GameName to current version (ex: Alpha 17 b239) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).
- KeepServerAlive: Detects server crashes and will restart the server.
- User-defined scheduled reboots
- Remote restart (via web browser)
- Clean shutdown of your server.
- Retain detailed logs of 7DTD dedicated server and 7dtdServerUtility.

---------
 CREDITS
---------
- Based on Dateranoth's ConanExilesServerUtility-3.2.3 and 7dServerUtility (THANK YOU!)
https://gamercide.org/forum/topic/9296-7-days-to-die-server-utility/
https://gamercide.org/forum/topic/10558-conan-exiles-server-utility/

----------------
 DOWNLOAD LINKS
----------------
Latest Version: 	http://www.phoenix125.com/share/7dtdServerUtility.zip
Source Code (AutoIT): 	http://www.phoenix125.com/share/7dtdServerUtility.au3
GitHub:			https://github.com/phoenix125/7dtdServerUtility

Website: http://www.Phoenix125.com
Discord: http://discord.gg/EU7pzPs

-----------------
 VERSION HISTORY
-----------------

(2018-12-220 v1.4.1
- Fixed error with undefined variable in GameName when WipeServer=no

(2018-12-21) v1.4
- Added option to automatically rename GameName to current version (ex: Alpha 17 b239) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).

(2018-12-20) v1.3
- Added option to automatically add version (ex: Alpha 17 (b233)) to server name after updates (so that users can quickly identify that you are running the latest server)

(2018-12-20) v1.2.3
- Added option to announce only server updates and/or scheduled reboots on Discord/Twitch/MCRCON

(2018-12-19) v1.2.2
- Improved update reliability and speed: Validates files on first run, then only when buildid (server version) changes. Backs up & erases appmanifest_294420.acf to force update when client-only update is released by The Fun Pimps.

(2018-12-19) v1.2.1
- Added "Do you wish to continue with installation?" after a serverconfig.xml not found error.

(2018-12-18) v1.2
Fixed "Does not work with a telnet password at this time."
Fixed "If The Fun Pimps release a client-only update, 7dtdServerUtility will go into an endless update loop because the server files don't change (therefore SteamCMD's verify command says no update is needed) but Steam still assigns a new version ID to the update. SteamCMD's update reports no update needed, but the version IDs still mismatch."

(2018-12-17) v1.1
- Added "Automatically import server settings from serverconfig.xml (or comparable file)"

(2018-12-16) v1.0 Initial Release
- Automatically download and install a new 7 Days To Die Dedicated Server: No need to do it manually.
- Automatically keeps server updated.
- Announce server updates and restarts on Discord, Twitch, and MCRCON.
- Works with both STABLE and EXPERIMENTAL versions
- KeepServerAlive: Detects server crashes and will restart the server.
- User-defined scheduled reboots
- Remote restart (via web browser)
- Clean shutdown of your server.
- Retain detailed logs of 7DTD dedicated server and 7dtdServerUtility.