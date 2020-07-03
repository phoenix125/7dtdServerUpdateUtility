7dtdServerUpdateUtility - A Utility to Keep Your 7 days To Die Dedicated Server updated (and schedule server restarts, download and install new server files, and more!)
- Latest version: 7dtdServerUpdateUtility_v2.3.3 (2020-07-03) (Beta and Stable are the same version)
- By Phoenix125 | http://www.Phoenix125.com | http://discord.gg/EU7pzPs | kim@kim125.com
- Based on Dateranoth's ConanExilesServerUtility-3.3.0 and 7dServerUtility | https://gamercide.org/

----------
 FEATURES
----------
- OK to use with most other server managers: Use this tool to install and maintain the server and use your other tools to manage game play features.
- Automatically download and install a new 7 Days To Die Dedicated Server: No need to do it manually.
- Automatically keeps server updated.
- Now send telnet & global chat in-game messages with a click.
- After updates, "(Almost) Future Proof" option adds 19 existing parameters to the new serverconfig.xml file to accommodate config changes during updates.
- Announce server updates and/or restarts in game, on Discord and Twitch.
- Works with both STABLE and EXPERIMENTAL versions.
- Optionally automatically add version (ex: Alpha 17 (b240)) to server name with each update, so that users can quickly identify that you are running the latest version.
- Optionally automatically rename GameName to current version (ex: Alpha 17 b240) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).
- KeepServerAlive: Detects server crashes (checks for 7DaysToDieServer.EXE and telnet response) and will restart the server.
- User-defined scheduled reboots.
- Remote restart (via web browser).
- Run multiple instances of 7dtdServerUpdateUtility to manage multiple servers.
- Clean shutdown of your server.
- Retain detailed logs of 7DTD dedicated server and 7dtdServerUpdateUtility.
- Optionally restart server on excessive memory use.
More detailed features:
- Optionally execute external files for six unique conditions, including at updates, scheduled restarts, remote restart, when first restart notice is announced
  *These options are great executing a batch file to disable certain mods during a server update, to run custom announcement scripts, make config changes (enable PVP at scheduled times), etc.
- Keeps only the latest 20 logfiles of the 7dtd dedicated server (the default value set by The Fun Pimps).
- Can validate files on first run, then optionally only when buildid (server version) changes. Backs up & erases appmanifest_294420.acf to force update when client-only update is released by The Fun Pimps.
- Automatically imports server settings from serverconfig.xml (or comparable file) and creates a temporary file... leaving the original file untouched.

-----------------
 GETTING STARTED (Two sets of instructions: one for existing servers and the other to use the 7dtdServerUpdateUtility tool to download and install a new dedicated server)
-----------------

EXISTING SERVER:
1) Run 7dtdServerUpdateUtility.exe
- The file "7dtdServerUpdateUtility.ini" will be created and the program will exit.
2) Modify the default values in "7dtdServerUpdateUtility.ini" to point to your "serverconfig.xml" (or comparable file), install folder, and any other desired values.
3) Run 7dtdServerUpdateUtility.exe again.
- It will validate your files, install any updates, and start the server.
4) Your server should be up-to-date and running! 

FRESH SERVER: Use 7dtdServerUpdateUtility to download install a fresh dedicated server
1) Run 7dtdServerUpdateUtility.exe
- The file "7dtdServerUpdateUtility.ini" will be created and the program will exit.
2) Open the "7dtdServerUpdateUtility.ini" with Notepad and modify the follow values:
	"Serverdir=" 	[Enter your desired server folder]
	"steamcmddir="	[Enter desired SteamCMD folder] (SteamCMD is Steam's utility to download and install the Steam programs)
	"[Version: 0-Stable/1-Latest Experimental] ServerVer=0" [Select Stable or Experimental version]
- No need to make any other changes at this time.
3) Run 7dtdServerUpdateUtility.exe again.
- All the required files will be downloaded and installed.
- Once completed, your server will be running... Now it's time to config the server and utility.
4) Shut down the server by rt-clicking on the 7dtdServerUpdateUtility icon on the lower right.
5) Modify the remaining default values in "7dtdServerUpdateUtility.ini".
6) Modify default values in "serverconfig.xml" (or comparable file) within the 7DTD server folder.
7) Run 7dtdServerUpdateUtility.exe again.
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
- Right-click on the 7dtdServerUpdateUtility icon and select EXIT.
To restart your server:
- Run 7dtdServerUpdateUtility.exe

-----------------
 TIPS & COMMENTS
-----------------
Comments:
- It is suggested that you RENAME or COPY the default serverconfig.xml file as it may be overwritten with server updates.
- Telnet password can only contain letters and numbers.
- There are a lot of parameters that can be set in the 7dtdServerUpdateUtility.ini. All parameters can be left at the default value, except...
    I recommend changing the default serverconfig.xml filename so that it does not get overwritten with each server update or file validation.
- If running multiple instances of this utility, each copy must be in a separate folder.
- If running multiple instances of this utility, rename 7dtdServerUpdateUtility.exe to a unique name for each server. The phoenix icon in the lower right will display the filename.
  For example: I run 6 servers, so I renamed the 7dtdServerUpdateUtility.exe files to 7DTD-STABLE.EXE, 7DTD-EXPERIMENTAL.EXE, CONAN-2X.EXE, CONAN-PIPPI.EXE, CONAN-LITMAN.EXE, & ATLAS.EXE.
- If using the "Request Restart From Browser" option, you have to use your local PC's IP address as the server's IP. ex: "Server Local IP=192.168.1.10" (127.0.0.1 and external IP do not work).
Tips:
- Use the "Run external script during server updates" feature to run a batch file that disables certain mods during a server update to prevent incompatibilities.

---------------------------
 UPCOMING PLANNED FEATURES
---------------------------
- Detailed instructions.
- Possibly add two more restart announcement times.  The workaround for now is to execute external scripts... often using Powershell.
- Scrapped: Create a GUI interface for modifying the .ini file. I have no intention of doing this unless there is demand for it. Let me know if you want this! email: kim@kim125.com

----------------
 DOWNLOAD LINKS
----------------
Latest Version:       http://www.phoenix125.com/share/7dtdServerUpdateUtility.zip
Previous Versions:    http://www.phoenix125.com/share/7dtdhistory/
Source Code (AutoIT): http://www.phoenix125.com/share/7dtdServerUpdateUtility.au3
GitHub:	              https://github.com/phoenix125/7dtdServerUpdateUtility

Website: http://www.Phoenix125.com
Discord: http://discord.gg/EU7pzPs
Forum:   https://phoenix125.createaforum.com/index.php

More ServerUpdateUtilities available: Conan Exiles and Atlas.  Rust and Empyrion coming soon!

---------
 CREDITS
---------
- Based on Dateranoth's ConanExilesServerUtility-3.3.0 and 7dServerUtility (THANK YOU!)
https://gamercide.org/forum/topic/9296-7-days-to-die-server-utility/
https://gamercide.org/forum/topic/10558-conan-exiles-server-utility/


-----------------------
 DETAILED INSTRUCTIONS
-----------------------
====> Request Restart From Browser <====
- If enabled on the server, use to remotely restart the server.
- When restarting, an announcement will be made in-game, on Discord, and in Twitch if enabled, with the set duration of delay (warning).
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
[Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 192.168.1.30:57520?restart=password)]
ListenPort=57520
RestartKey=restart
RestartCode=password

- You can have multiple passwords. For example: RestartCode=password1,pass2,pwd3
In a standard web browser, type in the URL http://192.168.1.30:57520?restart=password. The Server would compare the pass and find that it is correct. It would respond with 200 OK And HTML Code stating the server is restarting.

-----------------
 VERSION HISTORY
-----------------
(2020-07-02) v2.3.3 Many Bug Fixes and improvements
- Added: Two Discord WH: One for Server Status and one for Online Players / Server Time
- Added: Game Day / Time as announcement option with Online Player announcements to Discord/Twitch
- Added: Displays Online Player Count, Game Time, and Next Horde after "Server is Online and Ready for Connection" Discord announcement.
- Added: Query Port check: Much faster than Telnet. Used for online player count and Query KeepAlive. Suggest running this every 30 seconds and telnet check less often.
- Improved reliability of the server update process.
- Changed: Faster utility startup. Less waiting for servers to start or to get first online player check.
- Added: Scans for all existing 7DTD servers, compares the folders they were executed in, and assigns the proper PID if running. It does this at startup and at all server starts to prevent duplicates.
- Fixed: Icon tray clicks process immediately.
- Fixed: Online player count fixed when >9 players
- Fixed: Watchdog pause timers were not functioning properly after restarts and updates.
- Fixed: If Append Version Name and/or Wipe Server options are selected, util will no longer restart the server twice if no changes from last time server was started.
- Changed: Performs update check at program start and asks if you wish to update or not.
- Changed: Moved TT folder to temp folder.
- Changed: Moved PID file into a universal CFG file used for several persistant memory parameters.
- Changed: Log File: Creates two log files: one with basic log and other with detailed logs into a separate log folder.
- Changed: Made the status window smoother.
- Changed: If server is already running, Online player count will be performed within a few seconds.
- Changed: Online Player Window title is now the file name. Useful when running multiple servers: Change the file name to server name to label te tray icon and the online player window.

(2020-06-29) v2.3.2 Fix "latest_experimental" bug, added Discord online player count, more improvements. NOTICE! Not thoroughly tested.
- Fixed: It would not update properly if using build "latest_experimental".
- Added: Send customizable Discord Online Players message when players join or leave to second webhook
- Added: Added Query Port watchdog. Uses much less resources and no annoying popup Telnet windows. It will still get player COUNT but not player names. For player names, you must still use Telnet.
- Added: Watchdog delays for updates and server starts, to prevent watchdog from restarting server while it is generating teh map or still comig online.

(2020-06-18) v2.3.1
- Fixed: Line 11061 Error.  (Thanks to @McK1llen for reporting)

(2020-06-14) v2.3.0
- Added: Online users and current day/time window.
- Added: Daily Online Users logfile. Adds an entry when any changes in online users occurs. Also logs changes in main log file.
- Added: Response to telnet commands now displayed.
- Added: Pause Utility tray option.
- Added: At shutdown, util makes up to 5 attempts to shutdown properly, waits up to 10 seconds for server to complete shutdown, then will kill process if server still running.
- Added: Restart Server tray option.
- Added: Optionally send Discord message when server is back online after a restart.
- Added: New "\BatchFiles\" folder with five (5) new batch files are created for manual updating and starting 7DTD.
- Added: Select branch by name. ex. public/latest_experimental/alpha18.4 (Added due to The Fun Pimps removing the "latest_experimental" branch causing Line 12296 Error.

(2019-03-13) v2.2.1
- Fixed: Line 10626 and line 9451 error.  (I was missing a 1 in an expression which caused both errors). Thanks to MystaMagoo (Steam) fro reporting.

(2019-03-11) v2.2.0
- Added: Tray Icon menu and commands with option to send telnet and global chat messages, Check for utility updates, and initiate a Remote Restart.
- Fixed: When update check fails to get latest version, a warning message is displayed but the utility continues to function and check for updates. Previously it would run close servers and perform SteamCMD update loops.
- Added: You can now reboot the utility without shutting down your Atlas servers.  The util now checks for existing servers and redis using last PID.
- Added: Util updater can now automatically download, install, and run updated version without affecting running Atlas servers or redis.
- Added: Util update checks every 8 hours. Update checks can be disabled in the .ini file or by selecting (no) in the update check popup screen.
- Added: Util will remove "<-NO TRAILING SLASH AND USE FULL URL FROM WEBHOOK URL ON DISCORD" in the Discord webhook if left in there.
- Added: If util update is available, "__UTIL_UPDATE_AVAILABLE__.txt" file will be created in script folder. Once up-to-date, the file will be deleted automatically.
- Changed: debug = yes by default.

(2019-03-01) v2.1.7
- Fixed: "Line 10725" error.

(2019-02-28) v2.1.6
- Fixed: "Line 9283" error(when Steamcmd fails to provide latest server version during update check)
         I reworked this section to only detect valid responses from steam, instead of looking for the various failed responses.
- Fixed: Server password set to -1 when FutureProof config updater used.
- Added: 7dtdServerUpdateUtility update check and downloader.

(2019-02-20) v2.1.5
- Fixed: Error if wrong password is used for Remote Restart
- Fixed: "Line 9282" error (when Steamcmd fails to provide latest server version during update check)

(2019-02-13) v2.1.4
- Fixed: Another undefined variable error! Ugh!
- Cleaned up the log file a little more (will only show PID when executing server)

(2019-02-12) v2.1.3
- Fixed: "Future Proof" could engage after 3 normal reboots. Added a counter reset to "Future Proof" option so that the counter resets with each intentional reboot. 

(2019-02-12) v2.1.2
- Fixed: A condition that can cause reboot loops.

(2019-02-10) v2.1.1
- Added a feature to remove trailing slash on directory entries in the config.ini file
- Added "ServerLoginConfirmationText" to "Future Proof" imported settings.
- Fixed: undefined variable error.

(2019-02-09) v2.1.0
- Added "Future Proof" feature: After an update, if the 7dtdDedicatedServer.exe fails to run 3 times in-a-row (usually due to serverconfig.xml changes), the utility will:
    a. Read 18 common settings from your defined serverconfig file
	b. Read the new default serverconfig.xml file
	c. Combine the two into a temporary config file
	d. Rerun the 7dtdDedicatedServer.exe using the temporary config file... combining any new config file parameters to your most important existing parameters.
- Improved the retrieval of the current server version (eliminated potential duplicates).

(2019-02-08) v2.0.4
- Fixed: Undefined variable error with experimental update.

(2019-02-08) v2.0.3
- Added user-defined unique announcements for Daily, Update, and Remote Restart messages for each: In-Game, Discord, or Twitch.
- Added option to send only first announcement to Discord or Twitch (to reduce bot spam)
- Added "FINAL WARNING! Rebooting server in 10 seconds..." in-game reboot message.

(2019-02-06) v2.0.2
- Fixed: Some announcements were not disabling.

(2019-02-05) V2.0.1
- Added the option for multiple announcement times for each type of announcement.
- Added separate message options for each reboot scenario: Updates, Daily, and Remote Restart triggered restarts.
- Improved the config file for improved clarity and easier to read.
- Minor improvements on format and wording were made to the log file.

(2019-02-04) v2.0.0
- The .ini file was completely redesigned to be easier to read and understand.
- Added three more "call external script" options for increased versatility.
- All puttytel instances are now hidden; no more annoying pop-ups, except SteamCMD updates... those are intentionally visible.
- Restarts now occur at the scheduled time without delay due to announcements.
- Added the option to add extra command lines to SteamCMD and/or 7DaysToDieServer.exe.
- Added another announcement option for Discord for Remote Restart requests.
- The "Use SteamCMD" option was removed. SteamCMD is vital to the functionality of this utility. It is automatically downloaded and installed.
- Added several failsafes for invalid parameter entries and characters in the .ini.
    Most invalid entries/characters are replaced automatically with valid entries and an entry in placed in the log detailing the changes.
- If Remote Restart is enabled, the restart link is now added to the log file (unless "hide password" option is enabled).
- The "hide password" option works as intended. The feature was incomplete in prior releases.
- The "use telnet to check if server is alive" function is now hidden and properly closes the telnet connection.
- Minor log file improvements were made to provide more relevant information with better clarification.
- Minor notification window improvements were made, including notification of any changes made from the serverconfig.xml file to the temp file.

(2019-02-02) v1.8.5
- Fixed: undefined variable error when NOT appending server version to name.
- Added 'reason for server restart' displayed on screen and placed into log file.

(2019-02-02) v1.8.4
- Fixed: SteamCMD will now retrieve latest version properly. (It now deletes two steamcmd cache folders prior to update check)

(2019-01-27) v1.8.3
- Fixed: Variable not found error.

(2019-01-26) v1.8.2
- PROGRAM RENAMED from 7dtdServerUtility to 7dtdServerUpdateUtility to better reflect the function of this utility.
- Due to the unreliability of AutoIT's built-in telnet utility, I added the option to use puttytel instead:
  - Puttytel is more reliable but also intrusive: it will pop up a window with each update and telnet check.
  - AutoIT's built-in telnet utility will perform update and telnet checks discretely, but it can often cause the 7DaysToDieServer.exe to no longer respond to telnet commands, thus forcing a server restart.
- "Request Restart From Browser" tool updates:
  - Added in-game announcements (in addition to the Discord and Twitch restart announcements).
  - Added "Server Maintenance restart..." to the announcements.
- Minor changes to the wording in the .ini file for clarification.

(2019-01-18) v1.8.1
- Faster and more reliable shutdown process and in game announcements.
- Added the option to run an external script during server updates.. good for writing a batch file to disable certain mods during a server update to ensure server reliability.
- Added a feature to check that the server is running and responsive by logging into the server and ensuring a valid response. Requires telnet to be active.
- Added a feature to keep only the latest 20 logfiles of the dedicated server.
- Fixed: another condition in which an update may not be detected.

(2019-01-10) v1.8
- Fixed: a condition in which an experimental update may not be detected.

(2019-01-09) v1.7.2
- Removed the redundant MCRCON options in the 7dtdServerUpdateUtility.ini. Use in-game message announcements instead.
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
- Fixed the instance when the "no .ini file found" error pop-up gets hidden behind the server is starting splash screen.
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
Fixed "If The Fun Pimps release a client-only update, 7dtdServerUpdateUtility will go into an endless update loop because the server files don't change (therefore SteamCMD's verify command says no update is needed) but Steam still assigns a new version ID to the update. SteamCMD's update reports no update needed, but the version IDs still mismatch."

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
- Retain detailed logs of 7DTD dedicated server and 7dtdServerUpdateUtility.
