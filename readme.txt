7dtdServerUpdateUtility - A Utility to Keep Your 7 days To Die Dedicated Server updated (and schedule server restarts, download and install new server files, and more!)
- Latest version: 7dtdServerUpdateUtility_v2.6.9 (2024-08-20) (Beta and Stable are the same version)
- By Phoenix125 | http://www.Phoenix125.com | http://discord.gg/EU7pzPs | kim@kim125.com
- Based on Dateranoth's ConanExilesServerUtility-3.3.0 and 7dServerUtility | https://gamercide.org/

----------
 FEATURES
----------
- Works with other managers.
- Easy to use and set up.
- New! Discord: Send server status, in-game chat messages, players join or leave, and game time.
- New! Backups. Partial and full server.
- New! Config window.
- Keeps server updated and running.
- Easily downloads, installs, and set up a new 7 Days To Die Dedicated Server.
- Send telnet & chat messages with a click.
- After updates, "(Almost) Future Proof" option adds 19 existing parameters to the new serverconfig.xml file to accommodate config changes during updates and can disable mod folder.
- Announce server updates and/or restarts in game, on Discord and Twitch.
- Works with all version: Public, Latest_experimental, and custom.
- Optionally automatically add version (ex: Alpha 17 (b240)) to server name with each update, so that users can quickly identify that you are running the latest version.
- Optionally automatically rename GameName to current version (ex: Alpha 17 b240) with each update, therefore saving old world while creating new world (aka: SERVER WIPE).
- KeepAlive Watchdog: Restarts frozen servers. Monitors for process, valid telenet, and query responses.
- Scheduled restarts.
- Remote restart (via web browser).
- Run multiple instances to manage multiple servers.
- Detailed logs.
- Watchdog: restart server on excessive memory use.
More detailed features:
- Optionally execute external files for six unique conditions, including at updates, scheduled restarts, remote restart, when first restart notice is announced
  *These options are great executing a batch file to disable certain mods during a server update, to run custom announcement scripts, make config changes (enable PVP at scheduled times), etc.
- Can validate files on first run, then optionally only when buildid (server version) changes. Backs up & erases appmanifest_294420.acf to force update when client-only update is released by The Fun Pimps.
- Automatically imports server settings from serverconfig.xml (or comparable file) and creates a temporary file... leaving the original file untouched.

-----------------
 GETTING STARTED (Two sets of instructions: one for existing servers and the other to use the 7dtdServerUpdateUtility tool to download and install a new dedicated server)
-----------------

EXISTING SERVER:
1) Run 7dtdServerUpdateUtility.exe
2) Adjust desired settings in the Config window. If config window doesn't show, click the tray icon and select "Util CONFIG" toward the top.
- Required fields: Server Folder, Config File, and Local IP.
3) Click "Restart Util"
4) Your server should be up-to-date and running!

FRESH SERVER: Use 7dtdServerUpdateUtility to download install a fresh dedicated server
1) Run 7dtdServerUpdateUtility.exe
2) Adjust desired settings in the Config window. If config window doesn't show, click the tray icon and select "Util CONFIG" toward the top.
- Required fields: Server Folder and Local IP. (The Config File will be created when the server is downloaded).
3) Click "Restart Util"
4) Your server files will be downloaded from Steam. Once done, your server will start.
5) From the tray icon, click "Server Config" (toward the bottom). Make desired changes.
6) Restart server and util.
7) Congrats! Your new server is running.

------------
 KNOWN BUGS
------------
- The restart announcement countdown timer skips the first value.  ex. If set to restart in 10, 5, 3, 1.. It announces the 10 minute restart, but actually restarts in 5 minutes.

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
(2024-08-20) v2.6.9 Fixed Discord announcements in v1.0
- Fixed: Updated Discord announcement code to be compatible with 7DTD v1.0
- Fixed: Fixed an issue where the backups would fail due to a "-1" added to the 7zip commandline


(2023-07-13) v2.6.8 Fixed error Line 22456
- Fixed: Unknown function name error in Line 22456.  (Thanks to @BloodRven for reporting!)

(2023-07-13) v2.6.7 Fixed Watchdog server restarts and added Discord announcements for it
- Fixed: Query & telnet Watchdog was detecting server crashes but often failing to restart the server.  It is now fixed.
- Added: Discord: Watchdog can announce when a server crash is first detected and when it peforms the restart.
         Note! Announcements must be configured manually in the 7dtdServerUpdateUtility.ini using any text editor.  There are two sections: DISCORD INTEGRATION & DISCORD MESSAGES sections.
         Comment: In case there is a temporary loss of telnet/query connection or server freeze, multiple failures can be set before it actually restarts the server.  Default is 3 failed attempts.

(2023-07-01) v2.6.6 Improved code for checking for server updates and checking for existing servers when starting util
- Fixed: New improved code for checking for server updates.
- Fixed: Improved code for detecting existing servers (to prevent duplicate servers from starting).

(2022-01-17) v2.6.5 Fixed Horde Day Announcements
- Fixed: Fixed issues from v2.6.4 with next horde days announcements.
- Added: Disable watchdog is now visible in config GUI window. (Thanks to @BeatyBeatz for suggesting)
- Added: CPU Affinity is now visible in config GUI window.

(2022-01-15) v2.6.4 Added CPU Affinity and minor announcement bug fixes
- Fixed: Fix announcements when next horde is in 10 days. (Thanks to @LucTussi for reporting)
- Change: Changed horde is in 1 day, anouncement now says "tomorrow" instead of "in 1 day"
- Added: CPU Affinity. In the "Advanced" section of the config file... NOT available in in the config window. (Thanks to @Doublee for requesting)
- Fixed: Images were not showing in config window

(2021-12-09) v2.6.3 A20 Beta compatible. Fixed error when player log in. Still need to fix 
- Fixed: A20(b218) Line 20845 Error when clicking "Import Settings" from the Config window. (Thanks to @Zee for reporting)
- Fixed: A20(b218) Error getting server version number fixed.
- Fixed: Improved reliability of Announcement Intervals in Config
- Fixed: Line 23939 Error when players are online. (Thanks to @Egdelwonk & @Fervid for reporting)

(2020-12-24) v2.6.2 New In-Game Message features!
- Added: In-Game Message: Custom Chat Reponses.
- Added: In-Game Message: Customizable Player Join Message.
- Added: In-Game Message: Customizable Daily Message sent at definable hour.
- Added: Blood Moon message day offset. Used when blood moon day gets out of sync.
- Fixed: Messages sent from util did not show in Discord.
- Added: Customizable number of telnet retry attempts

(2020-12-12) v2.6.1 Game Save Bug Fix & Minor Discord Bug Fixes
- Added: Option to disable watchdog. Useful if using 7DTD RAT to manage server. (Thanks to @merlin66676 for requesting)
- Fixed: Backups were not saving saved folder if left at default (the AppData folder). (Thanks to KrissirK  & @Jared for reporting)
- Fixed: Improved Telnet response window and log file.
- Fixed: Log file now substitutes new line with |
- Fixed: Discord: No longer repeats "No Online Player" message when server or util is restarted.
- Fixed: Discord: ServerTools messages now remove the color code ie.[FFCC00] (Thanks to @Doublee for repoting)

(2020-10-03) v2.6.0 Discord Bug Fix & New "Horde Finished" message
- Fixed: Discord: New Day & Horde Day Announcements were not sending.
- Added: Discord: Optional Horde Finished announcement.
- Added: Discord: Selectable Webhooks for New Day & Horde announcements.

(2020-10-02) v2.5.9 Horde Day Bug Fix and New Discord Announcements
- Fixed: Discord: Next Horde was off by one day.
- Fixed: Discord: Next Horde was not displaying TODAY on horde day.
- Added: Discord: Optional New Day message each game day.
- Added: Discord: Optional Horde Day message each blood mood day with selectable hour to trigger announcement

(2020-09-30) v2.5.8 Bug fixes
- Fixed: Line 20461 Variable used without being declared error (Thanks to @AceMan for reporting)
- Fixed: Line 20523 error related to the "announcement minutes before DAILY announcement times" (Thanks to @Cameron for reporting)
- Fixed: Batch File: Update_7DTD_Validate_YES: Validate was mispelled (no 'l' in it) (Thanks to @AceMan for reporting)
- Fixed: \BatchFiles\Start_7DTD_Dedicated_Server.bat file was messed up. (Thanks to @AceMan for reporting)
- Fixed: Discord's "Next Horde" was off by one day.
- Changed: Next Horde now uses "BloodMoonFrequency" from config instead of default 7 days.
- Changed: Discord: Removed \n from default online player announcement.
- Changed: FutureProof is disabled by default.

(2020-09-03) v2.5.7 Bug fix
-Fixed: Line 19678 Error. (Thanks to @Timikana for reporting)

(2020-09-03) v2.5.6 Bug fix and Discord announcement updates
- Fixed: Line 21723 Error due to failed steamcmd update check. (Thanks to @Timikana for reporting)
- Added: Discord: Added emotes to default player accouncements.
- Added: Discord: Added default 7DTD logo URL for Discord webhooks.
- Fixed: Start logo now shows again.

(2020-08-21) v2.5.5 Fixed Error when Steam branch does not exist
- Fixed: Line 20431 Error when using Steam branch does not exist (Thanks to @arramus & @Majesticwalker for reporting)
- Fixed: Discord: Change default Online Player message: Add spaces between "Next Horde: x days" and "Player left/joined" (Thanks to @ ًًً\ 𝓞𝓱𝓨𝓪 / for reporting)
- Fixed: "Online Player submessage ( \o )" changed to "Online Player Sub-Message ( \a )" in Config window.

(2020-08-16) v2.5.4 Added Restart options window, added separate Global chat to Discord, other minor improvements
- Added: Option to announce manual restart with or without countdown timer to Discord/in-game. (Thanks to @ًًً\ 𝓞𝓱𝓨𝓪 / for requesting)
- Added: Discord: Separate webhook options for global chat (for public Discord) and all chat (for admin, if desired). (Thanks to @ًًً\ 𝓞𝓱𝓨𝓪 / for requesting)
- Fixed: When restart minutes had only one number, restarts would fail.
- Fixed: Discord: Server restarts would still show last player to leave.
- Fixed: Util now updates the temp serverconfig.xml file with each server restart. Prior, any changes to the config file required restarting util.
- Updated readme.txt instructions (Thanks to @arramus for reporting)
- Added: When announcement time = 1 minute, substitutes "minute(s)" and "minutes" with "minute". When announcement time = 0, substitutes "in 0 minute(s)" and "in 0 minutes" with "now".

(2020-08-04) v2.5.3 Bug fixes.
- Fixed: Line error when Discord message fails to send.
- Fixed: Line error when downloading files fails.
- Fixed: Only shows the "Util Update Available" file when an update is actually available.
- Changed: Open Util Log tray option now opens full log.
- Cleaned up the code a little.

(2020-08-02) v2.5.2 Minor bug fixes and improvements
- Fixed: Config GUI: Errors when changing Local IP
- Fixed: Watchdog attempts before restart used wrong default value.
- Changed: Default SteamCMD dir is now \SteamCMD
- Changed: If server config is not found, config window is offered instead of closing util.

(2020-08-01) v2.5.1 Discord Bug Fix. Minor improvements
- Fixed: Quotation marks " in any announcement were causing Discord failures. Util now removes quotation marks.
- Added: Open Server and Util logs tray item.
- Added: Open Server config tray item.
- Added: Customizable telnet check interval.
- Changed: Improved online player polling. Records in near-realtime now.
- Added: Config Window: 3 close buttons in top right.

(2020-07-30) v2.5.0 Config window. Backups. More Discord options. No more telnet popup windows. Several bug fixes, including SteamCMD improvements.
- Added: Player Chat to Discord. See what your friends are saying even when you can't play!
- Added: Config GUI menu.
- Fixed: Steam update would fail if there was a space in folder structure.
- Fixed: Telnet: Now uses plink instead of TeraTerm. No more popup screen interruptions!
- Added: Backup: Scheduled focused and complete backups.
- Added: Use up to four Discord webhooks.
- Added: Optional SteamCMD login and password.
- Added: Fully customizable Steam update command line.
- Added: Future-Proof: Optional Mod folder renaming in case mods are causing the updated server to fail.
- Fixed: Several bug fixes and stabiolization improvements.
- Added: Restart util tray icon option
- Added: Startup Image

(2020-07-09) v2.3.4 Several bug fixes. Added Watchdog Failed response count before restarting servers.
- Fixed: SteamCMD update did not work if there was a space in the folder structure.
- Fixed: GameTime sometimes grabbed extra data
- Fixed: Query Watchdog could fail after several hours due to an AutoIT limitation.
- Changed: Improved wording of the SteamCMD extra command line config parameter.
- Changed: Default Query and Telnet IP to 127.0.0.1
- Added: Config: Number of failed responses (after server has responded at least once) before restarting server. Used to avoid unnecessary restarts if server was unresponsive only momentarily.

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
