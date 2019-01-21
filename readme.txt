7dtdServerUtility - A Utility to Keep Your 7 days To Die Dedicated Server updated (and schedule server restarts, download and install new server files, and more!)
- Latest version: 7dtdServerUtility_v1.8.1 (2019-01-20)
- By Phoenix125 | http://www.Phoenix125.com | http://discord.gg/EU7pzPs | kim@kim125.com
- Based on Dateranoth's ConanExilesServerUtility-3.2.3 and 7dServerUtility | https://gamercide.org/

----------
 FEATURES
----------
- OK to use with most other server managers: Use this tool to install and maintain the server and use your other tools to manage game play features.
- Automatically download and install a new 7 Days To Die Dedicated Server: No need to do it manually.
- Automatically keeps server updated.
- Announce server updates and restarts in game, on Discord and Twitch.
- Works with both STABLE and EXPERIMENTAL versions.
- Optionally automatically add version (ex: Alpha 17 (b240)) to server name with each update, so that users can quickly identify that you are running the latest version.
- Optionally automatically rename GameName to current version (ex: Alpha 17 b240) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).
- KeepServerAlive: Detects server crashes (checks for 7DaysToDieServer.EXE and telnet reponse checks) and will restart the server.
- User-defined scheduled reboots.
- Remote restart (via web browser).
- Run multiple instances of 7dtdServerUtil to manage multiple servers.
- Clean shutdown of your server.
- Retain detailed logs of 7DTD dedicated server and 7dtdServerUtility.
- Optionally restart server on excessive memory use.

-----------------
 GETTING STARTED (Two sets of instructions: one for existing servers and the other to use the 7dtdServerUtility tool to download and install a new dedicated server)
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

To shut down your server:
- Right-click on the 7dtdServerUtility icon and select EXIT.
To restart your server:
- Run 7dtdServerUtility.exe

-----------------
 TIPS & COMMENTS
-----------------
Comments:
- It is suggested that you RENAME or COPY the default serverconfig.xml file as it will be overwritten with any updates
- Telnet password can only contain letters and numbers.
- There are a lot of parameters that can be set in the 7dtdServerUtility.ini. All parameters can be left at the default value, except...
  I recommend changing the default serverconfig.xml filename so that it does not get overwritten with each server update or file validation.
- If running multiple instances of this utility, each copy must be in a separate folder.
Tips:
- Use the "Run external script during server updates" feature to run a batch file that disables certain mods during a server update to prevent incompatibilities.
- If running multiple instances of this utility, rename 7dtdServerUtility.exe to a unique name for each server. The phoenix icon in the lower right will display the filename.
  For example: I run 5 servers, so I renamed the ServerUtility.exe files to 7DTD-STABLE.EXE, 7DTD-EXPERIMENTAL.EXE, CONAN-2X_HARVEST.EXE, CONAN-Pippi.EXE, CONAN-CALAMITOUS.EXE.

---------------------------
 UPCOMING PLANNED FEATURES
---------------------------
- Create a GUI interface for modifying the .ini file

----------------
 DOWNLOAD LINKS
----------------
Latest Version: 	http://www.phoenix125.com/share/7dtdServerUtility.zip
Source Code (AutoIT): 	http://www.phoenix125.com/share/7dtdServerUtility.au3
GitHub:			https://github.com/phoenix125/7dtdServerUtility

Website: http://www.Phoenix125.com
Discord: http://discord.gg/EU7pzPs

---------
 CREDITS
---------
- Based on Dateranoth's ConanExilesServerUtility-3.2.3 and 7dServerUtility (THANK YOU!)
https://gamercide.org/forum/topic/9296-7-days-to-die-server-utility/
https://gamercide.org/forum/topic/10558-conan-exiles-server-utility/


-----------------------
 DETAILED INSTRUCTIONS
-----------------------
====> Request Restart From Browser <====
- If enabled on the server, use to remotely restart the server.
- Set Password in INI file to save, or type each time.
- Restart using IP or Domain Name
- Restart commands are now expecting HTTP headers, and can be sent to the server from a web browser using the format http://IP:PORT?restart=user_pass. The utility will respond if the password is accepted or not. There is also a limit for max password attempts. After 15 tries in 10 minutes the requesting IP will be locked out for 10 minutes.
- 404 Responses will be sent if the RestartKey does not match or the header is incorrect. You can enable Debugging for a full output to the log what is being received by the server if you have any trouble.
- These Are the Allowed Characters in the RestartCode (Password) 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@$%^&*()+=-{}[]\|:;./?

Usage Example:
INI SETTINGS
[Game Server IP]
ListenIP=192.168.0.1
[Use Remote Restart ?yes/no]
UseRemoteRestart=yes
[Remote Restart Port]
ListenPort=57520
[Remote Restart Request Key http://IP:Port?KEY=user_pass]
RestartKey=restart
[Remote Restart Password]
RestartCode=Admin1_Pass1,Admin2_Pass2

In a standard web browser, type in the URL http://192.168.0.1:57520?restart=Admin1_Pass1 The Server would compare the pass and find that it is correct. It would respond with 200 OK And HTML Code stating the server is restarting.

-----------------
 VERSION HISTORY
-----------------

(2019-01-18) v1.8.1
- Faster and more reliable shutdown process and in game announcements.
- Added the option to run an external script during server updates.. good for writing a batch file to disable certain mods during a server update to ensure server reliability.
- Added a feature to check that the server is running and responsive by logging into the server and ensuring a valid response. Requires telnet to be active.
- Added a feature to keep only the latest 20 logfiles of the dedicated server.
- Fixed: another condition in which an update may not be detected.

(2019-01-10) v1.8
- Fixed: a condition in which an experimental update may not be detected.

(2019-01-09) v1.7.2
- Removed the redundant MCRCON options in the 7dtdServerUtility.ini. Use in-game message annuncements instead.
- Changed default install folder values for SteamCMD and 7DTD from Steam's default values to 'D:\Game Servers\7 Days to Die Dedicated Server\SteamCMD' and 'D:\Game Servers\7 Days to Die Dedicated Server'.

(2019-01-01) v1.7.1
- Fixed Error when NOT validating files (Thanks to CrasheR for notifying me).
- Added the option to execute a file before and/or after server update check (Thanks again to CrasheR for recommending these options).
- Tweaked notification windows again.

(2018-12-29) v1.7
- Added option to announce server updates & reboots as in game message.

(2018-12-24) v1.6.1
- Added option: When appending current version to server name, added option to use SHORT version (b240) or LONG version (Alpha A17 (b240)).
- Minor tweaks to notification windows and log file.
- Fixed: Truncated server name if the '|' character was used in server name.

(2018-12-24) v1.6
- Added ability to run multiple instances of 7dtdServerUtil to manage multiple servers.
- Fixed the instance when the "no .ini file found" error popup gets hidden behind the server is starting splash screen.
- Tweaked notification window sizes a little more.

(2018-12-23) v1.5
- Fixed an error in getting the Experimental Version buildid. The Fun Pimps changed the source file after the latest_experimental went stable. After a major rework, this utility SHOULD be forward compatible for now on.
- Sped up the reboot time significantly.
- Modified the notification windows to be smaller and movable.
- Added notification windows during startup and errors.

(2018-12-22) v1.4.1
- Fixed error with undefined variable in GameName when WipeServer=no

(2018-12-21) v1.4
- Added option to automatically rename GameName to current version (ex: Alpha 17 b239) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).

(2018-12-20) v1.3
- Added option to automatically add version (ex: Alpha 17 (b233)) to server name after updates (so that users can quickly identify that you are running the latest server)

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
