#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\phoenixtray.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_Icons.exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's ConanServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=2.3.5.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=2.3.5
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_Icon_Add=Resources\phoenixfaded.ico
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <Array.au3>
#include <AutoItConstants.au3>
#include <ButtonConstants.au3>
#include <ColorConstants.au3>
#include <Date.au3>
#include <EditConstants.au3>
#include <EditConstants.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <GuiConstants.au3>
#include <IE.au3>
#include <Inet.au3>
#include <ListViewConstants.au3>
#include <MsgBoxConstants.au3>
#include <Process.au3>
#include <StaticConstants.au3>
#include <String.au3>
#include <StringConstants.au3>
#include <TabConstants.au3>
#include <TrayConstants.au3>
#include <WinAPISysWin.au3>
#include <WindowsConstants.au3>

Opt("GUIOnEventMode", 1)
Opt("GUIResizeMode", $GUI_DOCKLEFT + $GUI_DOCKTOP)

; *** End added by AutoIt3Wrapper ***

$aUtilVerStable = "v2.3.5" ; (2020-07-11)
$aUtilVerBeta = "v2.3.5" ; (2020-07-11)
$aUtilVersion = $aUtilVerStable
Global $aUtilVerNumber = 3
; 1 = v2.3.3
; 2 = v2.3.4
; 3 = v2.3.5

;**** Directives created by AutoIt3Wrapper_GUI ****
;Originally written by Dateranoth for use and modified for 7DTD by Phoenix125.com
;by https://gamercide.com on their server
;Distributed Under GNU GENERAL PUBLIC LICENSE

Global Const $aUtilName = "7dtdServerUpdateUtility"
Global Const $aServerEXE = "7DaysToDieServer.exe"
Global Const $aServerShort = "7DTD"
Global $aGameName1 = "7 Days To Die"
Global Const $aIniFile = @ScriptDir & "\" & $aUtilName & ".ini"
Global $aUtilityVer = $aUtilName & " " & $aUtilVersion
Global $aUtilUpdateFile = @ScriptDir & "\__UTIL_UPDATE_AVAILABLE___.txt"
Global $aIniFailFile = @ScriptDir & "\___INI_FAIL_VARIABLES___.txt"
Global $aFolderLog = @ScriptDir & "\_Log\"
Global $aLogFile = $aFolderLog & $aUtilName & "_Log_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
Global $aLogDebugFile = $aFolderLog & $aUtilName & "_LogFull_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
Global $aFolderTemp = @ScriptDir & "\" & $aUtilName & "UtilFiles\"
Global $aUtilCFGFile = $aFolderTemp & $aUtilName & "_cfg.ini"
Global $aDiscordSendWebhookEXE = $aFolderTemp & "DiscordSendWebhook.exe"
Global $aFilePlink = $aFolderTemp & "plink.exe"
Global $aServerBatchFile = @ScriptDir & "\_start_" & $aUtilName & ".bat"
Global $aBatchDIR = @ScriptDir & "\BatchFiles"
Global $aSteamUpdateCMDValY = $aBatchDIR & "\Update_7DTD_Validate_YES.bat"
Global $aSteamUpdateCMDValN = $aBatchDIR & "\Update_7DTD_Validate_NO.bat"
DirCreate($aBatchDIR)

FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombieGroup.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombiehorde.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombie1.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombie2.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombie3.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombie6.jpg", $aFolderTemp, 0)
FileInstall("K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Resources\zombiedog.jpg", $aFolderTemp, 0)

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Global Variables ****
If @Compiled = 0 Then
	Global $aIconFile = @ScriptDir & "\7dtdServerUpdateUtility_Icons.exe"
Else
	Global $aIconFile = @ScriptFullPath
EndIf

Global $aTimeCheck0 = _NowCalc()
Global $aTimeCheck1 = _NowCalc()
Global $aTimeCheck2 = _NowCalc()
Global $aTimeCheck3 = _NowCalc()
Global $aTimeCheck4 = _NowCalc()
Global $aTimeCheck8 = _NowCalc()
Global $aPlinkPID = -1
Global $aTelnetBuffer = ""
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
Global $aUseSteamCMD = "yes"
Global $aOnlinePlayerLast = ""
Global $aRCONError = False
Global $aServerReadyTF = False
Global $aServerReadyOnce = True
Global $aNoExistingPID = True
Global $hGUI = 0
Global $aGUIW = 275
Global $aGUIH = 250
Global $tUserCtTF = False
Global $iEdit = 0
Global $tUserCnt = 1
Global $aBusy = False
Global $aSteamUpdateNow = False
;~ Global $aPlayerCountWindowTF = False
Global $tOnlinePlayerReady = False
Global $aPlayerCountShowTF = True
Global $aPlayersOnlineName = ""
Global $aPlayersOnlineSteamID = ""
Global $aPlayersJoined = ""
Global $aPlayersLeft = ""
Global $aPlayersName = ""
Local $aFirstStartDiscordAnnounce = True
Local $xLabels[15] = ["Raw", "Name", "Map", "Folder", "Game", "ID", "Players", "Max Players", "Bots", "Server Type", "Environment", "Visibility", "VAC", "Version", "Extra Data Field"]
Global $aServerQueryName = "[Not Read Yet]"
Global $aPlayersCount = 0
Global $aPlayersMax = 0
Global $gWatchdogServerStartTimeCheck = _NowCalc()
Global $aIniExist = False
Global $aRemoteRestartUse = "no"
Global $aGameTime = "Day 1, 00:00"
Global $aNextHorde = 7
Global $tQueryLogReadDoneTF = False
Global $aServerNamFromLog = "[Not Read Yet]"
;~ Global $aServerNameToDisplay = ""
Global $tFailedCountQuery = 0
Global $tFailedCountTelnet = 0
Global $wGUIMainWindow = -1
Global $Config = -1
Global $wGUIMainWindow = -1

Global $aServerRebootReason = ""
Global $aRebootReason = ""
Global $aRebootConfigUpdate = "no"
Global $aAnnounceCount1 = 0
Global $aFPCount = 0
Global $aFPClock = _NowCalc()
Global $aServerName = "7 Days To Die"
Global $aSteamAppID = "294420"
Global $aUpdateSource = "0" ; 0 = SteamCMD , 1 = SteamDB.com
$aServerUpdateLinkVerStable = "http://www.phoenix125.com/share/7dtdlatestver.txt"
$aServerUpdateLinkVerBeta = "http://www.phoenix125.com/share/7dtdlatestbeta.txt"
$aServerUpdateLinkDLStable = "http://www.phoenix125.com/share/7dtdServerUpdateUtility.zip"
$aServerUpdateLinkDLBeta = "http://www.phoenix125.com/share/7dtdServerUpdateUtilityBeta.zip"
Global $aShowUpdate = False

#EndRegion ;**** Global Variables ****

If FileExists($aFolderTemp) = 0 Then DirCreate($aFolderTemp)
If FileExists($aFolderLog) = 0 Then DirCreate($aFolderLog)
_FileWriteToLine($aIniFile, 3, "Version  :  " & $aUtilityVer, True)
Global $aCFGLastVerNumber = IniRead($aUtilCFGFile, "CFG", "LastVerNumber", "0")
IniWrite($aUtilCFGFile, "CFG", "LastVerNumber", $aUtilVerNumber)
Local $tUpdateINI = False
If $aCFGLastVerNumber < 1 Then
	FileCopy(@ScriptDir & "\*.log*", $aFolderLog)
	FileDelete(@ScriptDir & "\*.log*")
	FileCopy(@ScriptDir & "\tt\*.*", $aFolderTemp & "tt\", $FC_OVERWRITE + $FC_CREATEPATH)
	DirRemove(@ScriptDir & "\tt\", 1)
	FileDelete(@ScriptDir & "\" & $aUtilName & "_lastpid.tmp")
	FileDelete(@ScriptDir & "\7dtdServerUpdateUtility_PurgeLogFile.bat")
	FileDelete(@ScriptDir & "\tt.zip")
	$sDiscordPlayersMsg = "Players Online: **\o / \m**  Game Time: **\t**  Next Horde: **\n days**"
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Online Player Message (\o - Online Player Count, \m - Max Players, \t - Game Time, \n - Days to Next Horde) ###", $sDiscordPlayersMsg)
	$tUpdateINI = True
EndIf
If $aCFGLastVerNumber < 2 Then
	Global $aSteamExtraCMD = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (ex. -latest_experimental) ###", "public")
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (See note below) ###", $aSteamExtraCMD)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", "3")
	$tUpdateINI = True
EndIf
If $aCFGLastVerNumber < 3 Then
	Local $sDiscordWebHookURLs = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook URL ###", "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde")
	Local $sDiscordWHPlayers = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook Online Player Count URL ###", "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde")
	Local $sDiscordBotName = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Name ###", "7DTD Bot")
	Local $bDiscordBotUseTTS = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Use TTS? (yes/no) ###", "no")
	Local $sDiscordBotAvatar = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Avatar Link ###", "")
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Webhook URL ###", $sDiscordWebHookURLs)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Bot Name (optional) ###", $sDiscordBotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Avatar URL (optional) ###", $sDiscordBotAvatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Use TTS (optional) (yes/no) ###", $bDiscordBotUseTTS)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Webhook URL ###", $sDiscordWHPlayers)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Bot Name (optional) ###", $sDiscordBotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Avatar URL (optional) ###", $sDiscordBotAvatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Use TTS (optional) (yes/no) ###", $bDiscordBotUseTTS)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Webhook URL ###", $sDiscordWHPlayers)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Bot Name (optional) ###", $sDiscordBotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Avatar URL (optional) ###", $sDiscordBotAvatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Use TTS (optional) (yes/no) ###", $bDiscordBotUseTTS)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Webhook URL ###", "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde")
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Bot Name (optional) ###", $sDiscordBotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Avatar URL (optional) ###", $sDiscordBotAvatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Use TTS (optional) (yes/no) ###", $bDiscordBotUseTTS)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", "1")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", "2")
	Local $sUseDiscordBotDaily = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", "yes")
	Local $sUseDiscordBotUpdate = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", "yes")
	Local $sUseDiscordBotRemoteRestart = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", "eys")
	Local $sUseDiscordBotServersUpYN = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", "yes")
	Local $sUseDiscordBotFirstAnnouncement = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", "no")
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $sUseDiscordBotDaily)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $sUseDiscordBotUpdate)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $sUseDiscordBotRemoteRestart)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $sUseDiscordBotServersUpYN)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $sUseDiscordBotFirstAnnouncement)
	Local $sDiscordDailyMessage = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", "Daily server restart begins in \m minute(s).")
	Local $sDiscordUpdateMessage = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", "Fun Pimps have released a new update. Server is rebooting in \m minute(s).")
	Local $sDiscordRemoteRestartMessage = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", "Admin has requested a server reboot. Server is rebooting in \m minute(s).")
	Local $sDiscordServersUpMessage = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement when server is back online ###", "Server is online and ready for connection.")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement DAILY (\m - minutes) ###", $sDiscordDailyMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement UPDATES (\m - minutes) ###", $sDiscordUpdateMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sDiscordRemoteRestartMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement when server is back online ###", $sDiscordServersUpMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "__ Online Player message substitutions (\o Online Player Count, \m Max Players, \t Game Time, \h Days to Next Horde, \j Joined Sub-Msg, \l Left Sub-Msn, \a Online Players Sub-Msg) \n Next Line) __", "")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Message (see above for substitutions) ###", '""Players Online: **\o / \m**  Game Time: **\t**  Next Horde: **\h days**\j\l\a""')
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Join Player Sub-Message (\p - Player Name(s) of player(s) that joined server, \n Next Line) ###", '""  Joined: *\p*  ""')
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Left Player Sub-Message (\p - Player Name(s) of player(s) that left server, \n Next Line) ###", '""  Left: *\p*  ""')
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Sub-Message (\p - Player Name(s) of player(s) online, \n Next Line) ###", '""\nOnline Players: **\p**""')
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Died Message (\p - Player Name, \n Next Line) ###", '""*\p died.*""')
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Chat (\p - Player Name, \m Message) ###", '""[Chat] **\p**: \m""')
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Telnet: Stay Connected (Required for chat and death messaging) (yes/no) ###", "yes")
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Use scheduled backups? (yes/no) ###", "yes")
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", "0")
	$aBackupHours = "00,06,12,18"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup hours (comma separated 00-23 ex.04,16) ###", $aBackupHours)
	$aBackupMin = "00"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup minute (00-59) ###", $aBackupMin)
	$aBackupFull = "10"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Full " & $aGameName1 & " and Util folder backup every __ backups (0 to disable)(0-99) ###", $aBackupFull)
	$aBackupAddedFolders = ""
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Additional backup folders / files (comma separated. Folders add \ at end. ex. C:\Atlas\,D:\Atlas Server\) ###", $aBackupAddedFolders)
	$aBackupOutputFolder = @ScriptDir & "\Backups"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Output folder ###", $aBackupOutputFolder)
	$aBackupNumberToKeep = "56"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Number of backups to keep (1-999) ###", $aBackupNumberToKeep)
	$aBackupTimeoutSec = "600"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Max time in seconds to wait for backup to complete (30-999) ###", $aBackupTimeoutSec)
	$aBackupCommandLine = "a -spf -r -tzip -ssw"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "7zip backup additional command line parameters (Default: a -spf -r -tzip -ssw) ###", $aBackupCommandLine)
	$aBackupInGame = "Server backup started."
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "In-Game announcement when backup initiated (Leave blank to disable) ###", $aBackupInGame)
	$aBackupDiscord = "Server backup started."
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Discord announcement when backup initiated ###", $aBackupDiscord)
	$aBackupTwitch = "Server backup started."
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Twitch announcement when backup initiated ###", $aBackupTwitch)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Username (optional) ###", "")
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Password (optional) ###", "")
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD commandline (caution: overwrites all settings above) ###", "")
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD commandline (caution: overwrites all settings above) Write between lines below ###", "(Write between lines below)")
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Send Discord announcement when backup initiated (yes/no) ###", "no")
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Send Twitch announcement when backup initiated (yes/no) ###", "no")
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Online Player changes? (yes/no) ###", "yes")
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when player dies? (yes/no) ###", "yes")
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Player Chat? (yes/no) ###", "yes")
	FileWriteLine($aIniFile, '<--- BEGIN SteamCMD CODE --->')
	""
	FileWriteLine($aIniFile, '<--- END SteamCMD CODE --->')
	$tUpdateINI = True
EndIf
If $tUpdateINI Then
	ReadUini($aIniFile, $aLogFile)
	FileDelete($aIniFile)
	UpdateIni($aIniFile)
EndIf
; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
OnAutoItExitRegister("Gamercide")

Local $tSplash = SplashTextOn($aUtilName, "7dtdServerUpdateUtility started.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
LogWrite(" ============================ " & $aUtilityVer & " Started ============================")

Global $aServerPID = PIDReadServer($tSplash)
Global $gWatchdogServerStartTimeCheck = IniRead($aUtilCFGFile, "CFG", "Last Server Start", "no")
If $gWatchdogServerStartTimeCheck = "no" Then
	$gWatchdogServerStartTimeCheck = _NowCalc()
	IniWrite($aUtilCFGFile, "CFG", "Last Server Start", $gWatchdogServerStartTimeCheck)
EndIf

ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Importing settings from " & $aIniFile & ".")
ReadUini($aIniFile, $aLogFile)
If FileExists($aBackupOutputFolder) = 0 Then DirCreate($aBackupOutputFolder)

If $aTelnetIP = "" Then
	$aTelnetIP = $aServerIP
EndIf

If $aUtilBetaYN = "1" Then
	$aServerUpdateLinkVerUse = $aServerUpdateLinkVerBeta
	$aServerUpdateLinkDLUse = $aServerUpdateLinkDLBeta
	$aUtilVersion = $aUtilVerBeta
Else
	$aServerUpdateLinkVerUse = $aServerUpdateLinkVerStable
	$aServerUpdateLinkDLUse = $aServerUpdateLinkDLStable
	$aUtilVersion = $aUtilVerStable
EndIf
$aUtilityVer = $aUtilName & " " & $aUtilVersion

ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Updating config file.")
;~ AppendConfigSettings()
;GetfromServerConfig()

If $aUpdateUtil = "yes" Then
	UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndIf

ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Creating temp config file.")
;Func GetfromServerConfig()
Global $sConfigPath = $aServerDirLocal & "\" & $aConfigFile
Local $sFileExists = FileExists($sConfigPath)
If $sFileExists = 0 Then
	LogWrite("!!! ERROR !!! Could not find " & $sConfigPath)
	SplashOff()
	$aContinue = MsgBox($MB_YESNO, $aConfigFile & " Not Found", "Could not find " & $sConfigPath & ". (This is normal for New Install) " & @CRLF & "Do you wish to continue with installation?", 60)
	If $aContinue = 7 Then
		LogWrite("!!! ERROR !!! Could not find " & $sConfigPath & ". Program terminated by user.")
		_ExitUtil()
	Else
	EndIf
EndIf
Global $aServerTelnetReboot = "no"
_ImportServerConfig()
Func _ImportServerConfig()
	Local $kServerPort = "}ServerPort}value=}"
	Local $kServerName = "}ServerName}value=}"
	Local $kServerTelnetEnable = "}TelnetEnabled}value=}"
	Local $kServerTelnetPort = "}TelnetPort}value=}"
	Local $kServerTelnetPass = "}TelnetPassword}value=}"
	Local $kServerDataFolder = "}UserDataFolder}value=}"
	Local $kServerSaveGame = "}SaveGameFolder}value=}"
	Local $kServerTerminalWindow = "}TerminalWindowEnabled}value=}"
	Local $kFPServerPass = "}ServerPass}value=}"
	Local $kFPServerMaxPlayerCount = "}ServerMaxPlayerCount}value=}"
	Local $kFPServerDescription = "}ServerDescription}value=}"
	Local $kFPServerWebsiteURL = "}ServerWebsiteURL}value=}"
	Local $kFPGameWorld = "}GameWorld}value=}"
	Local $kFPWorldGenSeed = "}WorldGenSeed}value=}"
	Local $kFPWorldGenSize = "}WorldGenSize}value=}"
	Local $kFPGameName = "}GameName}value=}"
	Local $kFPGameDifficulty = "}GameDifficulty}value=}"
	Local $kFPAdminFileName = "}AdminFileName}value=}"
	Local $kFPDropOnDeath = "}DropOnDeath}value=}"
	Local $kMaxPlayers = "}ServerMaxPlayerCount}value=}"
	Local $kFPServerLoginConfirmationText = "}ServerLoginConfirmationText}value=}"
	Local $sConfigPathOpen = FileOpen($sConfigPath, 0)
	Local $sConfigRead4 = FileRead($sConfigPathOpen)
	Local $sConfigRead3 = StringRegExpReplace($sConfigRead4, """", "}")
	Local $sConfigRead2 = StringRegExpReplace($sConfigRead3, "\t", "")
	Local $sConfigRead1 = StringRegExpReplace($sConfigRead2, "  ", "")
	Local $sConfigRead = StringRegExpReplace($sConfigRead1, " value=", "value=")
	Local $xServerPort = _StringBetween($sConfigRead, $kServerPort, "}")
	Global $aServerPort = _ArrayToString($xServerPort)
	Local $xServerName = _StringBetween($sConfigRead, $kServerName, "}")
	Global $aServerName = _ArrayToString($xServerName)
	Local $xServerTelnetEnable = _StringBetween($sConfigRead, $kServerTelnetEnable, "}")
	Global $aServerTelnetEnable = _ArrayToString($xServerTelnetEnable)
	Local $xServerTelnetPort = _StringBetween($sConfigRead, $kServerTelnetPort, "}")
	Global $aTelnetPort = _ArrayToString($xServerTelnetPort)
	Local $xServerTelnetPass = _StringBetween($sConfigRead, $kServerTelnetPass, "}")
	Global $aTelnetPass = _ArrayToString($xServerTelnetPass)
	Local $xServerDataFolder = _StringBetween($sConfigRead, $kServerDataFolder, "}")
	Global $aServerDataFolder = _ArrayToString($xServerDataFolder)
	Local $xServerSaveGame = _StringBetween($sConfigRead, $kServerSaveGame, "}")
	Global $aServerSaveGame = _ArrayToString($xServerSaveGame)
	Local $xServerTerminalWindow = _StringBetween($sConfigRead, $kServerTerminalWindow, "}")
	Global $aServerTerminalWindow = _ArrayToString($xServerTerminalWindow)
	Local $xFPServerPass = _StringBetween($sConfigRead, $kFPServerPass, "}")
	Global $aFPServerPass = _ArrayToString($xFPServerPass)
	Local $xFPServerMaxPlayerCount = _StringBetween($sConfigRead, $kFPServerMaxPlayerCount, "}")
	Global $aFPServerMaxPlayerCount = _ArrayToString($xFPServerMaxPlayerCount)
	Local $xFPServerDescription = _StringBetween($sConfigRead, $kFPServerDescription, "}")
	Global $aFPServerDescription = _ArrayToString($xFPServerDescription)
	Local $xFPServerWebsiteURL = _StringBetween($sConfigRead, $kFPServerWebsiteURL, "}")
	Global $aFPServerWebsiteURL = _ArrayToString($xFPServerWebsiteURL)
	Local $xFPGameWorld = _StringBetween($sConfigRead, $kFPGameWorld, "}")
	Global $aFPGameWorld = _ArrayToString($xFPGameWorld)
	Local $xFPWorldGenSeed = _StringBetween($sConfigRead, $kFPWorldGenSeed, "}")
	Global $aFPWorldGenSeed = _ArrayToString($xFPWorldGenSeed)
	Local $xFPWorldGenSize = _StringBetween($sConfigRead, $kFPWorldGenSize, "}")
	Global $aFPWorldGenSize = _ArrayToString($xFPWorldGenSize)
	Local $xFPGameName = _StringBetween($sConfigRead, $kFPGameName, "}")
	Global $aFPGameName = _ArrayToString($xFPGameName)
	Local $xFPGameDifficulty = _StringBetween($sConfigRead, $kFPGameDifficulty, "}")
	Global $aFPGameDifficulty = _ArrayToString($xFPGameDifficulty)
	Local $xFPAdminFileName = _StringBetween($sConfigRead, $kFPAdminFileName, "}")
	Global $aFPAdminFileName = _ArrayToString($xFPAdminFileName)
	Local $xFPDropOnDeath = _StringBetween($sConfigRead, $kFPDropOnDeath, "}")
	Global $aFPDropOnDeath = _ArrayToString($xFPDropOnDeath)
	Local $xMaxPlayers = _StringBetween($sConfigRead, $kMaxPlayers, "}")
	Global $aMaxPlayers = _ArrayToString($xMaxPlayers)
	Local $xFPServerLoginConfirmationText = _StringBetween($sConfigRead, $kFPServerLoginConfirmationText, "}")
	Global $aFPServerLoginConfirmationText = _ArrayToString($xFPServerLoginConfirmationText)
	$aServerQueryName = $aServerName
	If $aServerSaveGame = "absolute path" Then
		Global $aServerSaveGame = _PathFull("7DaysToDieFolder", @AppDataDir)
	EndIf
	If $aServerDataFolder = "absolute path" Then
		Global $aServerDataFolder = $aServerDirLocal & "\UserData"
	EndIf
	If $aServerTelnetEnable = "no" Or $aServerTelnetEnable = "false" Then
		LogWrite(" . . . Server telnet was disabled. Telnet required for this utility. TelnetEnabled set to: true")
		;	Global $aServerTelnetEnable = "true"
		$aServerTelnetReboot = "yes"
		$aServerRebootReason = $aServerRebootReason & "Telnet was disabled." & @CRLF
	EndIf
	Global $aServerTelnetEnable = "true"
	If $aTelnetPort = "" Then
		LogWrite(" . . . Server telnet port was blank. Port CHANGED to default value: 8081")
		$aTelnetPort = "8081"
		$aServerTelnetReboot = "yes"
		$aServerRebootReason = $aServerRebootReason & "Telnet port was blank." & @CRLF
	EndIf
	If $aTelnetPass = "CHANGEME" Or $aTelnetPass = "" Then
		If $sObfuscatePass = "yes" Then
			LogWrite(" . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: [hidden]. Recommend change telnet password in " & $aConfigFile)
		Else
			LogWrite(" . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: 7dtdServerUpdateUtility. Recommend change telnet password in " & $aConfigFile)
		EndIf
		Global $aTelnetPass = "7dtdServerUpdateUtility"
		$aServerTelnetReboot = "yes"
		$aServerRebootReason = $aServerRebootReason & "Telnet password was blank or CHANGEME." & @CRLF
	EndIf
	If $aServerTerminalWindow = "false" Then
	Else
		LogWrite(" . . . Terminal window was enabled. Utility cannot function with it enabled. Terminal window set to: false")
		$aServerTelnetReboot = "yes"
		$aServerRebootReason = $aServerRebootReason & "Terminal window was enabled." & @CRLF
	EndIf
	LogWrite(" [Config] Retrieving data from " & $aConfigFile & ".")
	LogWrite("", " . . . Server Port = " & $aServerPort)
	LogWrite("", " . . . Server Name = " & $aServerName)
	LogWrite("", " . . . Server Telnet Port = " & $aTelnetPort)
	If $sObfuscatePass = "no" Then
		LogWrite("", " . . . Server Telnet Password = " & $aTelnetPass)
	Else
		LogWrite("", " . . . Server Telnet Password = [hidden]" & $aTelnetPass)
	EndIf
	LogWrite("", " . . . Server Save Game Folder = " & $aServerSaveGame)
	LogWrite("", " . . . Server UserData Folder = " & $aServerDataFolder)
	FileClose($sConfigRead)
	AppendConfigSettings()
EndFunc   ;==>_ImportServerConfig
;EndFunc
#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****

If $aUseSteamCMD = "yes" Then
	Local $sFileExists = FileExists($aSteamCMDDir & "\steamcmd.exe")
	If $sFileExists = 0 Then
		SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Downloading and installing SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
		DirCreate($aSteamCMDDir) ; to extract to
		_ExtractZip(@ScriptDir & "\steamcmd.zip", "", "steamcmd.exe", $aSteamCMDDir)
		FileDelete(@ScriptDir & "\steamcmd.zip")
		LogWrite(" [Steam Update] Running SteamCMD. [steamcmd.exe +quit]")
		RunWait("" & $aSteamCMDDir & "\steamcmd.exe +quit", @SW_MINIMIZE)
		If Not FileExists($aSteamCMDDir & "\steamcmd.exe") Then
			MsgBox(0x0, "SteamCMD Not Found", "Could not find steamcmd.exe at " & $aSteamCMDDir)
			_ExitUtil()
		EndIf
	EndIf
Else
	Local $cFileExists = FileExists($aServerDirLocal & "\" & $aServerEXE)
	If $cFileExists = 0 Then
		MsgBox(0x0, "7 Days To Die Server Not Found", "Could not find " & $aServerEXE & " at " & $aServerDirLocal)
		_ExitUtil()
	EndIf
EndIf
_SteamCMDCommandlineRead()
If $aSteamUpdateCommandline = "" Then
	_SteamCMDCreate()
	_SteamCMDCommandlineWrite()
EndIf
Func _SteamCMDCommandlineWrite()
	UpdateIni($aIniFile)
EndFunc   ;==>_SteamCMDCommandlineWrite
Func _SteamCMDCommandlineRead()
	$tRead = FileRead($aIniFile)
	$aSteamUpdateCommandline = _ArrayToString(_StringBetween($tRead, '<--- BEGIN SteamCMD CODE --->' & @CRLF, '<--- END SteamCMD CODE --->'))
EndFunc   ;==>_SteamCMDCommandlineRead
Func _SteamCMDCreate()
	Local $ServExp = ""
	If $aServerVer = "public" Then
	Else
		$ServExp = " -beta " & $aServerVer
	EndIf
	Global $aBatchDIR = @ScriptDir & "\BatchFiles"
	DirCreate($aBatchDIR)
	Global $aSteamUpdateCMDValY = $aBatchDIR & "\Update_7DTD_Validate_YES.bat"
	Global $aSteamUpdateCMDValN = $aBatchDIR & "\Update_7DTD_Validate_NO.bat"
	If $aSteamCMDUserName = "" Then
		Local $tLogin = "anonymous"
	Else
		Local $tLogin = $aSteamCMDUserName
	EndIf
	Local $tCmd = 'SET steampath=' & $aSteamCMDDir & @CRLF & _
			'SET gamepath=' & $aServerDirLocal & @CRLF & _
			'"%steampath%\steamcmd.exe" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login ' & $tLogin & ' ' & $aSteamCMDPassword & _
			' +force_install_dir "%gamepath%" +app_update ' & $aSteamAppID & ' ' & $ServExp
	If $aValidate = "yes" Then
		$tCmd &= " validate +quit"
	Else
		$tCmd &= " +quit"
	EndIf
	$aSteamUpdateCommandline = $tCmd
	_SteamCMDCommandlineWrite()
	_SteamCMDBatchFilesCreate()
EndFunc   ;==>_SteamCMDCreate
_SteamCMDBatchFilesCreate()
Func _SteamCMDBatchFilesCreate()
	#Region ; SteamCMD Update Files Creation
;~ 	Local $ServExp = ""
;~ 	If $aServerVer = "public" Then
;~ 	Else
;~ 		$ServExp = " -beta " & $aServerVer
;~ 	EndIf

;~ 	If $aSteamCMDUserName = "" Then
;~ 		Local $tLogin = "anonymous"
;~ 	Else
;~ 		Local $tLogin = $aSteamCMDUserName
;~ 	EndIf
;~ 	Local $tCmd = 'SET steampath=' & $aSteamCMDDir & @CRLF & _
;~ 			'SET gamepath=' & $aServerDirLocal & @CRLF & _
;~ 			'"%steampath%\steamcmd.exe" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login ' & $tLogin & ' ' & $aSteamCMDPassword & ' +force_install_dir "%gamepath%" +app_update ' & $aSteamAppID & ' ' & $ServExp & ' ' & $aSteamExtraCMD
	FileDelete($aSteamUpdateCMDValY)
	If StringInStr($aSteamUpdateCommandline, "validate") Then
		FileWrite($aSteamUpdateCMDValY, $aSteamUpdateCommandline)
	Else
		FileWrite($aSteamUpdateCMDValY, StringReplace($aSteamUpdateCommandline, "+quit", "vaidate +quit"))
	EndIf
	If StringInStr($aSteamUpdateCommandline, "validate") Then
		FileWrite($aSteamUpdateCMDValN, StringReplace($aSteamUpdateCommandline, " validate", ""))
	Else
		FileWrite($aSteamUpdateCMDValN, $aSteamUpdateCommandline)
	EndIf
	FileDelete($aSteamUpdateCMDValN)
	Local $xArray[85]
	$xArray[0] = '@echo off'
	$xArray[1] = 'rem Starts a dedicated server'
	$xArray[2] = 'rem'
	$xArray[3] = 'rem -quit, -batchmode, -nographics: Unity commands'
	$xArray[4] = 'rem -configfile			  : Allows server settings to be set up in an xml config file. Use no path if in same dir or full path.'
	$xArray[5] = 'rem -dedicated                    : Has to be the last option to start the dedicated server.'
	$xArray[6] = ''
	$xArray[7] = 'set LOGTIMESTAMP='
	$xArray[8] = ''
	$xArray[9] = ''
	$xArray[10] = 'IF EXIST 7DaysToDieServer.exe ('
	$xArray[11] = '	set GAMENAME=7DaysToDieServer'
	$xArray[12] = '	set LOGNAME=output_log_dedi'
	$xArray[13] = ') ELSE ('
	$xArray[14] = '	set GAMENAME=7DaysToDie'
	$xArray[15] = '	set LOGNAME=output_log'
	$xArray[16] = ')'
	$xArray[17] = ''
	$xArray[18] = ':: --------------------------------------------'
	$xArray[19] = ':: REMOVE OLD LOGS (only keep latest 20)'
	$xArray[20] = ''
	$xArray[21] = 'for /f "tokens=* skip=19" %%F in (' & "'dir %GAMENAME%_Data\%LOGNAME%*.txt /o-d /tc /b'" & ") do del %GAMENAME%_Data\%%F"
	$xArray[22] = ''
	$xArray[23] = ''
	$xArray[24] = ''
	$xArray[25] = ':: --------------------------------------------'
	$xArray[26] = ':: BUILDING TIMESTAMP FOR LOGFILE'
	$xArray[27] = ''
	$xArray[28] = ':: Check WMIC is available'
	$xArray[29] = 'WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_start'
	$xArray[30] = ''
	$xArray[31] = ':: Use WMIC to retrieve date and time'
	$xArray[32] = 'FOR /F "skip=1 tokens=1-6" %%G IN (' & "'WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table'" & ") DO ("
	$xArray[33] = '	IF "%%~L"=="" goto s_done'
	$xArray[34] = '	Set _yyyy=%%L'
	$xArray[35] = '	Set _mm=00%%J'
	$xArray[36] = '	Set _dd=00%%G'
	$xArray[37] = '	Set _hour=00%%H'
	$xArray[38] = '	Set _minute=00%%I'
	$xArray[39] = '	Set _second=00%%K'
	$xArray[40] = ')'
	$xArray[41] = ':s_done'
	$xArray[42] = ''
	$xArray[43] = ':: Pad digits with leading zeros'
	$xArray[44] = 'Set _mm=%_mm:~-2%'
	$xArray[45] = 'Set _dd=%_dd:~-2%'
	$xArray[46] = 'Set _hour=%_hour:~-2%'
	$xArray[47] = 'Set _minute=%_minute:~-2%'
	$xArray[48] = 'Set _second=%_second:~-2%'
	$xArray[49] = ''
	$xArray[50] = 'Set LOGTIMESTAMP=__%_yyyy%-%_mm%-%_dd%__%_hour%-%_minute%-%_second%'
	$xArray[51] = ''
	$xArray[52] = ':s_start'
	$xArray[53] = ''
	$xArray[54] = ''
	$xArray[55] = ':: --------------------------------------------'
	$xArray[56] = ':: STARTING SERVER'
	$xArray[57] = ''
	$xArray[58] = ''
	$xArray[59] = 'echo|set /p="251570" > steam_appid.txt'
	$xArray[60] = 'set SteamAppId=251570'
	$xArray[61] = 'set SteamGameId=251570'
	$xArray[62] = ''
	$xArray[63] = 'set LOGFILE=%~dp0\%GAMENAME%_Data\%LOGNAME%%LOGTIMESTAMP%.txt'
	$xArray[64] = ''
	$xArray[65] = ''
	$xArray[66] = 'echo Writing log file to: %LOGFILE%'
	$xArray[67] = ''
	$xArray[68] = 'start %GAMENAME% -logfile "%LOGFILE%" -quit -batchmode -nographics -configfile=' & $aConfigFile & ' -dedicated'
;~ $xArray[68] = 'start %GAMENAME% -logfile "%LOGFILE%" -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated'
	$xArray[69] = ''
	$xArray[70] = ''
	$xArray[71] = 'echo Starting server ...'
	$xArray[72] = 'timeout 15'
	$xArray[73] = ''
	$xArray[74] = 'cls'
	$xArray[75] = ''
	$xArray[76] = 'echo.'
	$xArray[77] = 'echo Server running in background, you can close this window.'
	$xArray[78] = 'echo You can check the task manager if the server process is really running.'
	$xArray[79] = 'echo.'
	$xArray[80] = 'echo.'
	$xArray[81] = ''
	$xArray[82] = 'pause'
	FileDelete($aServerDirLocal & "\Start_7DTD_Dedicated_Server.bat")
	_FileWriteFromArray($aServerDirLocal & "\Start_7DTD_Dedicated_Server.bat", $xArray)
	FileDelete($aBatchDIR & "\Start_7DTD_Dedicated_Server.bat")
	Local $xArray[2]
	$xArray[0] = '@echo off'
	$xArray[1] = 'start "7 Days To Die Dedicated Server" /D "' & $aServerDirLocal & '" Start_7DTD_Dedicated_Server.bat"'
	_FileWriteFromArray($aBatchDIR & "\Start_7DTD_Dedicated_Server.bat", $xArray)
	#EndRegion ; SteamCMD Update Files Creation
	Global $aUtilExe = @ScriptName
	FileDelete($aServerBatchFile)
	FileWrite($aServerBatchFile, '@echo off' & @CRLF & 'START "' & $aUtilName & '" "' & @ScriptDir & '\' & $aUtilExe & '"' & @CRLF & "EXIT")
EndFunc   ;==>_SteamCMDBatchFilesCreate
#Region ;**** Check for Update At Startup ****
If ($aCheckForUpdate = "yes") Then
	ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Checking for server updates.")
	LogWrite(" [Update] Running initial update check . . ")
	Local $bRestart = UpdateCheck(True, $tSplash, True)
	If $bRestart Then
		If ProcessExists($aServerPID) Then
			$aBeginDelayedShutdown = 1
			ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Server outdated. Server update scheduled.")
			Sleep(5000)
		Else
			ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Server outdated. Server update process inititiated.")
			SteamUpdate()
		EndIf
	EndIf
	SplashOff()
EndIf
#EndRegion ;**** Check for Update At Startup ****

ExternalScriptExist()
_StartRemoteRestart()
Func _StartRemoteRestart()
	If $aRemoteRestartUse = "yes" Then
		ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Starting Remote Restart.")
		TCPStartup() ; Start The TCP Services
		Global $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
		If $MainSocket = -1 Then
			MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $aRemoteRestartPort & "] Check server IP or disable Remote Restart in INI", 10)
			LogWrite(" [Remote Restart] Remote Restart enabled but could not bind to " & $aServerIP & ":" & $aRemoteRestartPort)
		Else
			If $sObfuscatePass = "no" Then
				LogWrite(" [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]", " [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?" & $aRemoteRestartKey & "=" & $aRemoteRestartCode)
			Else
				LogWrite(" [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]")
			EndIf
		EndIf
	EndIf
EndFunc   ;==>_StartRemoteRestart
If $aTelnetStayConnectedYN = "yes" Then
	ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Connecting to telnet.")
	$tResult = _PlinkConnect($aTelnetIP, $aTelnetPort, $aTelnetPass)
EndIf
ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Preparing icon tray.")
Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.
Opt("TrayOnEventMode", 1) ; Enable TrayOnEventMode.
;~ Global $iTrayQueryServerName = TrayCreateItem("(" & $aServerPID & ") " & $aServerQueryName)
Global $iTrayQueryServerName = TrayCreateItem("PID(" & $aServerPID & ") " & $aServerQueryName)
TrayItemSetOnEvent(-1, "TrayShowPlayerCount")
Global $iTrayQueryPlayers = TrayCreateItem("Players Online: [Enable Query or Online Player Check]")
TrayItemSetOnEvent(-1, "TrayShowPlayerCount")
TrayCreateItem("") ; Create a separator line.
Local $iTrayAbout = TrayCreateItem("About")
TrayItemSetOnEvent(-1, "TrayAbout")
Local $iTrayAbout = TrayCreateItem("Restart Util")
TrayItemSetOnEvent(-1, "TrayRestartUtil")
Local $iTrayUpdateUtilCheck = TrayCreateItem("Check for Util Update")
TrayItemSetOnEvent(-1, "TrayUpdateUtilCheck")
Local $iTrayUpdateUtilPause = TrayCreateItem("Pause Util")
TrayItemSetOnEvent(-1, "TrayUpdateUtilPause")
TrayCreateItem("") ; Create a separator line.
Local $iTraySendMessage = TrayCreateItem("Send global chat message")
TrayItemSetOnEvent(-1, "TraySendMessage")
Local $iTraySendInGame = TrayCreateItem("Send telnet command")
TrayItemSetOnEvent(-1, "TraySendInGame")
TrayCreateItem("") ; Create a separator line.
Local $iTrayPlayerCount = TrayCreateItem("Show Online Players Window")
TrayItemSetOnEvent(-1, "TrayShowPlayerCount")
Local $iTrayPlayerCheckPause = TrayCreateItem("Disable Online Players Check/Log")
TrayItemSetOnEvent(-1, "TrayShowPlayerCheckPause")
Local $iTrayPlayerCheckUnPause = TrayCreateItem("Enable Online Players Check/Log")
TrayItemSetOnEvent(-1, "TrayShowPlayerCheckUnPause")
TrayCreateItem("") ; Create a separator line.
Local $iTrayUpdateServCheck = TrayCreateItem("Check for Server Update")
TrayItemSetOnEvent(-1, "TrayUpdateServCheck")
Local $iTrayUpdateServPause = TrayCreateItem("Disable Server Update Check")
TrayItemSetOnEvent(-1, "TrayUpdateServPause")
Local $iTrayUpdateServUnPause = TrayCreateItem("Enable Server Update Check")
TrayItemSetOnEvent(-1, "TrayUpdateServUnPause")
TrayCreateItem("") ; Create a separator line.
Local $iTrayRemoteRestart = TrayCreateItem("Initiate Remote Restart")
TrayItemSetOnEvent(-1, "TrayRemoteRestart")
Local $iTrayRestartNow = TrayCreateItem("Restart Server Now")
TrayItemSetOnEvent(-1, "TrayRestartNow")
TrayCreateItem("") ; Create a separator line.
Local $iTrayExitCloseN = TrayCreateItem("CONFIG")
TrayItemSetOnEvent(-1, "TrayConfig")
Local $iTrayExitCloseN = TrayCreateItem("Exit: Do NOT Shut Down Servers")
TrayItemSetOnEvent(-1, "TrayExitCloseN")
Local $iTrayExitCloseY = TrayCreateItem("Exit: Shut Down Servers")
TrayItemSetOnEvent(-1, "TrayExitCloseY")
If $aCheckForUpdate = "yes" Then
	TrayItemSetState($iTrayUpdateServPause, $TRAY_ENABLE)
	TrayItemSetState($iTrayUpdateServUnPause, $TRAY_DISABLE)
Else
	TrayItemSetState($iTrayUpdateServPause, $TRAY_DISABLE)
	TrayItemSetState($iTrayUpdateServUnPause, $TRAY_ENABLE)
EndIf
If $aServerOnlinePlayerYN = "yes" Then
	TrayItemSetState($iTrayPlayerCheckPause, $TRAY_ENABLE)
	TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_DISABLE)
Else
	TrayItemSetState($iTrayPlayerCheckPause, $TRAY_DISABLE)
	TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_ENABLE)
EndIf
TraySetState($TRAY_ICONSTATE_SHOW) ; Show the tray menu.
Func TrayAbout()
	MsgBox($MB_SYSTEMMODAL, $aUtilName, $aUtilName & @CRLF & "Version: " & $aUtilVersion & @CRLF & @CRLF & "Install Path: " & @ScriptDir & @CRLF & @CRLF & "Discord: http://discord.gg/EU7pzPs" & @CRLF & "Website: http://www.phoenix125.com", 15)
EndFunc   ;==>TrayAbout
Func TrayRestartUtil()
	_RestartUtil()
EndFunc   ;==>TrayRestartUtil

ShowOnlineGUI()
_UpdateTray()

If $aUpdateUtil = "yes" Then AdlibRegister("RunUtilUpdate", 28800000)
Func RunUtilUpdate()
	UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndFunc   ;==>RunUtilUpdate
Global $gTelnetTimeCheck0 = _NowCalc()
Global $gQueryTimeCheck0 = _DateAdd('h', -2, _NowCalc())
Global $gServerUpdatedTimeCheck0 = IniRead($aUtilCFGFile, "CFG", "Last Server Update", "no")
If $gServerUpdatedTimeCheck0 = "no" Then
	$gServerUpdatedTimeCheck0 = _NowCalc()
	IniWrite($aUtilCFGFile, "CFG", "Last Server Update", $gServerUpdatedTimeCheck0)
EndIf

; -----------------------------------------------------------------------------------------------------------------------
$aServerCheck = TimerInit()
If ProcessExists($aServerPID) Then
	$aTimeCheck8 = _DateAdd('h', -1, $aTimeCheck8)
	$aServerCheck = _DateAdd('h', -1, $aServerCheck)
;~ 	SplashOff()
Else
	$aServerCheck = _DateAdd('h', -1, $aServerCheck)
	ControlSetText($tSplash, "", "Static1", "Preparing to start server...")
;~ 	MsgBox(4096, $aUtilName, "Startup process complete." & @CRLF & @CRLF & "The Phoenix tray icon turns grey (busy):" & @CRLF & "- When scanning for online players" & @CRLF & _
;~ 			"- During server process checks every 10 seconds" & @CRLF & @CRLF & "Tray icon menu ready . . .", 10)
EndIf
While True ;**** Loop Until Closed ****
;~ 	Switch TrayGetMsg()
;~ 		Case $iTrayAbout
;~ 			MsgBox($MB_SYSTEMMODAL, $aUtilName, $aUtilName & @CRLF & "Version: " & $aUtilVersion & @CRLF & @CRLF & "Install Path: " & @ScriptDir & @CRLF & @CRLF & "Discord: http://discord.gg/EU7pzPs" & @CRLF & "Website: http://www.phoenix125.com", 15)
;~ 		Case $iTrayUpdateUtilCheck
;~ 			TrayUpdateUtilCheck()
;~ 		Case $iTrayUpdateUtilPause
;~ 			TrayUpdateUtilPause()
;~ 		Case $iTraySendMessage
;~ 			TraySendMessage()
;~ 		Case $iTraySendInGame
;~ 			TraySendInGame()
;~ 		Case $iTrayUpdateServCheck
;~ 			TrayUpdateServCheck()
;~ 		Case $iTrayPlayerCount
;~ 			TrayShowPlayerCount()
;~ 		Case $iTrayPlayerCheckPause
;~ 			TrayShowPlayerCheckPause()
;~ 		Case $iTrayPlayerCheckUnPause
;~ 			TrayShowPlayerCheckUnPause()
;~ 		Case $iTrayUpdateServPause
;~ 			TrayUpdateServPause()
;~ 		Case $iTrayUpdateServUnPause
;~ 			TrayUpdateServUnPause()
;~ 		Case $iTrayRemoteRestart
;~ 			TrayRemoteRestart()
;~ 		Case $iTrayRestartNow
;~ 			TrayRestartNow()
;~ 		Case $iTrayExitCloseY
;~ 			TrayExitCloseY()
;~ 		Case $iTrayExitCloseN
;~ 			TrayExitCloseN()
;~ 	EndSwitch
;~ 	Switch GUIGetMsg()
;~ 		Case $GUI_EVENT_CLOSE
;~ 			GUIDelete()
;~ 			$aPlayerCountWindowTF = False
;~ 			$aPlayerCountShowTF = False
;~ 	EndSwitch

	#Region ;**** Listen for Remote Restart Request ****
	If TimerDiff($aServerCheck) > 10000 Then
		TraySetToolTip("Server process check in progress...")
		TraySetIcon(@ScriptName, 201)
		If $aRemoteRestartUse = "yes" Then
			Local $sRestart = _RemoteRestart($MainSocket, $aRemoteRestartCode, $aRemoteRestartKey, $sObfuscatePass, $aServerIP, $aServerName)
			Switch @error
				Case 0
					If ProcessExists($aServerPID) And ($aBeginDelayedShutdown = 0) Then
						Local $MEM = ProcessGetStats($aServerPID, 0)
						LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
						If ($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
							;						Local $aMaintenanceMsg = """WARNING! " & $sAnnounceRemoteRestartMessage & " Restarting server in " & $aDelayShutdownTime & " minutes...""" & @CRLF
							$aBeginDelayedShutdown = 1
							$aRebootReason = "remoterestart"
							$aTimeCheck0 = _NowCalc
						Else
							RunExternalRemoteRestart()
							CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
						EndIf
					EndIf
				Case 1 To 4
					LogWrite(" " & $sRestart & @CRLF)
			EndSwitch
		EndIf
		#EndRegion ;**** Listen for Remote Restart Request ****

		#Region ;**** Keep Server Alive Check. ****
		If Not ProcessExists($aServerPID) Then
			$tReturn = _CheckForExistingServer()
			If $tReturn = 0 Then
				$aBeginDelayedShutdown = 0
				$tSplash = SplashTextOn($aUtilName, "Starting server.", 550, 110, -1, -1, $DLG_MOVEABLE, "")
				;If $aExecuteExternalScript = "yes" Then
				;	LogWrite(" Executing External Script " & $aExternalScriptDir & "\" & $aExternalScriptName)
				;	If $aExternalScriptHideYN = "yes" Then
				;		Run($aExternalScriptDir & '\' & $aExternalScriptName, $aExternalScriptDir, @SW_HIDE)
				;	Else
				;		Run($aExternalScriptDir & '\' & $aExternalScriptName, $aExternalScriptDir)
				;	EndIf
				;EndIf
				;If $aUseSteamCMD = "yes" Then
				;	SteamUpdate(True)
				;EndIf
				;If $aExternalScriptValidateYN = "yes" Then
				;	LogWrite(" Executing AFTER Update Check External Script " & $aExternalScriptValidateDir & "\" & $aExternalScriptValidateName)
				;	If $aExternalScriptHideYN = "yes" Then
				;		Run($aExternalScriptValidateDir & '\' & $aExternalScriptValidateName, $aExternalScriptValidateDir, @SW_HIDE)
				;	Else
				;		Run($aExternalScriptValidateDir & '\' & $aExternalScriptValidateName, $aExternalScriptValidateDir)
				;	EndIf
				;	LogWrite(" External AFTER Update Check Script Finished. Continuing Server Start.")
				;EndIf

				$LogTimeStamp = $aServerDirLocal & '\7DaysToDieServer_Data\output_log_dedi' & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt"
				IniWrite($aUtilCFGFile, "CFG", "Last Log Time Stamp", $LogTimeStamp)
				Local $tRun = "" & $aServerDirLocal & "\" & $aServerEXE & ' -logfile "' & $LogTimeStamp & '" -quit -batchmode -nographics ' & $aServerExtraCMD & " -configfile=" & $aConfigFileTemp & " -dedicated"
				PurgeLogFile()
				$aServerPID = Run($tRun, $aServerDirLocal, @SW_HIDE)
				LogWrite(" [Server] **** Server Started **** PID(" & $aServerPID & ")", " [Server] **** Server Started **** PID(" & $aServerPID & ") [" & $tRun & "]")
				$gWatchdogServerStartTimeCheck = _NowCalc()
				IniWrite($aUtilCFGFile, "CFG", "Last Server Start", $gWatchdogServerStartTimeCheck)
				ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "PID[" & $aServerPID & "]")
				$gTelnetTimeCheck0 = _NowCalc()
				$tQueryLogReadDoneTF = False
				$aFPCount = $aFPCount + 1
				If ($aFPCount = 3) And ($aFPAutoUpdateYN = "yes") Then FPRun()

				; **** Retrieve Server Version ****
				Sleep(3000)
				ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "Retrieving server version from log.")
				Local $sLogPath = $LogTimeStamp
				Local $sLogPathOpen = FileOpen($sLogPath, 0)
				Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 2500)
				$aGameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
				FileClose($sLogPath)
				If $aGameVer = "-1" Then
					Sleep(2000)
					Local $sLogPath = $LogTimeStamp
					Local $sLogPathOpen = FileOpen($sLogPath, 0)
					Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 2500)
					$xGameVer = _StringBetween($sLogRead, "INF Version: ", " Compatibility Version")
					If @error Then
						ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "Unable to retrieve server version from log.")
						Sleep(5000)
						$aGameVer = "[Unable to retrieve]"
					Else
						$aGameVer = $xGameVer[0]
					EndIf
					$aGameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
					FileClose($sLogPath)
				EndIf
				ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "Server Version: " & $aGameVer)
				LogWrite(" [Server] Server version: " & $aGameVer & ".", " [Server] Server version: " & $aGameVer & ". Version derived from """ & $LogTimeStamp & """.")
				IniWrite($aUtilCFGFile, "CFG", "Last Server Version", $aGameVer)
				Sleep(3000)
				; **** END Retrieve Server Version ****

				; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****
				Local $tRebootTF = False
				If $aAppendVerBegin = "yes" Or $aAppendVerEnd = "yes" Then
					ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "Waiting for Server Name to be written in log")
					$aServerNamFromLog = _GetServerNameFromLog($tSplash)
					Local $tConfigPathOpen = FileOpen($aConfigFileTempFull, 0)
					Local $tConfigRead2 = FileRead($tConfigPathOpen)
					FileClose($tConfigPathOpen)
					Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "")
					Local $sConfigFileTempExists = FileExists($aConfigFileTempFull)
					If $sConfigFileTempExists = 1 Then
						FileDelete($aConfigFileTempFull)
					EndIf
					FileWrite($aConfigFileTempFull, $tConfigRead1)

					; **** Append Server Version to Server Name ****
					If ($aAppendVerBegin = "no") And ($aAppendVerEnd = "no") Then
						$aServerNameVer = $aServerName
					Else
						If $aGameVer = "[Unable to retrieve]" Then
							$aServerNameVer = $aServerName
						Else
							If $aAppendVerShort = "short" Then
								$aGameVerTemp1 = $aGameVer
								$aGameVerTemp1 = _StringBetween($aGameVerTemp1, "(", ")")
								$aGameVer = _ArrayToString($aGameVerTemp1)
							EndIf
							$aServerNameVer = $aServerName
							If $aAppendVerBegin = "yes" Then
								$aServerNameVer = $aGameVer & $aServerNameVer
							EndIf
							If $aAppendVerEnd = "yes" Then
								$aServerNameVer = $aServerNameVer & $aGameVer
							EndIf
						EndIf
						$aPropertyName = "ServerName"
						FileWriteLine($aConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aServerNameVer & """/>")
						IniWrite($aUtilCFGFile, "CFG", "Last Server Name", $aServerNameVer)
					EndIf
					If $aServerNamFromLog = $aServerNameVer Then
						LogWrite("", " [Server] Running server name contains correct server name. No restart necessary. [" & $aServerNameVer & "]")
					Else
						If $aServerNamFromLog = "[Unable to retrieve]" Then
							ControlSetText($tSplash, "", "Static1", "Server Started." & @CRLF & @CRLF & "Unable to retrieve server name from log.")
							Sleep(5000)
						Else
							$tRebootTF = True
							LogWrite("", " [Server] Changing Server Name to [" & $aServerNameVer & "]. Reboot necessary")
						EndIf
					EndIf
				EndIf
				If $aWipeServer = "no" Then
					$aGameName = "[no change]"
				Else
					Local $tGameName = IniRead($aUtilCFGFile, "CFG", "Last Game Name", $aFPGameName)
					$aPropertyName = "GameName"
					$aGameName = StringRegExpReplace($aGameVer, "[\(\)]", "")
					FileWriteLine($aConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aGameName & """/>")
					LogWrite("", " [Server] Changing GameName to """ & $aGameName & """ in " & $aConfigFileTempFull & ".")
					IniWrite($aUtilCFGFile, "CFG", "Last Game Name", $aGameName)
					If $tGameName = $aGameName Then
						LogWrite(" [Server] Running server Game Name = Appended server Game Name. No restart necessary.", " [Server] Running server Game Name = Appended server Game Name. No restart necessary. [" & $aGameName & "]")
					Else
						$tRebootTF = True
					EndIf
				EndIf
				If $aAppendVerBegin = "yes" Or $aAppendVerEnd = "yes" Or $aWipeServer = "yes" Then
					FileWriteLine($aConfigFileTempFull, "<property name=""TelnetEnabled"" value=""" & $aServerTelnetEnable & """/>")
					FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aTelnetPort & """/>")
					FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aTelnetPass & """/>")
					FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
				EndIf
				If $aQueryYN = "no" Then $aServerQueryName = $aServerNamFromLog
				If $tRebootTF Then
					ControlSetText($tSplash, "", "Static1", "Restarting server to apply config change(s)." & @CRLF & "Server name: " & $aServerNameVer & @CRLF & "Game Name: " & $aGameName)
					LogWrite(" [Server] ----- Restarting server to apply config change(s).")
					$aRebootConfigUpdate = "yes"
					$aRebootMe = "no"
					$aServerTelnetReboot = "no"
					CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
				EndIf
				SplashOff()
			Else
				LogWrite("", " [Server} Notice! Utility reported server PID(" & $aServerPID & ") not running, but searched and found a running server PID(" & $tReturn & "). New PID assigned.")
				$aServerPID = $tReturn
				SplashOff()
			EndIf
			; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****

			If @error Or Not $aServerPID Then
				If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
				$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
				Select
					Case $iMsgBoxAnswer = 4 ;Retry
						LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
					Case $iMsgBoxAnswer = 2 ;Cancel
						LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start - " & $aUtilName & " Shutdown - Initiated by User")
						_ExitUtil()
					Case $iMsgBoxAnswer = -1 ;Timeout
						LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. Script Initiated Restart Attempt after 60 seconds of no User Input.")
				EndSelect
			EndIf
			IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
		ElseIf ((_DateDiff('n', $aTimeCheck1, _NowCalc())) >= 5) Then
			;			If $aExMemRestart = "yes" Then
			Local $MEM = ProcessGetStats($aServerPID, 0)
			If $MEM[0] > $aExMemAmt And $aExMemRestart = "yes" Then
				LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " Excessive Memory Use - Restart requested by " & $aUtilName & " Script", " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1])
				CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
			EndIf
			$aTimeCheck1 = _NowCalc()
		EndIf

		If $aQueryYN = "no" And $tQueryLogReadDoneTF = False Then
			Local $tDiffStart = _DateDiff('n', $gWatchdogServerStartTimeCheck, _NowCalc())
			If $tDiffStart < 1 Then
			Else
				$aServerNamFromLog = _GetServerNameFromLog($tSplash)
				$tQueryLogReadDoneTF = True
			EndIf
		EndIf
		If $aTelnetCheckYN = "yes" Or $aServerOnlinePlayerYN = "yes" Then
			If $aTelnetStayConnectedYN = "no" Then
				_PlinkConnect($aTelnetIP, $aTelnetPort, $aTelnetPass)
				_TelnetLookForAll(_PlinkRead())
				_PlinkDisconnect()
			Else
				_TelnetLookForAll(_PlinkRead())
			EndIf
		EndIf

		#EndRegion ;**** Keep Server Alive Check. ****
		#Region ;**** Show Online Players ****
		If $aServerOnlinePlayerYN = "yes" Then
			If ((_DateDiff('s', $aTimeCheck8, _NowCalc())) >= $aServerOnlinePlayerSec) Then
				_GetPlayerCount()
				If $aQueryYN = "yes" Then
					$tQueryResponseOK = _QueryCheck(False)
					If $tQueryResponseOK Then
						$aServerReadyTF = True
					Else
						$aServerReadyTF = False
					EndIf
				EndIf
				If $aServerReadyTF And $aServerReadyOnce Then
					If $aNoExistingPID Then
						If $sUseDiscordBotServersUpYN = "yes" Then
							Local $aAnnounceCount3 = 0
							If $aRebootReason = "remoterestart" And $sUseDiscordBotRemoteRestart = "yes" Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								_SendDiscordStatus($sDiscordServersUpMessage)
;~ 								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "update" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								_SendDiscordStatus($sDiscordServersUpMessage)
;~ 								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "mod" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								_SendDiscordStatus($sDiscordServersUpMessage)
;~ 								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "daily" And $sUseDiscordBotDaily = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								_SendDiscordStatus($sDiscordServersUpMessage)
;~ 								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aFirstStartDiscordAnnounce And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								_SendDiscordStatus($sDiscordServersUpMessage)
;~ 								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aFirstStartDiscordAnnounce = False
							EndIf
						Else
							SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement NOT sent. Enable first announcement and/or daily, mod, update, remote restart annoucements in config if desired.", 400, 200, -1, -1, $DLG_MOVEABLE, "")
						EndIf
					Else
						SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement SKIPPED because server was already running or feature disabled in config.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
						$aNoExistingPID = True
					EndIf
					$aServerReadyOnce = False
					Sleep(5000)
					SplashOff()
				EndIf
				$aTimeCheck8 = _NowCalc()
			EndIf
		EndIf
		#EndRegion ;**** Show Online Players ****
		#Region ;**** Restart Server Every X Days and X Hours & Min****
		If (($aRestartDaily = "yes") And ((_DateDiff('n', $aTimeCheck2, _NowCalc())) >= 1) And (DailyRestartCheck($aRestartDays, $aRestartHours, $aRestartMin)) And ($aBeginDelayedShutdown = 0)) Then
			If ProcessExists($aServerPID) Then
				Local $MEM = ProcessGetStats($aServerPID, 0)
				LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " - Daily restart requested by " & $aUtilName & ".")
				If $aDelayShutdownTime Not = 0 Then
					$aBeginDelayedShutdown = 1
					$aRebootReason = "daily"
					$aTimeCheck0 = _NowCalc
					$aAnnounceCount1 = $aAnnounceCount1 + 1
				Else
					RunExternalScriptDaily()
					CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
				EndIf
			EndIf
			$aTimeCheck2 = _NowCalc()
		EndIf
		#EndRegion ;**** Restart Server Every X Days and X Hours & Min****

		#Region ;**** Backup Every X Days and X Hours & Min****
		If ($aBackupYN = "yes") And ((_DateDiff('n', $aTimeCheck4, _NowCalc())) >= 1) And (BackupCheck($aBackupDays, $aBackupHours, $aBackupMin)) Then
;~ 			SetStatusBusy("Server process check in progress...", "Check: Backup Game")
			_BackupGame(True)
			$aTimeCheck4 = _NowCalc()
		EndIf
		#EndRegion ;**** Backup Every X Days and X Hours & Min****

		#Region ;**** KeepServerAlive Telnet Check ****
		If ($aTelnetCheckYN = "yes") And (_DateDiff('s', $gTelnetTimeCheck0, _NowCalc()) >= $aTelnetCheckSec) Then
			Local $tSkipUpdateCheckTF = False
			Local $tSkipStartCheckTF = False
			Local $tDiffUpdate = _DateDiff('n', $gServerUpdatedTimeCheck0, _NowCalc())
			Local $tDiffStart = _DateDiff('n', $gWatchdogServerStartTimeCheck, _NowCalc())
			If $tDiffUpdate <= $aWatchdogWaitServerUpdate Then
				$tSkipUpdateCheckTF = True
				LogWrite("", " [Telnet] KeepAlive check SKIPPED due to Server Update: " & Int($aWatchdogWaitServerUpdate - $tDiffUpdate) & " minutes remain.")
			EndIf
			If $tDiffStart <= $aWatchdogWaitServerStart Then
				$tSkipStartCheckTF = True
				LogWrite("", " [Telnet] KeepAlive check SKIPPED due to Server Start: " & Int($aWatchdogWaitServerStart - $tDiffStart) & " minutes remain.")
			EndIf
			If $tSkipUpdateCheckTF = False And $tSkipStartCheckTF = False Then
				For $i = 1 To 6
					$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, "version", False)
					If $i = 6 Then
						$tFailedCountTelnet += 1
						If $tFailedCountTelnet > $aWatchdogAttemptsBeforeRestart Then
							LogWrite(" [Telnet] KeepAlive check FAILED " & $aWatchdogAttemptsBeforeRestart & " attempts. Restarting server.")
							CloseServer($ip, $port, $pass)
							ExitLoop
						Else
							LogWrite(" [Telnet] KeepAlive check FAILED. Attempt " & $tFailedCountTelnet & " of " & $aWatchdogAttemptsBeforeRestart & ".")
						EndIf
					EndIf
					If StringInStr($aReply, "Game version") = 0 Then
						Sleep(1000)
						LogWrite("", " [Telnet] KeepAlive check failed. Count:" & $i & " of 5")
					Else
						$tFailedCountTelnet = 0
						ExitLoop
					EndIf
				Next
				If $i < 6 Then LogWrite("", " [Telnet] KeepAlive check OK.")
			EndIf
			$gTelnetTimeCheck0 = _NowCalc()
		EndIf
		#EndRegion ;**** KeepServerAlive Telnet Check ****

		#Region ;**** KeepServerAlive Query Port Check ****
		If ($aQueryYN = "yes") And (_DateDiff('s', $gQueryTimeCheck0, _NowCalc()) >= $aQueryCheckSec) Then
			$tQueryResponseOK = _QueryCheck(True)
			$gQueryTimeCheck0 = _NowCalc()
		EndIf
		#EndRegion ;**** KeepServerAlive Query Port Check ****
		If $aGameTime = "Day 1, 00:00" Then
		Else
			If $aPlayersOnlineName <> IniRead($aUtilCFGFile, "CFG", "Players Name", "") Then
				_SendDiscordPlayer()
				IniWrite($aUtilCFGFile, "CFG", "Players Name", $aPlayersOnlineName)
				IniWrite($aUtilCFGFile, "CFG", "Last Online Player Count", $aPlayersCount)
			EndIf
		EndIf

		#Region ;**** Check for Update every X Minutes ****
		If ($aCheckForUpdate = "yes") And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aUpdateCheckInterval) And ($aBeginDelayedShutdown = 0) Then
			Local $bRestart = UpdateCheck(False)
			If $bRestart And (($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes")) Then
				$aBeginDelayedShutdown = 1
				$aRebootReason = "update"
			ElseIf $bRestart Then
				RunExternalScriptUpdate()
				CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
				$gServerUpdatedTimeCheck0 = _NowCalc()
				IniWrite($aUtilCFGFile, "CFG", "Last Server Update", $gServerUpdatedTimeCheck0)
			EndIf
			$aTimeCheck0 = _NowCalc()
		EndIf
		#EndRegion ;**** Check for Update every X Minutes ****

		#Region ;**** Announce to Twitch, In Game, Discord ****
		If $aDelayShutdownTime Not = 0 Then
			If $aBeginDelayedShutdown = 1 Then
				RunExternalScriptAnnounce()
				If $aRebootReason = "daily" Then
					$aAnnounceCount0 = $aDailyCnt
					$aAnnounceCount1 = $aAnnounceCount0 - 1
					If $aAnnounceCount1 = 0 Then
						;					$aDelayShutdownTime = $aDailyTime[$aAnnounceCount0]
						$aDelayShutdownTime = 0
						$aBeginDelayedShutdown = 3
					Else
						$aDelayShutdownTime = $aDailyTime[$aAnnounceCount0] - $aDailyTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aDailyMsgInGame[$aAnnounceCount0])
					EndIf
					If $sUseDiscordBotDaily = "yes" Then _SendDiscordStatus($aDailyMsgDiscord[$aAnnounceCount0])
;~ 						SendDiscordMsg($sDiscordWebHookURLs, $aDailyMsgDiscord[$aAnnounceCount0], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
;~ 					EndIf
					If $sUseTwitchBotDaily = "yes" Then
						TwitchMsgLog($aDailyMsgTwitch[$aAnnounceCount0])
					EndIf
				EndIf
				If $aRebootReason = "remoterestart" Then
					$aAnnounceCount0 = $aRemoteCnt
					$aDelayShutdownTime = $aRemoteTime[$aAnnounceCount0] - $aRemoteTime[$aAnnounceCount1]
					$aAnnounceCount1 = $aAnnounceCount0 - 1
					If $aAnnounceCount1 = 0 Then
						;					$aDelayShutdownTime = $aRemoteTime[$aAnnounceCount0]
						$aDelayShutdownTime = 0
						$aBeginDelayedShutdown = 3
					Else
						$aDelayShutdownTime = $aRemoteTime[$aAnnounceCount0] - $aRemoteTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aRemoteMsgInGame[$aAnnounceCount0])
					EndIf
					If $sUseDiscordBotRemoteRestart = "yes" Then _SendDiscordStatus($aRemoteMsgDiscord[$aAnnounceCount0])
;~ 						SendDiscordMsg($sDiscordWebHookURLs, $aRemoteMsgDiscord[$aAnnounceCount0], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
;~ 					EndIf
					If $sUseTwitchBotRemoteRestart = "yes" Then
						TwitchMsgLog($aRemoteMsgTwitch[$aAnnounceCount0])
					EndIf
				EndIf
				If $aRebootReason = "update" Then
					$aAnnounceCount0 = $aUpdateCnt
					$aDelayShutdownTime = $aUpdateTime[$aAnnounceCount0] - $aUpdateTime[$aAnnounceCount1]
					$aAnnounceCount1 = $aAnnounceCount0 - 1
					If $aAnnounceCount1 = 0 Then
						$aDelayShutdownTime = 0
						$aBeginDelayedShutdown = 3
					Else
						$aDelayShutdownTime = $aUpdateTime[$aAnnounceCount0] - $aUpdateTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aUpdateMsgInGame[$aAnnounceCount0])
					EndIf
					If $sUseDiscordBotUpdate = "yes" Then _SendDiscordStatus($aUpdateMsgDiscord[$aAnnounceCount0])
					If $sUseTwitchBotUpdate = "yes" Then
						TwitchMsgLog($aUpdateMsgTwitch[$aAnnounceCount0])
					EndIf
				EndIf
				$aBeginDelayedShutdown = 2
				$aTimeCheck0 = _NowCalc()

			ElseIf ($aBeginDelayedShutdown > 2 And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aDelayShutdownTime)) Then ; **** REBOOT SERVER ****

				$aBeginDelayedShutdown = 0
				$aTimeCheck0 = _NowCalc()
				If $aRebootReason = "daily" Then
					SplashTextOn($aUtilName, "Daily server request. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
					RunExternalScriptDaily()
				EndIf
				If $aRebootReason = "update" Then
					SplashTextOn($aUtilName, "New server update. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
					RunExternalScriptUpdate()
					$gServerUpdatedTimeCheck0 = _NowCalc()
					IniWrite($aUtilCFGFile, "CFG", "Last Server Update", $gServerUpdatedTimeCheck0)
				EndIf
				If $aRebootReason = "remoterestart" Then
					SplashTextOn($aUtilName, "Remote Restart request. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
					RunExternalRemoteRestart()
				EndIf
				If $sInGameAnnounce = "yes" Then
					SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, "FINAL WARNING! Rebooting server in 10 seconds...")
					Sleep(10000)
				EndIf
				CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)

			ElseIf ($aBeginDelayedShutdown = 2) And (_DateDiff('n', $aTimeCheck0, _NowCalc()) >= $aDelayShutdownTime) Then ; **** REPEAT ANNOUNCEMENTS UNTIL LAST COUNT ***

				If $aRebootReason = "daily" Then
					If $aAnnounceCount1 > 1 Then
						$aDelayShutdownTime = $aDailyTime[$aAnnounceCount1] - $aDailyTime[($aAnnounceCount1 - 1)]
					Else
						$aDelayShutdownTime = $aDailyTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aDailyMsgInGame[$aAnnounceCount1])
					EndIf
					If $sUseDiscordBotDaily = "yes" And ($sUseDiscordBotFirstAnnouncement = "no") Then _SendDiscordStatus($aDailyMsgDiscord[$aAnnounceCount1])
;~ 						SendDiscordMsg($sDiscordWebHookURLs, $aDailyMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
;~ 					EndIf
					If $sUseTwitchBotDaily = "yes" And ($sUseTwitchFirstAnnouncement = "no") Then
						TwitchMsgLog($aDailyMsgTwitch[$aAnnounceCount1])
					EndIf
				EndIf
				If $aRebootReason = "remoterestart" Then
					If $aAnnounceCount1 > 1 Then
						$aDelayShutdownTime = $aRemoteTime[$aAnnounceCount1] - $aRemoteTime[($aAnnounceCount1 - 1)]
					Else
						$aDelayShutdownTime = $aRemoteTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aRemoteMsgInGame[$aAnnounceCount1])
					EndIf
					If ($sUseDiscordBotRemoteRestart = "yes") And ($sUseDiscordBotFirstAnnouncement = "no") Then _SendDiscordStatus($aRemoteMsgDiscord[$aAnnounceCount1])
;~ 						SendDiscordMsg($sDiscordWebHookURLs, $aRemoteMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
;~ 					EndIf
					If $sUseTwitchBotRemoteRestart = "yes" And ($sUseTwitchFirstAnnouncement = "no") Then
						TwitchMsgLog($aRemoteMsgTwitch[$aAnnounceCount1])
					EndIf
				EndIf
				If $aRebootReason = "update" Then
					If $aAnnounceCount1 > 1 Then
						$aDelayShutdownTime = $aUpdateTime[$aAnnounceCount1] - $aUpdateTime[($aAnnounceCount1 - 1)]
					Else
						$aDelayShutdownTime = $aUpdateTime[$aAnnounceCount1]
					EndIf
					If $sInGameAnnounce = "yes" Then
						SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aUpdateMsgInGame[$aAnnounceCount1])
					EndIf
					If $sUseDiscordBotUpdate = "yes" And ($sUseDiscordBotFirstAnnouncement = "no") Then _SendDiscordStatus($aUpdateMsgDiscord[$aAnnounceCount1])
;~ 						SendDiscordMsg($sDiscordWebHookURLs, $aUpdateMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
;~ 					EndIf
					If $sUseTwitchBotUpdate = "yes" And ($sUseTwitchFirstAnnouncement = "no") Then
						TwitchMsgLog($aUpdateMsgTwitch[$aAnnounceCount1])
					EndIf
				EndIf

				$aAnnounceCount1 = $aAnnounceCount1 - 1
				If $aAnnounceCount1 = 0 Then
					$aBeginDelayedShutdown = 3
				EndIf
				$aTimeCheck0 = _NowCalc()
			EndIf
		Else
			$aBeginDelayedShutdown = 0
		EndIf
		#EndRegion ;**** Announce to Twitch, In Game, Discord ****
		_UpdateTray()
		$aServerCheck = TimerInit()
		TraySetToolTip(@ScriptName)
		TraySetIcon(@ScriptName, 99) ;KIM!!!
	EndIf
	Sleep(100)
WEnd

; -----------------------------------------------------------------------------------------------------------------------
#Region ; **** Gamercide Shutdown Protocol ****
Func Gamercide()
	SplashOff()
	Local $aMsg = "Thank you for using " & $aUtilName & "." & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & _
			"Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com"
	If @exitMethod <> 1 Then
		$Shutdown = MsgBox($MB_YESNOCANCEL, $aUtilName, "Utility exited unexpectedly or before it was fully initialized." & @CRLF & @CRLF & _
				"Close utility?" & @CRLF & @CRLF & _
				"Click (YES) to shutdown server and exit utility." & @CRLF & _
				"Click (NO) or (CANCEL) to exit utility but leave server running.", 60)
		;				"Click (NO) to exit utility but leave servers and redis still running." & @CRLF & _
		;				"Click (CANCEL) to cancel and resume utility.", 15)
		;		$Shutdown = MsgBox(4100, "Shut Down?", "Do you wish to shutdown Server " & $aServerName & "?", 60)
		; ----------------------------------------------------------
		If $Shutdown = 6 Then
			LogWrite(" [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
			SplashOff()
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			LogWrite(" [Server] Stopped by User")
			IniWrite($aUtilCFGFile, "CFG", "PID", "0")
			_ExitUtil()
			; ----------------------------------------------------------
		ElseIf $Shutdown = 7 Then
			LogWrite(" [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			LogWrite(" [Server] Stopped by User")
			_ExitUtil()
			; ----------------------------------------------------------
		ElseIf $Shutdown = 2 Then
			;			SplashTextOn($aUtilName, "Shutdown canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			;			Sleep(2000)
			LogWrite(" [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			LogWrite(" [Server] Stopped by User")
			; ----------------------------------------------------------
		EndIf
	Else
		LogWrite(" [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
		SplashOff()
		_ExitUtil()
	EndIf
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------
Func BackupCheck($sWDays, $sHours, $sMin)
	Local $iDay = -1
	Local $iHour = -1
	Local $aDays = StringSplit($sWDays, ",")
	Local $aHours = StringSplit($sHours, ",")
	For $d = 1 To $aDays[0]
		$iDay = StringStripWS($aDays[$d], 8)
		If Int($iDay) = Int(@WDAY) Or Int($iDay) = 0 Then
			For $h = 1 To $aHours[0]
				$iHour = StringStripWS($aHours[$h], 8)
				If Int($iHour) = Int(@HOUR) And Int($sMin) = Int(@MIN) Then
					Return True
				EndIf
			Next
		EndIf
	Next
	Return False
EndFunc   ;==>BackupCheck

Func _BackupGame($tMinimizeTF = True, $tFullTF = False, $tRunWait = False)
;~ 	SetStatusBusy("Backup starting")
;~ 	RunExternalScriptBackUp()
	If $aBackupInGame <> "" Then
		LogWrite(" [Backup] In-Game Announcement sent: " & $aBackupInGame)
		SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $aBackupInGame)
	EndIf
	Local $tCount = IniRead($aUtilCFGFile, "CFG", "aLastBackupCount", 0)
	$tCount += 1
	If $aBackupSendDiscordYN = "yes" Then _SendDiscordStatus($aBackupDiscord)
	If $aBackupSendTwitchYN = "yes" Then TwitchMsgLog($aBackupTwitch)
	_DownloadAndExtractFile("7z", "http://phoenix125.com/share/7dtdshare/7z.zip", "https://github.com/phoenix125/7dtdServerUpdateUtility/releases/download/LatestVersion/7z.zip", 0, $aFolderTemp, "7z.dll")
	Local $tTime = @YEAR & "-" & @MON & "-" & @MDAY & "_" & @HOUR & "-" & @MIN
	Local $tName = $aGameName1 & "_Backup_" & $tTime & ".zip"
	Local $tFull = $aBackupOutputFolder & "\" & $tName
	Local $tCmd = '"' & $aFolderTemp & '7z" ' & $aBackupCommandLine & ' -xr0!' & $aGameName1 & '_Backup*.zip "' & $tFull & '" "' & _
			$aConfigFile & '" "' & $aServerDataFolder & '" "' & $aServerSaveGame & '" '
;~ 	Local $tCmd = '"' & $aFolderTemp & '7z" ' & $aBackupCommandLine & ' -x!' & $aServerMapName & '.*.atlas -xr0!' & $aGameName & '_Backup*.zip "' & $tFull & '" "' & _
;~ 			$aServerDirLocal & '\ShooterGame\Saved\" "' & $aServerDirLocal & '\ShooterGame\Server*.json"' & _
;~ 			' "' & $aGridSelectFile & '" "' & $aIniFile & '" "' & $aServerDirLocal & '\ShooterGame\Config\Default*.ini" '
	$tCmd = StringRegExpReplace($tCmd, "  ", " ")
	If StringInStr($aBackupAddedFolders, "example:") = 0 And $aBackupAddedFolders <> "" Then
		Local $xBackupFolders = StringSplit($aBackupAddedFolders, ",")
		For $i = 1 To $xBackupFolders[0]
			Local $bString = StringRight($xBackupFolders[$i], 1)
			If $bString = "\" Then $xBackupFolders[$i] &= "*"
			$tCmd &= '"' & $xBackupFolders[$i] & '" '
		Next
	EndIf
	If $aBackupFull > 0 Then
		If $tCount >= $aBackupFull Or $tFullTF Then
			$tCmd &= '"' & $aServerDirLocal & '\" "' & @ScriptDir & '\"'
			$tCount = 0
		EndIf
	EndIf
	$tCmd = StringRegExpReplace($tCmd, "  ", " ")
	LogWrite(" [Backup] Backup started. File:" & $tName, " [Backup] Backup initiated: " & $tCmd)
	If $tMinimizeTF Then
		If $tRunWait = False Then
			Local $tPID = Run($tCmd, "", @SW_MINIMIZE)
		Else
			Local $tPID = RunWait($tCmd, "", @SW_MINIMIZE)
		EndIf
	Else
		If $tRunWait = False Then
			Local $tPID = Run($tCmd, "")
		Else
			Local $tPID = RunWait($tCmd, "")
		EndIf
	EndIf
	IniWrite($aUtilCFGFile, "CFG", "aLastBackupCount", $tCount)
	PurgeBackups()
;~ 	SetStatusIdle()
EndFunc   ;==>_BackupGame

Func PurgeBackups()
	Local $aPurgeBackups = $aFolderTemp & $aUtilName & "_PurgeBackups.bat"
	Local $sFileExists = FileExists($aPurgeBackups)
	If $sFileExists = 1 Then
		FileDelete($aPurgeBackups)
	EndIf
	FileWriteLine($aPurgeBackups, "for /f ""tokens=* skip=" & $aBackupNumberToKeep & """ %%F in " & Chr(40) & "'dir """ & $aBackupOutputFolder & "\" & $aGameName1 & "_Backup_*.zip"" /o-d /tc /b'" & Chr(41) & " do del """ & $aBackupOutputFolder & "\%%F""")
	LogWrite("", " Deleting Backups > " & $aBackupNumberToKeep & " in folder " & $aBackupOutputFolder)
	Run($aPurgeBackups, "", @SW_HIDE)
EndFunc   ;==>PurgeBackups
Func _GetPlayerCount()
	$aOnlinePlayers = GetPlayerCount(False)
	If $aGameTime = "Day 1, 00:00" Then
		LogWrite("", " [Players] Failed to get player count. Retry attempt 1 of 2")
		Sleep(1000)
		$aOnlinePlayers = GetPlayerCount(False)
		If $aGameTime = "Day 1, 00:00" Then
			LogWrite("", " [Players] Failed to get player count. Retry attempt 2 of 2")
			Sleep(1000)
			$aOnlinePlayers = GetPlayerCount(False)
			If $aGameTime = "Day 1, 00:00" Then LogWrite("", " [Players] Failed to get player count.")
		EndIf
	EndIf
	ShowPlayerCount()
EndFunc   ;==>_GetPlayerCount

Func _QueryCheck($tRestart1 = True)
	Local $tReturn3 = False
	Local $tSkipUpdateCheckTF = False
	Local $tSkipStartCheckTF = False
	Local $tDiffUpdate = _DateDiff('n', $gServerUpdatedTimeCheck0, _NowCalc())
	Local $tDiffStart = _DateDiff('n', $gWatchdogServerStartTimeCheck, _NowCalc())
	If $tDiffUpdate <= $aWatchdogWaitServerUpdate Then
		$tSkipUpdateCheckTF = True
		LogWrite("", " [Query] KeepAlive check SKIPPED due to Server Update: " & Int($aWatchdogWaitServerUpdate - $tDiffUpdate) & " minutes remain.")
	EndIf
	If $tDiffStart <= $aWatchdogWaitServerStart Then
		$tSkipStartCheckTF = True
		LogWrite("", " [Query] KeepAlive check SKIPPED due to Server Start: " & Int($aWatchdogWaitServerStart - $tDiffStart) & " minutes remain.")
	EndIf
	For $i = 1 To 6
		Local $tQueryCheckResult = _GetQuery($aQueryIP, $aServerPort)
		If UBound($tQueryCheckResult) < 10 Then
			If $i = 6 Then
				If $tSkipUpdateCheckTF = False And $tSkipStartCheckTF = False Then
					If $tRestart1 Then
						$tFailedCountQuery += 1
						If $tFailedCountQuery > $aWatchdogAttemptsBeforeRestart Then
							LogWrite(" [Query] KeepAlive check FAILED " & $aWatchdogAttemptsBeforeRestart & " attempts. Restarting server.")
							CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
							ExitLoop
						Else
							LogWrite(" [Query] KeepAlive check FAILED. Attempt " & $tFailedCountQuery & " of " & $aWatchdogAttemptsBeforeRestart & ".")
						EndIf
					Else
						$tReturn3 = False
					EndIf
					ExitLoop
				EndIf
			EndIf
		Else
			$tFailedCountQuery = 0
			$tReturn3 = True
			$aServerQueryName = StringReplace($tQueryCheckResult[1], "$~!", "|")
			If $aServerOnlinePlayerYN = "no" Then
				Local $tPlayers = IniRead($aUtilCFGFile, "CFG", "Last Online Player Count", 0)
				If $tQueryCheckResult[6] <> $tPlayers Then
					If $aGameTime = "Day 1, 00:00" Then
						If $aServerOnlinePlayerYN = "yes" Or $aTelnetCheckYN = "yes" Then GetPlayerCount(False)
					EndIf
					$aPlayersCount = $tQueryCheckResult[6]
					$aServerQueryName = StringReplace($tQueryCheckResult[1], "$~!", "|")
				EndIf
			EndIf
			ExitLoop
		EndIf
		Sleep(500)
	Next
	Return $tReturn3
EndFunc   ;==>_QueryCheck

Func _SendDiscordPlayer()
	If $aGameTime = "Day 1, 00:00" Then
		LogWrite("", " [Discord] Online player count error or not ready. Discord message not sent.")
	Else
		If $sUseDiscordBotPlayerChangeYN = "yes" Then
			Local $tDiscordPlayersMsg = StringReplace($sDiscordPlayersMsg, "\o", $aPlayersCount)
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\m", $aMaxPlayers)
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\t", $aGameTime)
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\h", $aNextHorde)
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\j", _DiscordPlayersJoined())
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\l", _DiscordPlayersLeft())
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\a", _DiscordPlayersOnline())
			$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\n", @CRLF)
			_SendDiscordMsg($tDiscordPlayersMsg, $aServerDiscordWHSelPlayers)
		EndIf
	EndIf
EndFunc   ;==>_SendDiscordPlayer
Func _DiscordPlayersJoined()
	Local $tTxt2 = ""
	If StringLen($aPlayersJoined) > 1 Then
		$tTxt2 &= StringReplace($sDiscordPlayerJoinMsg, "\p", $aPlayersJoined)
	EndIf
	Return $tTxt2
EndFunc   ;==>_DiscordPlayersJoined
Func _DiscordPlayersLeft()
	Local $tTxt2 = ""
	If StringLen($aPlayersLeft) > 1 Then
		$tTxt2 &= StringReplace($sDiscordPlayerLeftMsg, "\p", $aPlayersLeft)
	EndIf
	Return $tTxt2
EndFunc   ;==>_DiscordPlayersLeft
Func _DiscordPlayersOnline()
	Local $tTxt2 = ""
	If StringLen($aPlayersName) > 1 Then
		$tTxt2 &= StringReplace($sDiscordPlayerOnlineMsg, "\p", $aPlayersName)
	Else
		$tTxt2 &= StringReplace($sDiscordPlayerOnlineMsg, "\p", "[None]")
	EndIf
	Return $tTxt2
EndFunc   ;==>_DiscordPlayersOnline
Func _SendDiscordStatus($tMsg) ;kim125
	_SendDiscordMsg($tMsg, $aServerDiscordWHSelStatus)
EndFunc   ;==>_SendDiscordStatus
Func _SendDiscordChat($tMsg)
	If $sUseDiscordBotPlayerChatYN = "yes" Then	_SendDiscordMsg($tMsg, $aServerDiscordWHSelChat)
EndFunc   ;==>_SendDiscordChat
Func _SendDiscordDie($tMsg)
	_SendDiscordMsg($tMsg, $aServerDiscordWHSelDie)
EndFunc   ;==>_SendDiscordDie
Func _SendDiscordMsg($tMsg, $tSel)
	If $aServerDiscord1TTSYN = "yes" Then $aServerDiscord1TTSYN = True
	If StringInStr($tSel, "1") Then SendDiscordMsg($aServerDiscord1URL, $tMsg, $aServerDiscord1BotName, $aServerDiscord1TTSYN, $aServerDiscord1Avatar, 1)
	If StringInStr($tSel, "2") Then SendDiscordMsg($aServerDiscord2URL, $tMsg, $aServerDiscord2BotName, $aServerDiscord2TTSYN, $aServerDiscord2Avatar, 2)
	If StringInStr($tSel, "3") Then SendDiscordMsg($aServerDiscord3URL, $tMsg, $aServerDiscord3BotName, $aServerDiscord3TTSYN, $aServerDiscord3Avatar, 3)
	If StringInStr($tSel, "4") Then SendDiscordMsg($aServerDiscord4URL, $tMsg, $aServerDiscord4BotName, $aServerDiscord4TTSYN, $aServerDiscord4Avatar, 4)
EndFunc   ;==>_SendDiscordMsg
Func _UpdateTray()
;~ 	If ($aAppendVerBegin = "no") And ($aAppendVerEnd = "no") Then
;~ 		$aServerNameToDisplay = $aServerName
	If $aQueryYN = "yes" Then
		$aServerNameToDisplay = $aServerQueryName
	Else
		$aServerNameToDisplay = $aServerNamFromLog
	EndIf
	TrayItemSetText($iTrayQueryServerName, "PID(" & $aServerPID & ") " & $aServerNameToDisplay)
	If $aServerOnlinePlayerYN = "yes" Then
		TrayItemSetText($iTrayQueryPlayers, "Players Online: " & $aPlayersCount & " / " & $aMaxPlayers & " | Game Time: " & $aGameTime & " | Next Horde: " & $aNextHorde & " days")
	Else
		If $aQueryYN = "yes" Then
			TrayItemSetText($iTrayQueryPlayers, "Players Online: " & $aPlayersCount & " / " & $aMaxPlayers)
		Else
			TrayItemSetText($iTrayQueryPlayers, "Players Online: [Enable Query or Online Player Check]")
		EndIf
	EndIf
EndFunc   ;==>_UpdateTray
Func _GetServerNameFromLog($tSplash = 0)
	Local $tReturn = ""
	Local $sLogPath = IniRead($aUtilCFGFile, "CFG", "Last Log Time Stamp", $aServerDirLocal & '\7DaysToDieServer_Data\output_log_dedi' & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt")
	Local $sLogPathOpen = FileOpen($sLogPath, 0)
	Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 20000)
	FileClose($sLogPath)
	$sLogRead = StringReplace($sLogRead, "|", "~!~!")
	$tReturn = _ArrayToString(_StringBetween($sLogRead, "GamePref.ServerName = ", "GamePref"))
	$tReturn = StringReplace($tReturn, @CRLF, "")
	If $tReturn = "-1" Then
		For $t = 1 To 5
			ControlSetText($tSplash, "", "Static1", "Waiting for Server Name to be written in log." & @CRLF & @CRLF & "Attempt " & $t & " out of 5")
			Sleep(5000)
			Local $sLogPathOpen = FileOpen($sLogPath, 0)
			Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 20000)
			FileClose($sLogPath)
			$tReturn = _ArrayToString(_StringBetween($sLogRead, "GamePref.ServerName = ", "GamePref"))
			$tReturn = StringReplace($tReturn, @CRLF, "")
			If $tReturn = "-1" Then
				$tReturn = "[Unable to retrieve]"
			Else
				ExitLoop
			EndIf
		Next
	EndIf
	$tReturn = StringReplace($tReturn, "~!~!", "|")
	LogWrite(" [Server] Server name from server log file:[" & $tReturn & "]", " [Server] Server name from server log file:[" & $tReturn & "] Version derived from """ & $sLogPath & """.")
	Return $tReturn
EndFunc   ;==>_GetServerNameFromLog

#Region 	 ;**** Close Server ****
Func CloseServer($ip, $port, $pass)
	If $aRebootConfigUpdate = "no" Then
		$tSplash = SplashTextOn($aUtilName, "Shutting down 7 Days to Die server . . .", 350, 110, -1, -1, $DLG_MOVEABLE, "")
	EndIf
	$aServerReadyOnce = True
	$aServerReadyTF = False
	$aAnnounceCount1 = 0
	$aFPCount = 0
	$tQueryLogReadDoneTF = False
	For $i = 1 To 5
		If $aRebootConfigUpdate = "no" Then
			ControlSetText($tSplash, "", "Static1", "Sending shutdown command to server . . ." & @CRLF & @CRLF & "Countdown: " & (6 - $i))
		EndIf
		LogWrite(" [Server] Sending shutdown command to server. Countdown:" & (6 - $i))
		$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, "shutdown", True)
		If StringInStr($aReply, "shutting server down") = 0 Then
			Sleep(1000)
		Else
;~ 			SplashOff()
			ExitLoop
		EndIf
	Next

	For $i = 1 To 10
		If ProcessExists($aServerPID) Then
			If $aRebootConfigUpdate = "no" Then
				ControlSetText($tSplash, "", "Static1", "Waiting for server to finish shutting down." & @CRLF & @CRLF & "Countdown: " & (11 - $i))
			EndIf
			;		LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Server failed to shutdown. Killing process. Countdown:" & (11-$i))
			Sleep(1000)
		Else
			SplashOff()
			ExitLoop
		EndIf
	Next

	For $i = 1 To 10
		If ProcessExists($aServerPID) Then
			ProcessClose($aServerPID)
			If $aRebootConfigUpdate = "no" Then
				ControlSetText($tSplash, "", "Static1", "Server failed to shutdown. Killing process." & @CRLF & @CRLF & "Countdown: " & (11 - $i))
			EndIf
			LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Server failed to shutdown. Killing process. Countdown:" & (11 - $i))
			Sleep(1000)
		Else
			ExitLoop
		EndIf
	Next
	If $aRebootConfigUpdate = "no" Then
		SplashOff()
	EndIf
	IniWrite($aUtilCFGFile, "CFG", "PID", "0")
	SplashOff()
	If $aSteamUpdateNow Then
		SteamUpdate()
	EndIf
	$aRebootConfigUpdate = "no"
EndFunc   ;==>CloseServer
#EndRegion 	 ;**** Close Server ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Function to Send Message In Game ****
Func SendInGame($ip, $port, $pass, $tMsg)
	$tMsg = "say """ & $tMsg & """"
	$aReply = SendTelnetTT($ip, $port, $pass, $tMsg, False)
	LogWrite(" [Telnet] In-game message sent (" & $tMsg & ") " & $aReply)
EndFunc   ;==>SendInGame
#EndRegion ;**** Function to Send Message In Game ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Function to Send Message to Discord ****
Func _Discord_ErrFunc($oError)
	LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] Error: 0x" & Hex($oError.number) & " While Sending Discord Bot Message.")
EndFunc   ;==>_Discord_ErrFunc

;~ Func SendDiscordMsg($sHookURLs, $sBotMessage, $sBotName = "", $sBotTTS = False, $sBotAvatar = "", $tWH = 1)
;~ 	$sBotMessage = StringReplace($sBotMessage, @CRLF, "\n")
;~ 	$sBotMessage = StringReplace($sBotMessage, @LF, "\n")
;~ 	$sBotMessage = StringReplace($sBotMessage, @CR, "\n")
;~ 	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_Discord_ErrFunc")
;~ 	Local $sJsonMessage = '{"content" : "' & $sBotMessage & '", "username" : "' & $sBotName & '", "tts" : "' & $sBotTTS & '", "avatar_url" : "' & $sBotAvatar & '"}'
;~ 	Local $oHTTPOST = ObjCreate("WinHttp.WinHttpRequest.5.1")
;~ 	Local $aHookURLs = StringSplit($sHookURLs, ",")
;~ 	For $i = 1 To $aHookURLs[0]
;~ 		$oHTTPOST.Open("POST", StringStripWS($aHookURLs[$i], 2) & "?wait=true", False)
;~ 		$oHTTPOST.SetRequestHeader("Content-Type", "application/json")
;~ 		$oHTTPOST.Send($sJsonMessage)
;~ 		Local $oStatusCode = $oHTTPOST.Status
;~ 		Local $sResponseText = ""
;~ 		$sResponseText = "Message Response: " & $oHTTPOST.ResponseText
;~ 		LogWrite(" [Discord Bot] Message sent: " & $sBotMessage, " [Discord Bot] Message Status Code {" & $oStatusCode & "} " & $sResponseText)
;~ 	Next
;~ EndFunc   ;==>SendDiscordMsg
;~ #EndRegion ;**** Function to Send Message to Discord ****
Func ReplaceCRLF($tMsg0)
	Return StringReplace($tMsg0, @CRLF, "|")
EndFunc   ;==>ReplaceCRLF

Func SendDiscordMsg($sHookURL, $sBotMessage, $sBotName = "", $sBotTTS = False, $sBotAvatar = "", $tWH = 1)
	If $sHookURL <> "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde" Then
		If $sBotTTS = "yes" Then $sBotTTS = True
		If $sBotTTS = "no" Then $sBotTTS = False
		Local $tErr = True
		$sBotMessage = StringLeft($sBotMessage, 2000)
		$sBotMessage = StringReplace($sBotMessage, "\'", "'")
		$sBotMessage = StringReplace($sBotMessage, @CRLF, "\n")
		$sBotMessage = StringReplace($sBotMessage, @LF, "\n")
		$sBotMessage = StringReplace($sBotMessage, @CR, "\n")
		Local $sJsonMessage = '{"username": "' & $sBotName & '", "avatar_url": "' & $sBotAvatar & '", "content": "' & $sBotMessage & '", "tts": "' & $sBotTTS & '"}'
		Local $oHTTPOST = ObjCreate("WinHttp.WinHttpRequest.5.1")
		$oHTTPOST.Open("POST", StringStripWS($sHookURL, 3) & "?wait=True", False)
		$oHTTPOST.SetRequestHeader("Content-Type", "application/json")
		$oHTTPOST.Send($sJsonMessage)
		Local $oStatusCode = $oHTTPOST.Status
		Local $oReceived = $oHTTPOST.ResponseText
		If (Int($oStatusCode) = 200) Or (Int($oStatusCode) = 204) Then
			LogWrite(" [Discord] Message to WH" & $tWH & " sent. Message:" & $sBotMessage, " [Discord] (Fast Method) Message to WH" & $tWH & " sent (" & $sJsonMessage & "). Status Code (" & $oStatusCode & ") " & $oReceived)
			$tErr = False
		ElseIf Int($oStatusCode) = 429 Then
			LogWrite(" [Discord] ERROR! Message to WH" & $tWH & " failed due to too many requests. Message(" & $sBotMessage & ")", " [Discord] (Fast Method) ERROR! Message to WH" & $tWH & " failed due to too many requests (" & $sJsonMessage & ". Status Code (" & $oStatusCode & ") " & $oReceived)
			$tErr = False
		Else
			LogWrite(" [Discord] ERROR! Message to WH" & $tWH & " failed. Message:" & $sBotMessage, " [Discord] (Fast Method) ERROR! Message to WH" & $tWH & " failed (" & $sJsonMessage & ". Status Code (" & $oStatusCode & ") " & $oReceived)
			$tErr = True
		EndIf
		If $tErr Then
			$sBotMessage = StringReplace($sBotMessage, @CRLF, " | ")
			$sBotMessage = StringReplace($sBotMessage, @LF, " | ")
			$sBotMessage = StringReplace($sBotMessage, @CR, " | ")
			$sBotMessage = StringReplace($sBotMessage, "```css", "")
			$sBotMessage = StringReplace($sBotMessage, "```cs", "")
			$sBotMessage = StringReplace($sBotMessage, "```html", "")
			$sBotMessage = StringReplace($sBotMessage, "```diff", "")
			$sBotMessage = StringReplace($sBotMessage, "```json", "")
			$sBotMessage = StringReplace($sBotMessage, "```md", "")
			$sBotMessage = StringReplace($sBotMessage, "```yaml", "")
			$sBotMessage = StringReplace($sBotMessage, "```", "")
			$sBotMessage = StringReplace($sBotMessage, "> ", "")
			$sBotMessage = StringReplace($sBotMessage, "\n", " | ")
			If FileExists($aDiscordSendWebhookEXE) = 0 Then _DownloadAndExtractFile("DiscordSendWebhook", "http://www.phoenix125.com/share/atlas/DiscordSendWebhook.zip", "https://github.com/phoenix125/DiscordSendWebhook/releases/download/DiscordSendWebhook/DiscordSendWebhook.zip", $tSplash)
			Local $tFile = $aFolderTemp & "DiscordResponse.txt"
			FileDelete($tFile)
;~ 		Local $tCmd = '""' & $aDiscordSendWebhookEXE & '" "' & $sHookURL & '" "' & $sBotMessage & '" "' & $sBotName & '"'
;~ 		$tCmd = @ComSpec & ' /c ' & $tCmd & ' > "' & $tFile & '"'
			Local $tCmd = @ComSpec & ' /c ' & '""' & $aDiscordSendWebhookEXE & '" "' & $sHookURL & '" "' & $sBotMessage & '" "' & $sBotName & '"' & ' > "' & $tFile & '"'
			Local $mOut = Run($tCmd, $aFolderTemp, @SW_HIDE)
			Local $tErr = ProcessWaitClose($mOut, 4)
			If $tErr = 0 Then
				$aRCONError = True
			EndIf
			For $i = 0 To 5
				$tFileOpen = FileOpen($tFile)
				$tcrcatch = FileRead($tFileOpen, 100000000)
				FileClose($tFileOpen)
				If $tcrcatch <> "" Then ExitLoop
				Sleep(100)
			Next
			Local $tReply = ReplaceCRLF($tcrcatch)
			If (StringInStr($tReply, "[200]") > 0) Or (StringInStr($tReply, "[204]") > 0) Then
				LogWrite(" [Discord] (Backup Method) Message to WH" & $tWH & " sent: " & $sBotMessage, " [Discord] (Backup Method) Message sent to WH" & $tWH & ":[" & $tCmd & "] | Response:[" & $tReply & "]")
			Else
				FileDelete($tFile)
				LogWrite(" [Discord] (Backup Method) ERROR!!! Send message to WH" & $tWH & " failed 1st attempt: " & $sBotMessage, " [Discord] (Backup Method) ERROR!!! Send message to WH" & $tWH & " failed 1st attempt:[" & $tCmd & "] Response:[" & $tReply & "]")
				Local $mOut = Run($tCmd, $aFolderTemp, @SW_HIDE)
				$tErr = ProcessWaitClose($mOut, 4)
				If $tErr = 0 Then
					$aRCONError = True
				EndIf
				For $i = 0 To 5
					$tFileOpen = FileOpen($tFile)
					$tcrcatch = FileRead($tFileOpen, 100000000)
					FileClose($tFileOpen)
					If $tcrcatch <> "" Then ExitLoop
					Sleep(100)
				Next
				Local $tReply = ReplaceCRLF($tcrcatch)
				If (StringInStr($tReply, "[200]") > 0) Or (StringInStr($tReply, "[204]") > 0) Then
					LogWrite(" [Discord] Message to WH" & $tWH & " sent: " & $sBotMessage, " [Discord] Message sent to WH" & $tWH & ":[" & $tCmd & "] | Response:[" & $tReply & "]")
				Else
					LogWrite(" [Discord] ERROR!!! Send message to WH" & $tWH & " failed 2nd attempt: " & $sBotMessage, " [Discord] ERROR!!! Send message to WH" & $tWH & " failed 2nd attempt:[" & $tCmd & "] Response:[" & $tReply & "]")
					If $aDiscordUseFastMethodYN = "no" Then
						Local $sJsonMessage = '{"content" : "' & $sBotMessage & '", "username" : "' & $sBotName & '", "tts" : "' & $sBotTTS & '", "avatar_url" : "' & $sBotAvatar & '"}'
						Local $oHTTPOST = ObjCreate("WinHttp.WinHttpRequest.5.1")
						$oHTTPOST.Open("POST", StringStripWS($sHookURL, 3) & "?wait=True", False)
						$oHTTPOST.Option(4) = 0x3300 ; ignore all SSL errors
						$oHTTPOST.SetRequestHeader("Content-Type", "multipart/form-data")
						$oHTTPOST.Send($sJsonMessage)
						Local $oStatusCode = $oHTTPOST.Status
						Local $oReceived = $oHTTPOST.ResponseText
						If (Int($oStatusCode) = 200) Or (Int($oStatusCode) = 204) Then
							LogWrite(" [Discord] (Fast Method) Message to WH" & $tWH & " sent. Message(" & $sBotMessage & ")", " [Discord] (Fast Method) Message to WH" & $tWH & " sent. Status Code (" & $oStatusCode & ") " & $oReceived)
							$tErr = False
						Else
							LogWrite(" [Discord] (Fast Method) ERROR! Message to WH" & $tWH & " failed. Message(" & $sBotMessage & ")", " [Discord] (Fast Method) ERROR! Message to WH" & $tWH & " failed. Status Code (" & $oStatusCode & ") " & $oReceived)
							$tErr = True
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	Else
		LogWrite(" [Discord] ERROR! Message to WH" & $tWH & " failed. No webhook is assigned (" & $sBotMessage & ")")
	EndIf
EndFunc   ;==>SendDiscordMsg
#EndRegion ;**** Function to Send Message to Discord ****

#Region ;**** Post to Twitch Chat Function ****
Opt("TCPTimeout", 500)
Func SendTwitchMsg($sT_Nick, $sT_OAuth, $sT_Channels, $sT_Message)
	Local $aTwitchReturn[4] = [False, False, "", False]
	Local $sTwitchIRC = TCPConnect(TCPNameToIP("irc.chat.twitch.tv"), 6667)
	If @error Then
		TCPCloseSocket($sTwitchIRC)
		Return $aTwitchReturn
	Else
		$aTwitchReturn[0] = True ;Successfully Connected to irc
		TCPSend($sTwitchIRC, "PASS " & StringLower($sT_OAuth) & @CRLF)
		TCPSend($sTwitchIRC, "NICK " & StringLower($sT_Nick) & @CRLF)
		Local $sTwitchReceive = ""
		Local $iTimer1 = TimerInit()
		While TimerDiff($iTimer1) < 1000
			$sTwitchReceive &= TCPRecv($sTwitchIRC, 1)
			If @error Then ExitLoop
		WEnd
		Local $aTwitchReceiveLines = StringSplit($sTwitchReceive, @CRLF, 1)
		$aTwitchReturn[2] = $aTwitchReceiveLines[1] ;Status Line. Accepted or Not
		If StringRegExp($aTwitchReceiveLines[$aTwitchReceiveLines[0] - 1], "(?i):tmi.twitch.tv 376 " & $sT_Nick & " :>") Then
			$aTwitchReturn[1] = True ;Username and OAuth was accepted. Ready for PRIVMSG
			Local $aTwitchChannels = StringSplit($sT_Channels, ",")
			For $i = 1 To $aTwitchChannels[0]
				TCPSend($sTwitchIRC, "PRIVMSG #" & StringLower($aTwitchChannels[$i]) & " :" & $sT_Message & @CRLF)
				If @error Then
					TCPCloseSocket($sTwitchIRC)
					$aTwitchReturn[3] = False ;Check that all channels succeeded or none
					Return $aTwitchReturn
					ExitLoop
				Else
					$aTwitchReturn[3] = True ;Check that all channels succeeded or none
					If $aTwitchChannels[0] > 17 Then ;This is to make sure we don't break the rate limit
						Sleep(1600)
					Else
						Sleep(100)
					EndIf
				EndIf
			Next
			TCPSend($sTwitchIRC, "QUIT")
			TCPCloseSocket($sTwitchIRC)
		Else
			Return $aTwitchReturn
		EndIf
	EndIf
	Return $aTwitchReturn
EndFunc   ;==>SendTwitchMsg

Func TwitchMsgLog($sT_Msg)
	Local $aTwitchIRC = SendTwitchMsg($sTwitchNick, $sChatOAuth, $sTwitchChannels, $sT_Msg)
	If $aTwitchIRC[0] Then
		LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Successfully Connected to Twitch IRC")
		If $aTwitchIRC[1] Then
			LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Username and OAuth Accepted. [" & $aTwitchIRC[2] & "]")
			If $aTwitchIRC[3] Then
				LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Successfully sent ( " & $sT_Msg & " ) to all Channels")
			Else
				LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Failed sending message ( " & $sT_Msg & " ) to one or more channels")
			EndIf
		Else
			LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Username and OAuth Denied [" & $aTwitchIRC[2] & "]")
		EndIf
	Else
		LogWrite(" [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Could not connect to Twitch IRC. Is this URL or port blocked? [irc.chat.twitch.tv:6667]")
	EndIf
EndFunc   ;==>TwitchMsgLog
#EndRegion ;**** Post to Twitch Chat Function ****

; -----------------------------------------------------------------------------------------------------------------------

#Region	 ;**** Restart Server Scheduling Scripts ****
Func DailyRestartCheck($sWDays, $sHours, $sMin)
	Local $iDay = -1
	Local $iHour = -1
	Local $aDays = StringSplit($sWDays, ",")
	Local $aHours = StringSplit($sHours, ",")
	For $d = 1 To $aDays[0]
		$iDay = StringStripWS($aDays[$d], 8)
		If Int($iDay) = Int(@WDAY) Or Int($iDay) = 0 Then
			For $h = 1 To $aHours[0]
				$iHour = StringStripWS($aHours[$h], 8)
				If Int($iHour) = Int(@HOUR) And Int($sMin) = Int(@MIN) Then
					Return True
				EndIf
			Next
		EndIf
	Next
	Return False
EndFunc   ;==>DailyRestartCheck

#EndRegion	 ;**** Restart Server Scheduling Scripts ****

Func RunExternalScriptDaily()
	If $aExternalScriptDailyYN = "yes" Then
		LogWrite(" Executing DAILY restart external script " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir, @SW_HIDE)
		Else
			Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir)
		EndIf
		;					LogWrite(" External DAILY restart script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalScriptDaily

Func RunExternalScriptAnnounce()
	If $aExternalScriptAnnounceYN = "yes" Then
		LogWrite(" Executing FIRST ANNOUNCEMENT external script " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir, @SW_HIDE)
		Else
			Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir)
		EndIf
		;					LogWrite(" External DAILY restart script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalScriptAnnounce

Func RunExternalRemoteRestart()
	If $aExternalScriptRemoteYN = "yes" Then
		LogWrite(" Executing REMOTE RESTART external script " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir, @SW_HIDE)
		Else
			Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir)
		EndIf
		;					LogWrite(" External REMOTE RESTART script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalRemoteRestart

Func RunExternalScriptUpdate()
	If $aExternalScriptUpdateYN = "yes" Then
		LogWrite(" Executing Script When Restarting For Server Update: " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir, @SW_HIDE)
		Else
			Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir)
		EndIf
		;					LogWrite(" Executing Script When Restarting For Server Update Finished. Continuing Server Start.")
	EndIf
EndFunc   ;==>RunExternalScriptUpdate

Func ExternalScriptExist()
	If $aExecuteExternalScript = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptDir & "\" & $aExternalScriptName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External BEFORE update script not found", "Could not find " & $aExternalScriptDir & "\" & $aExternalScriptName & @CRLF & "Would you like to exit now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExecuteExternalScript = "no"
				LogWrite(" External BEFORE update script execution disabled - Could not find " & $aExternalScriptDir & "\" & $aExternalScriptName)
			EndIf
		EndIf
	EndIf
	If $aExternalScriptValidateYN = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptValidateDir & "\" & $aExternalScriptValidateName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External AFTER update script not found", "Could not find " & $aExternalScriptValidateDir & "\" & $aExternalScriptValidateName & @CRLF & "Would you like to exit now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExternalScriptValidateYN = "no"
				LogWrite(" External AFTER update script execution disabled - Could not find " & $aExternalScriptValidateDir & "\" & $aExternalScriptValidateName)
			EndIf
		EndIf
	EndIf
	If $aExternalScriptDailyYN = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External DAILY restart script not found", "Could not find " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName & @CRLF & "Would you like to Exit Now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExternalScriptDailyYN = "no"
				LogWrite(" External DAILY restart script execution disabled - Could not find " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
			EndIf
		EndIf
	EndIf
	If $aExternalScriptUpdateYN = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External UPDATE restart script not found", "Could not find " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName & @CRLF & "Would you like to Exit Now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExternalScriptUpdateYN = "no"
				LogWrite(" External UPDATE restart script execution disabled - Could not find " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
			EndIf
		EndIf
	EndIf
	If $aExternalScriptAnnounceYN = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External DAILY restart script not found", "Could not find " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName & @CRLF & "Would you like to Exit Now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExternalScriptDailyYN = "no"
				LogWrite(" External DAILY restart script execution disabled - Could not find " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
			EndIf
		EndIf
	EndIf
	If $aExternalScriptRemoteYN = "yes" Then
		Local $sFileExists = FileExists($aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
		If $sFileExists = 0 Then
			SplashOff()
			Local $ExtScriptNotFound = MsgBox(4100, "External DAILY restart script not found", "Could not find " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName & @CRLF & "Would you like to Exit Now to fix?", 20)
			If $ExtScriptNotFound = 6 Then
				_ExitUtil()
			Else
				$aExternalScriptDailyYN = "no"
				LogWrite(" External DAILY restart script execution disabled - Could not find " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>ExternalScriptExist

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Functions to Check for Update ****

;**** Retreive latest build ID from SteamDB ****
Func GetLatestVerSteamDB($bSteamAppID, $bServerVer)
	Local $aReturn[2] = [False, ""]
	$aSteamDB1 = _IECreate($aSteamDBURL, 0, 0)
	$aSteamDB = _IEDocReadHTML($aSteamDB1)
	_IEQuit($aSteamDB1)
	FileWrite(@ScriptDir & "\SteamDB.tmp", $aSteamDB)

	Local Const $sFilePath = @ScriptDir & "\SteamDB.tmp"
	Local $hFileOpen = FileOpen($sFilePath, 0)
	Local $hFileRead1 = FileRead($hFileOpen)
	If $hFileOpen = -1 Then
		$aReturn[0] = False
	Else
		Local $xBuildID = _ArrayToString(_StringBetween($hFileRead1, "buildid:</i> <b>", "</b></li><li><i>timeupdated"))
		Local $hBuildID = Int($xBuildID)
		LogWrite(" [Update] Using SteamDB " & $bServerVer & " branch. Latest version: " & $hBuildID)
	EndIf
	FileClose($hFileOpen)
	If $hBuildID < 100000 Then
		SplashOff()
		MsgBox($mb_ok, "ERROR", " [Update] Error retrieving buildid via SteamDB website. Please visit:" & @CRLF & @CRLF & $aURL & @CRLF & @CRLF & _
				"in *Internet Explorer* (NOT Chrome.. must be Internet Explorer) to CAPTCHA authorize your PC or use SteamCMD for updates." & @CRLF & "! Press OK to close " & $aUtilName & " !")
		LogWrite("Error retrieving buildid via SteamDB website. Please visit:" & $aURL & _
				"in **Internet Explorer** (NOT Chrome.. must be Internet Explorer) to CAPTCHA authorize your PC or use SteamCMD for updates.")
	EndIf
	If FileExists($sFilePath) Then
		FileDelete($sFilePath)
	EndIf
	$aReturn[0] = True
	$aReturn[1] = $hBuildID
	Return $aReturn
EndFunc   ;==>GetLatestVerSteamDB

Func GetLatestVersion($sCmdDir)
	$hBuildID = "0"
	Local $aReturn[2] = [False, ""]
	DirRemove($sCmdDir & "\appcache", 1)
	DirRemove($sCmdDir & "\depotcache", 1)
	$sAppInfoTemp = "app_info_" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".tmp"
	$aSteamUpdateCheck = '"' & @ComSpec & '" /c "' & $sCmdDir & "\steamcmd.exe"" +login anonymous +app_info_update 1 +app_info_print " & $aSteamAppID & " +app_info_print " & $aSteamAppID & " +app_info_print " & $aSteamAppID & " +exit > " & $sAppInfoTemp
	RunWait($aSteamUpdateCheck, $aSteamCMDDir, @SW_MINIMIZE)
	Local Const $sFilePath = $sCmdDir & "\" & $sAppInfoTemp
	;	Local Const $sFilePath = $sCmdDir & "\app_info.tmp"
	Local $hFileOpen = FileOpen($sFilePath, 0)
	Local $hFileRead1 = FileRead($hFileOpen)
	If $hFileOpen = -1 Then
		;		$aSteamRunCount = $aSteamRunCount + 1
		;		If $aSteamRunCount = 3 Then
		$aReturn[0] = False
		;		Else
		;			$aReturn[0] = True
		LogWrite(" [Update] SteamCMD update check FAILED to create update file. Skipping this update check.")
		;		EndIf
	Else
		;	Local $aString = _ArrayToString($hFileOpen)
		If StringInStr($hFileRead1, "buildid") > 0 Then
			Local $hFileReadArray = _StringBetween($hFileRead1, "branches", "AppID")
			Local $hFileRead = _ArrayToString($hFileReadArray)
			Local $hString1 = _StringBetween($hFileRead, $aServerVer, "timeupdated")
			If @error Then
				LogWrite(" [Update] ERROR!!! " & $aServerVer & " branch not found by SteamCMD")
				SplashOff()
				For $x1 = 0 To 5
					Local $tSplash = SplashTextOn($aUtilName, "ERROR! " & $aServerVer & " branch not found by SteamCMD.", 300, 75, -1, -1, $DLG_MOVEABLE, "")
					Sleep(850)
					ControlSetText($tSplash, "", "Static1", "")
					Sleep(150)
				Next
				SplashOff()
			Else
				Local $hString2 = StringSplit($hString1[0], '"', 2)
				$hString3 = _ArrayToString($hString2)
				Local $hString4 = StringRegExpReplace($hString3, "\t", "")
				Local $hString5 = StringRegExpReplace($hString4, @CR & @LF, ".")
				Local $hString6 = StringRegExpReplace($hString5, "{", "")
				Local $hBuildIDArray = _StringBetween($hString6, "buildid||", "|.")
				Local $hBuildID = _ArrayToString($hBuildIDArray)
				LogWrite("", " [Update] Update Check via " & $aServerVer & " Branch. Latest version: " & $hBuildID)
				If FileExists($sFilePath) Then
					FileDelete($sFilePath)
				EndIf
				$aReturn[0] = True
			EndIf
		Else
			;			$aSteamRunCount = $aSteamRunCount + 1
			;			If $aSteamRunCount = 3 Then
			$aReturn[0] = False
			;			Else
			LogWrite(" [Update] SteamCMD update check returned a FAILURE reponse. Skipping this update check.")
			;				$aReturn[0] = True
			;			EndIf
		EndIf
		FileClose($hFileOpen)
	EndIf
	$aReturn[1] = $hBuildID
	Return $aReturn
EndFunc   ;==>GetLatestVersion

Func GetInstalledVersion($sGameDir)
	Local $aReturn[2] = [False, ""]
	Local Const $sFilePath = $sGameDir & "\steamapps\appmanifest_" & $aSteamAppID & ".acf"
	Local $hFileOpen = FileOpen($sFilePath, 0)
	If $hFileOpen = -1 Then
		$aReturn[0] = False
	Else
		Local $sFileRead = FileRead($hFileOpen)
		Local $aAppInfo = StringSplit($sFileRead, '"buildid"', 1)

		If UBound($aAppInfo) >= 3 Then
			$aAppInfo = StringSplit($aAppInfo[2], '"buildid"', 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], '"LastOwner"', 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], '"', 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aReturn[0] = True
			$aReturn[1] = $aAppInfo[2]
		EndIf

		If FileExists($sFilePath) Then
			FileClose($hFileOpen)
		EndIf
	EndIf
	Return $aReturn
EndFunc   ;==>GetInstalledVersion

Func UpdateCheck($tAsk, $tSplash = 0, $tShowIfNoUpdate = False)
	Local $bUpdateRequired = False
	$aSteamUpdateNow = False
	If $aUpdateSource = "1" Then
		If $aFirstBoot Or $tAsk Then
			If $tSplash > 0 Then
				ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamDB.")
			Else
				SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamDB.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			EndIf
		EndIf
		Local $aLatestVersion = GetLatestVerSteamDB($aSteamAppID, $aServerVer)
	Else
		If $aFirstBoot Or $tAsk Then
			If $tSplash > 0 Then
				ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest BuildID from SteamCMD.")
			Else
				SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest BuildID from SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			EndIf
		EndIf
		Local $aLatestVersion = GetLatestVersion($aSteamCMDDir)
	EndIf
	If $aFirstBoot Or $tAsk Then
		If $tSplash > 0 Then
			ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Retrieving installed BuildID.")
		Else
			SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Retrieving installed BuildID.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		EndIf
	EndIf
	Local $aInstalledVersion = GetInstalledVersion($aServerDirLocal)
	If $tSplash = 0 Then SplashOff()
	If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
		If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
			LogWrite(" [Update] Server is Up to Date. Installed BuildID: " & $aInstalledVersion[1])
			If $tSplash > 0 Then
				ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & _
						"Server is Up to Date." & @CRLF & "BuildID: " & $aInstalledVersion[1])
				Sleep(3000)
			Else
				If $tShowIfNoUpdate Then MsgBox($MB_OK, $aUtilityVer, "Server is Up to Date." & @CRLF & @CRLF & "BuildID: " & $aInstalledVersion[1], 5)
			EndIf
		Else
			LogWrite(" [Server] Server is Out of Date! Installed BuildID: " & $aInstalledVersion[1] & " Latest BuildID: " & $aLatestVersion[1])
			If $tAsk Then
				SplashOff()
				$tMB = MsgBox($MB_YESNOCANCEL, $aUtilityVer, "Server is Out of Date!!!" & @CRLF & @CRLF & "Installed BuildID: " & $aInstalledVersion[1] & @CRLF & "   Latest BuildID: " & $aLatestVersion[1] & @CRLF & @CRLF & _
						"Click (YES) to update server NOW." & @CRLF & _
						"Click (NO) to update server with " & $aUpdateTime[UBound($aUpdateTime) - 1] & " minute announcements." & @CRLF & _
						"Click (CANCEL) to continue without updating.", 15)
				If $tMB = 6 Then ; yes
					$bUpdateRequired = True
					$aSteamUpdateNow = True
					$aUpdateVerify = "yes"
					RunExternalScriptUpdate()
					$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
					SplashTextOn($aUtilName, "Beginning update. Shutting down and updating server now.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
					CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
					SplashOff()
;~ 					Local $sManifestExists = FileExists($aSteamAppFile)
				ElseIf $tMB = 7 Then
					$bUpdateRequired = True
					$aSteamUpdateNow = True
					$aUpdateVerify = "yes"
					RunExternalScriptUpdate()
					$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
				Else
					$tSplash = SplashTextOn($aUtilName, "Utility update check canceled by user." & @CRLF & "Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				EndIf
			Else
				If $aFirstBoot Then
					SplashOff()
					$tSplash = SplashTextOn($aUtilName, "Server is Out of Date!" & @CRLF & "Installed BuildID: " & $aInstalledVersion[1] & @CRLF & "Latest BuildID: " & $aLatestVersion[1] & @CRLF & "Updating server . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				EndIf

				$bUpdateRequired = True
				$aSteamUpdateNow = True
				$aUpdateVerify = "yes"
				RunExternalScriptUpdate()
				$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
				;Local $sManifestExists = FileExists($aSteamAppFile)
				;			If $sManifestExists = 1 Then
				;				FileMove($aSteamAppFile, $aServerDirLocal & "\steamapps\appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf", 1)
				;				If $xDebug Then
				;					LogWrite(" Notice: """ & $aSteamAppFile & """ renamed to ""appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf""")
				;				EndIf
				;			EndIf
				;			EndIf
				;			If $aFirstBoot Then
				;				SplashTextOn($aUtilName, "Server is Out of Date!" & @CRLF & "Installed Version: " & $aInstalledVersion[1] & @CRLF & "Latest Version: " & $aLatestVersion[1] & @CRLF & "Updating server . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				;			EndIf

				$aRebootMe = "yes"
				;RunExternalScriptUpdate()
				;			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
				;			Local $sManifestExists = FileExists($aSteamCMDDir & "\steamapps\appmanifest_294420.acf")
				;			If $sManifestExists = 1 Then
				;				FileMove($aSteamCMDDir & "\steamapps\appmanifest_294420.acf", $aSteamCMDDir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				;				If $xDebug Then
				;					LogWrite(" Notice: """ & $aServerDirLocal & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				;				EndIf
				;			EndIf
				;			Local $sManifestExists = FileExists($aServerDirLocal & "\steamapps\appmanifest_294420.acf")
				;			If $sManifestExists = 1 Then
				;				FileMove($aServerDirLocal & "\steamapps\appmanifest_294420.acf", $aServerDirLocal & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				;				If $xDebug Then
				;					LogWrite(" Notice: """ & $aServerDirLocal & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				;				EndIf
				;			EndIf
				$bUpdateRequired = True
			EndIf
		EndIf
	ElseIf Not $aLatestVersion[0] And Not $aInstalledVersion[0] Then
		LogWrite(" [Update] Something went wrong retrieving Latest & Installed Versions. Running update with -validate")
		$tSplash = SplashTextOn($aUtilName, "Something went wrong retrieving Latest & Installed Versions." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 500, 125, -1, -1, $DLG_MOVEABLE, "")
		$bUpdateRequired = True
		$aSteamUpdateNow = True
	ElseIf Not $aInstalledVersion[0] Then
		LogWrite(" [Update] Something went wrong retrieving Installed Version. Running update with -validate. (This is normal for new install)")
		$tSplash = SplashTextOn($aUtilName, "Something went wrong retrieving Installed Version." & @CRLF & "(This is normal for new install)" & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
		$bUpdateRequired = True
		$aSteamUpdateNow = True
	ElseIf Not $aLatestVersion[0] Then
		LogWrite(" [Update] Something went wrong retrieving Latest Version.  Skipping this update check.")
		$tSplash = SplashTextOn($aUtilName, "Something went wrong retrieving Latest Version. Skipping this update check." & @CRLF & @CRLF & "(This window will close in 5 seconds)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
		Sleep(5000)
		SplashOff()
;~ 		MsgBox($MB_OK, $aUtilityVer, "Something went wrong retrieving Latest Version. Skipping this update check." & @CRLF & @CRLF & "(This window will close in 5 seconds)", 5)
		;		$aUpdateVerify = "yes"
		;		$aSteamFailedTwice = True
		;		$bUpdateRequired = True
	EndIf
	$aFirstBoot = False
	Return $bUpdateRequired
EndFunc   ;==>UpdateCheck
#EndRegion ;**** Functions to Check for Update ****

#Region ;**** Adjust restart time for announcement delay ****
Func DailyRestartOffset($bHour0, $sMin, $sTime)
	If $bRestartMin - $sTime < 0 Then
		Local $bHour1 = -1
		Local $bHour2 = ""
		Local $bHour3 = StringSplit($bHour0, ",")
		For $bRestartHours = 1 To $bHour3[0]
			$bHour1 = StringStripWS($bHour3[$bRestartHours], 8) - 1
			If Int($bHour1) = -1 Then
				$bHour1 = 23
			EndIf
			$bHour2 = $bHour2 & "," & Int($bHour1)
		Next
		Global $aRestartMin = 60 - $sTime + $bRestartMin
		Global $aRestartHours = StringTrimLeft($bHour2, 1)

	Else
		Global $aRestartMin = $bRestartMin - $sTime
		Global $aRestartHours = $bRestartHours
	EndIf
EndFunc   ;==>DailyRestartOffset
#EndRegion ;**** Adjust restart time for announcement delay ****

#Region ;**** Replace "\m" with minutes in announcement ****
Func AnnounceReplaceTime($tTime0, $tMsg0)
	If StringInStr($tMsg0, "\m") = "0" Then
	Else
		Local $tTime2 = -1
		Local $tTime3 = StringSplit($tTime0, ",")
		Local $tMsg1 = $tTime3
		For $tTime2 = 1 To $tTime3[0]
			$tTime1 = StringStripWS($tTime3[$tTime2], 8) - 1
			$tMsg1[$tTime2] = StringReplace($tMsg0, "\m", $tTime3[$tTime2])
		Next
		Return $tMsg1
	EndIf
EndFunc   ;==>AnnounceReplaceTime
#EndRegion ;**** Replace "\m" with minutes in announcement ****

#Region ;**** Remove invalid characters ****
Func RemoveInvalidCharacters($aString)
	Local $bString = StringRegExpReplace($aString, "[\x3D\x22\x3B\x3C\x3E\x3F\x25\x27\x7C]", "")
	If $aString = $bString Then
	Else
		LogWrite(" [ERROR] Invalid character found in " & $aIniFile & ". Changed parameter from """ & $aString & """ to """ & $bString & """.")
	EndIf
	Return $bString
EndFunc   ;==>RemoveInvalidCharacters
#EndRegion ;**** Remove invalid characters ****

Func SteamUpdate()
	SplashTextOn($aUtilName, "Updating server now...", 400, 110, -1, -1, $DLG_MOVEABLE, "")
	$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
	Local $sManifestExists = FileExists($aSteamCMDDir & "\steamapps\appmanifest_" & $aSteamAppID & ".acf")
	If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
		FileMove($aSteamCMDDir & "\steamapps\appmanifest_" & $aSteamAppID & ".acf", $aSteamCMDDir & "\steamapps\appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf", 1)
		LogWrite("", " Notice: Install manifest found at " & $aSteamCMDDir & "\steamapps\appmanifest_" & $aSteamAppID & ".acf & renamed to appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf")
	Else
		$aFirstBoot = 0
	EndIf
	If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
		FileMove($aServerDirLocal & "\steamapps\appmanifest_" & $aSteamAppID & ".acf", $aServerDirLocal & "\steamapps\appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf", 1)
		LogWrite("", " Notice: Install manifest found at " & $aServerDirLocal & "\steamapps\appmanifest_" & $aSteamAppID & ".acf & renamed to appmanifest_" & $aSteamAppID & "_" & $TimeStamp & ".acf")
	Else
		$aFirstBoot = 0
	EndIf
	$aSteamUpdateNow = False
	If $aValidate = "yes" Then
		LogWrite(" [Steam Update] Running SteamCMD " & $aServerVer & " branch with validate.", " [Steam Update] Running SteamCMD " & $aServerVer & " branch with validate: [" & $aSteamUpdateCMDValY & "]")
		RunWait($aSteamUpdateCMDValY)
	Else
		LogWrite(" [Steam Update] Running SteamCMD " & $aServerVer & " branch without validate.", " [Steam Update] Running SteamCMD " & $aServerVer & " branch without validate. [" & $aSteamUpdateCMDValN & "]")
		RunWait($aSteamUpdateCMDValN)
	EndIf
	SplashOff()
EndFunc   ;==>SteamUpdate

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** UnZip Function by trancexx ****
; #FUNCTION# ;===============================================================================
;
; Name...........: _ExtractZip
; Description ...: Extracts file/folder from ZIP compressed file
; Syntax.........: _ExtractZip($sZipFile, $sFolderStructure, $sFile, $sDestinationFolder)
; Parameters ....: $sZipFile - full path to the ZIP file to process
;                  $sFolderStructure - 'path' to the file/folder to extract inside ZIP file
;                  $sFile - file/folder to extract
;                  $sDestinationFolder - folder to extract to. Must exist.
; Return values .: Success - Returns 1
;                          - Sets @error to 0
;                  Failure - Returns 0 sets @error:
;                  |1 - Shell Object creation failure
;                  |2 - Destination folder is unavailable
;                  |3 - Structure within ZIP file is wrong
;                  |4 - Specified file/folder to extract not existing
; Author ........: trancexx
; https://www.autoitscript.com/forum/topic/101529-sunzippings-zipping/#comment-721866
;
;==========================================================================================
Func _ExtractZip($sZipFile, $sFolderStructure, $sFile, $sDestinationFolder)

	Local $i
	Do
		$i += 1
		$sTempZipFolder = @TempDir & "\Temporary Directory " & $i & " for " & StringRegExpReplace($sZipFile, ".*\\", "")
	Until Not FileExists($sTempZipFolder) ; this folder will be created during extraction

	Local $oShell = ObjCreate("Shell.Application")

	If Not IsObj($oShell) Then
		Return SetError(1, 0, 0) ; highly unlikely but could happen
	EndIf

	Local $oDestinationFolder = $oShell.NameSpace($sDestinationFolder)
	If Not IsObj($oDestinationFolder) Then
		Return SetError(2, 0, 0) ; unavailable destionation location
	EndIf

	Local $oOriginFolder = $oShell.NameSpace($sZipFile & "\" & $sFolderStructure) ; FolderStructure is overstatement because of the available depth
	If Not IsObj($oOriginFolder) Then
		Return SetError(3, 0, 0) ; unavailable location
	EndIf

	Local $oOriginFile = $oOriginFolder.ParseName($sFile)
	If Not IsObj($oOriginFile) Then
		Return SetError(4, 0, 0) ; no such file in ZIP file
	EndIf

	; copy content of origin to destination
	$oDestinationFolder.CopyHere($oOriginFile, 4) ; 4 means "do not display a progress dialog box", but apparently doesn't work

	DirRemove($sTempZipFolder, 1) ; clean temp dir

	Return 1 ; All OK!

EndFunc   ;==>_ExtractZip
#EndRegion ;**** UnZip Function by trancexx ****

; -----------------------------------------------------------------------------------------------------------------------

;===============================================================================
;
; Name...........: _RemoteRestart
; Description ...: Receives TCP string from GET request and checks against list of known passwords.
;				   Expects GET /?restart=user_pass HTTP/x.x
; Syntax.........: RemoteRestart($vMSocket, $sCodes, [$sKey = "restart", $sHideCodes = "no", [$sServIP = "0.0.0.0", [$sName = "Server", [$bDebug = False]]]]])
; Parameters ....: $vMSocket - Main Socket to Accept TCP Requests on. Should already be open from TCPListen
;                  $sCodes - Comma Seperated list of user1_password1,user2_password2,password3
;							 Allowed Characters: abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@$%^&*()+=-{}[]\|:;./?
;				   $sKey - Key to match before matching password. http://IP:Pass?KEY=user_pass
;                  $sHideCodes - Obfuscate codes or not, (yes/no) string
;                  $sServIP - IP  to send back in Header Response.
;				   $sName - Server Name to use in HTML Response.
;				   $sDebug - True to return Full TCP Request when Request is invalid
; Return values .: Success - Returns String
;                          - Sets @error to 0
;				   No Connection - Sets @ error to -1
;                  Failure - Returns Descriptive String sets @error:
;                  |1 - Password doesn't match
;                  |2 - Invalid Request
;                  |3 - CheckHTTPReq Failed - Returns error in string
;                  |4 - TCPRecv Failed - Returns error in string
; Author ........: Dateranoth
;
;==========================================================================================
#Region ;**** Check for Server Utility Update ****
Func UtilUpdate($tLink, $tDL, $tUtil, $tUtilName)
	SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Checking for " & $tUtilName & " updates.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
	Local $tVer[2]
	$hFileRead = _INetGetSource($tLink)
	If @error Then
		LogWrite(" [UTIL] " & $tUtilName & " update check failed to download latest version: " & $tLink)
		If $aShowUpdate Then
			SplashTextOn($aUtilName, $aUtilName & " update check failed." & @CRLF & "Please try again later.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
			$aShowUpdate = False
		EndIf
	Else
		$tVer = StringSplit($hFileRead, "^", 2)
		If $tVer[0] = $tUtil Then
			LogWrite(" [UTIL] " & $tUtilName & " up to date.", " [UTIL] " & $tUtilName & " up to date. Version: " & $tVer[0] & " , Notes: " & $tVer[1])
			FileDelete($aUtilUpdateFile)
			If $aShowUpdate Then
				SplashTextOn($aUtilName, $aUtilName & " up to date . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				Sleep(2000)
				$aShowUpdate = False
				SplashOff()
			EndIf
		Else
			LogWrite(" [UTIL] New " & $aUtilName & " update available. Installed version: " & $tUtil & ", Latest version: " & $tVer[0] & ", Notes: " & $tVer[1])
			FileWrite($aUtilUpdateFile, _NowCalc() & " [UTIL] New " & $aUtilName & " update available. Installed version: " & $tUtil & ", Latest version: " & $tVer[0] & ", Notes: " & $tVer[1])
			SplashOff()
			$tVer[1] = ReplaceReturn($tVer[1])
			$tMB = MsgBox($MB_YESNOCANCEL, $aUtilityVer, "New " & $aUtilName & " update available. " & @CRLF & "Installed version: " & $tUtil & @CRLF & "Latest version: " & $tVer[0] & @CRLF & @CRLF & _
					"Notes: " & @CRLF & $tVer[1] & @CRLF & @CRLF & _
					"Click (YES) to download update to " & @CRLF & @ScriptDir & @CRLF & _
					"Click (NO) to stop checking for updates." & @CRLF & _
					"Click (CANCEL) to skip this update check.", 15)
			If $tMB = 6 Then
				SplashTextOn($aUtilityVer, " Downloading latest version of " & @CRLF & $tUtilName, 400, 110, -1, -1, $DLG_MOVEABLE, "")
				Local $tZIP = @ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".zip"
				If FileExists($tZIP) Then
					FileDelete($tZIP)
				EndIf
				If FileExists($tUtilName & "_" & $tVer[0] & ".exe") Then
					FileDelete($tUtilName & "_" & $tVer[0] & ".exe")
				EndIf
				InetGet($tDL, $tZIP, 1)
				_ExtractZip($tZIP, "", $tUtilName & "_" & $tVer[0] & ".exe", @ScriptDir)
				If FileExists(@ScriptDir & "\readme.txt") Then
					FileDelete(@ScriptDir & "\readme.txt")
				EndIf
				_ExtractZip($tZIP, "", "readme.txt", @ScriptDir)
				;				FileDelete(@ScriptDir & "\" & $tUtilName & "_" & $tVer[1] & ".zip")
				If Not FileExists(@ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".exe") Then
					LogWrite(" [UTIL] ERROR! " & $tUtilName & ".exe download failed.")
					SplashOff()
					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download failed . . . " & @CRLF & "Go to """ & $tLink & """ to download latest version." & @CRLF & @CRLF & "Click (OK), (CANCEL), or wait 15 seconds, to resume current version.", 15)
				Else
					SplashOff()
					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download complete. . . " & @CRLF & @CRLF & "Click (OK) to run new version (server will remain running) OR" & @CRLF & "Click (CANCEL), or wait 15 seconds, to resume current version.", 15)
					If $tMB = 1 Then
						LogWrite(" [" & $aServerName & "] Util Shutdown - Initiated by User to run update.")
						If $aRemoteRestartUse = "yes" Then
							TCPShutdown()
						EndIf
						IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
						Run(@ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".exe")
						_ExitUtil()
					EndIf
				EndIf
			ElseIf $tMB = 7 Then
				$aUpdateUtil = "no"
				IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", "no")
				LogWrite(" [UTIL] " & "Utility update check disabled. To enable update check, change [Check for Updates ###=yes] in the .ini.")
				SplashTextOn($aUtilName, "Utility update check disabled." & @CRLF & "To enable update check, change [Check for Updates ###=yes] in the .ini.", 500, 110, -1, -1, $DLG_MOVEABLE, "")
				Sleep(5000)
			ElseIf $tMB = 2 Then
				LogWrite(" [UTIL] Utility update check canceled by user. Resuming utility . . .")
				SplashTextOn($aUtilName, "Utility update check canceled by user." & @CRLF & "Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				Sleep(2000)
			EndIf
			SplashOff()
		EndIf
		;	Local $tVer[2]
	EndIf
EndFunc   ;==>UtilUpdate
;Func UtilUpdate($tLink, $tDL, $tUtil, $tUtilName)
;	SplashTextOn($aUtilName, $aUtilName & " started." & @CRLF & @CRLF & "Checking for " & $tUtilName & " updates.", 400, 100, -1, -1, $DLG_MOVEABLE, "")
;	$sFilePath = @ScriptDir & "\" & $aUtilName & "_latest_ver.tmp"
;	If FileExists($sFilePath) Then
;		FileDelete($sFilePath)
;	EndIf
;	InetGet($tLink, $sFilePath, 1)
;	Local $hFileOpen = FileOpen($sFilePath, 0)
;	If $hFileOpen = -1 Then
;		LogWrite(" [UTIL] " & $tUtilName & " update check failed to download latest version: " & $tLink)
;	Else
;		Local $hFileRead = FileRead($hFileOpen)
;		$tVer = StringSplit($hFileRead, "^", 2)
;		FileClose($hFileOpen)
;		If $tVer[0] = $tUtil Then
;			LogWrite(" [UTIL] " & $tUtilName & " up to date. Version: " & $tVer[0] & " , Notes: " & $tVer[1])
;		Else
;			LogWrite(" [UTIL] New " & $aUtilName & " update available. Installed version: " & $tUtil & ", Latest version: " & $tVer[0] & ", Notes: " & $tVer[1])
;			SplashOff()
;			$tVer[1] = ReplaceReturn($tVer[1])
;			$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "New " & $aUtilName & " update available. " & @CRLF & "Installed version: " & $tUtil & @CRLF & "Latest version: " & $tVer[0] & @CRLF & @CRLF & "Notes: " & @CRLF & $tVer[1] & @CRLF & @CRLF & "Click (OK) to download update, but NOT install, to " & @CRLF & @ScriptDir & @CRLF & "Click (CANCEL), or wait 30 seconds, to close this window.", 30)
;			If $tMB = 1 Then
;				SplashTextOn($aUtilityVer, " Downloading latest version of " & @CRLF & $tUtilName, 400, 100, -1, -1, $DLG_MOVEABLE, "")
;				Local $tZIP = @ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".zip"
;				If FileExists($tZIP) Then
;					FileDelete($tZIP)
;				EndIf
;				If FileExists($tUtilName & "_" & $tVer[0] & ".exe") Then
;					FileDelete($tUtilName & "_" & $tVer[0] & ".exe")
;				EndIf
;				InetGet($tDL, $tZIP, 1)
;				_ExtractZip($tZIP, "", $tUtilName & "_" & $tVer[0] & ".exe", @ScriptDir)
;				If FileExists(@ScriptDir & "\readme.txt") Then
;					FileDelete(@ScriptDir & "\readme.txt")
;				EndIf
;				_ExtractZip($tZIP, "", "readme.txt", @ScriptDir)
;				;				FileDelete(@ScriptDir & "\" & $tUtilName & "_" & $tVer[1] & ".zip")
;				If Not FileExists(@ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".exe") Then
;					LogWrite(" [UTIL] ERROR! " & $tUtilName & ".exe download failed.")
;					SplashOff()
;					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download failed . . . " & @CRLF & "Go to """ & $tLink & """ to download latest version." & @CRLF & @CRLF & "Click (OK), (CANCEL), or wait 15 seconds, to resume current version.", 15)
;				Else
;					SplashOff()
;					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download complete. . . " & @CRLF & @CRLF & "Click (OK) to exit program OR" & @CRLF & "Click (CANCEL), or wait 15 seconds, to resume current version.", 15)
;					If $tMB = 1 Then
;						Global $aRemoteRestartUse = "no"
;						Exit
;					EndIf
;				EndIf
;			EndIf
;		EndIf
;	EndIf
;EndFunc   ;==>UtilUpdate

Func ReplaceReturn($tMsg0)
	If StringInStr($tMsg0, "|") = "0" Then
		Return $tMsg0
	Else
		Return StringReplace($tMsg0, "|", @CRLF)
	EndIf
EndFunc   ;==>ReplaceReturn

#EndRegion ;**** Check for Server Utility Update ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** PassCheck - Checks if received password matches any of the known passwords ****
Func PassCheck($sPass, $sPassString)
	Local $aPassReturn[3] = [False, "", ""]
	Local $aPasswords = StringSplit($sPassString, ",")
	For $i = 1 To $aPasswords[0]
		If (StringCompare($sPass, $aPasswords[$i], 1) = 0) Then
			Local $aUserPass = StringSplit($aPasswords[$i], "_")
			If $aUserPass[0] > 1 Then
				$aPassReturn[0] = True
				$aPassReturn[1] = $aUserPass[1]
				$aPassReturn[2] = $aUserPass[2]
			Else
				$aPassReturn[0] = True
				$aPassReturn[1] = "Anonymous"
				$aPassReturn[2] = $aUserPass[1]
			EndIf
			ExitLoop
		EndIf
	Next
	Return $aPassReturn
EndFunc   ;==>PassCheck
#EndRegion ;**** PassCheck - Checks if received password matches any of the known passwords ****

Func FPRun() ;**** Future-Proof Script ****
	Local $tConfigPath = $aServerDirLocal & "\" & $aConfigFile
	Local $aFPConfigDefault = $aServerDirLocal & "\serverconfig.xml"
	Local $sConfigFileTempExists = FileExists($aConfigFileTempFull)
	If $sConfigFileTempExists = 1 Then
		FileDelete($aConfigFileTempFull)
	EndIf
	Local $tConfigPathOpen = FileOpen($aFPConfigDefault, 0)
	Local $tConfigRead2 = FileRead($tConfigPathOpen)
	Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "<!-- BEGIN " & $aUtilName & " Changes -->" & @CRLF)
	Local $tConfigReada = StringRegExpReplace($tConfigRead1, "(*CRLF)(?m)^.*?\Q" & "TerminalWindowEnabled" & "\E.*?\r\n", "")
	Local $tConfigReadb = StringRegExpReplace($tConfigReada, "(*CRLF)(?m)^.*?\Q" & "TerminalWindowEnabled" & "\E.*?\r\n", "")
	Local $tConfigReadc = StringRegExpReplace($tConfigReadb, "(*CRLF)(?m)^.*?\Q" & "TelnetPort" & "\E.*?\r\n", "")
	Local $tConfigReadd = StringRegExpReplace($tConfigReadc, "(*CRLF)(?m)^.*?\Q" & "TelnetPassword" & "\E.*?\r\n", "")
	Local $tConfigReade = StringRegExpReplace($tConfigReadd, "(*CRLF)(?m)^.*?\Q" & "ServerPort" & "\E.*?\r\n", "")
	Local $tConfigReadf = StringRegExpReplace($tConfigReade, "(*CRLF)(?m)^.*?\Q" & "ServerName" & "\E.*?\r\n", "")
	Local $tConfigReadg = StringRegExpReplace($tConfigReadf, "(*CRLF)(?m)^.*?\Q" & "SaveGameFolder" & "\E.*?\r\n", "")
	Local $tConfigReadh = StringRegExpReplace($tConfigReadg, "(*CRLF)(?m)^.*?\Q" & "ServerMaxPlayerCount" & "\E.*?\r\n", "")
	Local $tConfigReadi = StringRegExpReplace($tConfigReadh, "(*CRLF)(?m)^.*?\Q" & "ServerDescription" & "\E.*?\r\n", "")
	Local $tConfigReadj = StringRegExpReplace($tConfigReadi, "(*CRLF)(?m)^.*?\Q" & "ServerWebsiteURL" & "\E.*?\r\n", "")
	Local $tConfigReadk = StringRegExpReplace($tConfigReadj, "(*CRLF)(?m)^.*?\Q" & "GameWorld" & "\E.*?\r\n", "")
	Local $tConfigReadl = StringRegExpReplace($tConfigReadk, "(*CRLF)(?m)^.*?\Q" & "WorldGenSeed" & "\E.*?\r\n", "")
	Local $tConfigReadm = StringRegExpReplace($tConfigReadl, "(*CRLF)(?m)^.*?\Q" & "WorldGenSize" & "\E.*?\r\n", "")
	Local $tConfigReadn = StringRegExpReplace($tConfigReadm, "(*CRLF)(?m)^.*?\Q" & "GameName" & "\E.*?\r\n", "")
	Local $tConfigReado = StringRegExpReplace($tConfigReadn, "(*CRLF)(?m)^.*?\Q" & "GameDifficulty" & "\E.*?\r\n", "")
	Local $tConfigReadp = StringRegExpReplace($tConfigReado, "(*CRLF)(?m)^.*?\Q" & "AdminFileName" & "\E.*?\r\n", "")
	Local $tConfigReadq = StringRegExpReplace($tConfigReadp, "(*CRLF)(?m)^.*?\Q" & "DropOnDeath" & "\E.*?\r\n", "")
	Local $tConfigReadr = StringRegExpReplace($tConfigReadq, "(*CRLF)(?m)^.*?\Q" & "ServerLoginConfirmationText" & "\E.*?\r\n", "")
	FileWrite($aConfigFileTempFull, $tConfigReadr)
	FileClose($aFPConfigDefault)
	$aServerNameVer = $aServerName
	FileWriteLine($aConfigFileTempFull, "<property name=""TerminalWindowEnabled"" value=""false""/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetEnabled"" value=""" & $aServerTelnetEnable & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aTelnetPort & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aTelnetPass & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerPort"" value=""" & $aServerPort & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerName"" value=""" & $aServerNameVer & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""SaveGameFolder"" value=""" & $aServerSaveGame & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""UserDataFolder"" value=""" & $aServerDataFolder & """/>")
	If ($aFPServerPass = "-1") Or ($aFPServerPass = "") Then
		FileWriteLine($aConfigFileTempFull, "<property name=""ServerPassword"" value=""""/>")
	Else
		FileWriteLine($aConfigFileTempFull, "<property name=""ServerPassword"" value=""" & $aFPServerPass & """/>")
	EndIf
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerMaxPlayerCount"" value=""" & $aFPServerMaxPlayerCount & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerDescription"" value=""" & $aFPServerDescription & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerWebsiteURL"" value=""" & $aFPServerWebsiteURL & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""GameWorld"" value=""" & $aFPGameWorld & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""WorldGenSeed"" value=""" & $aFPWorldGenSeed & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""WorldGenSize"" value=""" & $aFPWorldGenSize & """/>")
	If $aWipeServer = "no" Then
		FileWriteLine($aConfigFileTempFull, "<property name=""GameName"" value=""" & $aFPGameName & """/>")
	Else
		FileWriteLine($aConfigFileTempFull, "<property name=""GameName"" value=""" & $aGameName & """/>")
	EndIf
	FileWriteLine($aConfigFileTempFull, "<property name=""GameDifficulty"" value=""" & $aFPGameDifficulty & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""AdminFileName"" value=""" & $aFPAdminFileName & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""DropOnDeath"" value=""" & $aFPDropOnDeath & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""ServerLoginConfirmationText"" value=""" & $aFPServerLoginConfirmationText & """/>")
	FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
	LogWrite(" ### WARNING! ### Server failed to boot 3x's after update. The default serverconfig.xml settings and 18 existing parameters were imported to " & $aConfigFileTempFull & ".")
	LogWrite("    PLEASE EDIT THE " & $aConfigFile & " as soon as possible to reflect desired settings.")
	$aFPCount = 0
EndFunc   ;==>FPRun
#Region ;**** Future-Proof Script ****

Func ObfPass($sObfPassString) ;**** ObfPass - Obfuscates password string for logging
	Local $sObfPass = ""
	For $i = 1 To (StringLen($sObfPassString) - 3)
		If $i <> 4 Then
			$sObfPass = $sObfPass & "*"
		Else
			$sObfPass = $sObfPass & StringMid($sObfPassString, 4, 4)
		EndIf
	Next
	Return $sObfPass
EndFunc   ;==>ObfPass

#EndRegion ;**** Future-Proof Script ****

#Region ;**** Function to get IP from Restart Client ****
Func _TCP_Server_ClientIP($hSocket)
	Local $pSocketAddress, $aReturn
	$pSocketAddress = DllStructCreate("short;ushort;uint;char[8]")
	$aReturn = DllCall("ws2_32.dll", "int", "getpeername", "int", $hSocket, "ptr", DllStructGetPtr($pSocketAddress), "int*", DllStructGetSize($pSocketAddress))
	If @error Or $aReturn[0] <> 0 Then Return $hSocket
	$aReturn = DllCall("ws2_32.dll", "str", "inet_ntoa", "int", DllStructGetData($pSocketAddress, 3))
	If @error Then Return $hSocket
	$pSocketAddress = 0
	Return $aReturn[0]
EndFunc   ;==>_TCP_Server_ClientIP
#EndRegion ;**** Function to get IP from Restart Client ****

#Region ;**** Function to Check Request from Browser and return restart string if request is valid****
Func CheckHTTPReq($sRequest, $sKey = "restart")
	If IsString($sRequest) Then
		Local $aRequest = StringRegExp($sRequest, '^GET[[:blank:]]\/\?(?i)' & $sKey & '(?-i)=(\S+)[[:blank:]]HTTP\/\d.\d\R', 2)
		If Not @error Then
			Return SetError(0, 0, $aRequest[1])
		ElseIf @error = 1 Then
			Return SetError(1, @extended, "Invalid Request")
		ElseIf @error = 2 Then
			Return SetError(2, @extended, "Bad pattern, array is invalid. @extended = offset of error in pattern.")
		EndIf
	Else
		Return SetError(3, 0, "Not A String")
	EndIf
EndFunc   ;==>CheckHTTPReq
#EndRegion ;**** Function to Check Request from Browser and return restart string if request is valid****

#Region ;**** Remove Trailing Slash ****
Func RemoveTrailingSlash($aString)
	Local $bString = StringRight($aString, 1)
	If $bString = "\" Then $aString = StringTrimRight($aString, 1)
	Return $aString
EndFunc   ;==>RemoveTrailingSlash
#EndRegion ;**** Remove Trailing Slash ****

#Region ;**** Function to Check for Multiple Password Failures****
Func MultipleAttempts($sRemoteIP, $bFailure = False, $bSuccess = False)
	Local $aPassFailure[1][3] = [[0, 0, 0]]
	For $i = 1 To UBound($aPassFailure, 1) - 1
		If StringCompare($aPassFailure[$i][0], $sRemoteIP) = 0 Then
			If (_DateDiff('n', $aPassFailure[$i][2], _NowCalc()) >= 10) Or $bSuccess Then
				$aPassFailure[$i][1] = 0
				$aPassFailure[$i][2] = _NowCalc()
				Return SetError(0, 0, "Maximum Attempts Reset")
			ElseIf $bFailure Then
				$aPassFailure[$i][1] += 1
				$aPassFailure[$i][2] = _NowCalc()
			EndIf
			If $aPassFailure[$i][1] >= 15 Then
				Return SetError(1, $aPassFailure[$i][1], "Maximum Number of Attempts Exceeded. Wait 10 minutes before trying again.")
			Else
				Return SetError(0, $aPassFailure[$i][1], $aPassFailure[$i][1] & " attempts out of 15 used.")
			EndIf
			ExitLoop
		EndIf
	Next
	ReDim $aPassFailure[(UBound($aPassFailure, 1) + 1)][3]
	$aPassFailure[(UBound($aPassFailure, 1) - 1)][0] = $sRemoteIP
	$aPassFailure[(UBound($aPassFailure, 1) - 1)][1] = 0
	$aPassFailure[(UBound($aPassFailure, 1) - 1)][2] = _NowCalc
	Return SetError(0, 0, "IP Added to List")
EndFunc   ;==>MultipleAttempts
#EndRegion ;**** Function to Check for Multiple Password Failures****

#Region ;**** Uses other Functions to check connection, verify request is valid, verify restart code is correct, gather IP, and send proper message back to User depending on request received****
;Func _RemoteRestart($vMSocket, $sCodes, $sKey = "restart", $sHideCodes = "no", $sServIP = "0.0.0.0", $sName = "Server", $bDebug = False)
Func _RemoteRestart($vMSocket, $sCodes, $sKey, $sHideCodes = "no", $sServIP = "127.0.0.1", $sName = "7DTD Server")
	Local $vConnectedSocket = TCPAccept($vMSocket)
	If $vConnectedSocket >= 0 Then
		Local $sRecvIP = _TCP_Server_ClientIP($vConnectedSocket)
		Local $sRECV = TCPRecv($vConnectedSocket, 512)
		Local $iError = 0
		Local $iExtended = 0
		If @error = 0 Then
			Local $sRecvPass = CheckHTTPReq($sRECV, $sKey)
			If @error = 0 Then
				Local $sCheckMaxAttempts = MultipleAttempts($sRecvIP)
				If @error = 1 Then
					TCPSend($vConnectedSocket, "HTTP/1.1 429 Too Many Requests" & @CRLF & "Retry-After: 600" & @CRLF & "Connection: close" & @CRLF & "Content-Type: text/html; charset=iso-8859-1" & @CRLF & "Cache-Control: no-cache" & @CRLF & "Server: " & $sServIP & @CRLF & @CRLF)
					TCPSend($vConnectedSocket, "<!DOCTYPE HTML><html><head><link rel='icon' href='data:;base64,iVBORw0KGgo='><title>" & $sName & " Remote Restart</title></head><body><h1>429 Too Many Requests</h1><p>You tried to Restart " & $sName & " 15 times in a row.<BR>" & $sCheckMaxAttempts & "</body></html>")
					If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
					Return SetError(1, 0, "Restart ATTEMPT by Remote Host: " & $sRecvIP & " | Wrong Code was entered 15 times. User must wait 10 minutes before trying again.")
				EndIf
				Local $aPassCompare = PassCheck($sRecvPass, $sCodes)
				If $sHideCodes = "yes" Then
					$aPassCompare[2] = ObfPass($aPassCompare[2])
				EndIf
				If $aPassCompare[0] Then
					TCPSend($vConnectedSocket, "HTTP/1.1 200 OK" & @CRLF & "Connection: close" & @CRLF & "Content-Type: text/html; charset=iso-8859-1" & @CRLF & "Cache-Control: no-cache" & @CRLF & "Server: " & $sServIP & @CRLF & @CRLF)
					TCPSend($vConnectedSocket, "<!DOCTYPE HTML><html><head><link rel='icon' href='data:;base64,iVBORw0KGgo='><title>" & $sName & " Remote Restart</title></head><body><h1>Authentication Accepted. " & $sName & " Restarting.</h1></body></html>")
					If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
					$sCheckMaxAttempts = MultipleAttempts($sRecvIP, False, True)
					Return SetError(0, 0, "Restart Requested by Remote Host: " & $sRecvIP & " | User: " & $aPassCompare[1] & " | Pass: " & $aPassCompare[2])
				Else
					TCPSend($vConnectedSocket, "HTTP/1.1 403 Forbidden" & @CRLF & "Connection: close" & @CRLF & "Content-Type: text/html; charset=iso-8859-1" & @CRLF & "Cache-Control: no-cache" & @CRLF & "Server: " & $sServIP & @CRLF & @CRLF)
					TCPSend($vConnectedSocket, "<!DOCTYPE HTML><html><head><link rel='icon' href='data:;base64,iVBORw0KGgo='><title>" & $sName & " Remote Restart</title></head><body><h1>403 Forbidden</h1><p>You are not allowed to restart " & $sName & ".<BR> Attempt from <b>" & $sRecvIP & "</b> has been logged.</body></html>")
					If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
					$sCheckMaxAttempts = MultipleAttempts($sRecvIP, True, False)
					Return SetError(1, 0, "Restart ATTEMPT by Remote Host: " & $sRecvIP & " | Unknown Restart Code: " & $sRecvPass)
				EndIf
			Else
				$iError = @error
				$iExtended = @extended
				TCPSend($vConnectedSocket, "HTTP/1.1 404 Not Found" & @CRLF & "Connection: close" & @CRLF & "Content-Type: text/html; charset=iso-8859-1" & @CRLF & "Cache-Control: no-cache" & @CRLF & "Server: " & $sServIP & @CRLF & @CRLF)
				TCPSend($vConnectedSocket, "<!DOCTYPE HTML><html><head><link rel='icon' href='data:;base64,iVBORw0KGgo='><title>404 Not Found</title></head><body><h1>404 Not Found.</h1></body></html>")
				If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
				If $iError = 1 Then
					$sRECV = "Full TCP Request: " & @CRLF & $sRECV
					;					Return SetError(2, 0, "Invalid Restart Request by: " & $sRecvIP & ". Should be in the format of GET /?" & $sKey & "=user_pass HTTP/x.x | " & $sRECV)
					Return SetError(2, 0, "Invalid Restart Request by: " & $sRecvIP & ".")
				Else
					;This Shouldn't Happen
					Return SetError(3, 0, "CheckHTTPReq Failed with Error: " & $iError & " Extended: " & $iExtended & " [" & $sRecvPass & "]")
				EndIf
			EndIf
		Else
			$iError = @error
			$iExtended = @extended
			TCPSend($vConnectedSocket, "HTTP/1.1 400 Bad Request" & @CRLF & "Connection: close" & @CRLF & "Content-Type: text/html; charset=iso-8859-1" & @CRLF & "Cache-Control: no-cache" & @CRLF & "Server: " & $sServIP & @CRLF & @CRLF)
			TCPSend($vConnectedSocket, "<!DOCTYPE HTML><html><head><link rel='icon' href='data:;base64,iVBORw0KGgo='><title>400 Bad Request</title></head><body><h1>400 Bad Request.</h1></body></html>")
			If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
			Return SetError(4, 0, "TCPRecv Failed to Complete with Error: " & $iError & " Extended: " & $iExtended)
		EndIf
	EndIf
	Return SetError(-1, 0, "No Connection")
	If $vConnectedSocket <> -1 Then TCPCloseSocket($vConnectedSocket)
EndFunc   ;==>_RemoteRestart
#EndRegion ;**** Uses other Functions to check connection, verify request is valid, verify restart code is correct, gather IP, and send proper message back to User depending on request received****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** INI Settings - User Variables ****

Func ReadUini($aIniFile, $sLogFile)
	If FileExists($aIniFailFile) Then
		FileDelete($aIniFailFile)
	EndIf
	Local $iIniError = ""
	Local $iIniFail = 0
	Local $iniCheck = ""
	Local $aChar[3]
	For $i = 1 To 13
		$aChar[0] = Chr(Random(97, 122, 1)) ;a-z
		$aChar[1] = Chr(Random(48, 57, 1)) ;0-9
		$iniCheck &= $aChar[Random(0, 1, 1)]
	Next

	Global $aServerDirLocal = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $iniCheck)
	Global $aConfigFile = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $iniCheck)
	Global $aServerVer = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $iniCheck)
	Global $aServerExtraCMD = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $iniCheck)
	Global $aServerIP = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $iniCheck)
	Global $aSteamCMDDir = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $iniCheck)
	Global $aSteamCMDUserName = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Username (optional) ###", $iniCheck)
	Global $aSteamCMDPassword = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Password (optional) ###", $iniCheck)
;~ 	Global $aSteamExtraCMD = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (See note below) ###", $iniCheck)
	Global $aSteamUpdateCommandline = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD commandline (caution: overwrites all settings above) ###", $iniCheck)
	Global $aServerOnlinePlayerYN = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $iniCheck)
	Global $aServerOnlinePlayerSec = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $iniCheck)
	Global $aWipeServer = IniRead($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $iniCheck)
	Global $aAppendVerBegin = IniRead($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerEnd = IniRead($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerShort = IniRead($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $iniCheck)
	Global $aQueryYN = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Use Query Port to check if server is alive? (yes/no) ###", $iniCheck)
	Global $aQueryCheckSec = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query Port check interval in seconds (30-900) ###", $iniCheck)
	Global $aQueryIP = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $iniCheck)
	Global $aTelnetCheckYN = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Use telnet to check if server is alive? (yes/no) ###", $iniCheck)
	Global $aTelnetIP = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $iniCheck)
	Global $aTelnetCheckSec = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet check interval in seconds (30-900) ###", $iniCheck)
	Global $aWatchdogWaitServerUpdate = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server updated to allow map generation (1-360) ###", $iniCheck)
	Global $aWatchdogWaitServerStart = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server started to allow server to come online (1-60) ###", $iniCheck)
	Global $aWatchdogAttemptsBeforeRestart = IniRead($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", $iniCheck)

	Global $aExMemRestart = IniRead($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $iniCheck)
	Global $aExMemAmt = IniRead($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $iniCheck)
	Global $aBackupYN = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Use scheduled backups? (yes/no) ###", $iniCheck)
	Global $aBackupDays = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $iniCheck)
	Global $aBackupHours = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup hours (comma separated 00-23 ex.04,16) ###", $iniCheck)
	Global $aBackupMin = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup minute (00-59) ###", $iniCheck)
	Global $aBackupFull = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Full " & $aGameName1 & " and Util folder backup every __ backups (0 to disable)(0-99) ###", $iniCheck)
	Global $aBackupAddedFolders = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Additional backup folders / files (comma separated. Folders add \ at end. ex. C:\Atlas\,D:\Atlas Server\) ###", $iniCheck)
	Global $aBackupOutputFolder = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Output folder ###", $iniCheck)
	Global $aBackupNumberToKeep = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Number of backups to keep (1-999) ###", $iniCheck)
	Global $aBackupTimeoutSec = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Max time in seconds to wait for backup to complete (30-999) ###", $iniCheck)
	Global $aBackupCommandLine = IniRead($aIniFile, " --------------- BACKUP --------------- ", "7zip backup additional command line parameters (Default: a -spf -r -tzip -ssw) ###", $iniCheck)
	Global $aBackupSendDiscordYN = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Send Discord announcement when backup initiated (yes/no) ###", $iniCheck)
	Global $aBackupSendTwitchYN = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Send Twitch announcement when backup initiated (yes/no) ###", $iniCheck)
	Global $aBackupInGame = IniRead($aIniFile, " --------------- BACKUP --------------- ", "In-Game announcement when backup initiated (Leave blank to disable) ###", $iniCheck)
	Global $aBackupDiscord = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Discord announcement when backup initiated ###", $iniCheck)
	Global $aBackupTwitch = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Twitch announcement when backup initiated ###", $iniCheck)
	Global $aRemoteRestartUse = IniRead($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $iniCheck)
	Global $aRemoteRestartPort = IniRead($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $iniCheck)
	Global $aRemoteRestartKey = IniRead($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $iniCheck)
	Global $aRemoteRestartCode = IniRead($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $iniCheck)
	Global $aCheckForUpdate = IniRead($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $iniCheck)
	Global $aUpdateCheckInterval = IniRead($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $iniCheck)
	Global $aRestartDaily = IniRead($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $iniCheck)
	Global $aRestartDays = IniRead($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $iniCheck)
	Global $bRestartHours = IniRead($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $iniCheck)
	Global $bRestartMin = IniRead($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $iniCheck)
	Global $sAnnounceNotifyTime1 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $iniCheck)
	Global $sAnnounceNotifyTime2 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $iniCheck)
	Global $sAnnounceNotifyTime3 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $iniCheck)
	;	Global $sAnnounceDailyMessage = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement Daily (\m - minutes) ###", $iniCheck)
	;	Global $sAnnounceDailyMessage = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement Daily (\m - minutes) ###", $iniCheck)
	Global $sInGameAnnounce = IniRead($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $iniCheck)
	Global $sInGameDailyMessage = IniRead($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sInGameUpdateMessage = IniRead($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sInGameRemoteRestartMessage = IniRead($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)

	Global $aServerDiscord1URL = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Webhook URL ###", $iniCheck)
	Global $aServerDiscord1BotName = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Bot Name (optional) ###", $iniCheck)
	Global $aServerDiscord1Avatar = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Avatar URL (optional) ###", $iniCheck)
	Global $aServerDiscord1TTSYN = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Use TTS (optional) (yes/no) ###", $iniCheck)
	Global $aServerDiscord2URL = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Webhook URL ###", $iniCheck)
	Global $aServerDiscord2BotName = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Bot Name (optional) ###", $iniCheck)
	Global $aServerDiscord2Avatar = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Avatar URL (optional) ###", $iniCheck)
	Global $aServerDiscord2TTSYN = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Use TTS (optional) (yes/no) ###", $iniCheck)
	Global $aServerDiscord3URL = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Webhook URL ###", $iniCheck)
	Global $aServerDiscord3BotName = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Bot Name (optional) ###", $iniCheck)
	Global $aServerDiscord3Avatar = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Avatar URL (optional) ###", $iniCheck)
	Global $aServerDiscord3TTSYN = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Use TTS (optional) (yes/no) ###", $iniCheck)
	Global $aServerDiscord4URL = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Webhook URL ###", $iniCheck)
	Global $aServerDiscord4BotName = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Bot Name (optional) ###", $iniCheck)
	Global $aServerDiscord4Avatar = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Avatar URL (optional) ###", $iniCheck)
	Global $aServerDiscord4TTSYN = IniRead($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Use TTS (optional) (yes/no) ###", $iniCheck)

	Global $aServerDiscordWHSelStatus = IniRead($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $iniCheck)
	Global $aServerDiscordWHSelPlayers = IniRead($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $iniCheck)
	Global $aServerDiscordWHSelChat = IniRead($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $iniCheck)
	Global $aServerDiscordWHSelDie = IniRead($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $iniCheck)

	Global $sUseDiscordBotDaily = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotUpdate = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotRemoteRestart = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotServersUpYN = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotPlayerChangeYN = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Online Player changes? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotPlayerChatYN = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Player Chat? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotPlayerDiedYN = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when player dies? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotFirstAnnouncement = IniRead($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $iniCheck)

	Global $sDiscordDailyMessage = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sDiscordUpdateMessage = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sDiscordRemoteRestartMessage = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sDiscordServersUpMessage = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement when server is back online ###", $iniCheck)
	Global $sDiscordPlayersMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Message (see above for substitutions) ###", $iniCheck)
	Global $sDiscordPlayerJoinMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Join Player Sub-Message (\p - Player Name(s) of player(s) that joined server, \n Next Line) ###", $iniCheck)
	Global $sDiscordPlayerLeftMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Left Player Sub-Message (\p - Player Name(s) of player(s) that left server, \n Next Line) ###", $iniCheck)
	Global $sDiscordPlayerOnlineMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Sub-Message (\p - Player Name(s) of player(s) online, \n Next Line) ###", $iniCheck)
	Global $sDiscordPlayerDiedMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Died Message (\p - Player Name, \n Next Line) ###", $iniCheck)
	Global $sDiscordPlayerChatMsg = IniRead($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Chat (\p - Player Name, \m Message) ###", $iniCheck)

	Global $sUseTwitchBotDaily = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for DAILY reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchBotUpdate = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for UPDATE reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchBotRemoteRestart = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for REMOTE RESTART reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchFirstAnnouncement = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for first announcement only? (reduces bot spam)(yes/no) ###", $iniCheck)
	Global $sTwitchDailyMessage = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sTwitchUpdateMessage = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sTwitchRemoteRestartMessage = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sTwitchNick = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Nick ###", $iniCheck)
	Global $sChatOAuth = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "ChatOAuth ###", $iniCheck)
	Global $sTwitchChannels = IniRead($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Channels ###", $iniCheck)
	Global $aExecuteExternalScript = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Execute external script BEFORE update? (yes/no) ###", $iniCheck)
	Global $aExternalScriptDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script directory ###", $iniCheck)
	Global $aExternalScriptName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script filename ###", $iniCheck)
	Global $aExternalScriptValidateYN = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no) ###", $iniCheck)
	Global $aExternalScriptValidateDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script directory ###", $iniCheck)
	Global $aExternalScriptValidateName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script filename ###", $iniCheck)
	Global $aExternalScriptUpdateYN = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Execute external script for server update restarts? (yes/no) ###", $iniCheck)
	Global $aExternalScriptUpdateDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script directory ###", $iniCheck)
	Global $aExternalScriptUpdateFileName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script filename ###", $iniCheck)
	Global $aExternalScriptDailyYN = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Execute external script for daily server restarts? (yes/no) ###", $iniCheck)
	Global $aExternalScriptDailyDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script directory ###", $iniCheck)
	Global $aExternalScriptDailyFileName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script filename ###", $iniCheck)
	Global $aExternalScriptAnnounceYN = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Execute external script when first restart announcement is made? (yes/no) ###", $iniCheck)
	Global $aExternalScriptAnnounceDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script directory ###", $iniCheck)
	Global $aExternalScriptAnnounceFileName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script filename ###", $iniCheck)
	Global $aExternalScriptRemoteYN = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no) ###", $iniCheck)
	Global $aExternalScriptRemoteDir = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script directory ###", $iniCheck)
	Global $aExternalScriptRemoteFileName = IniRead($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script filename ###", $iniCheck)
	Global $aLogQuantity = IniRead($aIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $iniCheck)
	Global $aValidate = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $iniCheck)
	Global $aTelnetStayConnectedYN = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Telnet: Stay Connected (Required for chat and death messaging) (yes/no) ###", $iniCheck)
	Global $aUpdateSource = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $iniCheck)
	;	Global $aUsePuttytel = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $iniCheck)
	Global $sObfuscatePass = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $iniCheck)
	Global $aUpdateUtil = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $iniCheck)
	Global $aUtilBetaYN = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $iniCheck)
	Global $aExternalScriptHideYN = IniRead($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $iniCheck)
	Global $aFPAutoUpdateYN = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $iniCheck)
	;	Global $aFPAppendFPSettingsYN = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Append the following settings to new config? (yes/no) ###", $iniCheck)
	;	Global $aFPServerName = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerName ###", $iniCheck)
	;	Global $aFPServerPort = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPort ###", $iniCheck)
	;	Global $aFPServerPassword = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPassword ###", $iniCheck)
	;	Global $aFPTelnetPort = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPort ###", $iniCheck)
	;	Global $aFPTelnetPassword = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPassword ###", $iniCheck)
	;	Global $aFPServerLoginConfirmationText = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerLoginConfirmationText ###", $iniCheck)
	;	Global $aFPServerMaxPlayerCount = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerMaxPlayerCount ###", $iniCheck)
	;	Global $aFPServerDescription = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDescription ###", $iniCheck)
	;	Global $aFPServerWebsiteURL = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerWebsiteURL ###", $iniCheck)
	;	Global $aFPServerDisabledNetworkProtocols = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDisabledNetworkProtocols ###", $iniCheck)
	;	Global $aFPGameWorld = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameWorld ###", $iniCheck)
	;	Global $aFPWorldGenSeed = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSeed ###", $iniCheck)
	;	Global $aFPWorldGenSize = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSize ###", $iniCheck)
	;	Global $aFPGameName = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameName ###", $iniCheck)
	;	Global $aFPGameDifficulty = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameDifficulty ###", $iniCheck)
	;	Global $aFPAdminFileName = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "AdminFileName ###", $iniCheck)
	;	Global $aFPDropOnDeath = IniRead($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "DropOnDeath ###", $iniCheck)

	If $iniCheck = $aServerDirLocal Then
		$aServerDirLocal = "D:\Game Servers\7 Days to Die Dedicated Server"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDirLocal, "
	EndIf
	If $iniCheck = $aSteamCMDDir Then
		$aSteamCMDDir = "D:\Game Servers\7 Days to Die Dedicated Server\SteamCMD"
		$iIniFail += 1
		$iIniError = $iIniError & "SteamCMDDir, "
	EndIf
	If $iniCheck = $aSteamCMDUserName Then
		$aSteamCMDUserName = ""
		$iIniFail += 1
		$iIniError = $iIniError & "SteamCMDUserName, "
	EndIf
	If $iniCheck = $aSteamCMDPassword Then
		$aSteamCMDPassword = ""
		$iIniFail += 1
		$iIniError = $iIniError & "SteamCMDPassword, "
	EndIf
;~ 	If $iniCheck = $aSteamExtraCMD Then
;~ 		$aSteamExtraCMD = ""
;~ 		$iIniFail += 1
;~ 		$iIniError = $iIniError & "SteamExtraCMD, "
;~ 	EndIf
	If $iniCheck = $aServerVer Then
		$aServerVer = "public"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerVer, "
	EndIf
	If $aServerVer = "0" Then $aServerVer = "public" ; Remove after a while
	If $aServerVer = "1" Then $aServerVer = "latest_experimental" ; Remove after a while
	Global $aSteamDBURL = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=" & $aServerVer
	If $iniCheck = $aServerExtraCMD Then
		$aServerExtraCMD = ""
		$iIniFail += 1
		$iIniError = $iIniError & "ServerExtraCMD, "
	EndIf
	If $iniCheck = $aConfigFile Then
		$aConfigFile = "serverconfig.xml"
		$iIniFail += 1
		$iIniError = $iIniError & "ConfigFile, "
	EndIf
	If $iniCheck = $aWipeServer Then
		$aWipeServer = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "WipeServer, "
	EndIf
	If $iniCheck = $aAppendVerBegin Then
		$aAppendVerBegin = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "AppendVerBegin, "
	EndIf
	If $iniCheck = $aServerOnlinePlayerYN Then
		$aServerOnlinePlayerYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerOnlinePLayerYN, "
	EndIf
	If $iniCheck = $aServerOnlinePlayerSec Then
		$aServerOnlinePlayerSec = "60"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerOnlinePlayerSec, "
	ElseIf $aServerOnlinePlayerSec < 30 Then
		$aServerOnlinePlayerSec = 30
	ElseIf $aServerOnlinePlayerSec > 600 Then
		$aServerOnlinePlayerSec = 600
	EndIf
	If $iniCheck = $aAppendVerEnd Then
		$aAppendVerEnd = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "AppendVerEnd, "
	EndIf
	If $iniCheck = $aAppendVerShort Then
		$aAppendVerShort = "long"
		$iIniFail += 1
		$iIniError = $iIniError & "AppendVerShort, "
	EndIf
	If $iniCheck = $aServerIP Then
		$aServerIP = "192.168.1.10"
		$iIniFail += 1
		$iIniError = $iIniError & "AppendVerShort, "
	EndIf
	If $iniCheck = $aValidate Then
		$aValidate = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "Validate, "
	EndIf
	If $iniCheck = $aTelnetStayConnectedYN Then
		$aTelnetStayConnectedYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetStayConnectedYN, "
	EndIf
	If $iniCheck = $aUpdateSource Then
		$aUpdateSource = "0"
		$iIniFail += 1
		$iIniError = $iIniError & "UpdateSource, "
	EndIf
	If $iniCheck = $aRemoteRestartUse Then
		$aRemoteRestartUse = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "RemoteRestartUse, "
	EndIf
	If $iniCheck = $aRemoteRestartPort Then
		$aRemoteRestartPort = "57520"
		$iIniFail += 1
		$iIniError = $iIniError & "RemoteRestartPort, "
	EndIf
	If $iniCheck = $aRemoteRestartKey Then
		$aRemoteRestartKey = "restart"
		$iIniFail += 1
		$iIniError = $iIniError & "RemoteRestartKey, "
	EndIf
	If $iniCheck = $aRemoteRestartCode Then
		$aRemoteRestartCode = "password"
		$iIniFail += 1
		$iIniError = $iIniError & "RemoteRestartCode, "
	EndIf
	;	If $iniCheck = $aUsePuttytel Then
	;		$aUsePuttytel = "yes"
	;		$iIniFail += 1
	;		$iIniError = $iIniError & "UsePuttytel, "
	;	EndIf
	If $iniCheck = $aQueryYN Then
		$aQueryYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "QueryYN, "
	EndIf
	If $iniCheck = $aQueryCheckSec Then
		$aQueryCheckSec = "180"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetCheckSec, "
	ElseIf $aQueryCheckSec < 30 Then
		$aQueryCheckSec = 30
		LogWrite(" [Notice] Query Port server-is-alive check interval was out of range. Interval set to: " & $aQueryCheckSec & " seconds.")
	ElseIf $aQueryCheckSec > 900 Then
		$aQueryCheckSec = 900
		LogWrite(" [Notice] Query Port server-is-alive check interval was out of range. Interval set to: " & $aQueryCheckSec & " seconds.")
	EndIf
	If $iniCheck = $aQueryIP Then
		$aQueryIP = "127.0.0.1"
		$iIniFail += 1
		$iIniError = $iIniError & "QueryIP, "
	EndIf
	If $iniCheck = $aTelnetIP Then
		$aTelnetIP = "127.0.0.1"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetIP, "
	EndIf
	If $iniCheck = $aTelnetCheckYN Then
		$aTelnetCheckYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetCheckYN, "
	EndIf
	If $iniCheck = $aTelnetCheckSec Then
		$aTelnetCheckSec = "180"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetCheckSec, "
	ElseIf $aTelnetCheckSec < 30 Then
		$aTelnetCheckSec = 30
		LogWrite(" [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aTelnetCheckSec & " seconds.")
	ElseIf $aTelnetCheckSec > 900 Then
		$aTelnetCheckSec = 900
		LogWrite(" [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aTelnetCheckSec & " seconds.")
	EndIf
	If $iniCheck = $aWatchdogWaitServerUpdate Then
		$aWatchdogWaitServerUpdate = "60"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetDelayAfterUpdate, "
	ElseIf $aWatchdogWaitServerUpdate < 1 Then
		$aWatchdogWaitServerUpdate = 1
		LogWrite(" [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aWatchdogWaitServerUpdate & " minutes.")
	ElseIf $aWatchdogWaitServerUpdate > 360 Then
		$aWatchdogWaitServerUpdate = 360
		LogWrite(" [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aWatchdogWaitServerUpdate & " minutes.")
	EndIf
	If $iniCheck = $aWatchdogWaitServerStart Then
		$aWatchdogWaitServerStart = "5"
		$iIniFail += 1
		$iIniError = $iIniError & "WatchdogWaitServerStart, "
	ElseIf $aWatchdogWaitServerStart < 1 Then
		$aWatchdogWaitServerStart = 1
		LogWrite(" [Watchdog] Watchdog wait for server to start was out of range. Interval set to: " & $aWatchdogWaitServerStart & " minutes.")
	ElseIf $aWatchdogWaitServerStart > 60 Then
		$aWatchdogWaitServerStart = 60
		LogWrite(" [Watchdog] Watchdog wait for server to start was out of range. Interval set to: " & $aWatchdogWaitServerStart & " minutes.")
	EndIf
	If $iniCheck = $aWatchdogAttemptsBeforeRestart Then
		$aWatchdogWaitServerStart = "3"
		$iIniFail += 1
		$iIniError = $iIniError & "WatchdogAttemptsBeforeRestart, "
	ElseIf $aWatchdogAttemptsBeforeRestart < 1 Then
		$aWatchdogAttemptsBeforeRestart = 1
		LogWrite(" [Watchdog] Watchdog Attempts Before Restart was out of range. Attempts set to: " & $aWatchdogAttemptsBeforeRestart & ".")
	ElseIf $aWatchdogAttemptsBeforeRestart > 10 Then
		$aWatchdogAttemptsBeforeRestart = 10
		LogWrite(" [Watchdog] Watchdog Attempts Before Restart was out of range. Attempts set to: " & $aWatchdogAttemptsBeforeRestart & ".")
	EndIf
	If $iniCheck = $sObfuscatePass Then
		$sObfuscatePass = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ObfuscatePass ,"
	EndIf
	If $iniCheck = $aCheckForUpdate Then
		$aCheckForUpdate = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "CheckForUpdate, "
	EndIf
	If $iniCheck = $aUpdateCheckInterval Then
		$aUpdateCheckInterval = "15"
		$iIniFail += 1
		$iIniError = $iIniError & "UpdateCheckInterval, "
	ElseIf $aUpdateCheckInterval < 5 Then
		$aUpdateCheckInterval = 5
		LogWrite(" [Notice] Update check interval was out of range. Interval set to: " & $aUpdateCheckInterval & " minutes.")
	EndIf
	If $iniCheck = $aRestartDaily Then
		$aRestartDaily = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "RestartDaily, "
	EndIf
	If $iniCheck = $aRestartDays Then
		$aRestartDays = "0"
		$iIniFail += 1
		$iIniError = $iIniError & "RestartDays, "
	EndIf
	If $iniCheck = $bRestartHours Then
		$bRestartHours = "04,16"
		$iIniFail += 1
		$iIniError = $iIniError & "RestartHours, "
	EndIf
	If $iniCheck = $bRestartMin Then
		$bRestartMin = "00"
		$iIniFail += 1
		$iIniError = $iIniError & "RestartMin, "
	EndIf
	If $iniCheck = $aExMemAmt Then
		$aExMemAmt = "6000000000"
		$iIniFail += 1
		$iIniError = $iIniError & "$aExMemAmt, "
	EndIf
	If $iniCheck = $aBackupYN Then
		$aBackupYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupYN, "
	EndIf
	If $iniCheck = $aBackupDays Then
		$aBackupDays = "0"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupDays, "
	EndIf
	If $iniCheck = $aBackupHours Then
		$aBackupHours = "00,06,12,18"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupHours, "
	EndIf
	If $iniCheck = $aBackupMin Then
		$aBackupMin = "00"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupMin, "
	EndIf
	If $iniCheck = $aBackupFull Then
		$aBackupFull = "10"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupFull, "
	EndIf
	If $iniCheck = $aBackupOutputFolder Then
		$aBackupOutputFolder = @ScriptDir & "\Backups"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupOutputFolder, "
	EndIf
	If $iniCheck = $aBackupAddedFolders Then
		$aBackupAddedFolders = ""
		$iIniFail += 1
		$iIniError = $iIniError & "BackupAddedFolders, "
	EndIf
	If $iniCheck = $aBackupNumberToKeep Then
		$aBackupNumberToKeep = "56"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupDeleteOlder, "
	ElseIf $aBackupNumberToKeep < 0 Then
		$aBackupNumberToKeep = 1
	ElseIf $aBackupNumberToKeep > 999 Then
		$aBackupNumberToKeep = 999
	EndIf
	If $iniCheck = $aBackupTimeoutSec Then
		$aBackupTimeoutSec = "600"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupTimeoutSec, "
	ElseIf $aBackupTimeoutSec < 30 Then
		$aBackupTimeoutSec = 30
	ElseIf $aBackupTimeoutSec > 999 Then
		$aBackupTimeoutSec = 999
	EndIf
	If $iniCheck = $aBackupCommandLine Then
		$aBackupCommandLine = "a -spf -r -tzip -ssw"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupCommandLine, "
	EndIf
	If $iniCheck = $aBackupSendDiscordYN Then
		$aBackupSendDiscordYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupSendDiscordYN, "
	EndIf
	If $iniCheck = $aBackupSendTwitchYN Then
		$aBackupSendTwitchYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "BackupSendTwitchYN, "
	EndIf
	If $iniCheck = $aBackupInGame Then
		$aBackupInGame = "Server backup started."
		$iIniFail += 1
		$iIniError = $iIniError & "BackupInGame, "
	EndIf
	If $iniCheck = $aBackupDiscord Then
		$aBackupDiscord = "Server backup started."
		$iIniFail += 1
		$iIniError = $iIniError & "BackupDiscord, "
	EndIf
	If $iniCheck = $aBackupTwitch Then
		$aBackupTwitch = "Server backup started."
		$iIniFail += 1
		$iIniError = $iIniError & "BackupTwitch, "
	EndIf
	If $iniCheck = $aExMemRestart Then
		$aExMemRestart = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExMemRestart, "
	EndIf
	If $iniCheck = $aLogQuantity Then
		$aLogQuantity = "30"
		$iIniFail += 1
		$iIniError = $iIniError & "LogQuantity, "
	EndIf
	If $iniCheck = $sAnnounceNotifyTime1 Then
		$sAnnounceNotifyTime1 = "1,2,5,10,15"
		$iIniFail += 1
		$iIniError = $iIniError & "AnnounceNotifyTime1, "
	EndIf
	If $iniCheck = $sAnnounceNotifyTime2 Then
		$sAnnounceNotifyTime2 = "1,2,5,10"
		$iIniFail += 1
		$iIniError = $iIniError & "AnnounceNotifyTime2, "
	EndIf
	If $iniCheck = $sAnnounceNotifyTime3 Then
		$sAnnounceNotifyTime3 = "1,3"
		$iIniFail += 1
		$iIniError = $iIniError & "AnnounceNotifyTime3, "
	EndIf
	If $iniCheck = $sInGameDailyMessage Then
		$sInGameDailyMessage = "Daily server restart begins in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "InGameDailyMessage, "
	EndIf
	If $iniCheck = $sInGameUpdateMessage Then
		$sInGameUpdateMessage = "Fun Pimps have released a new update. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "InGameUpdateMessage, "
	EndIf
	If $iniCheck = $sInGameRemoteRestartMessage Then
		$sInGameRemoteRestartMessage = "Admin has requested a server reboot. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "InGameRemoteRestartMessage, "
	EndIf

	If $iniCheck = $aServerDiscord1URL Then
		$aServerDiscord1URL = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord1URL, "
	EndIf
	If $iniCheck = $aServerDiscord1BotName Then
		$aServerDiscord1BotName = "7DTD Bot"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord1BotName, "
	EndIf
	If $iniCheck = $aServerDiscord1Avatar Then
		$aServerDiscord1Avatar = ""
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord1Avatar, "
	EndIf
	If $iniCheck = $aServerDiscord1TTSYN Then
		$aServerDiscord1TTSYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord1TTSYN, "
	EndIf
	If $iniCheck = $aServerDiscord2URL Then
		$aServerDiscord2URL = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord2URL, "
	EndIf
	If $iniCheck = $aServerDiscord2BotName Then
		$aServerDiscord2BotName = "7DTD Bot"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord2BotName, "
	EndIf
	If $iniCheck = $aServerDiscord2Avatar Then
		$aServerDiscord2Avatar = ""
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord2Avatar, "
	EndIf
	If $iniCheck = $aServerDiscord2TTSYN Then
		$aServerDiscord2TTSYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord2TTSYN, "
	EndIf
	If $iniCheck = $aServerDiscord3URL Then
		$aServerDiscord3URL = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord3URL, "
	EndIf
	If $iniCheck = $aServerDiscord3BotName Then
		$aServerDiscord3BotName = "7DTD Bot"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord3BotName, "
	EndIf
	If $iniCheck = $aServerDiscord3Avatar Then
		$aServerDiscord3Avatar = ""
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord3Avatar, "
	EndIf
	If $iniCheck = $aServerDiscord3TTSYN Then
		$aServerDiscord3TTSYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord3TTSYN, "
	EndIf
	If $iniCheck = $aServerDiscord4URL Then
		$aServerDiscord4URL = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord4URL, "
	EndIf
	If $iniCheck = $aServerDiscord4BotName Then
		$aServerDiscord4BotName = "7DTD Bot"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord4BotName, "
	EndIf
	If $iniCheck = $aServerDiscord4Avatar Then
		$aServerDiscord4Avatar = ""
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord4Avatar, "
	EndIf
	If $iniCheck = $aServerDiscord4TTSYN Then
		$aServerDiscord4TTSYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscord4TTSYN, "
	EndIf
	If $iniCheck = $aServerDiscordWHSelStatus Then
		$aServerDiscordWHSelStatus = "1"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscordWHSelStatus, "
	EndIf
	If $iniCheck = $aServerDiscordWHSelPlayers Then
		$aServerDiscordWHSelPlayers = "2"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscordWHSelPlayers, "
	EndIf
	If $iniCheck = $aServerDiscordWHSelChat Then
		$aServerDiscordWHSelChat = "3"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscordWHSelChat, "
	EndIf
	If $iniCheck = $aServerDiscordWHSelDie Then
		$aServerDiscordWHSelDie = "3"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerDiscordWHSelDie, "
	EndIf
	If $iniCheck = $sDiscordDailyMessage Then
		$sDiscordDailyMessage = "Daily server restart begins in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordDailyMessage, "
	EndIf
	If $iniCheck = $sDiscordUpdateMessage Then
		$sDiscordUpdateMessage = "Fun Pimps have released a new update. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordUpdateMessage, "
	EndIf
	If $iniCheck = $sDiscordRemoteRestartMessage Then
		$sDiscordRemoteRestartMessage = "Admin has requested a server reboot. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordRemoteRestartMessage, "
	EndIf
	If $iniCheck = $sDiscordServersUpMessage Then
		$sDiscordServersUpMessage = $aGameName1 & " server is online and ready for connection."
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordServersUpMessage, "
	EndIf
	If $iniCheck = $sTwitchDailyMessage Then
		$sTwitchDailyMessage = "Daily server restart begins in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "TwitchDailyMessage, "
	EndIf
	If $iniCheck = $sTwitchUpdateMessage Then
		$sTwitchUpdateMessage = "Fun Pimps have released a new update. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "TwitchUpdateMessage, "
	EndIf
	If $iniCheck = $sTwitchRemoteRestartMessage Then
		$sTwitchRemoteRestartMessage = "Admin has requested a server reboot. Server is rebooting in \m minute(s)."
		$iIniFail += 1
		$iIniError = $iIniError & "TwitchRemoteRestartMessage, "
	EndIf
	If $iniCheck = $sInGameAnnounce Then
		$sInGameAnnounce = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "InGameAnnounce, "
	EndIf
	If $iniCheck = $sUseDiscordBotDaily Then
		$sUseDiscordBotDaily = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotDaily, "
	EndIf
	If $iniCheck = $sUseDiscordBotUpdate Then
		$sUseDiscordBotUpdate = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotUpdate, "
	EndIf
	If $iniCheck = $sUseDiscordBotRemoteRestart Then
		$sUseDiscordBotRemoteRestart = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotRemoteRestart, "
	EndIf
	If $iniCheck = $sUseDiscordBotServersUpYN Then
		$sUseDiscordBotServersUpYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotSereversUpYN, "
	EndIf
	If $iniCheck = $sUseDiscordBotPlayerChangeYN Then
		$sUseDiscordBotPlayerChangeYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotPlayerChangeYN, "
	EndIf
	If $iniCheck = $sUseDiscordBotPlayerChatYN Then
		$sUseDiscordBotPlayerChatYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotPlayerChatYN, "
	EndIf
	If $iniCheck = $sUseDiscordBotPlayerDiedYN Then
		$sUseDiscordBotPlayerDiedYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotPlayerDiedYN, "
	EndIf
	If $iniCheck = $sUseDiscordBotFirstAnnouncement Then
		$sUseDiscordBotFirstAnnouncement = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotFirstAnnouncement, "
	EndIf
	If $iniCheck = $sDiscordPlayersMsg Then
		$sDiscordPlayersMsg = '""Players Online: **\o / \m**  Game Time: **\t**  Next Horde: **\h days**\j\l\a""'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayersMsg, "
	EndIf
	If $iniCheck = $sDiscordPlayerJoinMsg Then
		$sDiscordPlayerJoinMsg = '""  Joined: *\p*  ""'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayerJoinedMsg, "
	EndIf
	If $iniCheck = $sDiscordPlayerLeftMsg Then
		$sDiscordPlayerLeftMsg = '"  Left: *\p*  "'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayerLeftMsg, "
	EndIf
	If $iniCheck = $sDiscordPlayerOnlineMsg Then
		$sDiscordPlayerOnlineMsg = '""\nOnline Players: **\p**""'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayerOnlineMsg, "
	EndIf
	If $iniCheck = $sDiscordPlayerDiedMsg Then
		$sDiscordPlayerDiedMsg = '""*\p died.*""'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayerDiedMsg, "
	EndIf
	If $iniCheck = $sDiscordPlayerChatMsg Then
		$sDiscordPlayerChatMsg = '""[Chat] **\p**: \m""'
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayerChatMsg, "
	EndIf
	If $iniCheck = $sUseTwitchBotDaily Then
		$sUseTwitchBotDaily = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseTwitchBotDaily, "
	EndIf
	If $iniCheck = $sUseTwitchBotUpdate Then
		$sUseTwitchBotUpdate = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseTwitchBotUpdate, "
	EndIf
	If $iniCheck = $sUseTwitchBotRemoteRestart Then
		$sUseTwitchBotRemoteRestart = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseTwitchBotRemoteRestart, "
	EndIf
	If $iniCheck = $sUseTwitchFirstAnnouncement Then
		$sUseTwitchFirstAnnouncement = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseTwitchFirstAnnouncement, "
	EndIf
	If $iniCheck = $sTwitchNick Then
		$sTwitchNick = "twitchbotusername"
		$iIniFail += 1
		$iIniError = $iIniError & "TwitchNick, "
	EndIf
	If $iniCheck = $sChatOAuth Then
		$sChatOAuth = "oauth:1234(Generate OAuth Token Here: https://twitchapps.com/tmi)"
		$iIniFail += 1
		$iIniError = $iIniError & "ChatOAuth, "
	EndIf
	If $iniCheck = $sTwitchChannels Then
		$sTwitchChannels = "channel1,channel2,channel3"
		$iIniFail += 1
		$iIniError = $iIniError & "TwitchChannels, "
	EndIf
	If $iniCheck = $aExecuteExternalScript Then
		$aExecuteExternalScript = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExecuteExternalScript, "
	EndIf
	If $iniCheck = $aExternalScriptDir Then
		$aExternalScriptDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptDir, "
	EndIf
	If $iniCheck = $aExternalScriptName Then
		$aExternalScriptName = "beforesteamcmd.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptName, "
	EndIf
	If $iniCheck = $aExternalScriptValidateYN Then
		$aExternalScriptValidateYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptValidateYN, "
	EndIf
	If $iniCheck = $aExternalScriptValidateDir Then
		$aExternalScriptValidateDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptValidateDir, "
	EndIf
	If $iniCheck = $aExternalScriptValidateName Then
		$aExternalScriptValidateName = "aftersteamcmd.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptValidateName, "
	EndIf
	If $iniCheck = $aExternalScriptUpdateYN Then
		$aExternalScriptUpdateYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptUpdateYN, "
	EndIf
	If $iniCheck = $aExternalScriptUpdateDir Then
		$aExternalScriptUpdateDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptUpdateDir, "
	EndIf
	If $iniCheck = $aExternalScriptUpdateFileName Then
		$aExternalScriptUpdateFileName = "update.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptUpdateFileName, "
	EndIf
	If $iniCheck = $aExternalScriptDailyYN Then
		$aExternalScriptDailyYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptDailyYN, "
	EndIf
	If $iniCheck = $aExternalScriptDailyDir Then
		$aExternalScriptDailyDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptDailyDir, "
	EndIf
	If $iniCheck = $aExternalScriptDailyFileName Then
		$aExternalScriptDailyFileName = "daily.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptDailyFileName, "
	EndIf
	If $iniCheck = $aExternalScriptAnnounceYN Then
		$aExternalScriptAnnounceYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptAnnounceYN, "
	EndIf
	If $iniCheck = $aExternalScriptAnnounceDir Then
		$aExternalScriptAnnounceDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptAnnounceDir, "
	EndIf
	If $iniCheck = $aExternalScriptAnnounceFileName Then
		$aExternalScriptAnnounceFileName = "firstannounce.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptAnnounceFileName, "
	EndIf
	If $iniCheck = $aExternalScriptRemoteYN Then
		$aExternalScriptRemoteYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptRemoteYN, "
	EndIf
	If $iniCheck = $aExternalScriptRemoteDir Then
		$aExternalScriptRemoteDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptRemoteDir, "
	EndIf
	If $iniCheck = $aExternalScriptRemoteFileName Then
		$aExternalScriptRemoteFileName = "remoterestart.bat"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptRemoteFileName, "
	EndIf
	If $iniCheck = $aExternalScriptHideYN Then
		$aExternalScriptHideYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "ExternalScriptHideYN, "
	EndIf
	If $iniCheck = $aUpdateUtil Then
		$aUpdateUtil = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UpdateUtil, "
		;		$iIniError = $iIniError & "UpdateUtil, "
	EndIf
	If $iniCheck = $aUtilBetaYN Then
		$aUtilBetaYN = "1"
		$iIniFail += 1
		$iIniError = $iIniError & "UtilBetaYN, "
	EndIf
	If $iniCheck = $aFPAutoUpdateYN Then
		$aFPAutoUpdateYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "FPAutoUpdateYN, "
	EndIf
	;	If $iniCheck = $aFPAppendFPSettingsYN Then
	;		$aFPAppendFPSettingsYN = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerName Then
	;		$aFPServerName = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerPort Then
	;		$aFPServerPort = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerPassword Then
	;		$aFPServerPassword = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPTelnetPort Then
	;		$aFPTelnetPort = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPTelnetPassword Then
	;		$aFPTelnetPassword = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerLoginConfirmationText Then
	;		$aFPServerLoginConfirmationText = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerMaxPlayerCount Then
	;		$aFPServerMaxPlayerCount = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerDescription Then
	;		$aFPServerDescription = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerWebsiteURL Then
	;		$aFPServerWebsiteURL = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPServerDisabledNetworkProtocols Then
	;		$aFPServerDisabledNetworkProtocols = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPGameWorld Then
	;		$aFPGameWorld = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPWorldGenSeed Then
	;		$aFPWorldGenSeed = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPWorldGenSize Then
	;		$aFPWorldGenSize = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPGameName Then
	;		$aFPGameName = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPGameDifficulty Then
	;		$aFPGameDifficulty = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPAdminFileName Then
	;		$aFPAdminFileName = "no"
	;		$iIniFail += 1
	;	EndIf
	;	If $iniCheck = $aFPDropOnDeath Then
	;		$aFPDropOnDeath = "no"
	;		$iIniFail += 1
	;	EndIf

;~ 	If ($aAppendVerBegin = "yes") Or ($aAppendVerEnd = "yes") Then
;~ 		$aRebootMe = "yes"
;~ 		$aServerRebootReason = $aServerRebootReason & "Append version to server name." & @CRLF
;~ 	EndIf
;~ 	If $aWipeServer = "yes" Then
;~ 		$aServerRebootReason = $aServerRebootReason & "Change save folder (server wipe)." & @CRLF
;~ 		$aRebootMe = "yes"
;~ 	EndIf
	LogWrite(" [Config] Importing settings from 7dtdServerUtil.ini.")

	$aServerDirLocal = RemoveInvalidCharacters($aServerDirLocal)
	$aServerDirLocal = RemoveTrailingSlash($aServerDirLocal)
	$aSteamCMDDir = RemoveInvalidCharacters($aSteamCMDDir)
	$aSteamCMDDir = RemoveTrailingSlash($aSteamCMDDir)
	$aConfigFile = RemoveInvalidCharacters($aConfigFile)
	$aExternalScriptDir = RemoveInvalidCharacters($aExternalScriptDir)
	$aExternalScriptDir = RemoveTrailingSlash($aExternalScriptDir)
	$aExternalScriptName = RemoveInvalidCharacters($aExternalScriptName)
	$aExternalScriptValidateDir = RemoveInvalidCharacters($aExternalScriptValidateDir)
	$aExternalScriptValidateDir = RemoveTrailingSlash($aExternalScriptValidateDir)
	$aExternalScriptValidateName = RemoveInvalidCharacters($aExternalScriptValidateName)
	$aExternalScriptUpdateDir = RemoveInvalidCharacters($aExternalScriptUpdateDir)
	$aExternalScriptUpdateDir = RemoveTrailingSlash($aExternalScriptUpdateDir)
	$aExternalScriptUpdateFileName = RemoveInvalidCharacters($aExternalScriptUpdateFileName)
	$aExternalScriptAnnounceDir = RemoveInvalidCharacters($aExternalScriptAnnounceDir)
	$aExternalScriptAnnounceDir = RemoveTrailingSlash($aExternalScriptAnnounceDir)
	$aExternalScriptAnnounceFileName = RemoveInvalidCharacters($aExternalScriptAnnounceFileName)
	$aExternalScriptDailyDir = RemoveInvalidCharacters($aExternalScriptDailyDir)
	$aExternalScriptDailyDir = RemoveTrailingSlash($aExternalScriptDailyDir)
	$aExternalScriptDailyFileName = RemoveInvalidCharacters($aExternalScriptDailyFileName)

	If $sUseDiscordBotRemoteRestart = "yes" Or $sUseDiscordBotDaily = "yes" Or $sUseDiscordBotUpdate = "yes" Or $sUseTwitchBotRemoteRestart = "yes" Or $sUseTwitchBotDaily = "yes" Or $sUseTwitchBotUpdate = "yes" Or $sInGameAnnounce = "yes" Then
		Global $aDailyMsgInGame = AnnounceReplaceTime($sAnnounceNotifyTime1, $sInGameDailyMessage)
		Global $aDailyMsgDiscord = AnnounceReplaceTime($sAnnounceNotifyTime1, $sDiscordDailyMessage)
		Global $aDailyMsgTwitch = AnnounceReplaceTime($sAnnounceNotifyTime1, $sTwitchDailyMessage)
		Global $aDailyTime = StringSplit($sAnnounceNotifyTime1, ",")
		Global $aDailyCnt = Int($aDailyTime[0])
		Global $aUpdateMsgInGame = AnnounceReplaceTime($sAnnounceNotifyTime2, $sInGameUpdateMessage)
		Global $aUpdateMsgDiscord = AnnounceReplaceTime($sAnnounceNotifyTime2, $sDiscordUpdateMessage)
		Global $aUpdateMsgTwitch = AnnounceReplaceTime($sAnnounceNotifyTime2, $sTwitchUpdateMessage)
		Global $aUpdateTime = StringSplit($sAnnounceNotifyTime2, ",")
		Global $aUpdateCnt = Int($aUpdateTime[0])
		Global $aRemoteMsgInGame = AnnounceReplaceTime($sAnnounceNotifyTime3, $sInGameRemoteRestartMessage)
		Global $aRemoteMsgDiscord = AnnounceReplaceTime($sAnnounceNotifyTime3, $sDiscordRemoteRestartMessage)
		Global $aRemoteMsgTwitch = AnnounceReplaceTime($sAnnounceNotifyTime3, $sTwitchRemoteRestartMessage)
		Global $aRemoteTime = StringSplit($sAnnounceNotifyTime3, ",")
		Global $aRemoteCnt = Int($aRemoteTime[0])
		Global $aDelayShutdownTime = Int($aDailyTime[$aDailyCnt])
		DailyRestartOffset($bRestartHours, $bRestartMin, $aDelayShutdownTime)
	Else
		Global $aDelayShutdownTime = 0
	EndIf
	LogWrite("", " . . . Server Folder = " & $aServerDirLocal)
	LogWrite("", " . . . SteamCMD Folder = " & $aSteamCMDDir)
	_SteamCMDCommandlineRead()
	If $aSteamUpdateCommandline = "" Then _SteamCMDCreate()
	If FileExists($aBackupOutputFolder) = 0 Then DirCreate($aBackupOutputFolder)
	If $iIniFail > 0 Then
		iniFileCheck($aIniFile, $iIniFail, $iIniError)
	EndIf
EndFunc   ;==>ReadUini
Func _RestartUtil($fQuickRebootTF = True, $tAdmin = False)     ; Thanks Yashied!  https://www.autoitscript.com/forum/topic/111215-restart-udf/
	Local $Pid
	Local $xArray[13]
	$xArray[0] = '@echo off'
	$xArray[1] = 'echo --------------------------------------------'
	$xArray[2] = 'echo  Waiting 5 seconds for shutdown to complete'
	$xArray[3] = 'echo --------------------------------------------'
	$xArray[4] = 'timeout 5'
	$xArray[5] = 'start "Starting ' & $aUtilName & '" "' & $aServerBatchFile & '"'
	$xArray[6] = 'echo --------------------------------------------'
	$xArray[7] = 'echo  AtlasServerUpdateUtility started . . .'
	$xArray[8] = 'echo --------------------------------------------'
	$xArray[9] = 'timeout 3'
	$xArray[10] = 'exit'
	Local $tBatFile = $aFolderTemp & $aUtilName & "_Delay_Restart.bat"
	FileDelete($tBatFile)
	_FileWriteFromArray($tBatFile, $xArray)
	If @Compiled Then
		If $tAdmin Then
			ShellExecute($tBatFile, "", "", "runas")
		Else
			$Pid = Run($tBatFile, "", @SW_HIDE)
		EndIf
	Else
		If $tAdmin Then
			_Splash("Run as administrator selected", 2000)
			ShellExecute(@AutoItExe & ' "' & @ScriptFullPath & '" ' & $CmdLineRaw, "", "", "runas")
		Else
			$Pid = Run(@AutoItExe & ' "' & @ScriptFullPath & '" ' & $CmdLineRaw, @ScriptDir, Default, 1)
		EndIf
		If @error Then
			Return SetError(@error, 0, 0)
		EndIf
		StdinWrite($Pid, @AutoItPID)
	EndIf
	Sleep(50)
	_ExitUtil()
EndFunc   ;==>_RestartUtil
Func _ExitUtil()
	_PlinkDisconnect()
	Exit
EndFunc   ;==>_ExitUtil

Func iniFileCheck($aIniFile, $iIniFail, $iIniError)
	If FileExists($aIniFile) Then
		Local $aMyDate, $aMyTime
		_DateTimeSplit(_NowCalc(), $aMyDate, $aMyTime)
		Local $iniDate = StringFormat("%04i.%02i.%02i.%02i%02i", $aMyDate[1], $aMyDate[2], $aMyDate[3], $aMyTime[1], $aMyTime[2])
		FileMove($aIniFile, $aIniFile & "_" & $iniDate & ".bak", 1)
		UpdateIni($aIniFile)
		;		FileWriteLine($aIniFailFile, _NowCalc() & " INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		Local $iIniErrorCRLF = StringRegExpReplace($iIniError, ", ", @CRLF & @TAB)
		FileWriteLine($aIniFailFile, _NowCalc() & @CRLF & " ---------- Parameters missing or changed ----------" & @CRLF & @CRLF & @TAB & $iIniErrorCRLF)
		LogWrite(" INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		LogWrite(" INI MISMATCH: Parameters missing: " & $iIniFail)
		SplashOff()
		MsgBox(4096, "INI MISMATCH", "INI FILE WAS UPDATED." & @CRLF & "Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini:" & @CRLF & @CRLF & $iIniError & @CRLF & @CRLF & _
				"Backup created and all existing settings transfered to new INI." & @CRLF & @CRLF & "Click OK to open config." & @CRLF & @CRLF & "File created: ___INI_FAIL_VARIABLES___.txt")
		ShellExecute($aIniFailFile)
		_PlinkDisconnect()
		Global $sConfigPath = $aServerDirLocal & "\" & $aConfigFile
		GUI_Config()
;~ 		_ExitUtil()
	Else
		UpdateIni($aIniFile)
		SplashOff()
		MsgBox(4096, "Default INI File Created", "Please Modify Default Values and Restart Program." & @CRLF & @CRLF & "IF NEW DEDICATED SERVER INSTALL:" & @CRLF & " - Once the server is installed and running," & @CRLF & _
				"Rt-Click on " & $aUtilName & " icon and shutdown server." & @CRLF & " - Then modify the server files and restart this utility.")
		LogWrite(" Default INI File Created . . Please Modify Default Values and Restart Program.")
		_ExitUtil()
	EndIf
EndFunc   ;==>iniFileCheck

Func UpdateIni($aIniFile)
	FileDelete($aIniFile)
	FileWriteLine($aIniFile, "[ --------------- " & StringUpper($aUtilName) & " INFORMATION --------------- ]")
	FileWriteLine($aIniFile, "Author   :  Phoenix125")
	FileWriteLine($aIniFile, "Version  :  " & $aUtilityVer)
	FileWriteLine($aIniFile, "Website  :  http://www.Phoenix125.com")
	FileWriteLine($aIniFile, "Discord  :  http://discord.gg/EU7pzPs")
	FileWriteLine($aIniFile, "Forum    :  https://phoenix125.createaforum.com/index.php")
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $aServerDirLocal)
	;	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config file (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", $aConfigFile)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $aConfigFile)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $aServerExtraCMD)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $aServerIP)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $aSteamCMDDir)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Username (optional) ###", $aSteamCMDUserName)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Password (optional) ###", $aSteamCMDPassword)
;~ 	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (See note below) ###", $aSteamExtraCMD)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD commandline (caution: overwrites all settings above) Write between lines below ###", "(Write between lines below)")
	FileWriteLine($aIniFile, '<--- BEGIN SteamCMD CODE --->')
	FileWriteLine($aIniFile, $aSteamUpdateCommandline)
	FileWriteLine($aIniFile, '<--- END SteamCMD CODE --->')
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $aServerOnlinePlayerYN)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $aServerOnlinePlayerSec)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $aWipeServer)
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $aAppendVerBegin)
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $aAppendVerEnd)
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $aAppendVerShort)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server updated to allow map generation (1-360) ###", $aWatchdogWaitServerUpdate)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server started to allow server to come online (1-60) ###", $aWatchdogWaitServerStart)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", $aWatchdogAttemptsBeforeRestart)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Use Query Port to check if server is alive? (yes/no) ###", $aQueryYN)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aQueryIP)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query Port check interval in seconds (30-900) ###", $aQueryCheckSec)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Use telnet to check if server is alive? (yes/no) ###", $aTelnetCheckYN)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aTelnetIP)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet check interval in seconds (30-900) ###", $aTelnetCheckSec)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $aExMemRestart)
	IniWrite($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $aExMemAmt)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $aRemoteRestartUse)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $aRemoteRestartPort)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $aRemoteRestartKey)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $aRemoteRestartCode)
	FileWriteLine($aIniFile, "(Usage example: http://192.168.1.10:57520/?restart=password)")
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $aCheckForUpdate)
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $aUpdateCheckInterval)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Use scheduled backups? (yes/no) ###", $aBackupYN)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aBackupDays)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup hours (comma separated 00-23 ex.04,16) ###", $aBackupHours)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup minute (00-59) ###", $aBackupMin)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Full " & $aGameName1 & " and Util folder backup every __ backups (0 to disable)(0-99) ###", $aBackupFull)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Additional backup folders / files (comma separated. Folders add \ at end. ex. C:\Atlas\,D:\Atlas Server\) ###", $aBackupAddedFolders)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Output folder ###", $aBackupOutputFolder)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Number of backups to keep (1-999) ###", $aBackupNumberToKeep)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Max time in seconds to wait for backup to complete (30-999) ###", $aBackupTimeoutSec)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "7zip backup additional command line parameters (Default: a -spf -r -tzip -ssw) ###", $aBackupCommandLine)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Send Discord announcement when backup initiated (yes/no) ###", $aBackupSendDiscordYN)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Send Twitch announcement when backup initiated (yes/no) ###", $aBackupSendTwitchYN)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "In-Game announcement when backup initiated (Leave blank to disable) ###", $aBackupInGame)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Discord announcement when backup initiated ###", $aBackupDiscord)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Twitch announcement when backup initiated ###", $aBackupTwitch)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $aRestartDaily)
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aRestartDays)
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $bRestartHours)
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $bRestartMin)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $sAnnounceNotifyTime1)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $sAnnounceNotifyTime2)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $sAnnounceNotifyTime3)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $sInGameAnnounce)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sInGameDailyMessage)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sInGameUpdateMessage)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sInGameRemoteRestartMessage)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Webhook URL ###", $aServerDiscord1URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Bot Name (optional) ###", $aServerDiscord1BotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Avatar URL (optional) ###", $aServerDiscord1Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Use TTS (optional) (yes/no) ###", $aServerDiscord1TTSYN)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Webhook URL ###", $aServerDiscord2URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Bot Name (optional) ###", $aServerDiscord2BotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Avatar URL (optional) ###", $aServerDiscord2Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Use TTS (optional) (yes/no) ###", $aServerDiscord2TTSYN)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Webhook URL ###", $aServerDiscord3URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Bot Name (optional) ###", $aServerDiscord3BotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Avatar URL (optional) ###", $aServerDiscord3Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Use TTS (optional) (yes/no) ###", $aServerDiscord3TTSYN)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Webhook URL ###", $aServerDiscord4URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Bot Name (optional) ###", $aServerDiscord4BotName)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Avatar URL (optional) ###", $aServerDiscord4Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Use TTS (optional) (yes/no) ###", $aServerDiscord4TTSYN)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $aServerDiscordWHSelStatus)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $aServerDiscordWHSelPlayers)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $aServerDiscordWHSelChat)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $aServerDiscordWHSelDie)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $sUseDiscordBotDaily)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $sUseDiscordBotUpdate)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $sUseDiscordBotRemoteRestart)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $sUseDiscordBotServersUpYN)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Online Player changes? (yes/no) ###", $sUseDiscordBotPlayerChangeYN)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Player Chat? (yes/no) ###", $sUseDiscordBotPlayerChatYN)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when player dies? (yes/no) ###", $sUseDiscordBotPlayerDiedYN)
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $sUseDiscordBotFirstAnnouncement)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement DAILY (\m - minutes) ###", $sDiscordDailyMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement UPDATES (\m - minutes) ###", $sDiscordUpdateMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sDiscordRemoteRestartMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement when server is back online ###", $sDiscordServersUpMessage)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "__ Online Player message substitutions (\o Online Player Count, \m Max Players, \t Game Time, \h Days to Next Horde, \j Joined Sub-Msg, \l Left Sub-Msn, \a Online Players Sub-Msg) \n Next Line) __", "")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Message (see above for substitutions) ###", $sDiscordPlayersMsg)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Join Player Sub-Message (\p - Player Name(s) of player(s) that joined server, \n Next Line) ###", $sDiscordPlayerJoinMsg)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Left Player Sub-Message (\p - Player Name(s) of player(s) that left server, \n Next Line) ###", $sDiscordPlayerLeftMsg)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Sub-Message (\p - Player Name(s) of player(s) online, \n Next Line) ###", $sDiscordPlayerOnlineMsg)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Died Message (\p - Player Name, \n Next Line) ###", $sDiscordPlayerDiedMsg)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Chat (\p - Player Name, \m Message) ###", $sDiscordPlayerChatMsg)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for DAILY reboot? (yes/no) ###", $sUseTwitchBotDaily)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for UPDATE reboot? (yes/no) ###", $sUseTwitchBotUpdate)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for REMOTE RESTART reboot? (yes/no) ###", $sUseTwitchBotRemoteRestart)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for first announcement only? (reduces bot spam)(yes/no) ###", $sUseTwitchFirstAnnouncement)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sTwitchDailyMessage)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sTwitchUpdateMessage)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sTwitchRemoteRestartMessage)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Nick ###", $sTwitchNick)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "ChatOAuth ###", $sChatOAuth)
	IniWrite($aIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Channels ###", $sTwitchChannels)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Execute external script BEFORE update? (yes/no) ###", $aExecuteExternalScript)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script directory ###", $aExternalScriptDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script filename ###", $aExternalScriptName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no) ###", $aExternalScriptValidateYN)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script directory ###", $aExternalScriptValidateDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script filename ###", $aExternalScriptValidateName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Execute external script for server update restarts? (yes/no) ###", $aExternalScriptUpdateYN)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script directory ###", $aExternalScriptUpdateDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script filename ###", $aExternalScriptUpdateFileName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Execute external script for daily server restarts? (yes/no) ###", $aExternalScriptDailyYN)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script directory ###", $aExternalScriptDailyDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script filename ###", $aExternalScriptDailyFileName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Execute external script when first restart announcement is made? (yes/no) ###", $aExternalScriptAnnounceYN)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script directory ###", $aExternalScriptAnnounceDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script filename ###", $aExternalScriptAnnounceFileName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no) ###", $aExternalScriptRemoteYN)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script directory ###", $aExternalScriptRemoteDir)
	IniWrite($aIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script filename ###", $aExternalScriptRemoteFileName)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $aLogQuantity)
	FileWriteLine($aIniFile, @CRLF)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $aValidate)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Telnet: Stay Connected (Required for chat and death messaging) (yes/no) ###", $aTelnetStayConnectedYN)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $aUpdateSource)
	;	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $aUsePuttytel)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $sObfuscatePass)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $aExternalScriptHideYN)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $aUpdateUtil)
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $aUtilBetaYN)
	FileWriteLine($aIniFile, @CRLF)
	FileWriteLine($aIniFile, "[--------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS ---------------]")
	FileWriteLine($aIniFile, "During updates, The Fun Pimps sometimes make changes to the ServerConfig.xml file, which can cause the server to fail to start when using the old config file.")
	FileWriteLine($aIniFile, "  This section is a best-effort attempt to temporarily adjust to those changes during server updates to keep your server running.")
	;	FileWriteLine($aIniFile, "If YES to either two questions below, this utility will make a backup of your existing serverconfig file (as listed in Game Server Configuration section),)")
	FileWriteLine($aIniFile, "  If automatic import enabled above, this utility will attempt two reboots. If The server fails to boot after the second reboot,")
	FileWriteLine($aIniFile, "  it will backup of your existing serverconfig file (as listed in Game Server Configuration section),")
	FileWriteLine($aIniFile, "  copy the contents from the new ServerConfig.xml, import data from your existing config file, and add this data")
	FileWriteLine($aIniFile, "  to your serverconfig file (as listed above) at the end of the file.")
	FileWriteLine($aIniFile, "Therefore, after an update, it is recommended that you review your config file and make any changes.")
	FileWriteLine($aIniFile, "The following parameters will be imported:")
	FileWriteLine($aIniFile, "  ServerName, ServerPort, ServerPassword, TelnetPort, TelnetPassword, ServerLoginConfirmationText, ServerMaxPlayerCount, ServerDescription,")
	FileWriteLine($aIniFile, "  ServerWebsiteURL,, ServerDisabledNetworkProtocols, GameWorld, WorldGenSeed, WorldGenSize, GameName, GameDifficulty, ServerLoginConfirmationText, DropOnDeath")
	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $aFPAutoUpdateYN)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Append the following settings to new config? (yes/no) ###", $aFPAppendFPSettingsYN)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerName ###", $aFPServerName)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPort ###", $aFPServerPort)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPassword ###", $aFPServerPassword)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPort ###", $aFPTelnetPort)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPassword ###", $aFPTelnetPassword)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerLoginConfirmationText ###", $aFPServerLoginConfirmationText)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerMaxPlayerCount ###", $aFPServerMaxPlayerCount)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDescription ###", $aFPServerDescription)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerWebsiteURL ###", $aFPServerWebsiteURL)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDisabledNetworkProtocols ###", $aFPServerDisabledNetworkProtocols)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameWorld ###", $aFPGameWorld)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSeed ###", $aFPWorldGenSeed)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSize ###", $aFPWorldGenSize)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameName ###", $aFPGameName)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameDifficulty ###", $aFPGameDifficulty)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "AdminFileName ###", $aFPAdminFileName)
	;	IniWrite($aIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "DropOnDeath ###", $aFPDropOnDeath)
	FileWriteLine($aIniFile, @CRLF)
EndFunc   ;==>UpdateIni
#EndRegion ;**** INI Settings - User Variables ****

#Region ;**** Append Settings to Temporary Server Config ****
Func AppendConfigSettings()
	Global $aConfigFileTemp = "ServerConfig7dtdServerUtilTemp.xml"
	Global $aConfigFileTempFull = $aServerDirLocal & "\" & $aConfigFileTemp
	Local $tConfigPath = $aServerDirLocal & "\" & $aConfigFile
	Local $sConfigFileTempExists = FileExists($aConfigFileTempFull)
	If $sConfigFileTempExists = 1 Then
		FileDelete($aConfigFileTempFull)
	EndIf
	Local $tConfigPathOpen = FileOpen($tConfigPath, 0)
	Local $tConfigRead2 = FileRead($tConfigPathOpen)
	Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "<!-- BEGIN 7dtdtSEerverUtility Changes -->" & @CRLF)
	FileWrite($aConfigFileTempFull, $tConfigRead1)
	FileClose($tConfigPath)
	If $aAppendVerBegin = "yes" Or $aAppendVerEnd = "yes" Then
		Local $tName = IniRead($aUtilCFGFile, "CFG", "Last Server Name", $aServerName)
		FileWriteLine($aConfigFileTempFull, "<property name=""ServerName"" value=""" & $tName & """/>")
	EndIf
	If $aWipeServer = "yes" Then
		Local $tName = IniRead($aUtilCFGFile, "CFG", "Last Game Name", $aFPGameName)
		FileWriteLine($aConfigFileTempFull, "<property name=""GameName"" value=""" & $tName & """/>")
	EndIf
	FileWriteLine($aConfigFileTempFull, "<property name=""TerminalWindowEnabled"" value=""false""/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetEnabled"" value=""true""/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aTelnetPort & """/>")
	FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aTelnetPass & """/>")
	FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
EndFunc   ;==>AppendConfigSettings
#EndRegion ;**** Append Settings to Temporary Server Config ****
Func _CheckForExistingServer()
	Local $tReturn2 = 0
	Local $tProcess = ProcessList($aServerEXE)
	For $x = 1 To $tProcess[0][0]
		Local $tProcessFolder = _ProcessGetLocation($tProcess[$x][1])
		Global $aServerDirLocal = IniRead($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", @ScriptDir)
		If $tProcessFolder = $aServerDirLocal & "\" & $aServerEXE Then
			$tReturn2 = $tProcess[$x][1]
			IniWrite($aUtilCFGFile, "CFG", "PID", $tReturn2)
			LogWrite(" [Server] Existing server found by Process search. PID(" & $tReturn2 & ")")
		EndIf
	Next
	Return $tReturn2
EndFunc   ;==>_CheckForExistingServer
Func PIDReadServer($tSplash = 0)
	Local $tReturn = IniRead($aUtilCFGFile, "CFG", "PID", "0")
	Local $tReturn1 = _CheckForExistingServer()
	If $tReturn1 > 0 Then $tReturn = $tReturn1
	If $tReturn = "0" Then
		LogWrite(" [Util] No existing server found. Will start new server.")
		$aNoExistingPID = True
	Else
		$aNoExistingPID = False
		If ProcessExists($tReturn) Then
			LogWrite(" [Server] Server PID(" & $tReturn & ") found.")
			If $tSplash = 0 Then
				SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Running server found." & @CRLF & "PID(" & $tReturn & ")", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Else
				ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Running server found." & @CRLF & "PID(" & $tReturn & ")")
			EndIf
		Else
			$aNoExistingPID = True
			LogWrite(" [Server] -ERROR- Server PID(" & $tReturn & ") NOT found. Server will be restarted.")
		EndIf
		Sleep(2500)
	EndIf
	Return $tReturn
EndFunc   ;==>PIDReadServer
Func TrayConfig()
	GUI_Config()
EndFunc   ;==>TrayConfig
Func TrayExitCloseN()
	LogWrite(" [Server] Utility exit without server shutdown initiated by user via tray icon (Exit: Do NOT Shut Down Servers).")
	$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to close this utility?" & @CRLF & "(Server will remain running)" & @CRLF & @CRLF & _
			"Click (YES) to close this utility." & @CRLF & _
			"Click (NO) or (CANCEL) to cancel.", 15)
	If $tMB = 6 Then ; (YES)
		MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & @CRLF & "SERVER IS STILL RUNNING ! ! !" & @CRLF & @CRLF & _
				"Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & _
				"Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
		LogWrite(" " & $aUtilityVer & " Stopped by User")
		IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
		If $aRemoteRestartUse = "yes" Then
			TCPShutdown()
		EndIf
		_ExitUtil()
	Else
		SplashTextOn($aUtilName, "Shutdown canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	EndIf
	SplashOff()
EndFunc   ;==>TrayExitCloseN

Func TrayExitCloseY()
	LogWrite(" [" & $aServerName & "] Utility exit with server shutdown initiated by user via tray icon (Exit: Shut Down Servers).")
	$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to shut down server and exit this utility?" & @CRLF & @CRLF & _
			"Click (YES) to Shutdown server and exit." & @CRLF & _
			"Click (NO) or (CANCEL) to cancel.", 15)
	If $tMB = 6 Then ; (YES)
		CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		SplashOff()
		MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & _
				"Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
		LogWrite(" " & $aUtilityVer & " Stopped by User")
		LogWrite(" " & $aUtilityVer & " Stopped")
		If $aRemoteRestartUse = "yes" Then
			TCPShutdown()
		EndIf
		SplashOff()
		_ExitUtil()
	Else
		SplashTextOn($aUtilName, "Shutdown canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	EndIf
	SplashOff()
EndFunc   ;==>TrayExitCloseY

Func TrayRestartNow()
	LogWrite(" [Server] Restart Server Now requested by user via tray icon (Restart Server Now).")
	$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to Restart Server Now?" & @CRLF & @CRLF & _
			"Click (YES) to Restart Server Now." & @CRLF & _
			"Click (NO) or (CANCEL) to cancel.", 15)
	If $tMB = 6 Then ; (YES)
		If $aBeginDelayedShutdown = 0 Then
			LogWrite(" [Server] Restart Server Now request initiated by user.")
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		EndIf
	Else
		LogWrite(" [Server] Restart Server Now request canceled by user.")
		SplashTextOn($aUtilName, "Restart Server Now canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	EndIf
	SplashOff()
EndFunc   ;==>TrayRestartNow

Func TrayRemoteRestart()
	LogWrite(" [Remote Restart] Remote Restart requested by user via tray icon (Initiate Remote Restart).")
	If $aRemoteRestartUse <> "yes" Then
		$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "You must enable Remote Restart in the " & $aUtilName & ".ini." & @CRLF & @CRLF & _
				"Would you like to enable it? (Port:" & $aRemoteRestartPort & ")" & @CRLF & _
				"Click (YES) to enable Remote Restart." & @CRLF & _
				"Click (NO) or (CANCEL) to skip.", 15)
		If $tMB = 6 Then ; (YES)
			LogWrite(" [Remote Restart] Remote Restart enabled in " & $aUtilName & ".ini per user request")
			IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", "yes")
			$aRemoteRestartUse = "yes"
			MsgBox($MB_OK, $aUtilityVer, "Remote Restart enabled in " & $aUtilName & ".ini. " & @CRLF & "Please restart this utility for Remote Restart to be started.", 5)
			;ElseIf $tMB = 7 Then  ;(NO)
			;ElseIf $tMB = 2 Then  ; (CANCEL)
			TCPStartup() ; Start The TCP Services
			Global $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
			If $MainSocket = -1 Then
				MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $aRemoteRestartPort & "] Check server IP or disable Remote Restart in INI")
				LogWrite(" [Remote Restart] Remote Restart enabled. Could not bind to " & $aServerIP & ":" & $aRemoteRestartPort)
				_ExitUtil()
			Else
				If $sObfuscatePass = "no" Then
					LogWrite("", " [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?" & $aRemoteRestartKey & "=" & $aRemoteRestartCode)
				Else
					LogWrite(" [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]")
				EndIf
			EndIf
		Else
			LogWrite(" [Remote Restart] No changes made to Remote Restart setting in " & $aUtilName & ".ini per user request.")
			SplashTextOn($aUtilName, "No changes were made. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
			SplashOff()
		EndIf
	Else
		$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to initiate Remote Restart (reboot server in " & $aRemoteTime[$aRemoteCnt] & "min)?" & @CRLF & @CRLF & _
				"Click (YES) to Initiate Remote Restart." & @CRLF & _
				"Click (NO) or (CANCEL) to cancel.", 15)
		If $tMB = 6 Then ; (YES)
			If $aBeginDelayedShutdown = 0 Then
				LogWrite(" [Remote Restart] Remote Restart request initiated by user.")
				If ($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
					$aRebootReason = "remoterestart"
					$aBeginDelayedShutdown = 1
					$aTimeCheck0 = _NowCalc
				Else
					RunExternalRemoteRestart()
					CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
				EndIf
			EndIf
		Else
			LogWrite(" [Remote Restart] Remote Restart request canceled by user.")
			SplashTextOn($aUtilName, "Remote Restart canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
		EndIf
		SplashOff()
	EndIf
EndFunc   ;==>TrayRemoteRestart

Func TrayUpdateUtilCheck()
	LogWrite(" [Update] " & $aUtilName & " update check requested by user via tray icon (Check for Updates).")
	$aShowUpdate = True
	UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndFunc   ;==>TrayUpdateUtilCheck

Func TraySendMessage()
	LogWrite(" [Telnet] Global chat message requested by user via tray icon. (Send global chat message).")
	SplashOff()
	$tMsg = InputBox($aUtilName, "Enter global chat message", "", "", 400, 125)
	If $tMsg = "" Then
		LogWrite(" [Telnet] Global chat message canceled by user.")
		SplashTextOn($aUtilName, "Global chat Message canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	Else
		$tMsg = "say """ & $tMsg & """"
		SplashTextOn($aUtilName, "Sending global chat message:" & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, $tMsg, True)
		LogWrite(" [Telnet] Global chat Message sent (" & $tMsg & ") " & $aReply)
		SplashOff()
		MsgBox($MB_OKCANCEL, $aUtilityVer, "Global chat Message sent:" & @CRLF & $tMsg & @CRLF & @CRLF & "Response:" & @CRLF & $aReply, 10)
	EndIf
	SplashOff()
EndFunc   ;==>TraySendMessage

Func TraySendInGame()
	LogWrite(" [Telnet] Send Telnet command requested by user via tray icon (Send telnet command).")
	SplashOff()
	;	$tMsg = ""
	$tMsg = InputBox($aUtilName, "Enter Telnet command to send to server", "", "", 400, 125)
	If $tMsg = "" Then
		LogWrite(" [Telnet] Send Telnet command canceled by user.")
		SplashTextOn($aUtilName, "Send Telnet command canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	Else
		;		LogWrite(" [Telnet] Sending Telnet command to server: " & $tMsg)
		SplashTextOn($aUtilName, "Sending Telnet command. " & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, $tMsg, False)
		LogWrite(" [Telnet] Telnet command sent (" & $tMsg & ") " & $aReply)
		SplashOff()
		MsgBox($MB_OKCANCEL, $aUtilityVer, "Telnet command sent: " & @CRLF & $tMsg & @CRLF & @CRLF & "Response:" & @CRLF & $aReply, 15)
	EndIf
	SplashOff()
EndFunc   ;==>TraySendInGame

Func TrayUpdateServCheck()
	SplashOff()
	SplashTextOn($aUtilName, "Checking for server update.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
	UpdateCheck(True)
	SplashOff()
EndFunc   ;==>TrayUpdateServCheck

Func GetPlayerCount($tSplash)
	Local $aCMD = "listplayers"
	$tOnlinePlayerReady = True
	Global $aServerPlayers[2]
	Global $tOnlinePlayers[4]
	Local $aErr = False
	$aServerReadyTF = False
	TraySetToolTip("Scanning server for online players.")
	TraySetIcon(@ScriptName, 201)
	If $tSplash Then
		SplashTextOn($aUtilName, " Checking online players. . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
	EndIf
	Local $tTime9 = "00:00"
	$sMsg = TelnetOnlinePlayers($aTelnetIP, $aTelnetPort, $aTelnetPass)
	If $sMsg[0] = "Error: Timed Out" Then
		$tOnlinePlayers[0] = False
		$tOnlinePlayers[1] = "Error: Online Players Check Timed Out " ; Screen version with @CRLF
		$tOnlinePlayers[2] = "Error: Online Players Check Timed Out " ; Log version without @CRLF
	Else
		If StringLen($sMsg[0]) < 12 Then
			$aGameTime = "Day 1, 00:00"
			$tDay = 1
		Else
			$tOnlinePlayers[0] = False
			For $t = 1 To 20
				$tStr = StringMid($sMsg[0], $t, 1)
				If $tStr = "," Then
					$tTime9 = StringMid($sMsg[0], $t + 2, 5)
					ExitLoop
				EndIf
			Next
			If StringInStr($tTime9, ":") <> 3 Then $tTime9 = "00:00"
			Local $tTxt1 = _StringBetween($sMsg[0], "Day ", ",")
			If @error Then
				Local $tDay = "1"
			Else
				Local $tDay = Int($tTxt1[0])
			EndIf
			$aGameTime = "Day " & $tDay & ", " & $tTime9
		EndIf
		Local $t2 = (Int($tDay / 7) * 7)
		$aNextHorde = 7 - ($tDay - $t2)
		$tOnlinePlayers[1] = "Game Time: " & $aGameTime & @CRLF & "Total Players " ; Screen version with @CRLF
		$tOnlinePlayers[2] = "Game Time(" & $aGameTime & ") Total Players " ; Log version without @CRLF
		If StringInStr($sMsg[1], "Total of 0 in the game") <> 0 Then
			$aServerPlayers = "0"
			$tOnlinePlayers[1] = $tOnlinePlayers[1] & "(0)"
			$tOnlinePlayers[2] = $tOnlinePlayers[2] & "(0)"
			$aPlayersCount = 0
			$aPlayersOnlineName = ""
			$aPlayersOnlineSteamID = ""
		Else
			Local $tUser1 = _StringBetween($sMsg[1], ". id=", "pos=")
			Global $tUserCnt = UBound($tUser1)
			$aPlayersCount = $tUserCnt
			Local $tSteamIDArray = _StringBetween($sMsg[1], "steamid=", ",")
			Local $tUserAll[$tUserCnt]
			$tOnlinePlayers[1] = $tOnlinePlayers[1] & "(" & $tUserCnt & ") " & @CRLF
			$tOnlinePlayers[2] = $tOnlinePlayers[2] & "(" & $tUserCnt & ") "
			For $i = 0 To ($tUserCnt - 1)
				$tUserAll[$i] = _ArrayToString(_StringBetween($tUser1[$i], ", ", ", "))
				$tOnlinePlayers[1] = $tOnlinePlayers[1] & $tUserAll[$i] & " - " & $tSteamIDArray[$i] & @CRLF
				$tOnlinePlayers[2] = $tOnlinePlayers[2] & $tUserAll[$i] & " [" & $tSteamIDArray[$i] & "] , "
			Next
			$aPlayersOnlineName = _ArrayToString($tUserAll, Chr(238))
			$aPlayersOnlineSteamID = _ArrayToString($tSteamIDArray)
		EndIf
		If $aRCONError Then
			LogWrite(" [Online Players] Error receiving online players.")
			$aErr = True
			$aRCONError = False
		EndIf
		SplashOff()
		TraySetToolTip(@ScriptName)
		TraySetIcon(@ScriptName, 99)
		$tPlayersBeforeString = IniRead($aUtilCFGFile, "CFG", "Players Name", "")
		If ($tPlayersBeforeString <> $aPlayersOnlineName) And $aGameTime <> "Day 1, 00:00" Then
			Local $tPlayersBeforeArray = StringSplit($tPlayersBeforeString, Chr(238), 2)
			Local $tPlayersAfterArray = StringSplit($aPlayersOnlineName, Chr(238), 2)
			$tTempArray = _ArrayCompare($tPlayersBeforeArray, $tPlayersAfterArray)
			$aPlayersJoined = _ArrayToString($tTempArray[1], " , ")
			$aPlayersLeft = _ArrayToString($tTempArray[0], " , ")
			$aPlayersName = _ArrayToString($tPlayersAfterArray, " , ")
			$tOnlinePlayers[0] = True
			LogWrite(" [Online Players] " & _PlayersChangedText() & $tOnlinePlayers[2])
			WriteOnlineLog(_PlayersChangedText() & $tOnlinePlayers[2])
			If $tSplash Then
				MsgBox($MB_OK, $aUtilityVer, "ONLINE PLAYERS CHANGED!" & @CRLF & @CRLF & "Online players: " & @CRLF & $tOnlinePlayers[1], 10)
			EndIf
		Else
			If $tSplash Then
				MsgBox($MB_OK, $aUtilityVer, "No Change in online players: " & @CRLF & $tOnlinePlayers[1], 10)
				WriteOnlineLog("[Usr Ck] " & $tOnlinePlayers[2])
			EndIf
		EndIf
		If $aGameTime <> "Day 1, 00:00" Then $aOnlinePlayerLast = $tOnlinePlayers[1]
		If $aErr = 0 Then
			$aServerReadyTF = True
		EndIf
		Return $tOnlinePlayers
	EndIf
EndFunc   ;==>GetPlayerCount
Func _PlayersChangedText()
	Local $tTxt2 = ""
	If StringLen($aPlayersJoined) > 1 Then $tTxt2 &= "Joined:[" & $aPlayersJoined & "] "
	If StringLen($aPlayersLeft) > 1 Then $tTxt2 &= "Left:[" & $aPlayersLeft & "] "
	Return $tTxt2
EndFunc   ;==>_PlayersChangedText
Func _PlayersOnlineText()
	Local $tTxt2 = ""
	If StringLen($aPlayersName) > 1 Then $tTxt2 &= "Online:[" & $aPlayersName & "] "
	Return $tTxt2
EndFunc   ;==>_PlayersOnlineText
Func TelnetOnlinePlayers($ip, $port, $pwd)
	If $aTelnetStayConnectedYN = "no" Then
		_PlinkConnect($aTelnetIP, $aTelnetPort, $aTelnetPass)
	EndIf
	Local $sReturn[2]
	Local $tTxt0 = ""
	$tErr = False
	_PlinkSend("listplayers")
	Local $tRead1 = _PlinkRead()
	Local $tArray3 = StringSplit($tRead1, @CRLF)
	$sReturn[1] = "Error"
	If IsArray($tArray3) Then
		For $t1 = 1 To ($tArray3[0] - 1)
			If StringInStr($tArray3[$t1], "Executing command 'listplayers'") Then
				For $t2 = ($t1 + 1) To ($tArray3[0] - 1)
					If StringInStr($tArray3[$t2], "Total of 0 in the game") Then
						$sReturn[1] = "Total of 0 in the game"
						ExitLoop
					EndIf
					$tTxt0 &= $tArray3[$t2]
					If StringRegExp($tTxt0, "Total of .* in the game") Then
						$sReturn[1] = $tTxt0
						ExitLoop
					EndIf
				Next
			EndIf
		Next
	EndIf
	_PlinkSend("gettime")
	Local $tRead2 = _PlinkRead()
	Local $tArray3 = StringSplit($tRead2, @CRLF)
	$sReturn[0] = "Day 1, 00:00"
	If IsArray($tArray3) Then
		For $t1 = 1 To ($tArray3[0] - 1)
			If StringInStr($tArray3[$t1], "Executing command 'gettime'") Then
				For $t2 = $t1 To ($tArray3[0] - 1)
					If StringInStr($tArray3[$t2], "Day") Then
						$sReturn[0] = StringStripCR($tArray3[$t2])
						ExitLoop
					EndIf
				Next
			EndIf
		Next
	EndIf
	If $aTelnetStayConnectedYN = "no" Then
		_PlinkDisconnect()
	EndIf
	Return $sReturn
EndFunc   ;==>TelnetOnlinePlayers

Func ShowOnlineGUI()
	If $aServerOnlinePlayerYN = "yes" Then
		If $aPlayerCountShowTF Then
			Global $aPlayerWindowClose = False
			If WinExists($wGUIMainWindow) = 0 Then
;~ 			If $aPlayerCountWindowTF = False Then
				If $tUserCnt > 13 Then
					$aGUIH = 500 ;Create Show Online Players Window Frame
				Else
					$aGUIH = 250 ;Create Show Online Players Window Frame
				EndIf
				$wGUIMainWindow = GUICreate(@ScriptName, $aGUIW, $aGUIH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME)) ;Creates the GUI window
				GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
				GUICtrlSetLimit(-1, 0xFFFFFF)
				GUISetOnEvent($GUI_EVENT_CLOSE, "PlayerClose")
				$iEdit = GUICtrlCreateEdit("", 0, 0, $aGUIW, $aGUIH, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_READONLY), $WS_EX_STATICEDGE)
;~ 				$aPlayerCountWindowTF = True
			EndIf
			If $tOnlinePlayerReady Then
				$tTxt = _DateTimeFormat(_NowCalc(), 0) & @CRLF & $tOnlinePlayers[1]
			Else
				$tTxt = _DateTimeFormat(_NowCalc(), 0) & @CRLF & "Waiting for first Online Player and Game Time check."
			EndIf
			If $iEdit <> 0 Then
				GUICtrlSetData($iEdit, $tTxt)
			EndIf
			ControlClick($wGUIMainWindow, "", $iEdit)
			GUISetState(@SW_SHOW) ;Shows the GUI window
;~ 			If WinExists($wGUIMainWindow) Then
;~ 			Else
;~ 				While $aPlayerWindowClose = False
;~ 					Sleep(100)
;~ 				WEnd
;~ 				GUIDelete($wGUIMainWindow)
;~ 				$aPlayerWindowClose = False
;~ 				$aPlayerCountWindowTF = False
;~ 			EndIf
		EndIf
	EndIf
EndFunc   ;==>ShowOnlineGUI
Func PlayerClose()
;~ 	If WinExists($wGUIMainWindow) Then
	GUIDelete($wGUIMainWindow)
	$aPlayerCountShowTF = False
;~ 	Else
;~ 		$aPlayerWindowClose = True
;~ 	EndIf
EndFunc   ;==>PlayerClose
Func ShowPlayerCount()
	$aServerOnlinePlayerYN = "yes"
	ShowOnlineGUI()
EndFunc   ;==>ShowPlayerCount

Func TrayShowPlayerCount()
	$aPlayerCountShowTF = True
	If $aServerOnlinePlayerYN = "no" Then
		SplashTextOn($aUtilName, "To show online players, you must Enable Online Players Check/Log. . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
		SplashOff()
	Else
		ShowPlayerCount()
	EndIf
EndFunc   ;==>TrayShowPlayerCount

Func WriteOnlineLog($aMsg)
	FileWriteLine($aFolderLog & $aUtilName & "_OnlineUserLog_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt", _NowCalc() & " " & $aMsg)
EndFunc   ;==>WriteOnlineLog

Func TrayShowPlayerCheckPause()
;~ 	GUIDelete()
;~ 	$aPlayerCountWindowTF = False
	TrayItemSetState($iTrayPlayerCheckPause, $TRAY_DISABLE)
	TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_ENABLE)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", "no")
	$aServerOnlinePlayerYN = "no"
EndFunc   ;==>TrayShowPlayerCheckPause

Func TrayShowPlayerCheckUnPause()
	TrayItemSetState($iTrayPlayerCheckPause, $TRAY_ENABLE)
	TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_DISABLE)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", "yes")
	$aServerOnlinePlayerYN = "yes"
EndFunc   ;==>TrayShowPlayerCheckUnPause

Func TrayUpdateServPause()
	TrayItemSetState($iTrayUpdateServPause, $TRAY_DISABLE)
	TrayItemSetState($iTrayUpdateServUnPause, $TRAY_ENABLE)
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", "no")
	$aCheckForUpdate = "no"
EndFunc   ;==>TrayUpdateServPause

Func TrayUpdateServUnPause()
	TrayItemSetState($iTrayUpdateServPause, $TRAY_ENABLE)
	TrayItemSetState($iTrayUpdateServUnPause, $TRAY_DISABLE)
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", "yes")
	$aCheckForUpdate = "yes"
EndFunc   ;==>TrayUpdateServUnPause

Func SendTelnetTT($ip, $port, $pwd, $cmd1, $logTF = True)
	If $aBusy Then
		Return "Telnet Busy. Please try again."
	Else
		$cmd = ReplaceSingleQuote($cmd1)
		$aBusy = True
		Local $telnetfn = "ttermpro.exe"
		Local $telnetfnz = "tt.zip"
		Local $telnetfp = $aFolderTemp & "tt\" & $telnetfn
		Local $telnetSend = $aFolderTemp & "tt\_telnetSend.ttl"
		Local $telnetOut = $aFolderTemp & "tt\_telnetOut.log"
		If FileExists($telnetSend) Then FileDelete($telnetSend)
		If FileExists($telnetOut) Then FileDelete($telnetOut)
		If $logTF Then
			LogWrite(" [Telnet] Sending telnet command: " & $cmd)
		EndIf
		If FileExists($telnetfp) = 0 Then
			LogWrite(" [Telnet] Downloading Modified Tera Term Pro: http://www.phoenix125.com/share/" & $telnetfnz)
			InetGet("http://www.phoenix125.com/share/" & $telnetfnz, $aFolderTemp & $telnetfnz, 0)
			If FileExists($aFolderTemp & "tt") = 0 Then DirCreate($aFolderTemp & "tt")
			$fail = _ExtractZip($aFolderTemp & $telnetfnz, "", "tt", StringTrimRight($aFolderTemp, 1))
			If @error Then
				LogWrite(" [Telnet] ERROR!! Failed to extract Modified Tera Term Pro. Telnet features will not work.")
			EndIf
			If Not FileExists($telnetfp) Then
				LogWrite(" [Telnet] ERROR!! Failed to download Modified Tera Term Pro. Telnet features will not work.")
				MsgBox(0x0, "ERROR", "Modified Tera Term Pro not found. " & @CRLF & "Telnet features will not work." & @CRLF & @CRLF & "http://www.phoenix125.com/share/" & $telnetfnz, 30)
			EndIf
		EndIf
		If FileExists($telnetfp) Then
			FileWriteLine($telnetSend, "showtt -1" & @CRLF & "restoresetup '" & $aFolderTemp & "tt\7dtdTeraTerm.ini'" & @CRLF & "connect '" & $ip & ":" & $port & "'" & @CRLF & "logautoclosemode 1" & @CRLF & "logopen '" & $telnetOut & "'" & @CRLF & _
					"logstart" & @CRLF & "sendln" & @CRLF & "sendln '" & $pwd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'to end session'" & @CRLF & "sendln '" & $cmd & "'" & @CRLF & _
					"timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'done'" & @CRLF & "sendln 'exit'" & @CRLF & "logclose" & @CRLF & "closett" & @CRLF)
			Local $aRun = $telnetfp & " /m=""" & $telnetSend & """"
			Local $mOut = Run($aRun, $aFolderTemp & "tt", @SW_MINIMIZE)
			$tErr = ProcessWaitClose($mOut, 5)
			If $tErr = 0 Then
				$aReturn = "Error: Timed Out"
				ProcessClose($mOut)
				$aBusy = False
				Return $aReturn
			Else
				$aReturn = FileRead($telnetOut)
				Local $aReturn1 = _StringBetween($aReturn, "'" & $cmd1 & "'", "exit")
				Local $aReturn = _ArrayToString($aReturn1)
				Local $sFirstLine = StringRegExpReplace($aReturn, "(?s)^(\V+).*$", "\1") ; First line in string.
				Local $sFileContents = StringRegExpReplace($aReturn, $sFirstLine & "\v*", "")
				If FileExists($telnetSend) Then FileDelete($telnetSend)
				If FileExists($telnetOut) Then FileDelete($telnetOut)
				$aBusy = False
				Return $sFileContents
			EndIf
		Else
			$aReturn = "Error: Could Not Find " & $telnetfp
			$aBusy = False
			Return $aReturn
		EndIf
	EndIf
EndFunc   ;==>SendTelnetTT


Func ReplaceSingleQuote($tMsg0)
	If StringInStr($tMsg0, "'") = "0" Then
		Return $tMsg0
	Else
		Return StringReplace($tMsg0, "'", "' 39 '")
	EndIf
EndFunc   ;==>ReplaceSingleQuote

Func TrayUpdateUtilPause()
	SplashOff()
	MsgBox($MB_OK, $aUtilityVer, $aUtilityVer & " Paused.  Press OK to resume.")
EndFunc   ;==>TrayUpdateUtilPause
Func _GetQuery($tIP, $tPort)
	Local $tFileBase = "SteamServerQuery"
	Local $tFileDL = $tFileBase & ".zip"
	Local $tFileRun = $aFolderTemp & $tFileBase & ".exe"
	If FileExists($tFileRun) = 0 Then
		Local $tFileExist = _DownloadAndExtractFile($tFileBase, "http://www.phoenix125.com/share/steamserverquery/" & $tFileDL, _
				"https://github.com/phoenix125/SteamServerQuery/releases/download/Latest_Version/SteamServerQuery.zip", 0, $aFolderTemp)
		If $tFileExist = False Then
			LogWrite(" [Query] ERROR!! Failed to download and extract " & $tFileBase & ". Query watchdog disabled until tool restarted.")
			$aQueryYN = "no"
		EndIf
	EndIf
	If $aQueryYN = "yes" Then
	EndIf

	Local $mWaitms = 1000
	Local $tQuerycmd = $tFileRun & " -po " & $tIP & ":" & $tPort
	Local $mOut = Run($tQuerycmd, @ScriptDir, @SW_HIDE, $STDOUT_CHILD)
	Local $tTimer1 = TimerInit()
	Local $tExit = False
	While ProcessExists($mOut) And $tExit = False
		Sleep(50)
		If TimerDiff($tTimer1) > $mWaitms Then $tExit = True
	WEnd
	Local $tcrcatch = StdoutRead($mOut)
	StdioClose($mOut)
	If ProcessExists($mOut) Then ProcessClose($mOut)
	Local $tReturn = StringSplit($tcrcatch, @CRLF, 3)
	Return $tReturn
EndFunc   ;==>_GetQuery
Func _Splash($tTxt, $tTime = 0, $tWidth = 400, $tHeight = 125)
	Local $tPID = SplashTextOn($aUtilName, $tTxt, $tWidth, $tHeight, -1, -1, $DLG_MOVEABLE, "")
	If $tTime > 0 Then
		Sleep($tTime)
		SplashOff()
	EndIf
	Return $tPID
EndFunc   ;==>_Splash

Func _DownloadAndExtractFile($tFileName, $tURL1, $tURL2 = "", $tSplash = 0, $tFolder = @ScriptDir, $tFile2 = 0, $tFile3 = 0, $tFile4 = 0, $tFile5 = 0)
	$tFolder = RemoveTrailingSlash($tFolder)
	If FileExists($tFolder & "\" & $tFileName & ".exe") = 0 Then
		If $tSplash > 0 Then
			ControlSetText($tSplash, "", "Static1", "Downloading " & $tFileName & ".exe.")
		Else
			_Splash("Downloading " & $tFileName & ".exe.", 0, 475)
		EndIf
		DirCreate($tFolder)     ; to extract to
		InetGet($tURL1, $tFolder & "\" & $tFileName & ".zip", 1)
		If Not FileExists($tFolder & "\" & $tFileName & ".zip") Then
			SetError(1, 1)     ; Failed to download from source 1
			LogWrite(" [Util] Error downloading " & $tFileName & " from Source1: " & $tURL1)
			InetGet($tURL2, $tFolder & "\" & $tFileName & ".zip", 1)
			If Not FileExists($tFolder & "\" & $tFileName & ".zip") Then
				SetError(1, 2)     ; Failed to download from source 2
				LogWrite(" [Util] Error downloading " & $tFileName & " from Source2: " & $tURL2)
				SplashOff()
				MsgBox($MB_OK, $aUtilName, "ERROR!!!  " & $tFileName & ".zip download failed.")
				$aSplashStartUp = _Splash($aStartText, 0, 475)
				Return
			EndIf
		EndIf
		DirCreate($tFolder)     ; to extract to
		_ExtractZip($tFolder & "\" & $tFileName & ".zip", "", $tFileName & ".exe", $tFolder)
		If $tFile2 <> 0 Then _ExtractZip($tFolder & "\" & $tFileName & ".zip", "", $tFile2, $tFolder)
		If $tFile3 <> 0 Then _ExtractZip($tFolder & "\" & $tFileName & ".zip", "", $tFile3, $tFolder)
		If $tFile4 <> 0 Then _ExtractZip($tFolder & "\" & $tFileName & ".zip", "", $tFile4, $tFolder)
		If $tFile5 <> 0 Then _ExtractZip($tFolder & "\" & $tFileName & ".zip", "", $tFile5, $tFolder)
		If FileExists($tFolder & "\" & $tFileName & ".exe") Then
			LogWrite(" [Util] Downloaded and installed " & $tFileName & ".")
		Else
			LogWrite(" [Util] Error extracting " & $tFileName & ".exe from " & $tFileName & ".zip")
			SetError(1, 3)     ; Failed to extract file
			SplashOff()
			MsgBox($MB_OK, $aUtilName, "ERROR!!! Extracting " & $tFileName & ".exe from " & $tFileName & ".zip failed.")
			$aSplashStartUp = _Splash($aStartText, 0, 475)
			SplashOff()
			Return
		EndIf
		FileDelete($tFolder & "\" & $tFileName & ".zip")
		SplashOff()
		Return True     ; Downloaded and installed file
	Else
		SplashOff()
		Return False     ; File existed
	EndIf
EndFunc   ;==>_DownloadAndExtractFile

Func LogWrite($Msg, $msgdebug = -1)
	$aLogFile = $aFolderLog & $aUtilName & "_Log_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
	$aLogDebugFile = $aFolderLog & $aUtilName & "_LogFull_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
	Local $tFileSize = FileGetSize($aLogFile)
	If $tFileSize > 10000000 Then
		FileMove($aLogFile, $aFolderLog & $aUtilName & "_Log_" & @YEAR & "-" & @MON & "-" & @MDAY & "-Part1.txt")
		FileWriteLine($aLogFile, _NowCalc() & " Log File Split.  First file:" & $aFolderLog & $aUtilName & "_Log_" & @YEAR & "-" & @MON & "-" & @MDAY & "-Part1.txt")
	EndIf
	Local $tFileSize = FileGetSize($aLogDebugFile)
	If $tFileSize > 10000000 Then
		FileMove($aLogDebugFile, $aFolderLog & $aUtilName & "_LogFull_" & @YEAR & "-" & @MON & "-" & @MDAY & "-Part1.txt")
		FileWriteLine($aLogFile, _NowCalc() & " Log File Split.  First file:" & $aFolderLog & $aUtilName & "_LogFull_" & @YEAR & "-" & @MON & "-" & @MDAY & "-Part1.txt")
	EndIf
	If $Msg <> "" Then
		FileWriteLine($aLogFile, _NowCalc() & $Msg)
;~ 		$aGUILogWindowText = _NowTime(5) & $Msg & @CRLF & StringLeft($aGUILogWindowText, 10000)
;~ 		If $aGUIReady Then GUICtrlSetData($LogTicker, $aGUILogWindowText)
	EndIf
	If $msgdebug <> "no" Then
		If $msgdebug = -1 Then
			FileWriteLine($aLogDebugFile, _NowCalc() & $Msg)
		Else
			FileWriteLine($aLogDebugFile, _NowCalc() & $msgdebug)
		EndIf
	EndIf
EndFunc   ;==>LogWrite
Func PurgeLogFile()
	$aPurgeLogFileName = $aFolderTemp & $aUtilName & "_PurgeLogFile.bat"
	Local $sFileExists = FileExists($aPurgeLogFileName)
	If $sFileExists = 1 Then
		FileDelete($aPurgeLogFileName)
	EndIf
	FileWriteLine($aPurgeLogFileName, "for /f ""tokens=* skip=" & $aLogQuantity & """ %%F in " & Chr(40) & "'dir """ & $aFolderLog & $aUtilName & "_Log_*.txt"" /o-d /tc /b'" & Chr(41) & " do del """ & $aFolderLog & "%%F""")
	FileWriteLine($aPurgeLogFileName, "for /f ""tokens=* skip=" & $aLogQuantity & """ %%F in " & Chr(40) & "'dir """ & $aFolderLog & $aUtilName & "_LogFull_*.txt"" /o-d /tc /b'" & Chr(41) & " do del """ & $aFolderLog & "%%F""")
	FileWriteLine($aPurgeLogFileName, "for /f ""tokens=* skip=" & $aLogQuantity & """ %%F in " & Chr(40) & "'dir """ & $aFolderLog & $aUtilName & "_OnlineUserLog_*.txt"" /o-d /tc /b'" & Chr(41) & " do del """ & $aFolderLog & "%%F""")
	LogWrite("", " Deleting log files >" & $aLogQuantity & " in folder " & $aFolderTemp)
	Run($aPurgeLogFileName, "", @SW_HIDE)
EndFunc   ;==>PurgeLogFile
Func _ProcessGetLocation($iPID)
	Local $aProc = DllCall('kernel32.dll', 'hwnd', 'OpenProcess', 'int', BitOR(0x0400, 0x0010), 'int', 0, 'int', $iPID)
	If $aProc[0] = 0 Then Return SetError(1, 0, '')
	Local $vStruct = DllStructCreate('int[1024]')
	DllCall('psapi.dll', 'int', 'EnumProcessModules', 'hwnd', $aProc[0], 'ptr', DllStructGetPtr($vStruct), 'int', DllStructGetSize($vStruct), 'int_ptr', 0)
	Local $aReturn = DllCall('psapi.dll', 'int', 'GetModuleFileNameEx', 'hwnd', $aProc[0], 'int', DllStructGetData($vStruct, 1), 'str', '', 'int', 2048)
	If StringLen($aReturn[3]) = 0 Then Return SetError(2, 0, '')
	Return $aReturn[3]
EndFunc   ;==>_ProcessGetLocation
Func _ArrayCompare($tArray1, $tArray2) ; Returns array: [0]=Only in 1st Array [1]=Only in 2nd Array [2]=Common in Both Arrays | Thanks to mikell https://www.autoitscript.com/forum/topic/164728-compare-2-arrays-with-3-arrays-as-a-result/?do=findComment&comment=1201986
	Local $sda = ObjCreate("Scripting.Dictionary")
	Local $sdb = ObjCreate("Scripting.Dictionary")
	Local $sdc = ObjCreate("Scripting.Dictionary")
	For $i9 In $tArray1
		$sda.Item($i9)
	Next
	For $i9 In $tArray2
		$sdb.Item($i9)
	Next
	$aKeys = $sdb.Keys()
	For $i9 In $tArray1
		If $sdb.Exists($i9) Then $sdc.Item($i9)
	Next
	$asd3 = $sdc.Keys()
	For $i9 In $asd3
		If $sda.Exists($i9) Then $sda.Remove($i9)
		If $sdb.Exists($i9) Then $sdb.Remove($i9)
	Next
	$asd1 = $sda.Keys()
	$asd2 = $sdb.Keys()
	Local $tReturn[3]
	$tReturn[0] = $asd1
	$tReturn[1] = $asd2
	$tReturn[2] = $asd3
	Return $tReturn
EndFunc   ;==>_ArrayCompare
Func _PlinkConnect($tIP, $tPort, $tPwd)
	_DownloadAndExtractFile("plink", "http://www.phoenix125.com/share/plink/plink.zip", "https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe", $tSplash, $aFolderTemp)
	Local $tCmd = '"' & $aFilePlink & '" -telnet ' & $tIP & ' -P ' & $tPort
	$aPlinkPID = Run($tCmd, @ScriptDir, @SW_HIDE, $STDIN_CHILD + $STDERR_MERGED)
	If Not $aPlinkPID Then
		LogWrite(" [Telnet] ERROR! Fialed to connect to telnet. [" & $tIP & ":" & $tPort & "]", " [Telnet] ERROR! Fialed to connect to telnet. [" & $tIP & ":" & $tPort & "] " & $tCmd)
		Return SetError(2, 0, 0)
	EndIf
	For $i = 1 To 6
		If $i = 6 Then
			LogWrite(" [Telnet] Plink Connected to server [" & $tIP & ":" & $tPort & "]", " [Telnet] Plink Connected to server [" & $tIP & ":" & $tPort & "] " & $tCmd)
			Return SetError(2, 0, 0)
		EndIf
		_PlinkSend($tPwd)
		Local $sReturn = _PlinkRead()
		If StringInStr($sReturn, "Logon successful.") > 0 Then ExitLoop
		Sleep(500)
	Next
	LogWrite(" [Telnet] Plink Connected to server [" & $tIP & ":" & $tPort & "]", " [Telnet] Plink Connected to server [" & $tIP & ":" & $tPort & "] " & $tCmd)
	Return $sReturn
EndFunc   ;==>_PlinkConnect
Func _PlinkRead() ; Author:spudw2k, Modified:Adam Lawrence (AdamUL), http://www.autoitscript.com/forum/topic/130536-interacting-with-a-remote-computer-via-ssh/page__p__910252#entry910252
	Local $sDataA
	Local $sDataB
	Do
		$sDataB = $sDataA
		Sleep(100)
		$sDataA &= StdoutRead($aPlinkPID)
		If $sDataA = "" Then Return StringRegExpReplace($sDataA, "\00", "")
		If @error Then ExitLoop
	Until $sDataB = $sDataA And $sDataA And $sDataB
	Return StringRegExpReplace($sDataA, "\00", "")
EndFunc   ;==>_PlinkRead
Func _PlinkSend($sCmd)
	$iChars = StdinWrite($aPlinkPID, $sCmd & @CRLF)
	Return SetError(@error, 0, $iChars)
EndFunc   ;==>_PlinkSend
Func _PlinkDisconnect()
	$iClosed = ProcessClose($aPlinkPID)
	Return SetError(@error, 0, $iClosed)
EndFunc   ;==>_PlinkDisconnect
Func _TelnetBufferTrim()
	$aTelnetBuffer = StringRight($aTelnetBuffer, 10000)
EndFunc   ;==>_TelnetBufferTrim
Func _TelnetLookForAll($tTxt5)
	Local $tArray3 = StringSplit($tTxt5, @CRLF)
	If IsArray($tArray3) Then
		For $t1 = 1 To $tArray3[0]
			_TelnetLookForDeath($tArray3[$t1])
			_TelnetLookForJoin($tArray3[$t1])
			_TelnetLookForLeave($tArray3[$t1])
			_TelnetLookForChat($tArray3[$t1])
		Next
	EndIf
EndFunc   ;==>_TelnetLookForAll
Func _TelnetLookForDeath($tTxt4)
	Local $tMsg4 = $sDiscordPlayerDiedMsg
	If $sUseDiscordBotPlayerDiedYN = "yes" Then
		If StringRegExp($tTxt4, "Player '.*' died") Then
			Local $tName = _ArrayToString(_StringBetween($tTxt4, "'", "'"))
			$tMsg4 = StringReplace($tMsg4, "\p", $tName)
			$tMsg4 = StringReplace($tMsg4, "\n", @CRLF)
			_SendDiscordDie($tMsg4)
		EndIf
	EndIf
EndFunc   ;==>_TelnetLookForDeath
Func _TelnetLookForJoin($tTxt4)
	Local $tMsg4 = $sDiscordPlayerJoinMsg
	If $tMsg4 <> "" Then
		If StringRegExp($tTxt4, "Player '.*' joined the game") Then
			Local $tName = _ArrayToString(_StringBetween($tTxt4, "'", "'"))
			$tMsg4 = StringReplace($tMsg4, "\p", $tName)
			$tMsg4 = StringReplace($tMsg4, "\n", @CRLF)
			_SendDiscordJoin($tMsg4)
		EndIf
	EndIf
EndFunc   ;==>_TelnetLookForJoin
Func _TelnetLookForLeave($tTxt4)
	Local $tMsg4 = $sDiscordPlayerLeftMsg
	If $tMsg4 <> "" Then
		If StringRegExp($tTxt4, "Player '.*' left the game") Then
			Local $tName = _ArrayToString(_StringBetween($tTxt4, "'", "'"))
			$tMsg4 = StringReplace($tMsg4, "\p", $tName)
			$tMsg4 = StringReplace($tMsg4, "\n", @CRLF)
			_SendDiscordJoin($tMsg4)
		EndIf
	EndIf
EndFunc   ;==>_TelnetLookForLeave
Func _TelnetLookForChat($tTxt4)
	Local $tMsg4 = $sDiscordPlayerChatMsg
	If $tMsg4 <> "" Then
		If StringInStr($tTxt4, " INF Chat (from") Then
			Local $tName = _ArrayToString(_StringBetween($tTxt4, "'): '", "': "))
			Local $tChat = StringMid($tTxt4, StringInStr($tTxt4, $tName & "': ") + StringLen($tName & "': "))
			$tMsg4 = StringReplace($tMsg4, "\p", $tName)
			$tMsg4 = StringReplace($tMsg4, "\m", $tChat)
			$tMsg4 = StringReplace($tMsg4, "\n", @CRLF)
			_SendDiscordChat($tMsg4)
		EndIf
	EndIf
EndFunc   ;==>_TelnetLookForChat
Func _SendDiscordJoin($tMsg)
	_GetPlayerCount()
EndFunc   ;==>_SendDiscordJoin
Func _SendDiscordLeave($tMsg)
	_GetPlayerCount()
EndFunc   ;==>_SendDiscordLeave
Func _DisableCloseButton($tHwd)
	$aSysMenu = DllCall("User32.dll", "hwnd", "GetSystemMenu", "hwnd", $tHwd, "int", 0)
	$hSysMenu = $aSysMenu[0]
	DllCall("User32.dll", "int", "RemoveMenu", "hwnd", $hSysMenu, "int", 0xF060, "int", 0)         ; 0=Disable, 1=Enable, CLOSE = 0xF060, MOVE = 0xF010, MAXIMIZE = 0xF030, MINIMIZE = 0xF020, SIZE = 0xF000, RESTORE = 0xF120
	DllCall("User32.dll", "int", "DrawMenuBar", "hwnd", $tHwd)
EndFunc   ;==>_DisableCloseButton
#Region ### START Koda GUI section ### Form=K:\AutoIT\_MyProgs\7dtdServerUpdateUtility\Koda GUIs\7DTD_W1(b3).kxf
Func GUI_Config()
	If WinExists($Config) Then
		_WinAPI_SetWindowPos($Config, $HWND_TOPMOST, 0, 0, 0, 0, BitOR($SWP_NOACTIVATE, $SWP_NOMOVE, $SWP_NOSIZE))
		_WinAPI_SetWindowPos($Config, $HWND_NOTOPMOST, 0, 0, 0, 0, BitOR($SWP_NOACTIVATE, $SWP_NOMOVE, $SWP_NOSIZE))
	Else
		Global $aConfigWindowClose = False
		SplashOff()
		$Config = GUICreate("7DTDServerUpdateUtility Config", 906, 555, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME))
;~ 		GUISetIcon("G:\Game Server Files\AutoIT\Icons\phoenix.ico", -1)
		GUISetIcon($aIconFile, 99)
		GUISetBkColor(0x646464)
		GUISetOnEvent($GUI_EVENT_CLOSE, "ConfigClose")
		GUISetOnEvent($GUI_EVENT_MINIMIZE, "ConfigMinimize")
		GUISetOnEvent($GUI_EVENT_MAXIMIZE, "ConfigMaximize")
		GUISetOnEvent($GUI_EVENT_RESTORE, "ConfigRestore")
		_DisableCloseButton($Config)
		Global $ConfigTabWindow = GUICtrlCreateTab(8, 8, 889, 537)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "ConfigTabWindowChange")
		Global $Tab1 = GUICtrlCreateTabItem("1 Server Setup")
		Global $Label1 = GUICtrlCreateLabel("", 72, 64, 4, 4)
		GUICtrlSetFont(-1, 16, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label1Click")
		Global $Group5 = GUICtrlCreateGroup("Server", 16, 36, 515, 123)
		GUICtrlSetFont(-1, 10, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label2 = GUICtrlCreateLabel("Server Folder", 33, 61, 86, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label2Click")
		Global $W1_T1_I_DIR = GUICtrlCreateInput("W1_T1_I_DIR", 124, 60, 300, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_DIRChange")
		Global $W1_T1_B_DIR = GUICtrlCreateButton("Select Folder", 427, 58, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_B_DIRClick")
		Global $W1_T1_I_ConfigFile = GUICtrlCreateInput("W1_T1_I_ConfigFile", 124, 90, 220, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_ConfigFileChange")
		Global $W1_T1_B_Config = GUICtrlCreateButton("Select File", 347, 88, 76, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_B_ConfigClick")
		Global $W1_T1_B_ImportSettings = GUICtrlCreateButton("Import Settings", 427, 88, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xF3E747)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_B_ImportSettingsClick")
		Global $W1_T1_I_IP = GUICtrlCreateInput("192.168.1.1", 124, 120, 86, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_IPChange")
		Global $Label4 = GUICtrlCreateLabel("Config File", 52, 91, 67, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label4Click")
		Global $Label3 = GUICtrlCreateLabel("Local IP", 66, 121, 52, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label3Click")
		Global $Label36 = GUICtrlCreateLabel("(ie. 192.168.1.10)", 215, 121, 101, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label36Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group6 = GUICtrlCreateGroup("SteamCMD", 16, 162, 591, 175)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label5 = GUICtrlCreateLabel("Steam Branch", 32, 199, 88, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label5Click")
		Global $W1_T1_R_BranchPublic = GUICtrlCreateRadio("public", 126, 197, 56, 21)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_BranchPublicClick")
		Global $W1_T1_R_BranchExperimental = GUICtrlCreateRadio("latest_experimental", 193, 198, 138, 19)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_BranchExperimentalClick")
		Global $W1_T1_I_SteamBranch = GUICtrlCreateInput("W1_T1_I_SteamBranch", 353, 195, 118, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_SteamBranchChange")
		Global $W1_T1_I_SteamUsername = GUICtrlCreateInput("(optional)", 195, 223, 86, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_SteamUsernameChange")
		Global $W1_T1_I_SteamPassword = GUICtrlCreateInput("(optional)", 385, 223, 86, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_SteamPasswordChange")
		Global $W1_T1_E_Commandline = GUICtrlCreateEdit("", 122, 253, 471, 74, BitOR($ES_AUTOVSCROLL, $ES_AUTOHSCROLL, $ES_WANTRETURN))
		GUICtrlSetData(-1, "Edit3")
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_E_CommandlineChange")
		Global $Label32 = GUICtrlCreateLabel("Username", 125, 226, 67, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label32Click")
		Global $Label34 = GUICtrlCreateLabel("Password", 318, 226, 64, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label34Click")
		Global $Label35 = GUICtrlCreateLabel("Commandline", 29, 253, 87, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label35Click")
		Global $W1_T1_R_BranchManual = GUICtrlCreateRadio("", 337, 198, 15, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_BranchManualClick")
		Global $Group16 = GUICtrlCreateGroup("", 480, 179, 114, 69)
		Global $W1_T1_R_NOValidate = GUICtrlCreateRadio("NO Validate", 489, 198, 96, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_NOValidateClick")
		Global $W1_T1_R_Validate = GUICtrlCreateRadio("Validate", 489, 220, 67, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_ValidateClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $W1_T1_B_ResetCMD = GUICtrlCreateButton("Reset Cmd", 36, 298, 75, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0x99B4D1)
		GUICtrlSetOnEvent(-1, "W1_T1_B_ResetCMDClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group1 = GUICtrlCreateGroup("Server Update Check", 536, 37, 353, 123)
		GUICtrlSetFont(-1, 10, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label45 = GUICtrlCreateLabel("Check for updates every", 551, 94, 149, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label45Click")
		Global $W1_T1_C_ServerUpdateCheck = GUICtrlCreateCheckbox("Check For Server Updates", 555, 67, 187, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_ServerUpdateCheckClick")
		Global $W1_T1_I_UpdateMinutes = GUICtrlCreateInput("5", 705, 90, 47, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_UpdateMinutesChange")
		Global $W1_T1_U_UpdateMinutes = GUICtrlCreateUpdown($W1_T1_I_UpdateMinutes)
		GUICtrlSetLimit(-1, 59, 5)
		GUICtrlSetOnEvent(-1, "W1_T1_U_UpdateMinutesChange")
		Global $W1_T1_R_UpdateViaSteamCMD = GUICtrlCreateRadio("SteamCMD", 706, 125, 93, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_UpdateViaSteamCMDClick")
		Global $W1_T1_R_UpdateViaSteamDB = GUICtrlCreateRadio("SteamDB", 802, 125, 77, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_R_UpdateViaSteamDBClick")
		Global $Label46 = GUICtrlCreateLabel("minutes (05-59)", 757, 94, 93, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label46Click")
		Global $Label47 = GUICtrlCreateLabel("For update checks, use: ", 556, 125, 149, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label47Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group17 = GUICtrlCreateGroup("Backups", 16, 342, 873, 197)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T1_C_Enable = GUICtrlCreateCheckbox("Enable", 68, 365, 75, 18)
		GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T1_C_EnableClick")
		Global $Label69 = GUICtrlCreateLabel("Days", 20, 365, 36, 20, $SS_RIGHT)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label69Click")
		Global $W1_T1_C_Daily = GUICtrlCreateCheckbox("Daily", 153, 365, 51, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_DailyClick")
		Global $W1_T1_C_Sun = GUICtrlCreateCheckbox("Sun", 209, 365, 45, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_SunClick")
		Global $W1_T1_C_Mon = GUICtrlCreateCheckbox("Mon", 254, 365, 47, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_MonClick")
		Global $W1_T1_C_Tues = GUICtrlCreateCheckbox("Tues", 305, 365, 50, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_TuesClick")
		Global $W1_T1_C_Wed = GUICtrlCreateCheckbox("Wed", 357, 365, 53, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_WedClick")
		Global $W1_T1_C_Thurs = GUICtrlCreateCheckbox("Thur", 413, 365, 51, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_ThursClick")
		Global $W1_T1_C_Fri = GUICtrlCreateCheckbox("Fri", 467, 365, 39, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_FriClick")
		Global $W1_T1_C_Sat = GUICtrlCreateCheckbox("Sat", 506, 365, 51, 18)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_SatClick")
		Global $W1_T1_C_00 = GUICtrlCreateCheckbox("00", 61, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_00Click")
		Global $W1_T1_C_01 = GUICtrlCreateCheckbox("01", 100, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_01Click")
		Global $W1_T1_C_02 = GUICtrlCreateCheckbox("02", 141, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_02Click")
		Global $W1_T1_C_03 = GUICtrlCreateCheckbox("03", 182, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_03Click")
		Global $W1_T1_C_04 = GUICtrlCreateCheckbox("04", 222, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_04Click")
		Global $W1_T1_C_05 = GUICtrlCreateCheckbox("05", 263, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_05Click")
		Global $W1_T1_C_06 = GUICtrlCreateCheckbox("06", 303, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_06Click")
		Global $W1_T1_C_07 = GUICtrlCreateCheckbox("07", 343, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_07Click")
		Global $W1_T1_C_08 = GUICtrlCreateCheckbox("08", 383, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_08Click")
		Global $W1_T1_C_09 = GUICtrlCreateCheckbox("09", 423, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_09Click")
		Global $W1_T1_C_10 = GUICtrlCreateCheckbox("10", 463, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_10Click")
		Global $W1_T1_C_11 = GUICtrlCreateCheckbox("11", 501, 399, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_11Click")
		Global $W1_T1_C_12 = GUICtrlCreateCheckbox("12", 61, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_12Click")
		Global $W1_T1_C_13 = GUICtrlCreateCheckbox("13", 100, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_13Click")
		Global $W1_T1_C_14 = GUICtrlCreateCheckbox("14", 141, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_14Click")
		Global $W1_T1_C_15 = GUICtrlCreateCheckbox("15", 182, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_15Click")
		Global $W1_T1_C_16 = GUICtrlCreateCheckbox("16", 222, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_16Click")
		Global $W1_T1_C_17 = GUICtrlCreateCheckbox("17", 263, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_17Click")
		Global $W1_T1_C_18 = GUICtrlCreateCheckbox("18", 303, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_18Click")
		Global $W1_T1_C_19 = GUICtrlCreateCheckbox("19", 343, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_19Click")
		Global $W1_T1_C_20 = GUICtrlCreateCheckbox("20", 383, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_20Click")
		Global $W1_T1_C_21 = GUICtrlCreateCheckbox("21", 423, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_21Click")
		Global $W1_T1_C_22 = GUICtrlCreateCheckbox("22", 463, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_22Click")
		Global $W1_T1_C_23 = GUICtrlCreateCheckbox("23", 501, 425, 30, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_C_23Click")
		Global $W1_T1_I_BackupMin = GUICtrlCreateInput("0", 64, 452, 47, 24)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupMinChange")
		Global $W1_T1_U_BackupMinute = GUICtrlCreateUpdown($W1_T1_I_BackupMin)
		GUICtrlSetLimit(-1, 59, 0)
		GUICtrlSetOnEvent(-1, "W1_T1_U_BackupMinuteChange")
		Global $W1_T1_I_BackupOutFolder = GUICtrlCreateInput("W1_T1_I_DIR", 188, 453, 267, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupOutFolderChange")
		Global $W1_T1_B_BackupOutFolder = GUICtrlCreateButton("Select Folder", 456, 451, 73, 25)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_B_BackupOutFolderClick")
		Global $W1_T1_I_BackupCm = GUICtrlCreateInput("W1_T1_I_DIR", 387, 482, 183, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupCmChange")
		Global $W1_T1_I_BackupNumberToKeep = GUICtrlCreateInput("1", 792, 360, 47, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupNumberToKeepChange")
		Global $W1_T1_U_BackupNumberToKeep = GUICtrlCreateUpdown($W1_T1_I_BackupNumberToKeep)
		GUICtrlSetLimit(-1, 999, 1)
		GUICtrlSetOnEvent(-1, "W1_T1_U_BackupNumberToKeepChange")
		Global $W1_T1_I_BackupFullEvery = GUICtrlCreateInput("0", 758, 430, 48, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupFullEveryChange")
		Global $W1_T1_U_BackupFullEvery = GUICtrlCreateUpdown($W1_T1_I_BackupFullEvery)
		GUICtrlSetLimit(-1, 99, 0)
		GUICtrlSetOnEvent(-1, "W1_T1_U_BackupFullEveryChange")
		Global $W1_T1_I_BackupMaxWaitSec = GUICtrlCreateInput("30", 792, 476, 47, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupMaxWaitSecChange")
		Global $W1_T1_U_BackupMaxSecToWait = GUICtrlCreateUpdown($W1_T1_I_BackupMaxWaitSec)
		GUICtrlSetLimit(-1, 999, 30)
		GUICtrlSetOnEvent(-1, "W1_T1_U_BackupMaxSecToWaitChange")
		Global $W1_T1_I_BackupCmd = GUICtrlCreateInput("W1_T1_I_DIR", 566, 508, 316, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T1_I_BackupCmdChange")
		Global $Label70 = GUICtrlCreateLabel("Hours", 20, 401, 40, 20)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label70Click")
		Global $Label71 = GUICtrlCreateLabel("Minute", 19, 454, 43, 20, $SS_RIGHT)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label71Click")
		Global $Label72 = GUICtrlCreateLabel("Number of backups to Keep", 650, 362, 137, 17, $SS_RIGHT)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label72Click")
		Global $Label73 = GUICtrlCreateLabel("Full server and util backup every", 599, 433, 157, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label73Click")
		Global $Label74 = GUICtrlCreateLabel("backup (0-99)", 809, 433, 70, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label74Click")
		Global $Label75 = GUICtrlCreateLabel("Routine backups include SAVE && MODS folders and config files", 573, 396, 311, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label75Click")
		Global $Label76 = GUICtrlCreateLabel("Full backups include entire server && util folders", 657, 413, 227, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label76Click")
		Global $Label77 = GUICtrlCreateLabel("(1-999)", 843, 362, 37, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label77Click")
		Global $Label78 = GUICtrlCreateLabel("0 = disable", 824, 448, 55, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label78Click")
		Global $Label79 = GUICtrlCreateLabel("Output Folder", 120, 456, 68, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label79Click")
		Global $Label80 = GUICtrlCreateLabel("Additional backup folders / files (comma separated. Folders add \ at end. ex. ""C:\7DTD\"",""D:\7DTD\config.xml"")", 24, 512, 559, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label80Click")
		Global $Label81 = GUICtrlCreateLabel("7zip backup additional command line parameters (Default: a -spf -r -tzip -ssw)", 24, 485, 363, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label81Click")
		Global $Label82 = GUICtrlCreateLabel("Max seconds to wait for backup to complete", 579, 479, 213, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label82Click")
		Global $Label83 = GUICtrlCreateLabel("(30-999)", 843, 478, 43, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label83Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic1 = GUICtrlCreatePic("" & $aFolderTemp & "zombiehorde.jpg", 614, 170, 274, 165)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic1Click")
		Global $Tab2 = GUICtrlCreateTabItem("2 Watchdog")
		Global $Watchdog = GUICtrlCreateGroup("KeepAlive Watchdog", 40, 60, 793, 253)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label8 = GUICtrlCreateLabel("(1-360)", 57, 89, 44, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label8Click")
		Global $W1_T2_E_PauseForMapGeneration = GUICtrlCreateInput("0", 107, 86, 53, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_E_PauseForMapGenerationChange")
		Global $W1_T2_U_PauseForUpdate = GUICtrlCreateUpdown($W1_T2_E_PauseForMapGeneration)
		GUICtrlSetLimit(-1, 360, 1)
		GUICtrlSetOnEvent(-1, "W1_T2_U_PauseForUpdateChange")
		Global $W1_T2_I_PauseForStarted = GUICtrlCreateInput("0", 107, 115, 53, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_PauseForStartedChange")
		Global $W1_T2_U_PauseForStarted = GUICtrlCreateUpdown($W1_T2_I_PauseForStarted)
		GUICtrlSetLimit(-1, 60, 1)
		GUICtrlSetOnEvent(-1, "W1_T2_U_PauseForStartedChange")
		Global $W1_T2_I_FailedResponses = GUICtrlCreateInput("0", 107, 144, 53, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_FailedResponsesChange")
		Global $W1_T2_U_FailedResponse = GUICtrlCreateUpdown($W1_T2_I_FailedResponses)
		GUICtrlSetLimit(-1, 10, 1)
		GUICtrlSetOnEvent(-1, "W1_T2_U_FailedResponseChange")
		Global $W1_T2_C_UseQuery = GUICtrlCreateCheckbox("Use QUERY PORT to check if server is alive", 97, 212, 287, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_C_UseQueryClick")
		Global $W1_T2_I_QueryIP = GUICtrlCreateInput("127.0.0.1", 453, 208, 86, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_QueryIPChange")
		Global $W1_T2_I_QueryCheckEvery = GUICtrlCreateInput("0", 651, 207, 49, 24)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_QueryCheckEveryChange")
		Global $W1_T2_U_QueryCheck = GUICtrlCreateUpdown($W1_T2_I_QueryCheckEvery)
		GUICtrlSetLimit(-1, 900, 30)
		GUICtrlSetOnEvent(-1, "W1_T2_U_QueryCheckChange")
		Global $W1_T2_C_UseTelnet = GUICtrlCreateCheckbox("Use TELNET to check if server is alive", 97, 245, 277, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_C_UseTelnetClick")
		Global $W1_T2_I_TelnetIP = GUICtrlCreateInput("127.0.0.1", 453, 241, 86, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_TelnetIPChange")
		Global $W1_T2_I_TelnetCheckEvery = GUICtrlCreateInput("0", 651, 240, 49, 24)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_I_TelnetCheckEveryChange")
		Global $W1_T2_U_TelnetCheck = GUICtrlCreateUpdown($W1_T2_I_TelnetCheckEvery)
		GUICtrlSetLimit(-1, 900, 30)
		GUICtrlSetOnEvent(-1, "W1_T2_U_TelnetCheckChange")
		Global $W1_T2_C_TelnetStayConnected = GUICtrlCreateCheckbox("Stay connected to telnet (faster and required for Discord Chat & Death Messages)", 130, 275, 519, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_C_TelnetStayConnectedClick")
		Global $Label22 = GUICtrlCreateLabel("Pause watchdog for _ minutes after server updated to allow map generation", 165, 90, 449, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label22Click")
		Global $Label6 = GUICtrlCreateLabel("Pause watchdog for _ minutes after server started to allow server to come online", 165, 119, 474, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label6Click")
		Global $Label7 = GUICtrlCreateLabel("(1-60)", 63, 118, 37, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label7Click")
		Global $Label37 = GUICtrlCreateLabel("Number of failed responses (after server has responded at least once) before restarting server (Default is 3)", 165, 148, 637, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label37Click")
		Global $Label38 = GUICtrlCreateLabel("(1-10)", 61, 147, 37, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label38Click")
		Global $Label39 = GUICtrlCreateLabel("Query IP", 394, 212, 55, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label39Click")
		Global $Label40 = GUICtrlCreateLabel("Check Every", 570, 210, 80, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label40Click")
		Global $Label41 = GUICtrlCreateLabel("seconds (30-900)", 708, 210, 104, 20)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label41Click")
		Global $Label42 = GUICtrlCreateLabel("Telnet IP", 394, 245, 57, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label42Click")
		Global $Label43 = GUICtrlCreateLabel("Check Every", 570, 243, 80, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label43Click")
		Global $Label44 = GUICtrlCreateLabel("seconds (30-900)", 708, 243, 106, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label44Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group7 = GUICtrlCreateGroup("Excessive Memory Watchdog", 39, 332, 331, 109)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T2_C_RestartExcessiveMemory = GUICtrlCreateCheckbox("Restart on excessive memory use", 55, 356, 223, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T2_C_RestartExcessiveMemoryClick")
		Global $Label48 = GUICtrlCreateLabel("Excessive memory amount", 51, 388, 165, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label48Click")
		Global $W1_T2_I_RestartExcessiveMemoryAmt = GUICtrlCreateInput("W1_T2_I_RestartExcessiveMemoryAmt", 216, 384, 137, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T2_I_RestartExcessiveMemoryAmtChange")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic2 = GUICtrlCreatePic("" & $aFolderTemp & "zombiedog.jpg", 610, 336, 222, 180)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic2Click")
		Global $Tab3 = GUICtrlCreateTabItem("3 Restarts")
		Global $Group2 = GUICtrlCreateGroup("Server Restart Schedules", 31, 56, 649, 165)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		Global $Label9 = GUICtrlCreateLabel("Restart Days", 51, 90, 82, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "Label9Click")
		Global $W1_T3_C_Daily = GUICtrlCreateCheckbox("Daily", 230, 90, 49, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_DailyClick")
		Global $W1_T3_C_Sun = GUICtrlCreateCheckbox("Sun", 284, 90, 41, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_SunClick")
		Global $W1_T3_C_Mon = GUICtrlCreateCheckbox("Mon", 329, 90, 47, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_MonClick")
		Global $W1_T3_C_Tues = GUICtrlCreateCheckbox("Tues", 376, 90, 49, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_TuesClick")
		Global $W1_T3_C_Wed = GUICtrlCreateCheckbox("Wed", 432, 90, 49, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_WedClick")
		Global $W1_T3_C_Thur = GUICtrlCreateCheckbox("Thur", 482, 90, 51, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_ThurClick")
		Global $W1_T3_C_Fri = GUICtrlCreateCheckbox("Fri", 534, 90, 38, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_FriClick")
		Global $W1_T3_C_Sat = GUICtrlCreateCheckbox("Sat", 575, 90, 51, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_SatClick")
		Global $W1_T3_C_00 = GUICtrlCreateCheckbox("00", 142, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_00Click")
		Global $Label10 = GUICtrlCreateLabel("Restart Hours", 52, 124, 86, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "Label10Click")
		Global $W1_T3_C_01 = GUICtrlCreateCheckbox("01", 181, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_01Click")
		Global $W1_T3_C_02 = GUICtrlCreateCheckbox("02", 222, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_02Click")
		Global $W1_T3_C_03 = GUICtrlCreateCheckbox("03", 263, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_03Click")
		Global $W1_T3_C_04 = GUICtrlCreateCheckbox("04", 303, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_04Click")
		Global $W1_T3_C_05 = GUICtrlCreateCheckbox("05", 344, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_05Click")
		Global $W1_T3_C_06 = GUICtrlCreateCheckbox("06", 384, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_06Click")
		Global $W1_T3_C_07 = GUICtrlCreateCheckbox("07", 424, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_07Click")
		Global $W1_T3_C_08 = GUICtrlCreateCheckbox("08", 464, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_08Click")
		Global $W1_T3_C_09 = GUICtrlCreateCheckbox("09", 504, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_09Click")
		Global $W1_T3_C_10 = GUICtrlCreateCheckbox("10", 544, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_10Click")
		Global $W1_T3_C_11 = GUICtrlCreateCheckbox("11", 582, 124, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_11Click")
		Global $W1_T3_C_12 = GUICtrlCreateCheckbox("12", 142, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_12Click")
		Global $W1_T3_C_13 = GUICtrlCreateCheckbox("13", 181, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_13Click")
		Global $W1_T3_C_14 = GUICtrlCreateCheckbox("14", 222, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_14Click")
		Global $W1_T3_C_15 = GUICtrlCreateCheckbox("15", 263, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_15Click")
		Global $W1_T3_C_16 = GUICtrlCreateCheckbox("16", 303, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_16Click")
		Global $W1_T3_C_17 = GUICtrlCreateCheckbox("17", 344, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_17Click")
		Global $W1_T3_C_18 = GUICtrlCreateCheckbox("18", 384, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_18Click")
		Global $W1_T3_C_19 = GUICtrlCreateCheckbox("19", 424, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_19Click")
		Global $W1_T3_C_20 = GUICtrlCreateCheckbox("20", 464, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_20Click")
		Global $W1_T3_C_21 = GUICtrlCreateCheckbox("21", 504, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_21Click")
		Global $W1_T3_C_22 = GUICtrlCreateCheckbox("22", 544, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_22Click")
		Global $W1_T3_C_23 = GUICtrlCreateCheckbox("23", 582, 150, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "W1_T3_C_23Click")
		Global $Label11 = GUICtrlCreateLabel("Restart Minute", 45, 184, 89, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH)
		GUICtrlSetOnEvent(-1, "Label11Click")
		Global $W1_T3_I_RestartMinute = GUICtrlCreateInput("0", 141, 182, 47, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_I_RestartMinuteChange")
		Global $W1_T3_U_RestartMinute = GUICtrlCreateUpdown($W1_T3_I_RestartMinute)
		GUICtrlSetLimit(-1, 59, 0)
		GUICtrlSetOnEvent(-1, "W1_T3_U_RestartMinuteChange")
		Global $W1_T3_C_EnableRestart = GUICtrlCreateCheckbox("Enable", 142, 90, 75, 18)
		GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T3_C_EnableRestartClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group4 = GUICtrlCreateGroup("Remote Restart", 30, 238, 649, 77)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label23 = GUICtrlCreateLabel("Port", 228, 263, 28, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label23Click")
		Global $W1_T3_C_EnableRemoteRestart = GUICtrlCreateCheckbox("Enable Remote Restart", 42, 264, 171, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_C_EnableRemoteRestartClick")
		Global $W1_T3_I_RemoteRestartPort = GUICtrlCreateInput("W1_T3_I_RemoteRestartPort", 256, 260, 65, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_I_RemoteRestartPortChange")
		Global $W1_T3_I_RemoteRestartKey = GUICtrlCreateInput("Input1", 367, 260, 65, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_I_RemoteRestartKeyChange")
		Global $W1_T3_I_RemoteRestartCode = GUICtrlCreateInput("Input1", 491, 260, 65, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_I_RemoteRestartCodeChange")
		Global $Label31 = GUICtrlCreateLabel("Key", 338, 263, 27, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label31Click")
		Global $Label49 = GUICtrlCreateLabel("Code", 455, 263, 37, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label49Click")
		Global $Label50 = GUICtrlCreateLabel("(Usage example: in any web brower, enter http://192.168.1.10:57520/?restart=password) to restart server)", 48, 289, 505, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label50Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group8 = GUICtrlCreateGroup("Append Server Version to Name", 30, 338, 649, 157)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T3_C_RenameGameSave = GUICtrlCreateCheckbox("Rename GameSave with updates causing a SERVER WIPE (while retaining old save files)", 46, 368, 567, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_C_RenameGameSaveClick")
		Global $W1_T3_C_AppendBefore = GUICtrlCreateCheckbox("Append Server Version at BEGINNING of Server Name    example: Alpha 19 (b163) | My Server Name", 46, 393, 641, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_C_AppendBeforeClick")
		Global $W1_T3_C_AppendAfter = GUICtrlCreateCheckbox("Append Server Version at END of Server Name.  example: My Server Name | Alpha 19 (b163)", 46, 417, 625, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_C_AppendAfterClick")
		Global $W1_T3_R_AppendShort = GUICtrlCreateRadio("Use SHORT server version. example: b163", 80, 437, 355, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_R_AppendShortClick")
		Global $W1_T3_R_AppendLong = GUICtrlCreateRadio("Use LONG server version. example: Alpha 19 (b163)", 80, 458, 337, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T3_R_AppendLongClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic3 = GUICtrlCreatePic("" & $aFolderTemp & "zombie1.jpg", 702, 164, 173, 251)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic3Click")
		Global $Tab4 = GUICtrlCreateTabItem("4 Announcements")
		Global $Group9 = GUICtrlCreateGroup("Announcement Intervals (Applies to all methods)", 20, 148, 863, 119)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label12 = GUICtrlCreateLabel("Announcement _ minutes before DAILY restarts", 33, 178, 282, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label12Click")
		Global $W1_T4_I_DailyMins = GUICtrlCreateInput("W1_T4_I_DailyMins", 356, 173, 75, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_DailyMinsChange")
		Global $W1_T4_C_Daily01 = GUICtrlCreateCheckbox("01", 436, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily01Click")
		Global $W1_T4_C_Daily02 = GUICtrlCreateCheckbox("02", 477, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily02Click")
		Global $W1_T4_C_Daily03 = GUICtrlCreateCheckbox("03", 518, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily03Click")
		Global $W1_T4_C_Daily05 = GUICtrlCreateCheckbox("05", 560, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily05Click")
		Global $W1_T4_C_Daily10 = GUICtrlCreateCheckbox("10", 599, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily10Click")
		Global $W1_T4_C_Daily15 = GUICtrlCreateCheckbox("15", 637, 176, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Daily15Click")
		Global $Label13 = GUICtrlCreateLabel("Announcement _ minutes before UPDATE restarts", 33, 207, 300, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label13Click")
		Global $W1_T4_I_UpdateMins = GUICtrlCreateInput("Input1", 356, 202, 75, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_UpdateMinsChange")
		Global $W1_T4_C_Update01 = GUICtrlCreateCheckbox("01", 436, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update01Click")
		Global $W1_T4_C_Update02 = GUICtrlCreateCheckbox("02", 477, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update02Click")
		Global $W1_T4_C_Update03 = GUICtrlCreateCheckbox("03", 518, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update03Click")
		Global $W1_T4_C_Update05 = GUICtrlCreateCheckbox("05", 560, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update05Click")
		Global $W1_T4_C_Update10 = GUICtrlCreateCheckbox("10", 599, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update10Click")
		Global $W1_T4_C_Update15 = GUICtrlCreateCheckbox("15", 637, 205, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Update15Click")
		Global $Label24 = GUICtrlCreateLabel("Announcement _ minutes before REMOTE RESTART", 33, 236, 323, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label24Click")
		Global $W1_T4_I_UpdateRemote = GUICtrlCreateInput("Input1", 356, 231, 75, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_UpdateRemoteChange")
		Global $W1_T4_C_Remote01 = GUICtrlCreateCheckbox("01", 436, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote01Click")
		Global $W1_T4_C_Remote02 = GUICtrlCreateCheckbox("02", 477, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote02Click")
		Global $W1_T4_C_Remote03 = GUICtrlCreateCheckbox("03", 518, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote03Click")
		Global $W1_T4_C_Remote05 = GUICtrlCreateCheckbox("05", 560, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote05Click")
		Global $W1_T4_C_Remote10 = GUICtrlCreateCheckbox("10", 599, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote10Click")
		Global $W1_T4_C_Remote15 = GUICtrlCreateCheckbox("15", 637, 234, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_Remote15Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group10 = GUICtrlCreateGroup("In-Game Announcements", 20, 292, 865, 193)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T4_C_AnnounceInGame = GUICtrlCreateCheckbox("Announce Messages In-Game", 30, 316, 211, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_C_AnnounceInGameClick")
		Global $Label51 = GUICtrlCreateLabel("DAILY Restarts", 96, 353, 95, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label51Click")
		Global $W1_T4_I_AnnounceDaily = GUICtrlCreateInput("W1_T4_I_AnnounceDaily", 195, 350, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_AnnounceDailyChange")
		Global $Label52 = GUICtrlCreateLabel("Text substitution: \m - minutes", 314, 312, 176, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label52Click")
		Global $Label53 = GUICtrlCreateLabel("UPDATE Restarts", 78, 381, 113, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label53Click")
		Global $W1_T4_I_AnnounceUpdate = GUICtrlCreateInput("W1_T4_I_AnnounceDaily", 195, 378, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_AnnounceUpdateChange")
		Global $Label54 = GUICtrlCreateLabel("REMOTE RESTART", 61, 409, 130, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label54Click")
		Global $W1_T4_I_AnnounceRemote = GUICtrlCreateInput("W1_T4_I_AnnounceDaily", 195, 406, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_AnnounceRemoteChange")
		Global $Label84 = GUICtrlCreateLabel("BACKUP started", 88, 452, 102, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label84Click")
		Global $W1_T4_I_BackupStarted = GUICtrlCreateInput("W1_T4_I_AnnounceBackup", 195, 449, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T4_I_BackupStartedChange")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group18 = GUICtrlCreateGroup("Online Players Check", 20, 52, 399, 77)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T4_C_LogOnlinePlayers = GUICtrlCreateCheckbox("Check for, and log, online players every", 34, 76, 255, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T4_C_LogOnlinePlayersClick")
		Global $W1_T4_I_LogOnlinePlaySeconds = GUICtrlCreateInput("0", 289, 73, 49, 24)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T4_I_LogOnlinePlaySecondsChange")
		Global $W1_T4_U_OnlinePlayers = GUICtrlCreateUpdown($W1_T4_I_LogOnlinePlaySeconds)
		GUICtrlSetOnEvent(-1, "W1_T4_U_OnlinePlayersChange")
		Global $Label91 = GUICtrlCreateLabel("seconds", 348, 77, 56, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "Label91Click")
		Global $Label92 = GUICtrlCreateLabel("Used as a backup to the continuous telnet monitoring", 54, 100, 316, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "Label92Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic6 = GUICtrlCreatePic("" & $aFolderTemp & "zombie6.jpg", 596, 38, 169, 109)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic6Click")
		Global $Tab5 = GUICtrlCreateTabItem("5 Discord Webhooks")
		Global $Group3 = GUICtrlCreateGroup("Discord Webhooks", 38, 42, 831, 355)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label14 = GUICtrlCreateLabel("Discord #1", 48, 65, 90, 24)
		GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label14Click")
		Global $W1_T5_I_D1URL = GUICtrlCreateInput("W1_T5_I_D1URL", 181, 64, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D1URLChange")
		Global $W1_T5_I_D1Bot = GUICtrlCreateInput("Input1", 181, 93, 101, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D1BotChange")
		Global $W1_T5_I_D1Avatar = GUICtrlCreateInput("Input1", 365, 94, 415, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D1AvatarChange")
		Global $W1_T5_C_D1TTS = GUICtrlCreateCheckbox("Use TTS", 786, 97, 79, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_D1TTSClick")
		Global $Label15 = GUICtrlCreateLabel("URL", 145, 67, 31, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label15Click")
		Global $Label16 = GUICtrlCreateLabel("Bot Name", 113, 96, 64, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label16Click")
		Global $Label17 = GUICtrlCreateLabel("Avatar URL", 288, 97, 73, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label17Click")
		Global $Label18 = GUICtrlCreateLabel("Discord #2", 47, 154, 90, 24)
		GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label18Click")
		Global $Label19 = GUICtrlCreateLabel("URL", 144, 156, 31, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label19Click")
		Global $Label20 = GUICtrlCreateLabel("Bot Name", 112, 185, 64, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label20Click")
		Global $W1_T5_I_D2URL = GUICtrlCreateInput("Input1", 180, 153, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D2URLChange")
		Global $W1_T5_I_D2Bot = GUICtrlCreateInput("Input1", 180, 182, 101, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D2BotChange")
		Global $Label25 = GUICtrlCreateLabel("Avatar URL", 287, 186, 73, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label25Click")
		Global $W1_T5_I_D2Avatar = GUICtrlCreateInput("Input1", 364, 183, 415, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D2AvatarChange")
		Global $W1_T5_C_D2TTS = GUICtrlCreateCheckbox("Use TTS", 785, 186, 79, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_D2TTSClick")
		Global $Label55 = GUICtrlCreateLabel("Discord #3", 47, 243, 90, 24)
		GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label55Click")
		Global $Label56 = GUICtrlCreateLabel("URL", 142, 245, 31, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label56Click")
		Global $Label57 = GUICtrlCreateLabel("Bot Name", 110, 274, 64, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label57Click")
		Global $W1_T5_I_D3URL = GUICtrlCreateInput("Input1", 178, 242, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D3URLChange")
		Global $W1_T5_I_D3Bot = GUICtrlCreateInput("Input1", 178, 271, 101, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D3BotChange")
		Global $Label58 = GUICtrlCreateLabel("Avatar URL", 285, 275, 73, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label58Click")
		Global $W1_T5_I_D3Avatar = GUICtrlCreateInput("Input1", 362, 272, 415, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D3AvatarChange")
		Global $W1_T5_C_D3TTS = GUICtrlCreateCheckbox("Use TTS", 783, 275, 79, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_D3TTSClick")
		Global $Label59 = GUICtrlCreateLabel("Discord #4", 47, 328, 90, 24)
		GUICtrlSetFont(-1, 12, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label59Click")
		Global $Label60 = GUICtrlCreateLabel("URL", 142, 331, 31, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label60Click")
		Global $Label61 = GUICtrlCreateLabel("Bot Name", 110, 360, 64, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label61Click")
		Global $W1_T5_I_D4URL = GUICtrlCreateInput("Input1", 178, 328, 677, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D4URLChange")
		Global $W1_T5_I_D4Bot = GUICtrlCreateInput("Input1", 178, 357, 101, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D4BotChange")
		Global $Label62 = GUICtrlCreateLabel("Avatar URL", 285, 361, 73, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label62Click")
		Global $W1_T5_I_D4Avatar = GUICtrlCreateInput("Input1", 362, 358, 415, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_I_D4AvatarChange")
		Global $W1_T5_C_D4TTS = GUICtrlCreateCheckbox("Use TTS", 783, 361, 79, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_D4TTSClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Group11 = GUICtrlCreateGroup("Discord Webhook Select", 38, 408, 535, 117)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label63 = GUICtrlCreateLabel("Webhook(s) to send RESTART / STATUS Messages to:", 54, 430, 342, 20, $SS_RIGHT)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label63Click")
		Global $W1_T5_C_WHRestart1 = GUICtrlCreateCheckbox("#1", 403, 431, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHRestart1Click")
		Global $W1_T5_C_WHRestart2 = GUICtrlCreateCheckbox("#2", 444, 431, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHRestart2Click")
		Global $W1_T5_C_WHRestart3 = GUICtrlCreateCheckbox("#3", 485, 431, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHRestart3Click")
		Global $W1_T5_C_WHRestart4 = GUICtrlCreateCheckbox("#4", 527, 431, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHRestart4Click")
		Global $Label64 = GUICtrlCreateLabel("Webhook(s) to send PLAYERS ONLINE Messages to:", 58, 452, 326, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label64Click")
		Global $W1_T5_C_WHOnline1 = GUICtrlCreateCheckbox("#1", 403, 453, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHOnline1Click")
		Global $W1_T5_C_WHOnline2 = GUICtrlCreateCheckbox("#2", 444, 453, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHOnline2Click")
		Global $W1_T5_C_WHOnline3 = GUICtrlCreateCheckbox("#3", 485, 453, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHOnline3Click")
		Global $W1_T5_C_WHOnline4 = GUICtrlCreateCheckbox("#4", 527, 453, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHOnline4Click")
		Global $Label65 = GUICtrlCreateLabel("Webhook(s) to send CHAT Messages to:", 58, 474, 249, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label65Click")
		Global $W1_T5_C_WHChat1 = GUICtrlCreateCheckbox("#1", 403, 475, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHChat1Click")
		Global $W1_T5_C_WHChat2 = GUICtrlCreateCheckbox("#2", 444, 475, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHChat2Click")
		Global $W1_T5_C_WHChat3 = GUICtrlCreateCheckbox("#3", 485, 475, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHChat3Click")
		Global $W1_T5_C_WHChat4 = GUICtrlCreateCheckbox("#4", 527, 475, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHChat4Click")
		Global $Label66 = GUICtrlCreateLabel("Webhook(s) to send PLAYER DEATH Messages to:", 58, 496, 315, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label66Click")
		Global $W1_T5_C_WHDie1 = GUICtrlCreateCheckbox("#1", 403, 497, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHDie1Click")
		Global $W1_T5_C_WHDie2 = GUICtrlCreateCheckbox("#2", 444, 497, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHDie2Click")
		Global $W1_T5_C_WHDie3 = GUICtrlCreateCheckbox("#3", 485, 497, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHDie3Click")
		Global $W1_T5_C_WHDie4 = GUICtrlCreateCheckbox("#4", 527, 497, 30, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T5_C_WHDie4Click")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic4 = GUICtrlCreatePic("" & $aFolderTemp & "zombie2.jpg", 722, 406, 53, 123)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic4Click")
		Global $Tab6 = GUICtrlCreateTabItem("6 Discord Announcements")
		Global $Group12 = GUICtrlCreateGroup("Discord Announcements", 18, 52, 867, 455)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T6_C_Daily = GUICtrlCreateCheckbox("Daily", 32, 95, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_DailyClick")
		Global $W1_T6_I_Daily = GUICtrlCreateInput("W1_T6_I_Daily", 147, 92, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_DailyChange")
		Global $W1_T6_C_Update = GUICtrlCreateCheckbox("Update", 32, 124, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_UpdateClick")
		Global $W1_T6_I_Update = GUICtrlCreateInput("Input13", 147, 121, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_UpdateChange")
		Global $W1_T6_C_Remote = GUICtrlCreateCheckbox("Remote Restart", 32, 153, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_RemoteClick")
		Global $W1_T6_I_Remote = GUICtrlCreateInput("Input13", 147, 150, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_RemoteChange")
		Global $Label29 = GUICtrlCreateLabel("Text substitution: \m - minutes", 146, 70, 174, 18)
		GUICtrlSetFont(-1, 8, 800, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label29Click")
		Global $W1_T6_C_BackOnline = GUICtrlCreateCheckbox("When server is back online", 32, 192, 183, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_BackOnlineClick")
		Global $W1_T6_I_BackOnline = GUICtrlCreateInput("W1_T6_I_BackOnline", 218, 190, 657, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_BackOnlineChange")
		Global $W1_T6_C_PlayerChange = GUICtrlCreateCheckbox("Online Player Change", 31, 252, 147, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_PlayerChangeClick")
		Global $W1_T6_I_PlayerChange = GUICtrlCreateInput("Input13", 182, 249, 692, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_PlayerChangeChange")
		Global $W1_T6_I_SubJoined = GUICtrlCreateInput("Input13", 230, 276, 644, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_SubJoinedChange")
		Global $Label21 = GUICtrlCreateLabel("Joined Player Sub-Message ( \j )", 69, 280, 157, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label21Click")
		Global $W1_T6_I_SubLeft = GUICtrlCreateInput("Input13", 230, 303, 644, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_SubLeftChange")
		Global $Label67 = GUICtrlCreateLabel("Left Player Sub-Message ( \l )", 81, 307, 144, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label67Click")
		Global $Label68 = GUICtrlCreateLabel("Online Player Sub-Message ( \o )", 67, 334, 160, 17)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label68Click")
		Global $W1_T6_I_SubOnlinePlayer = GUICtrlCreateInput("Input13", 230, 330, 644, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_SubOnlinePlayerChange")
		Global $W1_T6_C_PlayerDie = GUICtrlCreateCheckbox("Player Died (\p - Player Name, \n Next Line)", 30, 366, 277, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_PlayerDieClick")
		Global $W1_T6_I_PlayerDie = GUICtrlCreateInput("Input13", 312, 363, 562, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_PlayerDieChange")
		Global $W1_T6_C_PlayerChat = GUICtrlCreateCheckbox("Player Chat (\p - Player Name, \m Message)", 30, 395, 277, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_PlayerChatClick")
		Global $W1_T6_I_PlayerChat = GUICtrlCreateInput("Input13", 312, 392, 562, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_PlayerChatChange")
		Global $W1_T6_C_FirstAnnounceOnly = GUICtrlCreateCheckbox("Send Discord message for FIRST ANNOUNCEMENT only (reduces bot spam)", 30, 424, 491, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_FirstAnnounceOnlyClick")
		Global $W1_T6_C_BackupStarted = GUICtrlCreateCheckbox("Backup Started", 30, 468, 111, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_C_BackupStartedClick")
		Global $W1_T6_I_BackupStarted = GUICtrlCreateInput("Input13", 142, 465, 732, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T6_I_BackupStartedChange")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Label26 = GUICtrlCreateLabel("\o Online Player Count, \m Max Players, \t Game Time, \h Days to Next Horde, \j Joined Sub-Msg, \l Left Sub-Msg, \a Online Players Sub-Msg, \n Next Line", 38, 230, 827, 18)
		GUICtrlSetFont(-1, 8, 800, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label26Click")
		Global $Tab7 = GUICtrlCreateTabItem("7 Twitch")
		Global $Group13 = GUICtrlCreateGroup("Twitch Announcements", 18, 52, 865, 369)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label27 = GUICtrlCreateLabel("Text substitution: \m - minutes", 144, 85, 174, 18)
		GUICtrlSetFont(-1, 8, 800, 0, "Arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label27Click")
		Global $W1_T7_C_TwitchDaily = GUICtrlCreateCheckbox("Daily", 30, 110, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_C_TwitchDailyClick")
		Global $W1_T7_I_TwitchDaily = GUICtrlCreateInput("Input13", 145, 107, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchDailyChange")
		Global $W1_T7_C_TwitchUpdate = GUICtrlCreateCheckbox("Update", 30, 139, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_C_TwitchUpdateClick")
		Global $W1_T7_I_TwitchUpdate = GUICtrlCreateInput("Input13", 145, 136, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchUpdateChange")
		Global $W1_T7_C_TwitchRemote = GUICtrlCreateCheckbox("Remote Restart", 30, 168, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_C_TwitchRemoteClick")
		Global $W1_T7_I_TwitchRemote = GUICtrlCreateInput("Input13", 145, 165, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchRemoteChange")
		Global $Label28 = GUICtrlCreateLabel("Nick #", 61, 228, 41, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label28Click")
		Global $Label30 = GUICtrlCreateLabel("ChatOAuth", 37, 258, 67, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label30Click")
		Global $Label33 = GUICtrlCreateLabel("Channels", 44, 288, 60, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label33Click")
		Global $W1_T7_I_TwitchNick = GUICtrlCreateInput("W1_T7_I_TwitchNick", 107, 227, 201, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchNickChange")
		Global $W1_T7_I_TwitchChatOAuth = GUICtrlCreateInput("Input1", 107, 254, 633, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchChatOAuthChange")
		Global $W1_T7_I_TwitchChannels = GUICtrlCreateInput("Input1", 103, 285, 633, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchChannelsChange")
		Global $W1_T7_C_TwitchFirstAnnounceOnly = GUICtrlCreateCheckbox("Send Twitch message for FIRST ANNOUNCEMENT only (reduces bot spam)", 32, 335, 491, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_C_TwitchFirstAnnounceOnlyClick")
		Global $W1_T7_C_BackupStarted = GUICtrlCreateCheckbox("Backup Started", 32, 383, 112, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_C_BackupStartedClick")
		Global $W1_T7_I_TwitchBackStarted = GUICtrlCreateInput("Input13", 147, 380, 728, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T7_I_TwitchBackStartedChange")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Tab8 = GUICtrlCreateTabItem("8 Scripts")
		Global $Group14 = GUICtrlCreateGroup("External Scripts", 50, 42, 575, 457)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $W1_T8_C_ExecuteAfterSteamandStart = GUICtrlCreateCheckbox("Execute after SteamCMD update and server start", 65, 70, 358, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterSteamandStartClick")
		Global $W1_T8_C_ExecuteAfterSteamandStartWait = GUICtrlCreateCheckbox("Wait for script to complete", 430, 68, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterSteamandStartWaitClick")
		Global $Label85 = GUICtrlCreateLabel("File to run", 67, 95, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label85Click")
		Global $W1_T8_I_ExecuteAfterSteamandStart = GUICtrlCreateInput("W1_T1_I_DIR", 129, 91, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteAfterSteamandStartChange")
		Global $W1_T8_B_ExecuteAfterSteamandStart = GUICtrlCreateButton("Select File", 509, 90, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteAfterSteamandStartClick")
		Global $W1_T8_C_ExecuteAfterSteamBeforeStart = GUICtrlCreateCheckbox("Execute after SteamCMD update but before server start", 66, 139, 357, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterSteamBeforeStartClick")
		Global $W1_T8_C_ExecuteAfterSteamBeforeStartWait = GUICtrlCreateCheckbox("Wait for script to complete", 430, 139, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterSteamBeforeStartWaitClick")
		Global $Label86 = GUICtrlCreateLabel("File to run", 67, 166, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label86Click")
		Global $W1_T8_I_ExecuteAfterSteamBeforeStart = GUICtrlCreateInput("W1_T1_I_DIR", 129, 162, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteAfterSteamBeforeStartChange")
		Global $W1_T8_B_ExecuteAfterSteamBeforeStart = GUICtrlCreateButton("Select File", 509, 161, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteAfterSteamBeforeStartClick")
		Global $W1_T8_C_ExecuteAfterUpdate = GUICtrlCreateCheckbox("Execute when restarting for server update", 66, 212, 357, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterUpdateClick")
		Global $W1_T8_C_ExecuteAfterUpdateWait = GUICtrlCreateCheckbox("Wait for script to complete", 430, 212, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterUpdateWaitClick")
		Global $Label87 = GUICtrlCreateLabel("File to run", 67, 241, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label87Click")
		Global $W1_T8_I_ExecuteAfterUpdate = GUICtrlCreateInput("W1_T1_I_DIR", 129, 235, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteAfterUpdateChange")
		Global $W1_T8_B_ExecuteAfterUpdate = GUICtrlCreateButton("Select File", 509, 234, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteAfterUpdateClick")
		Global $W1_T8_C_ExecuteAfterRestart = GUICtrlCreateCheckbox("Execute when restarting for daily server restart", 66, 292, 357, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterRestartClick")
		Global $W1_T8_C_ExecuteAfterRestartWait = GUICtrlCreateCheckbox("Wait for script to complete", 429, 289, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAfterRestartWaitClick")
		Global $Label88 = GUICtrlCreateLabel("File to run", 66, 318, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label88Click")
		Global $W1_T8_I_ExecuteAfterRestart = GUICtrlCreateInput("W1_T1_I_DIR", 128, 312, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteAfterRestartChange")
		Global $W1_T8_B_ExecuteAfterRestart = GUICtrlCreateButton("Select File", 508, 311, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteAfterRestartClick")
		Global $W1_T8_C_ExecuteAFirstRestartAnnouncement = GUICtrlCreateCheckbox("Execute when first restart announcement is made", 64, 362, 357, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAFirstRestartAnnouncementClick")
		Global $W1_T8_C_ExecuteAFirstRestartAnnouncementWait = GUICtrlCreateCheckbox("Wait for script to complete", 428, 362, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteAFirstRestartAnnouncementWaitClick")
		Global $Label89 = GUICtrlCreateLabel("File to run", 65, 391, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label89Click")
		Global $W1_T8_I_ExecuteAFirstRestartAnnouncement = GUICtrlCreateInput("W1_T1_I_DIR", 127, 385, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteAFirstRestartAnnouncementChange")
		Global $W1_T8_B_ExecuteAFirstRestartAnnouncement = GUICtrlCreateButton("Select File", 507, 384, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteAFirstRestartAnnouncementClick")
		Global $W1_T8_C_ExecuteRemoteRestart = GUICtrlCreateCheckbox("Execute before restart for Remote Restart", 63, 429, 357, 17)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteRemoteRestartClick")
		Global $W1_T8_C_ExecuteRemoteRestartWaitr = GUICtrlCreateCheckbox("Wait for script to complete", 427, 429, 179, 16)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetOnEvent(-1, "W1_T8_C_ExecuteRemoteRestartWaitrClick")
		Global $Label90 = GUICtrlCreateLabel("File to run", 64, 458, 61, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label90Click")
		Global $W1_T8_I_ExecuteRemoteRestart = GUICtrlCreateInput("W1_T1_I_DIR", 126, 452, 376, 22)
		GUICtrlSetFont(-1, 8, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_I_ExecuteRemoteRestartChange")
		Global $W1_T8_B_ExecuteRemoteRestart = GUICtrlCreateButton("Select File", 506, 451, 95, 25)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T8_B_ExecuteRemoteRestartClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Pic5 = GUICtrlCreatePic("" & $aFolderTemp & "zombie3.jpg", 696, 94, 125, 353)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic5Click")
		Global $Tab9 = GUICtrlCreateTabItem("9 Future-Proof")
		Global $Group15 = GUICtrlCreateGroup("Future Proof", 26, 74, 849, 427)
		GUICtrlSetFont(-1, 10, 400, 0, "arial")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		Global $Label93 = GUICtrlCreateLabel("During updates, The Fun Pimps sometimes make changes to the ServerConfig.xml file, which can cause the server to fail to start when using the old config file." & @CRLF & "  This section is a best-effort attempt to temporarily adjust to those changes during server updates to keep your server running." & @CRLF & "  If automatic import enabled above, this utility will attempt two reboots. If The server fails to boot after the second reboot," & @CRLF & "  it will backup of your existing serverconfig file (as listed in Game Server Configuration section)," & @CRLF & "  copy the contents from the new ServerConfig.xml, import data from your existing config file, and add this data" & @CRLF & "  to your serverconfig file (as listed above) at the end of the file." & @CRLF & "Therefore, after an update, it is recommended that you review your config file and make any changes." & @CRLF & "The following parameters will be imported:" & @CRLF & "  ServerName, ServerPort, ServerPassword, TelnetPort, TelnetPassword, ServerLoginConfirmationText, ServerMaxPlayerCount, ServerDescription," & @CRLF & "  ServerWebsiteURL,, ServerDisabledNetworkProtocols, GameWorld, WorldGenSeed, WorldGenSize, GameName, GameDifficulty, ServerLoginConfirmationText, DropOnDeath" & @CRLF & "", 42, 272, 7463, 20)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label93Click")
		Global $W1_T9_C_EnableFutureProof = GUICtrlCreateCheckbox("Enable Future Proof", 48, 108, 149, 29)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T9_C_EnableFutureProofClick")
		Global $Label94 = GUICtrlCreateLabel("After a server update, if the server crashes three times in-a-row,", 52, 176, 374, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label94Click")
		Global $Label95 = GUICtrlCreateLabel("Future Proof will use the new default ServerConfig.xml and add your server's essential parameters.", 79, 197, 582, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label95Click")
		Global $Label96 = GUICtrlCreateLabel("This is useful when The Fun Pimps change the ServerConfig.xml ", 79, 219, 384, 20)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label96Click")
		Global $W1_T9_C_RenameModFolder = GUICtrlCreateCheckbox("Rename the Mod Folder (therefore saving and disabling it) if Future Proof was needed.", 64, 140, 529, 29)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T9_C_RenameModFolderClick")
		GUICtrlCreateGroup("", -99, -99, 1, 1)
		Global $Tab10 = GUICtrlCreateTabItem("10 FINISH / SAVE")
		Global $Pic7 = GUICtrlCreatePic("" & $aFolderTemp & "zombieGroup.jpg", 104, 314, 637, 197)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Pic7Click")
		Global $Label98 = GUICtrlCreateLabel("Click to restart the utility with your new settings.", 213, 102, 459, 29)
		GUICtrlSetFont(-1, 16, 800, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label98Click")
		Global $W1_T10_B_RestartUtil = GUICtrlCreateButton("RESTART Util", 293, 142, 115, 29)
		GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xF3E747)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T10_B_RestartUtilClick")
		Global $W1_T10_B_ExitNoRestart = GUICtrlCreateButton("Exit without Restarting Util", 345, 210, 167, 25)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T10_B_ExitNoRestartClick")
		Global $Label99 = GUICtrlCreateLabel("(Warning! Some settings will not take effect until utility and/or server are restarted)", 201, 250, 479, 20, $SS_CENTER)
		GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "Label99Click")
		Global $W1_T10_B_RestartBoth = GUICtrlCreateButton("RESTART Util && SERVER", 427, 142, 179, 29)
		GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
		GUICtrlSetBkColor(-1, 0xFF4A4A)
		GUICtrlSetResizing(-1, $GUI_DOCKLEFT + $GUI_DOCKTOP + $GUI_DOCKWIDTH + $GUI_DOCKHEIGHT)
		GUICtrlSetOnEvent(-1, "W1_T10_B_RestartBothClick")
		GUICtrlCreateTabItem("")
		GUISetState(@SW_SHOW)
		#EndRegion ### END Koda GUI section ###
		_UpdateWindowConfig()
		If WinExists($wGUIMainWindow) Then
		Else
			While $aConfigWindowClose = False
				Sleep(100)
			WEnd
			GUIDelete($Config)
			$aConfigWindowClose = False
		EndIf
	EndIf
EndFunc   ;==>GUI_Config
Func _UpdateWindowConfig()
	GUICtrlSetData($W1_T1_I_BackupOutFolder, $aBackupOutputFolder)
	GUICtrlSetData($W1_T1_I_ConfigFile, $aConfigFile)
	GUICtrlSetData($W1_T1_I_DIR, $aServerDirLocal)
	GUICtrlSetData($W1_T1_I_IP, $aServerIP)
	If StringInStr($aBackupHours, "00") Then GUICtrlSetState($W1_T1_C_00, $GUI_CHECKED)
	If StringInStr($aBackupHours, "01") Then GUICtrlSetState($W1_T1_C_01, $GUI_CHECKED)
	If StringInStr($aBackupHours, "02") Then GUICtrlSetState($W1_T1_C_02, $GUI_CHECKED)
	If StringInStr($aBackupHours, "03") Then GUICtrlSetState($W1_T1_C_03, $GUI_CHECKED)
	If StringInStr($aBackupHours, "04") Then GUICtrlSetState($W1_T1_C_04, $GUI_CHECKED)
	If StringInStr($aBackupHours, "05") Then GUICtrlSetState($W1_T1_C_05, $GUI_CHECKED)
	If StringInStr($aBackupHours, "06") Then GUICtrlSetState($W1_T1_C_06, $GUI_CHECKED)
	If StringInStr($aBackupHours, "07") Then GUICtrlSetState($W1_T1_C_07, $GUI_CHECKED)
	If StringInStr($aBackupHours, "08") Then GUICtrlSetState($W1_T1_C_08, $GUI_CHECKED)
	If StringInStr($aBackupHours, "09") Then GUICtrlSetState($W1_T1_C_09, $GUI_CHECKED)
	If StringInStr($aBackupHours, "10") Then GUICtrlSetState($W1_T1_C_10, $GUI_CHECKED)
	If StringInStr($aBackupHours, "11") Then GUICtrlSetState($W1_T1_C_11, $GUI_CHECKED)
	If StringInStr($aBackupHours, "12") Then GUICtrlSetState($W1_T1_C_12, $GUI_CHECKED)
	If StringInStr($aBackupHours, "13") Then GUICtrlSetState($W1_T1_C_13, $GUI_CHECKED)
	If StringInStr($aBackupHours, "14") Then GUICtrlSetState($W1_T1_C_14, $GUI_CHECKED)
	If StringInStr($aBackupHours, "15") Then GUICtrlSetState($W1_T1_C_15, $GUI_CHECKED)
	If StringInStr($aBackupHours, "16") Then GUICtrlSetState($W1_T1_C_16, $GUI_CHECKED)
	If StringInStr($aBackupHours, "17") Then GUICtrlSetState($W1_T1_C_17, $GUI_CHECKED)
	If StringInStr($aBackupHours, "18") Then GUICtrlSetState($W1_T1_C_18, $GUI_CHECKED)
	If StringInStr($aBackupHours, "19") Then GUICtrlSetState($W1_T1_C_19, $GUI_CHECKED)
	If StringInStr($aBackupHours, "20") Then GUICtrlSetState($W1_T1_C_20, $GUI_CHECKED)
	If StringInStr($aBackupHours, "21") Then GUICtrlSetState($W1_T1_C_21, $GUI_CHECKED)
	If StringInStr($aBackupHours, "22") Then GUICtrlSetState($W1_T1_C_22, $GUI_CHECKED)
	If StringInStr($aBackupHours, "23") Then GUICtrlSetState($W1_T1_C_23, $GUI_CHECKED)
	If StringInStr($aBackupDays, "0") Then
		GUICtrlSetState($W1_T1_C_Daily, $GUI_CHECKED)
		GUICtrlSetState($W1_T1_C_Sun, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Mon, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Tues, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Wed, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Thurs, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Fri, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Sat, $GUI_CHECKED + $GUI_DISABLE)
	Else
		If StringInStr($aBackupDays, "1") Then GUICtrlSetState($W1_T1_C_Sun, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "2") Then GUICtrlSetState($W1_T1_C_Mon, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "3") Then GUICtrlSetState($W1_T1_C_Tues, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "4") Then GUICtrlSetState($W1_T1_C_Wed, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "5") Then GUICtrlSetState($W1_T1_C_Thurs, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "6") Then GUICtrlSetState($W1_T1_C_Fri, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "7") Then GUICtrlSetState($W1_T1_C_Sat, $GUI_CHECKED + $GUI_ENABLE)
	EndIf
	GUICtrlSetData($W1_T1_I_UpdateMinutes, $aUpdateCheckInterval)
	If $aUpdateSource = "0" Then GUICtrlSetState($W1_T1_R_UpdateViaSteamCMD, $GUI_CHECKED)
	If $aUpdateSource = "1" Then GUICtrlSetState($W1_T1_R_UpdateViaSteamDB, $GUI_CHECKED)
	GUICtrlSetData($W1_T1_I_BackupCm, $aBackupCommandLine)
	GUICtrlSetData($W1_T1_I_BackupCmd, $aBackupAddedFolders)
	GUICtrlSetData($W1_T1_I_BackupFullEvery, $aBackupFull)
	GUICtrlSetData($W1_T1_I_BackupMaxWaitSec, $aBackupTimeoutSec)
	GUICtrlSetData($W1_T1_I_BackupMin, $aBackupMin)
	GUICtrlSetData($W1_T1_I_BackupNumberToKeep, $aBackupNumberToKeep)
	If $aCheckForUpdate = "yes" Then
		GUICtrlSetState($W1_T1_C_ServerUpdateCheck, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T1_C_ServerUpdateCheck, $GUI_CHECKED)
	EndIf
	GUICtrlSetData($W1_T1_I_SteamPassword, $aSteamCMDPassword)
	GUICtrlSetData($W1_T1_I_SteamUsername, $aSteamCMDUserName)
	If $aServerVer = "public" Then
		GUICtrlSetState($W1_T1_R_BranchPublic, $GUI_CHECKED)
		GUICtrlSetData($W1_T1_I_SteamBranch, "")
	ElseIf $aServerVer = "latest_experimental" Then
		GUICtrlSetState($W1_T1_R_BranchExperimental, $GUI_CHECKED)
		GUICtrlSetData($W1_T1_I_SteamBranch, "")
	Else
		GUICtrlSetState($W1_T1_R_BranchManual, $GUI_CHECKED)
		GUICtrlSetData($W1_T1_I_SteamBranch, $aServerVer)
	EndIf
	If $aValidate = "no" Then
		GUICtrlSetState($W1_T1_R_NOValidate, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T1_R_Validate, $GUI_CHECKED)
	EndIf
	GUICtrlSetData($W1_T1_E_Commandline, $aSteamUpdateCommandline)
	GUICtrlSetData($W1_T2_I_RestartExcessiveMemoryAmt, $aExMemAmt)
	If $aExMemRestart = "yes" Then
		GUICtrlSetState($W1_T2_C_RestartExcessiveMemory, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T2_C_RestartExcessiveMemory, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($W1_T2_E_PauseForMapGeneration, $aWatchdogWaitServerUpdate)
	GUICtrlSetData($W1_T2_I_FailedResponses, $aWatchdogAttemptsBeforeRestart)
	GUICtrlSetData($W1_T2_I_PauseForStarted, $aWatchdogWaitServerStart)
	If $aTelnetStayConnectedYN = "yes" Then
		GUICtrlSetState($W1_T2_C_TelnetStayConnected, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T2_C_TelnetStayConnected, $GUI_UNCHECKED)
	EndIf
	If $aQueryYN = "yes" Then
		GUICtrlSetState($W1_T2_C_UseQuery, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T2_C_UseQuery, $GUI_UNCHECKED)
	EndIf
	If $aTelnetCheckYN = "yes" Then
		GUICtrlSetState($W1_T2_C_UseTelnet, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T2_C_UseTelnet, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($W1_T2_E_PauseForMapGeneration, $aWatchdogWaitServerUpdate)
	GUICtrlSetData($W1_T2_I_QueryCheckEvery, $aQueryCheckSec)
	GUICtrlSetData($W1_T2_I_QueryIP, $aQueryIP)
	GUICtrlSetData($W1_T2_I_TelnetCheckEvery, $aTelnetCheckSec)
	GUICtrlSetData($W1_T2_I_TelnetIP, $aTelnetIP)
	If StringInStr($bRestartHours, "00") Then GUICtrlSetState($W1_T3_C_00, $GUI_CHECKED)
	If StringInStr($bRestartHours, "01") Then GUICtrlSetState($W1_T3_C_01, $GUI_CHECKED)
	If StringInStr($bRestartHours, "02") Then GUICtrlSetState($W1_T3_C_02, $GUI_CHECKED)
	If StringInStr($bRestartHours, "03") Then GUICtrlSetState($W1_T3_C_03, $GUI_CHECKED)
	If StringInStr($bRestartHours, "04") Then GUICtrlSetState($W1_T3_C_04, $GUI_CHECKED)
	If StringInStr($bRestartHours, "05") Then GUICtrlSetState($W1_T3_C_05, $GUI_CHECKED)
	If StringInStr($bRestartHours, "06") Then GUICtrlSetState($W1_T3_C_06, $GUI_CHECKED)
	If StringInStr($bRestartHours, "07") Then GUICtrlSetState($W1_T3_C_07, $GUI_CHECKED)
	If StringInStr($bRestartHours, "08") Then GUICtrlSetState($W1_T3_C_08, $GUI_CHECKED)
	If StringInStr($bRestartHours, "09") Then GUICtrlSetState($W1_T3_C_09, $GUI_CHECKED)
	If StringInStr($bRestartHours, "10") Then GUICtrlSetState($W1_T3_C_10, $GUI_CHECKED)
	If StringInStr($bRestartHours, "11") Then GUICtrlSetState($W1_T3_C_11, $GUI_CHECKED)
	If StringInStr($bRestartHours, "12") Then GUICtrlSetState($W1_T3_C_12, $GUI_CHECKED)
	If StringInStr($bRestartHours, "13") Then GUICtrlSetState($W1_T3_C_13, $GUI_CHECKED)
	If StringInStr($bRestartHours, "14") Then GUICtrlSetState($W1_T3_C_14, $GUI_CHECKED)
	If StringInStr($bRestartHours, "15") Then GUICtrlSetState($W1_T3_C_15, $GUI_CHECKED)
	If StringInStr($bRestartHours, "16") Then GUICtrlSetState($W1_T3_C_16, $GUI_CHECKED)
	If StringInStr($bRestartHours, "17") Then GUICtrlSetState($W1_T3_C_17, $GUI_CHECKED)
	If StringInStr($bRestartHours, "18") Then GUICtrlSetState($W1_T3_C_18, $GUI_CHECKED)
	If StringInStr($bRestartHours, "19") Then GUICtrlSetState($W1_T3_C_19, $GUI_CHECKED)
	If StringInStr($bRestartHours, "20") Then GUICtrlSetState($W1_T3_C_20, $GUI_CHECKED)
	If StringInStr($bRestartHours, "21") Then GUICtrlSetState($W1_T3_C_21, $GUI_CHECKED)
	If StringInStr($bRestartHours, "22") Then GUICtrlSetState($W1_T3_C_22, $GUI_CHECKED)
	If StringInStr($bRestartHours, "23") Then GUICtrlSetState($W1_T3_C_23, $GUI_CHECKED)
	If StringInStr($aBackupDays, "0") Then
		GUICtrlSetState($W1_T3_C_Daily, $GUI_CHECKED)
		GUICtrlSetState($W1_T3_C_Sun, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Mon, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Tues, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Wed, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Thur, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Fri, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Sat, $GUI_CHECKED + $GUI_DISABLE)
	Else
		If StringInStr($aBackupDays, "1") Then GUICtrlSetState($W1_T3_C_Sun, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "2") Then GUICtrlSetState($W1_T3_C_Mon, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "3") Then GUICtrlSetState($W1_T3_C_Tues, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "4") Then GUICtrlSetState($W1_T3_C_Wed, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "5") Then GUICtrlSetState($W1_T3_C_Thur, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "6") Then GUICtrlSetState($W1_T3_C_Fri, $GUI_CHECKED + $GUI_ENABLE)
		If StringInStr($aBackupDays, "7") Then GUICtrlSetState($W1_T3_C_Sat, $GUI_CHECKED + $GUI_ENABLE)
	EndIf
	If $aAppendVerEnd = "yes" Then
		GUICtrlSetState($W1_T3_C_AppendAfter, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_C_AppendAfter, $GUI_UNCHECKED)
	EndIf
	If $aAppendVerBegin = "yes" Then
		GUICtrlSetState($W1_T3_C_AppendBefore, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_C_AppendBefore, $GUI_UNCHECKED)
	EndIf
	If $aWipeServer = "yes" Then
		GUICtrlSetState($W1_T3_C_RenameGameSave, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_C_RenameGameSave, $GUI_UNCHECKED)
	EndIf
	If $aRemoteRestartUse = "yes" Then
		GUICtrlSetState($W1_T3_C_EnableRemoteRestart, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_C_EnableRemoteRestart, $GUI_UNCHECKED)
	EndIf
	If $aAppendVerShort = "long" Then
		GUICtrlSetState($W1_T3_R_AppendLong, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_R_AppendShort, $GUI_CHECKED)
	EndIf
	GUICtrlSetData($W1_T3_I_RemoteRestartCode, $aRemoteRestartCode)
	GUICtrlSetData($W1_T3_I_RemoteRestartKey, $aRemoteRestartKey)
	GUICtrlSetData($W1_T3_I_RemoteRestartPort, $aRemoteRestartPort)
	GUICtrlSetData($W1_T3_I_RestartMinute, $bRestartMin)
	If $aBackupYN = "yes" Then
		GUICtrlSetState($W1_T1_C_Enable, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T1_C_Enable, $GUI_UNCHECKED)
	EndIf

	If $aRemoteRestartUse = "yes" Then
		GUICtrlSetState($W1_T3_C_EnableRestart, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T3_C_EnableRestart, $GUI_UNCHECKED)
	EndIf
	If $sInGameAnnounce = "yes" Then
		GUICtrlSetState($W1_T4_C_AnnounceInGame, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T4_C_AnnounceInGame, $GUI_UNCHECKED)
	EndIf
	If $aServerOnlinePlayerYN = "yes" Then
		GUICtrlSetState($W1_T4_C_LogOnlinePlayers, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T4_C_LogOnlinePlayers, $GUI_UNCHECKED)
	EndIf
	Local $tArray = StringSplit($sAnnounceNotifyTime1, ",")
	If @error Then
		If $sAnnounceNotifyTime1 = "1" Then GUICtrlSetState($W1_T4_C_Daily01, $GUI_CHECKED)
		If $sAnnounceNotifyTime1 = "2" Then GUICtrlSetState($W1_T4_C_Daily02, $GUI_CHECKED)
		If $sAnnounceNotifyTime1 = "3" Then GUICtrlSetState($W1_T4_C_Daily03, $GUI_CHECKED)
		If $sAnnounceNotifyTime1 = "5" Then GUICtrlSetState($W1_T4_C_Daily05, $GUI_CHECKED)
		If $sAnnounceNotifyTime1 = "10" Then GUICtrlSetState($W1_T4_C_Daily10, $GUI_CHECKED)
		If $sAnnounceNotifyTime1 = "15" Then GUICtrlSetState($W1_T4_C_Daily15, $GUI_CHECKED)
	Else
		For $i = 1 To $tArray[0]
			If $tArray[$i] = "1" Then GUICtrlSetState($W1_T4_C_Daily01, $GUI_CHECKED)
			If $tArray[$i] = "2" Then GUICtrlSetState($W1_T4_C_Daily02, $GUI_CHECKED)
			If $tArray[$i] = "3" Then GUICtrlSetState($W1_T4_C_Daily03, $GUI_CHECKED)
			If $tArray[$i] = "5" Then GUICtrlSetState($W1_T4_C_Daily05, $GUI_CHECKED)
			If $tArray[$i] = "10" Then GUICtrlSetState($W1_T4_C_Daily10, $GUI_CHECKED)
			If $tArray[$i] = "15" Then GUICtrlSetState($W1_T4_C_Daily15, $GUI_CHECKED)
		Next
	EndIf
	Local $tArray = StringSplit($sAnnounceNotifyTime2, ",")
	If @error Then
		If $sAnnounceNotifyTime2 = "1" Then GUICtrlSetState($W1_T4_C_Update01, $GUI_CHECKED)
		If $sAnnounceNotifyTime2 = "2" Then GUICtrlSetState($W1_T4_C_Update02, $GUI_CHECKED)
		If $sAnnounceNotifyTime2 = "3" Then GUICtrlSetState($W1_T4_C_Update03, $GUI_CHECKED)
		If $sAnnounceNotifyTime2 = "5" Then GUICtrlSetState($W1_T4_C_Update05, $GUI_CHECKED)
		If $sAnnounceNotifyTime2 = "10" Then GUICtrlSetState($W1_T4_C_Update10, $GUI_CHECKED)
		If $sAnnounceNotifyTime2 = "15" Then GUICtrlSetState($W1_T4_C_Update15, $GUI_CHECKED)
	Else
		For $i = 1 To $tArray[0]
			If $tArray[$i] = "1" Then GUICtrlSetState($W1_T4_C_Update01, $GUI_CHECKED)
			If $tArray[$i] = "2" Then GUICtrlSetState($W1_T4_C_Update02, $GUI_CHECKED)
			If $tArray[$i] = "3" Then GUICtrlSetState($W1_T4_C_Update03, $GUI_CHECKED)
			If $tArray[$i] = "5" Then GUICtrlSetState($W1_T4_C_Update05, $GUI_CHECKED)
			If $tArray[$i] = "10" Then GUICtrlSetState($W1_T4_C_Update10, $GUI_CHECKED)
			If $tArray[$i] = "15" Then GUICtrlSetState($W1_T4_C_Update15, $GUI_CHECKED)
		Next
	EndIf
	Local $tArray = StringSplit($sAnnounceNotifyTime3, ",")
	If @error Then
		If $sAnnounceNotifyTime3 = "1" Then GUICtrlSetState($W1_T4_C_Remote01, $GUI_CHECKED)
		If $sAnnounceNotifyTime3 = "2" Then GUICtrlSetState($W1_T4_C_Remote02, $GUI_CHECKED)
		If $sAnnounceNotifyTime3 = "3" Then GUICtrlSetState($W1_T4_C_Remote03, $GUI_CHECKED)
		If $sAnnounceNotifyTime3 = "5" Then GUICtrlSetState($W1_T4_C_Remote05, $GUI_CHECKED)
		If $sAnnounceNotifyTime3 = "10" Then GUICtrlSetState($W1_T4_C_Remote10, $GUI_CHECKED)
		If $sAnnounceNotifyTime3 = "15" Then GUICtrlSetState($W1_T4_C_Remote15, $GUI_CHECKED)
	Else
		For $i = 1 To $tArray[0]
			If $tArray[$i] = "1" Then GUICtrlSetState($W1_T4_C_Remote01, $GUI_CHECKED)
			If $tArray[$i] = "2" Then GUICtrlSetState($W1_T4_C_Remote02, $GUI_CHECKED)
			If $tArray[$i] = "3" Then GUICtrlSetState($W1_T4_C_Remote03, $GUI_CHECKED)
			If $tArray[$i] = "5" Then GUICtrlSetState($W1_T4_C_Remote05, $GUI_CHECKED)
			If $tArray[$i] = "10" Then GUICtrlSetState($W1_T4_C_Remote10, $GUI_CHECKED)
			If $tArray[$i] = "15" Then GUICtrlSetState($W1_T4_C_Remote15, $GUI_CHECKED)
		Next
	EndIf
	GUICtrlSetData($W1_T4_I_UpdateMins, $sAnnounceNotifyTime2)
	GUICtrlSetData($W1_T4_I_UpdateRemote, $sAnnounceNotifyTime3)
	GUICtrlSetData($W1_T4_I_DailyMins, $sAnnounceNotifyTime1)
	GUICtrlSetData($W1_T4_I_AnnounceDaily, $sInGameDailyMessage)
	GUICtrlSetData($W1_T4_I_AnnounceRemote, $sInGameRemoteRestartMessage)
	GUICtrlSetData($W1_T4_I_AnnounceUpdate, $sInGameUpdateMessage)
	GUICtrlSetData($W1_T4_I_BackupStarted, $aBackupInGame)
	GUICtrlSetData($W1_T4_I_LogOnlinePlaySeconds, $aServerOnlinePlayerSec)
	If $aServerDiscord1TTSYN = "yes" Then
		GUICtrlSetState($W1_T5_C_D1TTS, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_D1TTS, $GUI_UNCHECKED)
	EndIf
	If $aServerDiscord2TTSYN = "yes" Then
		GUICtrlSetState($W1_T5_C_D2TTS, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_D2TTS, $GUI_UNCHECKED)
	EndIf
	If $aServerDiscord3TTSYN = "yes" Then
		GUICtrlSetState($W1_T5_C_D3TTS, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_D3TTS, $GUI_UNCHECKED)
	EndIf
	If $aServerDiscord4TTSYN = "yes" Then
		GUICtrlSetState($W1_T5_C_D4TTS, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_D4TTS, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelChat, "1") Then
		GUICtrlSetState($W1_T5_C_WHChat1, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHChat1, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelChat, "2") Then
		GUICtrlSetState($W1_T5_C_WHChat2, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHChat2, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelChat, "3") Then
		GUICtrlSetState($W1_T5_C_WHChat3, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHChat3, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelChat, "4") Then
		GUICtrlSetState($W1_T5_C_WHChat4, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHChat4, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelDie, "1") Then
		GUICtrlSetState($W1_T5_C_WHDie1, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHDie1, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelDie, "2") Then
		GUICtrlSetState($W1_T5_C_WHDie2, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHDie2, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelDie, "3") Then
		GUICtrlSetState($W1_T5_C_WHDie3, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHDie3, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelDie, "4") Then
		GUICtrlSetState($W1_T5_C_WHDie4, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHDie4, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelPlayers, "1") Then
		GUICtrlSetState($W1_T5_C_WHOnline1, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHOnline1, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelPlayers, "2") Then
		GUICtrlSetState($W1_T5_C_WHOnline2, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHOnline2, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelPlayers, "3") Then
		GUICtrlSetState($W1_T5_C_WHOnline3, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHOnline3, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelPlayers, "4") Then
		GUICtrlSetState($W1_T5_C_WHOnline4, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHOnline4, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelStatus, "1") Then
		GUICtrlSetState($W1_T5_C_WHRestart1, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHRestart1, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelStatus, "2") Then
		GUICtrlSetState($W1_T5_C_WHRestart2, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHRestart2, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelStatus, "3") Then
		GUICtrlSetState($W1_T5_C_WHRestart3, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHRestart3, $GUI_UNCHECKED)
	EndIf
	If StringInStr($aServerDiscordWHSelStatus, "4") Then
		GUICtrlSetState($W1_T5_C_WHRestart4, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T5_C_WHRestart4, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($W1_T5_I_D1Avatar, $aServerDiscord1Avatar)
	GUICtrlSetData($W1_T5_I_D2Avatar, $aServerDiscord2Avatar)
	GUICtrlSetData($W1_T5_I_D3Avatar, $aServerDiscord3Avatar)
	GUICtrlSetData($W1_T5_I_D4Avatar, $aServerDiscord4Avatar)
	GUICtrlSetData($W1_T5_I_D1Bot, $aServerDiscord1BotName)
	GUICtrlSetData($W1_T5_I_D2Bot, $aServerDiscord2BotName)
	GUICtrlSetData($W1_T5_I_D3Bot, $aServerDiscord3BotName)
	GUICtrlSetData($W1_T5_I_D4Bot, $aServerDiscord4BotName)
	GUICtrlSetData($W1_T5_I_D1URL, $aServerDiscord1URL)
	GUICtrlSetData($W1_T5_I_D2URL, $aServerDiscord2URL)
	GUICtrlSetData($W1_T5_I_D3URL, $aServerDiscord3URL)
	GUICtrlSetData($W1_T5_I_D4URL, $aServerDiscord4URL)
	If $sUseDiscordBotServersUpYN = "yes" Then
		GUICtrlSetState($W1_T6_C_BackOnline, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_BackOnline, $GUI_UNCHECKED)
	EndIf
	If $aBackupSendDiscordYN = "yes" Then
		GUICtrlSetState($W1_T6_C_BackupStarted, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_BackupStarted, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotDaily = "yes" Then
		GUICtrlSetState($W1_T6_C_Daily, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_Daily, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotFirstAnnouncement = "yes" Then
		GUICtrlSetState($W1_T6_C_FirstAnnounceOnly, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_FirstAnnounceOnly, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotPlayerChangeYN = "yes" Then
		GUICtrlSetState($W1_T6_C_PlayerChange, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_PlayerChange, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotPlayerChatYN = "yes" Then
		GUICtrlSetState($W1_T6_C_PlayerChat, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_PlayerChat, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotPlayerDiedYN = "yes" Then
		GUICtrlSetState($W1_T6_C_PlayerDie, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_PlayerDie, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotRemoteRestart = "yes" Then
		GUICtrlSetState($W1_T6_C_Remote, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_Remote, $GUI_UNCHECKED)
	EndIf
	If $sUseDiscordBotUpdate = "yes" Then
		GUICtrlSetState($W1_T6_C_Update, $GUI_CHECKED)
	Else
		GUICtrlSetState($W1_T6_C_Update, $GUI_UNCHECKED)
	EndIf
	GUICtrlSetData($W1_T6_I_BackupStarted, $aBackupDiscord)
	GUICtrlSetData($W1_T6_I_Daily, $sDiscordDailyMessage)
	GUICtrlSetData($W1_T6_I_PlayerChange, $sDiscordPlayersMsg)
	GUICtrlSetData($W1_T6_I_PlayerChat, $sDiscordPlayerChatMsg)
	GUICtrlSetData($W1_T6_I_PlayerDie, $sDiscordPlayerDiedMsg)
	GUICtrlSetData($W1_T6_I_Remote, $sDiscordRemoteRestartMessage)
	GUICtrlSetData($W1_T6_I_SubJoined, $sDiscordPlayerJoinMsg)
	GUICtrlSetData($W1_T6_I_SubLeft, $sDiscordPlayerLeftMsg)
	GUICtrlSetData($W1_T6_I_SubOnlinePlayer, $sDiscordPlayerOnlineMsg)
	GUICtrlSetData($W1_T6_I_Update, $sDiscordUpdateMessage)
	GUICtrlSetData($W1_T6_I_BackOnline, $sDiscordServersUpMessage)
EndFunc   ;==>_UpdateWindowConfig
Func _BackupTimeCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$aBackupHours = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup hours (comma separated 00-23 ex.04,16) ###", "00,06,12,18")
		$aBackupHours = _SortString($aBackupHours & "," & $tTxt, "D")
	Else
		$aBackupHours = _RemoveFromStringCommaSeparated($aBackupHours, $tTxt, "SD")
	EndIf
	If $aBackupHours = "" Then $aBackupHours = "00"
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup hours (comma separated 00-23 ex.04,16) ###", $aBackupHours)
EndFunc   ;==>_BackupTimeCB
Func _BackupDayCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$aBackupDays = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", "0")
		$aBackupDays = _SortString($aBackupDays & "," & $tTxt)
	Else
		$aBackupDays = _RemoveFromStringCommaSeparated($aBackupDays, $tTxt, "SND")
	EndIf
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aBackupDays)
EndFunc   ;==>_BackupDayCB
Func ConfigClose()
	If WinExists($wGUIMainWindow) Then
		GUIDelete($Config)
	Else
		$aConfigWindowClose = True
	EndIf
EndFunc   ;==>ConfigClose
Func ConfigTabWindowChange()

EndFunc   ;==>ConfigTabWindowChange
Func W1_T1_B_BackupOutFolderClick()
	Local $tCtrlID = $W1_T1_I_BackupOutFolder
	Local $tInput = FileSelectFolder("Please select Backup Output Folder", $aBackupOutputFolder, 7, @ScriptDir)
	If @error Then
		Local $tRead = GUICtrlRead($tCtrlID)
		GUICtrlSetData($tCtrlID, $tRead)
	Else
		GUICtrlSetData($tCtrlID, $tInput)
	EndIf
	$aBackupOutputFolder = GUICtrlRead($tCtrlID)
	$aBackupOutputFolder = RemoveInvalidCharacters($aBackupOutputFolder)
	$aBackupOutputFolder = RemoveTrailingSlash($aBackupOutputFolder)
	GUICtrlSetData($tCtrlID, $aBackupOutputFolder)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Output folder ###", $aBackupOutputFolder)
EndFunc   ;==>W1_T1_B_BackupOutFolderClick
Func W1_T1_B_ResetCMDClick()
	_SteamCMDCreate()
	GUICtrlSetData($W1_T1_E_Commandline, $aSteamUpdateCommandline)
EndFunc   ;==>W1_T1_B_ResetCMDClick
Func W1_T1_B_ConfigClick()
	Local $tCtrlID = $W1_T1_I_ConfigFile
	Local $tInput = FileOpenDialog("Please select config file", $aServerDirLocal, "XML File (*.xml)", 3, $aConfigFile)
	If @error Then
		Local $tRead = GUICtrlRead($tCtrlID)
		GUICtrlSetData($tCtrlID, $tRead)
	Else
		GUICtrlSetData($tCtrlID, $tInput)
	EndIf
	$aConfigFile = GUICtrlRead($tCtrlID)
	$aConfigFile = StringRegExpReplace($aConfigFile, "^.*\\", "")
	$aConfigFile = RemoveInvalidCharacters($aConfigFile)
	$aConfigFile = RemoveTrailingSlash($aConfigFile)
	GUICtrlSetData($tCtrlID, $aConfigFile)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $aConfigFile)
EndFunc   ;==>W1_T1_B_ConfigClick
Func W1_T1_B_DIRClick()
	Local $tCtrlID = $W1_T1_I_DIR
	Local $tFile = $aServerDirLocal
	Local $tInput = FileSelectFolder("Please select server foler", $tFile)
	If @error Then
		Local $tRead = GUICtrlRead($tCtrlID)
		GUICtrlSetData($tCtrlID, $tRead)
	Else
		GUICtrlSetData($tCtrlID, $tInput)
	EndIf
	$tFile = GUICtrlRead($tCtrlID)
	$tFile = RemoveInvalidCharacters($tFile)
	$tFile = RemoveTrailingSlash($tFile)
	GUICtrlSetData($tCtrlID, $tFile)
	$aServerDirLocal = $tFile
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $aServerDirLocal)
EndFunc   ;==>W1_T1_B_DIRClick
Func W1_T1_B_ImportSettingsClick()
	_ImportServerConfig()
;~ 	ConfigClose()
	_Splash("7DTD Config Import Updated.", 750)
;~ 	GUI_Config()
EndFunc   ;==>W1_T1_B_ImportSettingsClick
Func W1_T1_C_00Click()
	_BackupTimeCB($W1_T1_C_00, "00")
EndFunc   ;==>W1_T1_C_00Click
Func W1_T1_C_01Click()
	_BackupTimeCB($W1_T1_C_01, "01")
EndFunc   ;==>W1_T1_C_01Click
Func W1_T1_C_02Click()
	_BackupTimeCB($W1_T1_C_02, "02")
EndFunc   ;==>W1_T1_C_02Click
Func W1_T1_C_03Click()
	_BackupTimeCB($W1_T1_C_03, "03")
EndFunc   ;==>W1_T1_C_03Click
Func W1_T1_C_04Click()
	_BackupTimeCB($W1_T1_C_04, "04")
EndFunc   ;==>W1_T1_C_04Click
Func W1_T1_C_05Click()
	_BackupTimeCB($W1_T1_C_05, "05")
EndFunc   ;==>W1_T1_C_05Click
Func W1_T1_C_06Click()
	_BackupTimeCB($W1_T1_C_06, "06")
EndFunc   ;==>W1_T1_C_06Click
Func W1_T1_C_07Click()
	_BackupTimeCB($W1_T1_C_07, "07")
EndFunc   ;==>W1_T1_C_07Click
Func W1_T1_C_08Click()
	_BackupTimeCB($W1_T1_C_08, "08")
EndFunc   ;==>W1_T1_C_08Click
Func W1_T1_C_09Click()
	_BackupTimeCB($W1_T1_C_09, "09")
EndFunc   ;==>W1_T1_C_09Click
Func W1_T1_C_10Click()
	_BackupTimeCB($W1_T1_C_10, "10")
EndFunc   ;==>W1_T1_C_10Click
Func W1_T1_C_11Click()
	_BackupTimeCB($W1_T1_C_11, "11")
EndFunc   ;==>W1_T1_C_11Click
Func W1_T1_C_12Click()
	_BackupTimeCB($W1_T1_C_12, "12")
EndFunc   ;==>W1_T1_C_12Click
Func W1_T1_C_13Click()
	_BackupTimeCB($W1_T1_C_13, "13")
EndFunc   ;==>W1_T1_C_13Click
Func W1_T1_C_14Click()
	_BackupTimeCB($W1_T1_C_14, "14")
EndFunc   ;==>W1_T1_C_14Click
Func W1_T1_C_15Click()
	_BackupTimeCB($W1_T1_C_15, "15")
EndFunc   ;==>W1_T1_C_15Click
Func W1_T1_C_16Click()
	_BackupTimeCB($W1_T1_C_16, "16")
EndFunc   ;==>W1_T1_C_16Click
Func W1_T1_C_17Click()
	_BackupTimeCB($W1_T1_C_17, "17")
EndFunc   ;==>W1_T1_C_17Click
Func W1_T1_C_18Click()
	_BackupTimeCB($W1_T1_C_18, "18")
EndFunc   ;==>W1_T1_C_18Click
Func W1_T1_C_19Click()
	_BackupTimeCB($W1_T1_C_19, "19")
EndFunc   ;==>W1_T1_C_19Click
Func W1_T1_C_20Click()
	_BackupTimeCB($W1_T1_C_20, "20")
EndFunc   ;==>W1_T1_C_20Click
Func W1_T1_C_21Click()
	_BackupTimeCB($W1_T1_C_21, "21")
EndFunc   ;==>W1_T1_C_21Click
Func W1_T1_C_22Click()
	_BackupTimeCB($W1_T1_C_22, "22")
EndFunc   ;==>W1_T1_C_22Click
Func W1_T1_C_23Click()
	_BackupTimeCB($W1_T1_C_23, "23")
EndFunc   ;==>W1_T1_C_23Click
Func W1_T1_C_DailyClick()
	If GUICtrlRead($W1_T1_C_Daily) = $GUI_CHECKED Then
		GUICtrlSetState($W1_T1_C_Sun, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Mon, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Tues, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Wed, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Thurs, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Fri, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Sat, $GUI_CHECKED + $GUI_DISABLE)
		$aBackupDays = "0"
	Else
		GUICtrlSetState($W1_T1_C_Sun, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Mon, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Tues, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Wed, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Thurs, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Fri, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Sat, $GUI_CHECKED + $GUI_ENABLE)
		$aBackupDays = "1,2,3,4,5,6,7"
	EndIf
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aBackupDays)
EndFunc   ;==>W1_T1_C_DailyClick
Func W1_T1_C_FriClick()
	_BackupDayCB($W1_T1_C_Fri, "6")
EndFunc   ;==>W1_T1_C_FriClick
Func W1_T1_C_MonClick()
	_BackupDayCB($W1_T1_C_Mon, "2")
EndFunc   ;==>W1_T1_C_MonClick
Func W1_T1_C_SatClick()
	_BackupDayCB($W1_T1_C_Sat, "7")
EndFunc   ;==>W1_T1_C_SatClick
Func W1_T1_C_ServerUpdateCheckClick()
	If GUICtrlRead($W1_T1_C_ServerUpdateCheck) = $GUI_CHECKED Then
		$aCheckForUpdate = "yes"
	Else
		$aCheckForUpdate = "no"
	EndIf
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $aCheckForUpdate)
EndFunc   ;==>W1_T1_C_ServerUpdateCheckClick
Func W1_T1_C_SunClick()
	_BackupDayCB($W1_T1_C_Sun, "1")
EndFunc   ;==>W1_T1_C_SunClick
Func W1_T1_C_ThursClick()
	_BackupDayCB($W1_T1_C_Thurs, "5")
EndFunc   ;==>W1_T1_C_ThursClick
Func W1_T1_C_TuesClick()
	_BackupDayCB($W1_T1_C_Tues, "3")
EndFunc   ;==>W1_T1_C_TuesClick
Func W1_T1_C_WedClick()
	_BackupDayCB($W1_T1_C_Wed, "4")
EndFunc   ;==>W1_T1_C_WedClick
Func W1_T1_C_EnableClick()
	If GUICtrlRead($W1_T1_C_Enable) = $GUI_CHECKED Then
		$aBackupYN = "yes"
		GUICtrlSetState($W1_T1_C_Daily, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Sun, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Mon, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Tues, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Wed, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Thurs, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Fri, $GUI_ENABLE)
		GUICtrlSetState($W1_T1_C_Sat, $GUI_ENABLE)
	Else
		$aBackupYN = "no"
		GUICtrlSetState($W1_T1_C_Daily, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Sun, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Mon, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Tues, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Wed, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Thurs, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Fri, $GUI_DISABLE)
		GUICtrlSetState($W1_T1_C_Sat, $GUI_DISABLE)
	EndIf
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Use scheduled backups? (yes/no) ###", $aBackupYN)
EndFunc   ;==>W1_T1_C_EnableClick
Func W1_T1_E_CommandlineChange()
	$aSteamUpdateCommandline = GUICtrlRead($W1_T1_E_Commandline)
	_SteamCMDCommandlineWrite()
EndFunc   ;==>W1_T1_E_CommandlineChange
Func W1_T1_I_BackupCmChange()
	$aBackupCommandLine = GUICtrlRead($W1_T1_I_BackupCm)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "7zip backup additional command line parameters (Default: a -spf -r -tzip -ssw) ###", $aBackupCommandLine)
EndFunc   ;==>W1_T1_I_BackupCmChange
Func W1_T1_I_BackupCmdChange()
	$aBackupAddedFolders = GUICtrlRead($W1_T1_I_BackupCmd)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Additional backup folders / files (comma separated. Folders add \ at end. ex. C:\Atlas\,D:\Atlas Server\) ###", $aBackupAddedFolders)
EndFunc   ;==>W1_T1_I_BackupCmdChange
Func W1_T1_I_BackupFullEveryChange()
	$aBackupFull = GUICtrlRead($W1_T1_I_BackupFullEvery)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Full " & $aGameName1 & " and Util folder backup every __ backups (0 to disable)(0-99) ###", $aBackupFull)
EndFunc   ;==>W1_T1_I_BackupFullEveryChange
Func W1_T1_I_BackupMaxWaitSecChange()
	$aBackupTimeoutSec = GUICtrlRead($W1_T1_I_BackupMaxWaitSec)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Max time in seconds to wait for backup to complete (30-999) ###", $aBackupTimeoutSec)
EndFunc   ;==>W1_T1_I_BackupMaxWaitSecChange
Func W1_T1_I_BackupMinChange()
	$aBackupMin = GUICtrlRead($W1_T1_I_BackupMin)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Backup minute (00-59) ###", $aBackupMin)
EndFunc   ;==>W1_T1_I_BackupMinChange
Func W1_T1_I_BackupNumberToKeepChange()
	$aBackupNumberToKeep = GUICtrlRead($W1_T1_I_BackupNumberToKeep)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Number of backups to keep (1-999) ###", $aBackupNumberToKeep)
EndFunc   ;==>W1_T1_I_BackupNumberToKeepChange
Func W1_T1_I_BackupOutFolderChange()
	Local $tCtrlID = $W1_T1_I_BackupOutFolder
	$aBackupOutputFolder = GUICtrlRead($tCtrlID)
	$aBackupOutputFolder = RemoveInvalidCharacters($aBackupOutputFolder)
	$aBackupOutputFolder = RemoveTrailingSlash($aBackupOutputFolder)
	GUICtrlSetData($tCtrlID, $aBackupOutputFolder)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Output folder ###", $aBackupOutputFolder)
EndFunc   ;==>W1_T1_I_BackupOutFolderChange
Func W1_T1_I_ConfigFileChange()
	Local $tCtrlID = $W1_T1_I_ConfigFile
	$aConfigFile = GUICtrlRead($tCtrlID)
	$aConfigFile = FileGetShortName($aConfigFile)
	$aConfigFile = RemoveInvalidCharacters($aConfigFile)
	$aConfigFile = RemoveTrailingSlash($aConfigFile)
	GUICtrlSetData($tCtrlID, $aConfigFile)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $aConfigFile)
EndFunc   ;==>W1_T1_I_ConfigFileChange
Func W1_T1_I_DIRChange()
	Local $tCtrlID = $W1_T1_I_DIR
	Local $tFile = $aServerDirLocal
	$tFile = GUICtrlRead($tCtrlID)
	$tFile = RemoveInvalidCharacters($tFile)
	$tFile = RemoveTrailingSlash($tFile)
	GUICtrlSetData($tCtrlID, $tFile)
	$aServerDirLocal = $tFile
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $aServerDirLocal)
EndFunc   ;==>W1_T1_I_DIRChange
Func W1_T1_I_IPChange()
	Local $tCtrlID = $W1_T1_I_IP
	$tMsg = InputBox($aUtilName, "Local IP:", "Enter local IP", $tCtrlID, 400, 125, Default, Default, 360)
	GUICtrlSetData($tCtrlID, $tMsg)
	$aServerIP = $tFile
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $aServerIP)
EndFunc   ;==>W1_T1_I_IPChange
Func W1_T1_I_SteamBranchChange()
	$aServerVer = GUICtrlRead($W1_T1_I_SteamBranch)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
EndFunc   ;==>W1_T1_I_SteamBranchChange
Func W1_T1_I_SteamPasswordChange()
	$aSteamCMDPassword = GUICtrlRead($W1_T1_I_SteamPassword)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Password (optional) ###", $aSteamCMDPassword)
EndFunc   ;==>W1_T1_I_SteamPasswordChange
Func W1_T1_I_SteamUsernameChange()
	$aSteamCMDUserName = GUICtrlRead($W1_T1_I_SteamUsername)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD Username (optional) ###", $aSteamCMDUserName)
EndFunc   ;==>W1_T1_I_SteamUsernameChange
Func W1_T1_I_UpdateMinutesChange()
	$aUpdateCheckInterval = GUICtrlRead($W1_T1_I_UpdateMinutes)
	IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $aUpdateCheckInterval)
EndFunc   ;==>W1_T1_I_UpdateMinutesChange
Func W1_T1_R_BranchExperimentalClick()
	$aServerVer = "latest_experimental"
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
EndFunc   ;==>W1_T1_R_BranchExperimentalClick
Func W1_T1_R_BranchManualClick()
	$aServerVer = GUICtrlRead($W1_T1_I_SteamBranch)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
EndFunc   ;==>W1_T1_R_BranchManualClick
Func W1_T1_R_BranchPublicClick()
	$aServerVer = "public"
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
EndFunc   ;==>W1_T1_R_BranchPublicClick
Func W1_T1_R_NOValidateClick()
	$aValidate = "no"
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $aValidate)
EndFunc   ;==>W1_T1_R_NOValidateClick
Func W1_T1_R_UpdateViaSteamCMDClick()
	$aUpdateSource = "0"
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $aUpdateSource)
EndFunc   ;==>W1_T1_R_UpdateViaSteamCMDClick
Func W1_T1_R_UpdateViaSteamDBClick()
	$aUpdateSource = "1"
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $aUpdateSource)
EndFunc   ;==>W1_T1_R_UpdateViaSteamDBClick
Func W1_T1_R_ValidateClick()
	$aValidate = "yes"
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $aValidate)
EndFunc   ;==>W1_T1_R_ValidateClick
Func W1_T1_U_BackupFullEveryChange()
EndFunc   ;==>W1_T1_U_BackupFullEveryChange
Func W1_T1_U_BackupMaxSecToWaitChange()
EndFunc   ;==>W1_T1_U_BackupMaxSecToWaitChange
Func W1_T1_U_BackupMinuteChange()
EndFunc   ;==>W1_T1_U_BackupMinuteChange
Func W1_T1_U_BackupNumberToKeepChange()
EndFunc   ;==>W1_T1_U_BackupNumberToKeepChange
Func W1_T1_U_UpdateMinutesChange()
EndFunc   ;==>W1_T1_U_UpdateMinutesChange
Func W1_T10_B_ExitNoRestartClick()
	ConfigClose()
EndFunc   ;==>W1_T10_B_ExitNoRestartClick
Func W1_T10_B_RestartUtilClick()
	ConfigClose()
	_RestartUtil()
EndFunc   ;==>W1_T10_B_RestartUtilClick
Func W1_T10_B_RestartBothClick()
	ConfigClose()
	TrayRestartNow()
	_RestartUtil()
EndFunc   ;==>W1_T10_B_RestartBothClick
Func W1_T2_C_RestartExcessiveMemoryClick()
	If GUICtrlRead($W1_T2_C_RestartExcessiveMemory) = $GUI_CHECKED Then
		$aExMemRestart = "yes"
	Else
		$aExMemRestart = "no"
	EndIf
	IniWrite($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $aExMemRestart)
EndFunc   ;==>W1_T2_C_RestartExcessiveMemoryClick
Func W1_T2_C_TelnetStayConnectedClick()
	If GUICtrlRead($W1_T2_C_TelnetStayConnected) = $GUI_CHECKED Then
		$aTelnetStayConnectedYN = "yes"
	Else
		$aTelnetStayConnectedYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Telnet: Stay Connected (Required for chat and death messaging) (yes/no) ###", $aTelnetStayConnectedYN)
EndFunc   ;==>W1_T2_C_TelnetStayConnectedClick
Func W1_T2_C_UseQueryClick()
	If GUICtrlRead($W1_T2_C_UseQuery) = $GUI_CHECKED Then
		$aQueryYN = "yes"
	Else
		$aQueryYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Use Query Port to check if server is alive? (yes/no) ###", $aQueryYN)
EndFunc   ;==>W1_T2_C_UseQueryClick
Func W1_T2_C_UseTelnetClick()
	If GUICtrlRead($W1_T2_C_UseTelnet) = $GUI_CHECKED Then
		$aTelnetCheckYN = "yes"
	Else
		$aTelnetCheckYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Use telnet to check if server is alive? (yes/no) ###", $aTelnetCheckYN)
EndFunc   ;==>W1_T2_C_UseTelnetClick
Func W1_T2_E_PauseForMapGenerationChange()
	$aWatchdogWaitServerUpdate = GUICtrlRead($W1_T2_E_PauseForMapGeneration)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server updated to allow map generation (1-360) ###", $aWatchdogWaitServerUpdate)
EndFunc   ;==>W1_T2_E_PauseForMapGenerationChange
Func W1_T2_I_FailedResponsesChange()
	$aWatchdogAttemptsBeforeRestart = GUICtrlRead($W1_T2_I_FailedResponses)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", $aWatchdogAttemptsBeforeRestart)
EndFunc   ;==>W1_T2_I_FailedResponsesChange
Func W1_T2_I_PauseForStartedChange()
	$aWatchdogWaitServerStart = GUICtrlRead($W1_T2_I_PauseForStarted)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server started to allow server to come online (1-60) ###", $aWatchdogWaitServerStart)
EndFunc   ;==>W1_T2_I_PauseForStartedChange
Func W1_T2_I_QueryCheckEveryChange()
	$aQueryCheckSec = GUICtrlRead($W1_T2_I_QueryCheckEvery)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query Port check interval in seconds (30-900) ###", $aQueryCheckSec)
EndFunc   ;==>W1_T2_I_QueryCheckEveryChange
Func W1_T2_I_QueryIPChange()
	$aQueryIP = GUICtrlRead($W1_T2_I_QueryIP)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aQueryIP)
EndFunc   ;==>W1_T2_I_QueryIPChange
Func W1_T2_I_RestartExcessiveMemoryAmtChange()
	$aExMemAmt = GUICtrlRead($W1_T2_I_RestartExcessiveMemoryAmt)
	IniWrite($aIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $aExMemAmt)
EndFunc   ;==>W1_T2_I_RestartExcessiveMemoryAmtChange
Func W1_T2_I_TelnetCheckEveryChange()
	$aTelnetCheckSec = GUICtrlRead($W1_T2_I_TelnetCheckEvery)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet check interval in seconds (30-900) ###", $aTelnetCheckSec)
EndFunc   ;==>W1_T2_I_TelnetCheckEveryChange
Func W1_T2_I_TelnetIPChange()
	$aTelnetIP = GUICtrlRead($W1_T2_I_TelnetIP)
	IniWrite($aIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aTelnetIP)
EndFunc   ;==>W1_T2_I_TelnetIPChange
Func W1_T2_U_FailedResponseChange()
EndFunc   ;==>W1_T2_U_FailedResponseChange
Func W1_T2_U_PauseForStartedChange()
EndFunc   ;==>W1_T2_U_PauseForStartedChange
Func W1_T2_U_PauseForUpdateChange()
EndFunc   ;==>W1_T2_U_PauseForUpdateChange
Func W1_T2_U_QueryCheckChange()
EndFunc   ;==>W1_T2_U_QueryCheckChange
Func W1_T2_U_TelnetCheckChange()
EndFunc   ;==>W1_T2_U_TelnetCheckChange
Func _RestartTimeCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$bRestartHours = IniRead($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", "04,16")
		$bRestartHours = _SortString($bRestartHours & "," & $tTxt, "D")
	Else
		$bRestartHours = _RemoveFromStringCommaSeparated($bRestartHours, $tTxt, "SD")
	EndIf
	If $bRestartHours = "" Then $bRestartHours = "00"
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $bRestartHours)
EndFunc   ;==>_RestartTimeCB
Func W1_T3_C_00Click()
	_RestartTimeCB($W1_T3_C_00, "00")
EndFunc   ;==>W1_T3_C_00Click
Func W1_T3_C_01Click()
	_RestartTimeCB($W1_T3_C_01, "01")
EndFunc   ;==>W1_T3_C_01Click
Func W1_T3_C_02Click()
	_RestartTimeCB($W1_T3_C_02, "02")
EndFunc   ;==>W1_T3_C_02Click
Func W1_T3_C_03Click()
	_RestartTimeCB($W1_T3_C_03, "03")
EndFunc   ;==>W1_T3_C_03Click
Func W1_T3_C_04Click()
	_RestartTimeCB($W1_T3_C_04, "04")
EndFunc   ;==>W1_T3_C_04Click
Func W1_T3_C_05Click()
	_RestartTimeCB($W1_T3_C_05, "05")
EndFunc   ;==>W1_T3_C_05Click
Func W1_T3_C_06Click()
	_RestartTimeCB($W1_T3_C_06, "06")
EndFunc   ;==>W1_T3_C_06Click
Func W1_T3_C_07Click()
	_RestartTimeCB($W1_T3_C_07, "07")
EndFunc   ;==>W1_T3_C_07Click
Func W1_T3_C_08Click()
	_RestartTimeCB($W1_T3_C_08, "08")
EndFunc   ;==>W1_T3_C_08Click
Func W1_T3_C_09Click()
	_RestartTimeCB($W1_T3_C_09, "09")
EndFunc   ;==>W1_T3_C_09Click
Func W1_T3_C_10Click()
	_RestartTimeCB($W1_T3_C_10, "10")
EndFunc   ;==>W1_T3_C_10Click
Func W1_T3_C_11Click()
	_RestartTimeCB($W1_T3_C_11, "11")
EndFunc   ;==>W1_T3_C_11Click
Func W1_T3_C_12Click()
	_RestartTimeCB($W1_T3_C_12, "12")
EndFunc   ;==>W1_T3_C_12Click
Func W1_T3_C_13Click()
	_RestartTimeCB($W1_T3_C_13, "13")
EndFunc   ;==>W1_T3_C_13Click
Func W1_T3_C_14Click()
	_RestartTimeCB($W1_T3_C_14, "14")
EndFunc   ;==>W1_T3_C_14Click
Func W1_T3_C_15Click()
	_RestartTimeCB($W1_T3_C_15, "15")
EndFunc   ;==>W1_T3_C_15Click
Func W1_T3_C_16Click()
	_RestartTimeCB($W1_T3_C_16, "16")
EndFunc   ;==>W1_T3_C_16Click
Func W1_T3_C_17Click()
	_RestartTimeCB($W1_T3_C_17, "17")
EndFunc   ;==>W1_T3_C_17Click
Func W1_T3_C_18Click()
	_RestartTimeCB($W1_T3_C_18, "18")
EndFunc   ;==>W1_T3_C_18Click
Func W1_T3_C_19Click()
	_RestartTimeCB($W1_T3_C_19, "19")
EndFunc   ;==>W1_T3_C_19Click
Func W1_T3_C_20Click()
	_RestartTimeCB($W1_T3_C_20, "20")
EndFunc   ;==>W1_T3_C_20Click
Func W1_T3_C_21Click()
	_RestartTimeCB($W1_T3_C_21, "21")
EndFunc   ;==>W1_T3_C_21Click
Func W1_T3_C_22Click()
	_RestartTimeCB($W1_T3_C_22, "22")
EndFunc   ;==>W1_T3_C_22Click
Func W1_T3_C_23Click()
	_RestartTimeCB($W1_T3_C_23, "23")
EndFunc   ;==>W1_T3_C_23Click
Func W1_T3_C_AppendAfterClick()
	If GUICtrlRead($W1_T3_C_AppendAfter) = $GUI_CHECKED Then
		$aAppendVerEnd = "yes"
	Else
		$aAppendVerEnd = "no"
	EndIf
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $aAppendVerEnd)
EndFunc   ;==>W1_T3_C_AppendAfterClick
Func W1_T3_C_AppendBeforeClick()
	If GUICtrlRead($W1_T3_C_AppendBefore) = $GUI_CHECKED Then
		$aAppendVerBegin = "yes"
	Else
		$aAppendVerBegin = "no"
	EndIf
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $aAppendVerBegin)
EndFunc   ;==>W1_T3_C_AppendBeforeClick
Func W1_T3_C_DailyClick()
	If GUICtrlRead($W1_T3_C_Daily) = $GUI_CHECKED Then
		GUICtrlSetState($W1_T3_C_Sun, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Mon, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Tues, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Wed, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Thur, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Fri, $GUI_CHECKED + $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Sat, $GUI_CHECKED + $GUI_DISABLE)
		$aRestartDays = "0"
	Else
		GUICtrlSetState($W1_T3_C_Sun, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Mon, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Tues, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Wed, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Thur, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Fri, $GUI_CHECKED + $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Sat, $GUI_CHECKED + $GUI_ENABLE)
		$aRestartDays = "1,2,3,4,5,6,7"
	EndIf
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aRestartDays)
EndFunc   ;==>W1_T3_C_DailyClick
Func _RestartDayCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$aRestartDays = IniRead($aIniFile, " --------------- BACKUP --------------- ", "Backup days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", "0")
		$aRestartDays = _SortString($aRestartDays & "," & $tTxt)
	Else
		$aRestartDays = _RemoveFromStringCommaSeparated($aRestartDays, $tTxt, "SND")
	EndIf
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aRestartDays)
EndFunc   ;==>_RestartDayCB
Func W1_T3_C_FriClick()
	_RestartDayCB($W1_T3_C_Fri, "6")
EndFunc   ;==>W1_T3_C_FriClick
Func W1_T3_C_MonClick()
	_RestartDayCB($W1_T3_C_Mon, "2")
EndFunc   ;==>W1_T3_C_MonClick
Func W1_T3_C_SatClick()
	_RestartDayCB($W1_T3_C_Sat, "7")
EndFunc   ;==>W1_T3_C_SatClick
Func W1_T3_C_SunClick()
	_RestartDayCB($W1_T3_C_Sun, "1")
EndFunc   ;==>W1_T3_C_SunClick
Func W1_T3_C_ThursClick()
	_RestartDayCB($W1_T3_C_Thur, "5")
EndFunc   ;==>W1_T3_C_ThursClick
Func W1_T3_C_TuesClick()
	_RestartDayCB($W1_T3_C_Tues, "3")
EndFunc   ;==>W1_T3_C_TuesClick
Func W1_T3_C_WedClick()
	_RestartDayCB($W1_T3_C_Wed, "4")
EndFunc   ;==>W1_T3_C_WedClick
Func W1_T3_C_EnableRemoteRestartClick()
	If GUICtrlRead($W1_T3_C_EnableRemoteRestart) = $GUI_CHECKED Then
		$aRemoteRestartUse = "yes"
		IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $aRemoteRestartUse)
		_StartRemoteRestart()
	Else
		$aRemoteRestartUse = "no"
		IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $aRemoteRestartUse)
	EndIf
EndFunc   ;==>W1_T3_C_EnableRemoteRestartClick
Func W1_T3_C_EnableRestartClick()
	If GUICtrlRead($W1_T3_C_EnableRestart) = $GUI_CHECKED Then
		$aRestartDaily = "yes"
		GUICtrlSetState($W1_T3_C_Daily, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Sun, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Mon, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Tues, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Wed, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Thur, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Fri, $GUI_ENABLE)
		GUICtrlSetState($W1_T3_C_Sat, $GUI_ENABLE)
	Else
		$aRestartDaily = "no"
		GUICtrlSetState($W1_T3_C_Daily, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Sun, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Mon, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Tues, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Wed, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Thur, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Fri, $GUI_DISABLE)
		GUICtrlSetState($W1_T3_C_Sat, $GUI_DISABLE)
	EndIf
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $aRestartDaily)
EndFunc   ;==>W1_T3_C_EnableRestartClick
Func W1_T3_C_RenameGameSaveClick()
	If GUICtrlRead($W1_T3_C_RenameGameSave) = $GUI_CHECKED Then
		$aWipeServer = "yes"
	Else
		$aWipeServer = "no"
	EndIf
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $aWipeServer)
EndFunc   ;==>W1_T3_C_RenameGameSaveClick
Func W1_T3_I_RemoteRestartCodeChange()
	$aRemoteRestartCode = GUICtrlRead($W1_T3_I_RemoteRestartCode)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $aRemoteRestartCode)
EndFunc   ;==>W1_T3_I_RemoteRestartCodeChange
Func W1_T3_I_RemoteRestartKeyChange()
	$aRemoteRestartKey = GUICtrlRead($W1_T3_I_RemoteRestartKey)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $aRemoteRestartKey)
EndFunc   ;==>W1_T3_I_RemoteRestartKeyChange
Func W1_T3_I_RemoteRestartPortChange()
	$aRemoteRestartPort = GUICtrlRead($W1_T3_I_RemoteRestartPort)
	IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $aRemoteRestartPort)
EndFunc   ;==>W1_T3_I_RemoteRestartPortChange
Func W1_T3_I_RestartMinuteChange()
	$bRestartMin = GUICtrlRead($W1_T3_I_RestartMinute)
	IniWrite($aIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $bRestartMin)
EndFunc   ;==>W1_T3_I_RestartMinuteChange
Func W1_T3_R_AppendLongClick()
	If GUICtrlRead($W1_T3_R_AppendLong) = $GUI_CHECKED Then
		$aAppendVerShort = "long"
	Else
		$aAppendVerShort = "short"
	EndIf
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $aAppendVerShort)
EndFunc   ;==>W1_T3_R_AppendLongClick
Func W1_T3_R_AppendShortClick()
	If GUICtrlRead($W1_T3_R_AppendShort) = $GUI_CHECKED Then
		$aAppendVerShort = "short"
	Else
		$aAppendVerShort = "long"
	EndIf
	IniWrite($aIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $aAppendVerShort)
EndFunc   ;==>W1_T3_R_AppendShortClick
Func W1_T3_U_RestartMinuteChange()
EndFunc   ;==>W1_T3_U_RestartMinuteChange
Func W1_T4_C_AnnounceInGameClick()
	If GUICtrlRead($W1_T4_C_AnnounceInGame) = $GUI_CHECKED Then
		$sInGameAnnounce = "yes"
	Else
		$sInGameAnnounce = "no"
	EndIf
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $sInGameAnnounce)
EndFunc   ;==>W1_T4_C_AnnounceInGameClick
Func _AnnounceDailyCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$sAnnounceNotifyTime1 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", "1,3,5,10")
		$sAnnounceNotifyTime1 = _SortString($sAnnounceNotifyTime1 & "," & $tTxt)
	Else
		$sAnnounceNotifyTime1 = _RemoveFromStringCommaSeparated($sAnnounceNotifyTime1, $tTxt, "0SND")
	EndIf
	GUICtrlSetData($W1_T4_I_DailyMins, $sAnnounceNotifyTime1)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $sAnnounceNotifyTime1)
EndFunc   ;==>_AnnounceDailyCB
Func W1_T4_C_Daily01Click()
	_AnnounceDailyCB($W1_T4_C_Daily01, "1")
EndFunc   ;==>W1_T4_C_Daily01Click
Func W1_T4_C_Daily02Click()
	_AnnounceDailyCB($W1_T4_C_Daily02, "2")
EndFunc   ;==>W1_T4_C_Daily02Click
Func W1_T4_C_Daily03Click()
	_AnnounceDailyCB($W1_T4_C_Daily03, "3")
EndFunc   ;==>W1_T4_C_Daily03Click
Func W1_T4_C_Daily05Click()
	_AnnounceDailyCB($W1_T4_C_Daily05, "5")
EndFunc   ;==>W1_T4_C_Daily05Click
Func W1_T4_C_Daily10Click()
	_AnnounceDailyCB($W1_T4_C_Daily10, "10")
EndFunc   ;==>W1_T4_C_Daily10Click
Func W1_T4_C_Daily15Click()
	_AnnounceDailyCB($W1_T4_C_Daily15, "15")
EndFunc   ;==>W1_T4_C_Daily15Click
Func W1_T4_C_LogOnlinePlayersClick()
	If GUICtrlRead($W1_T4_C_LogOnlinePlayers) = $GUI_CHECKED Then
		$aServerOnlinePlayerYN = "yes"
	Else
		$aServerOnlinePlayerYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $aServerOnlinePlayerYN)
EndFunc   ;==>W1_T4_C_LogOnlinePlayersClick
Func _AnnounceRemoteCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$sAnnounceNotifyTime3 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", "1,3,5,10")
		$sAnnounceNotifyTime3 = _SortString($sAnnounceNotifyTime3 & "," & $tTxt)
	Else
		$sAnnounceNotifyTime3 = _RemoveFromStringCommaSeparated($sAnnounceNotifyTime3, $tTxt, "0SND")
	EndIf
	GUICtrlSetData($W1_T4_I_UpdateRemote, $sAnnounceNotifyTime3)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $sAnnounceNotifyTime3)
EndFunc   ;==>_AnnounceRemoteCB
Func W1_T4_C_Remote01Click()
	_AnnounceRemoteCB($W1_T4_C_Remote01, "1")
EndFunc   ;==>W1_T4_C_Remote01Click
Func W1_T4_C_Remote02Click()
	_AnnounceRemoteCB($W1_T4_C_Remote02, "2")
EndFunc   ;==>W1_T4_C_Remote02Click
Func W1_T4_C_Remote03Click()
	_AnnounceRemoteCB($W1_T4_C_Remote03, "3")
EndFunc   ;==>W1_T4_C_Remote03Click
Func W1_T4_C_Remote05Click()
	_AnnounceRemoteCB($W1_T4_C_Remote05, "5")
EndFunc   ;==>W1_T4_C_Remote05Click
Func W1_T4_C_Remote10Click()
	_AnnounceRemoteCB($W1_T4_C_Remote10, "10")
EndFunc   ;==>W1_T4_C_Remote10Click
Func W1_T4_C_Remote15Click()
	_AnnounceRemoteCB($W1_T4_C_Remote15, "15")
EndFunc   ;==>W1_T4_C_Remote15Click
Func _AnnounceUpdateCB($tCID, $tTxt)
	If GUICtrlRead($tCID) = $GUI_CHECKED Then
		$sAnnounceNotifyTime2 = IniRead($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", "1,3,5,10")
		$sAnnounceNotifyTime2 = _SortString($sAnnounceNotifyTime2 & "," & $tTxt)
	Else
		$sAnnounceNotifyTime2 = _RemoveFromStringCommaSeparated($sAnnounceNotifyTime2, $tTxt, "0SND")
	EndIf
	GUICtrlSetData($W1_T4_I_UpdateMins, $sAnnounceNotifyTime2)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $sAnnounceNotifyTime2)
EndFunc   ;==>_AnnounceUpdateCB
Func _RemoveFromStringCommaSeparated($tString, $tRemove, $tOpt = "SND") ; $tOpt 0=Remove leading zeros, S=Sort
	Local $tArray5 = StringSplit($tString, ",", 2)
	$tArray5 = _ArrayUnique($tArray5, 0, 0, 0, 0)
	For $i8 = 0 To (UBound($tArray5) - 1)
		If $tArray5[$i8] = $tRemove Then
			_ArrayDelete($tArray5, $i8)
			ExitLoop
		EndIf
	Next
	$tString = _ArrayToString($tArray5, ",")
	If StringInStr($tOpt, "0") Then
		If StringLeft($tString, 2) = "0," Then $tString = StringTrimLeft($tString, 2)
		If $tString = 0 Or $tString = "0" Then $tString = "1"
	EndIf
	If StringInStr($tOpt, "S") Then $tString = _SortString($tString, $tOpt)
	Return $tString
EndFunc   ;==>_RemoveFromStringCommaSeparated
Func _SortString($tString, $tOpt = "ND") ; $tOpt N=IsNumber, D=Remove Duplicates
	Local $tArray4 = StringSplit($tString, ",", 2)
	If StringInStr($tOpt, "N") Then
		For $t2 = 0 To (UBound($tArray4) - 1)
			$tArray4[$t2] = Number($tArray4[$t2])
		Next
	EndIf
	_ArraySort($tArray4)
	If StringInStr($tOpt, "D") Then $tArray4 = _ArrayUnique($tArray4, 0, 0, 0, 0)
	$tString = _ArrayToString($tArray4, ",")
	If StringLeft($tString, 2) = "0," Then $tString = StringTrimLeft($tString, 2)
	Return $tString
EndFunc   ;==>_SortString
Func W1_T4_C_Update01Click()
	_AnnounceUpdateCB($W1_T4_C_Update01, "1")
EndFunc   ;==>W1_T4_C_Update01Click
Func W1_T4_C_Update02Click()
	_AnnounceUpdateCB($W1_T4_C_Update02, "2")
EndFunc   ;==>W1_T4_C_Update02Click
Func W1_T4_C_Update03Click()
	_AnnounceUpdateCB($W1_T4_C_Update03, "3")
EndFunc   ;==>W1_T4_C_Update03Click
Func W1_T4_C_Update05Click()
	_AnnounceUpdateCB($W1_T4_C_Update05, "5")
EndFunc   ;==>W1_T4_C_Update05Click
Func W1_T4_C_Update10Click()
	_AnnounceUpdateCB($W1_T4_C_Update10, "10")
EndFunc   ;==>W1_T4_C_Update10Click
Func W1_T4_C_Update15Click()
	_AnnounceUpdateCB($W1_T4_C_Update15, "15")
EndFunc   ;==>W1_T4_C_Update15Click
Func W1_T4_I_AnnounceDailyChange()
	$sInGameDailyMessage = GUICtrlRead($W1_T4_I_AnnounceDaily)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sInGameDailyMessage)
EndFunc   ;==>W1_T4_I_AnnounceDailyChange
Func W1_T4_I_AnnounceRemoteChange()
	$sInGameRemoteRestartMessage = GUICtrlRead($W1_T4_I_AnnounceRemote)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sInGameRemoteRestartMessage)
EndFunc   ;==>W1_T4_I_AnnounceRemoteChange
Func W1_T4_I_AnnounceUpdateChange()
	$sInGameUpdateMessage = GUICtrlRead($W1_T4_I_AnnounceUpdate)
	IniWrite($aIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sInGameUpdateMessage)
EndFunc   ;==>W1_T4_I_AnnounceUpdateChange
Func W1_T4_I_BackupStartedChange()
	$aBackupInGame = GUICtrlRead($W1_T4_I_BackupStarted)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "In-Game announcement when backup initiated (Leave blank to disable) ###", $aBackupInGame)
EndFunc   ;==>W1_T4_I_BackupStartedChange
Func W1_T4_I_DailyMinsChange()
	$sAnnounceNotifyTime1 = GUICtrlRead($W1_T4_I_DailyMins)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $sAnnounceNotifyTime1)
EndFunc   ;==>W1_T4_I_DailyMinsChange
Func W1_T4_I_LogOnlinePlaySecondsChange()
	$aServerOnlinePlayerSec = GUICtrlRead($W1_T4_I_LogOnlinePlaySeconds)
	IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $aServerOnlinePlayerSec)
EndFunc   ;==>W1_T4_I_LogOnlinePlaySecondsChange
Func W1_T4_I_UpdateMinsChange()
	$sAnnounceNotifyTime2 = GUICtrlRead($W1_T4_I_UpdateMins)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $sAnnounceNotifyTime2)
EndFunc   ;==>W1_T4_I_UpdateMinsChange
Func W1_T4_I_UpdateRemoteChange()
	$sAnnounceNotifyTime3 = GUICtrlRead($W1_T4_I_UpdateRemote)
	IniWrite($aIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $sAnnounceNotifyTime3)
EndFunc   ;==>W1_T4_I_UpdateRemoteChange
Func W1_T5_C_D1TTSClick()
	If GUICtrlRead($W1_T5_C_D1TTS) = $GUI_CHECKED Then
		$aServerDiscord1TTSYN = "yes"
	Else
		$aServerDiscord1TTSYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Use TTS (optional) (yes/no) ###", $aServerDiscord1TTSYN)
EndFunc   ;==>W1_T5_C_D1TTSClick
Func W1_T5_C_D2TTSClick()
	If GUICtrlRead($W1_T5_C_D2TTS) = $GUI_CHECKED Then
		$aServerDiscord2TTSYN = "yes"
	Else
		$aServerDiscord2TTSYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Use TTS (optional) (yes/no) ###", $aServerDiscord2TTSYN)
EndFunc   ;==>W1_T5_C_D2TTSClick
Func W1_T5_C_D3TTSClick()
	If GUICtrlRead($W1_T5_C_D3TTS) = $GUI_CHECKED Then
		$aServerDiscord3TTSYN = "yes"
	Else
		$aServerDiscord3TTSYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Use TTS (optional) (yes/no) ###", $aServerDiscord3TTSYN)
EndFunc   ;==>W1_T5_C_D3TTSClick
Func W1_T5_C_D4TTSClick()
	If GUICtrlRead($W1_T5_C_D4TTS) = $GUI_CHECKED Then
		$aServerDiscord4TTSYN = "yes"
	Else
		$aServerDiscord4TTSYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Use TTS (optional) (yes/no) ###", $aServerDiscord4TTSYN)
EndFunc   ;==>W1_T5_C_D4TTSClick
Func _ConfigWH($tCB, $tWH, $tPar) ; CheckBox ID, Webhook string, Value to add or remove)
	If GUICtrlRead($tCB) = $GUI_CHECKED Then
		If StringInStr($tWH, $tPar) = 0 Then $tWH &= $tPar
	Else
		$tWH = StringReplace($tWH, $tPar, "")
	EndIf
	Return $tWH
EndFunc   ;==>_ConfigWH
Func W1_T5_C_WHChat1Click()
	$aServerDiscordWHSelChat = _ConfigWH($W1_T5_C_WHChat1, $aServerDiscordWHSelChat, "1")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $aServerDiscordWHSelChat)
EndFunc   ;==>W1_T5_C_WHChat1Click
Func W1_T5_C_WHChat2Click()
	$aServerDiscordWHSelChat = _ConfigWH($W1_T5_C_WHChat2, $aServerDiscordWHSelChat, "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $aServerDiscordWHSelChat)
EndFunc   ;==>W1_T5_C_WHChat2Click
Func W1_T5_C_WHChat3Click()
	$aServerDiscordWHSelChat = _ConfigWH($W1_T5_C_WHChat3, $aServerDiscordWHSelChat, "3")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $aServerDiscordWHSelChat)
EndFunc   ;==>W1_T5_C_WHChat3Click
Func W1_T5_C_WHChat4Click()
	$aServerDiscordWHSelChat = _ConfigWH($W1_T5_C_WHChat4, $aServerDiscordWHSelChat, "4")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send CHAT Msg (ie 23) ###", $aServerDiscordWHSelChat)
EndFunc   ;==>W1_T5_C_WHChat4Click
Func W1_T5_C_WHDie1Click()
	$aServerDiscordWHSelDie = _ConfigWH($W1_T5_C_WHDie1, $aServerDiscordWHSelDie, "1")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $aServerDiscordWHSelDie)
EndFunc   ;==>W1_T5_C_WHDie1Click
Func W1_T5_C_WHDie2Click()
	$aServerDiscordWHSelDie = _ConfigWH($W1_T5_C_WHDie2, $aServerDiscordWHSelDie, "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $aServerDiscordWHSelDie)
EndFunc   ;==>W1_T5_C_WHDie2Click
Func W1_T5_C_WHDie3Click()
	$aServerDiscordWHSelDie = _ConfigWH($W1_T5_C_WHDie3, $aServerDiscordWHSelDie, "3")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $aServerDiscordWHSelDie)
EndFunc   ;==>W1_T5_C_WHDie3Click
Func W1_T5_C_WHDie4Click()
	$aServerDiscordWHSelDie = _ConfigWH($W1_T5_C_WHDie4, $aServerDiscordWHSelDie, "4")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS DIE Msg (ie 1234) ###", $aServerDiscordWHSelDie)
EndFunc   ;==>W1_T5_C_WHDie4Click
Func W1_T5_C_WHOnline1Click()
	$aServerDiscordWHSelPlayers = _ConfigWH($W1_T5_C_WHOnline1, $aServerDiscordWHSelPlayers, "1")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $aServerDiscordWHSelPlayers)
EndFunc   ;==>W1_T5_C_WHOnline1Click
Func W1_T5_C_WHOnline2Click()
	$aServerDiscordWHSelPlayers = _ConfigWH($W1_T5_C_WHOnline2, $aServerDiscordWHSelPlayers, "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $aServerDiscordWHSelPlayers)
EndFunc   ;==>W1_T5_C_WHOnline2Click
Func W1_T5_C_WHOnline3Click()
	$aServerDiscordWHSelPlayers = _ConfigWH($W1_T5_C_WHOnline3, $aServerDiscordWHSelPlayers, "3")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $aServerDiscordWHSelPlayers)
EndFunc   ;==>W1_T5_C_WHOnline3Click
Func W1_T5_C_WHOnline4Click()
	$aServerDiscordWHSelPlayers = _ConfigWH($W1_T5_C_WHOnline4, $aServerDiscordWHSelPlayers, "4")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send PLAYERS ONLINE Msg (ie 2) ###", $aServerDiscordWHSelPlayers)
EndFunc   ;==>W1_T5_C_WHOnline4Click
Func W1_T5_C_WHRestart1Click()
	$aServerDiscordWHSelStatus = _ConfigWH($W1_T5_C_WHRestart1, $aServerDiscordWHSelStatus, "1")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $aServerDiscordWHSelStatus)
EndFunc   ;==>W1_T5_C_WHRestart1Click
Func W1_T5_C_WHRestart2Click()
	$aServerDiscordWHSelStatus = _ConfigWH($W1_T5_C_WHRestart2, $aServerDiscordWHSelStatus, "2")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $aServerDiscordWHSelStatus)
EndFunc   ;==>W1_T5_C_WHRestart2Click
Func W1_T5_C_WHRestart3Click()
	$aServerDiscordWHSelStatus = _ConfigWH($W1_T5_C_WHRestart3, $aServerDiscordWHSelStatus, "3")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $aServerDiscordWHSelStatus)
EndFunc   ;==>W1_T5_C_WHRestart3Click
Func W1_T5_C_WHRestart4Click()
	$aServerDiscordWHSelStatus = _ConfigWH($W1_T5_C_WHRestart4, $aServerDiscordWHSelStatus, "4")
	IniWrite($aIniFile, " --------------- DISCORD MESSAGE WEBHOOK SELECT --------------- ", "Webhook number(s) to send RESTART/STATUS Msg (ie 1) ###", $aServerDiscordWHSelStatus)
EndFunc   ;==>W1_T5_C_WHRestart4Click
Func W1_T5_I_D1AvatarChange()
	$aServerDiscord1Avatar = GUICtrlRead($W1_T5_I_D1Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Avatar URL (optional) ###", $aServerDiscord1Avatar)
EndFunc   ;==>W1_T5_I_D1AvatarChange
Func W1_T5_I_D1BotChange()
	$aServerDiscord1BotName = GUICtrlRead($W1_T5_I_D1Bot)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Bot Name (optional) ###", $aServerDiscord1BotName)
EndFunc   ;==>W1_T5_I_D1BotChange
Func W1_T5_I_D1URLChange()
	$aServerDiscord1URL = GUICtrlRead($W1_T5_I_D1URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #1 Webhook URL ###", $aServerDiscord1URL)
EndFunc   ;==>W1_T5_I_D1URLChange
Func W1_T5_I_D2AvatarChange()
	$aServerDiscord2Avatar = GUICtrlRead($W1_T5_I_D2Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Avatar URL (optional) ###", $aServerDiscord2Avatar)
EndFunc   ;==>W1_T5_I_D2AvatarChange
Func W1_T5_I_D2BotChange()
	$aServerDiscord2BotName = GUICtrlRead($W1_T5_I_D2Bot)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Bot Name (optional) ###", $aServerDiscord2BotName)
EndFunc   ;==>W1_T5_I_D2BotChange
Func W1_T5_I_D2URLChange()
	$aServerDiscord2URL = GUICtrlRead($W1_T5_I_D2URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #2 Webhook URL ###", $aServerDiscord2URL)
EndFunc   ;==>W1_T5_I_D2URLChange
Func W1_T5_I_D3AvatarChange()
	$aServerDiscord3Avatar = GUICtrlRead($W1_T5_I_D3Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Avatar URL (optional) ###", $aServerDiscord3Avatar)
EndFunc   ;==>W1_T5_I_D3AvatarChange
Func W1_T5_I_D3BotChange()
	$aServerDiscord3BotName = GUICtrlRead($W1_T5_I_D3Bot)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Bot Name (optional) ###", $aServerDiscord3BotName)
EndFunc   ;==>W1_T5_I_D3BotChange
Func W1_T5_I_D3URLChange()
	$aServerDiscord3URL = GUICtrlRead($W1_T5_I_D3URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #3 Webhook URL ###", $aServerDiscord3URL)
EndFunc   ;==>W1_T5_I_D3URLChange
Func W1_T5_I_D4AvatarChange()
	$aServerDiscord4Avatar = GUICtrlRead($W1_T5_I_D4Avatar)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Avatar URL (optional) ###", $aServerDiscord4Avatar)
EndFunc   ;==>W1_T5_I_D4AvatarChange
Func W1_T5_I_D4BotChange()
	$aServerDiscord4BotName = GUICtrlRead($W1_T5_I_D4Bot)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Bot Name (optional) ###", $aServerDiscord4BotName)
EndFunc   ;==>W1_T5_I_D4BotChange
Func W1_T5_I_D4URLChange()
	$aServerDiscord4URL = GUICtrlRead($W1_T5_I_D4URL)
	IniWrite($aIniFile, " --------------- DISCORD WEBHOOK --------------- ", "Discord #4 Webhook URL ###", $aServerDiscord4URL)
EndFunc   ;==>W1_T5_I_D4URLChange
Func W1_T6_C_BackOnlineClick()
	If GUICtrlRead($W1_T6_C_BackOnline) = $GUI_CHECKED Then
		$sUseDiscordBotServersUpYN = "yes"
	Else
		$sUseDiscordBotServersUpYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $sUseDiscordBotServersUpYN)
EndFunc   ;==>W1_T6_C_BackOnlineClick
Func W1_T6_C_BackupStartedClick()
	If GUICtrlRead($W1_T6_C_BackupStarted) = $GUI_CHECKED Then
		$aBackupSendDiscordYN = "yes"
	Else
		$aBackupSendDiscordYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Send Discord announcement when backup initiated (yes/no) ###", $aBackupSendDiscordYN)
EndFunc   ;==>W1_T6_C_BackupStartedClick
Func W1_T6_C_DailyClick()
	If GUICtrlRead($W1_T6_C_Daily) = $GUI_CHECKED Then
		$sUseDiscordBotDaily = "yes"
	Else
		$sUseDiscordBotDaily = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $sUseDiscordBotDaily)
EndFunc   ;==>W1_T6_C_DailyClick
Func W1_T6_C_FirstAnnounceOnlyClick()
	If GUICtrlRead($W1_T6_C_FirstAnnounceOnly) = $GUI_CHECKED Then
		$sUseDiscordBotFirstAnnouncement = "yes"
	Else
		$sUseDiscordBotFirstAnnouncement = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $sUseDiscordBotFirstAnnouncement)
EndFunc   ;==>W1_T6_C_FirstAnnounceOnlyClick
Func W1_T6_C_PlayerChangeClick()
	If GUICtrlRead($W1_T6_C_PlayerChange) = $GUI_CHECKED Then
		$sUseDiscordBotPlayerChangeYN = "yes"
	Else
		$sUseDiscordBotPlayerChangeYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Online Player changes? (yes/no) ###", $sUseDiscordBotPlayerChangeYN)
EndFunc   ;==>W1_T6_C_PlayerChangeClick
Func W1_T6_C_PlayerChatClick()
	If GUICtrlRead($W1_T6_C_PlayerChat) = $GUI_CHECKED Then
		$sUseDiscordBotPlayerChatYN = "yes"
	Else
		$sUseDiscordBotPlayerChatYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for Player Chat? (yes/no) ###", $sUseDiscordBotPlayerChatYN)
EndFunc   ;==>W1_T6_C_PlayerChatClick
Func W1_T6_C_PlayerDieClick()
	If GUICtrlRead($W1_T6_C_PlayerDie) = $GUI_CHECKED Then
		$sUseDiscordBotPlayerDiedYN = "yes"
	Else
		$sUseDiscordBotPlayerDiedYN = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when player dies? (yes/no) ###", $sUseDiscordBotPlayerDiedYN)
EndFunc   ;==>W1_T6_C_PlayerDieClick
Func W1_T6_C_RemoteClick()  ;kim125er
	If GUICtrlRead($W1_T6_C_Remote) = $GUI_CHECKED Then
		$sUseDiscordBotRemoteRestart = "yes"
	Else
		$sUseDiscordBotRemoteRestart = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $sUseDiscordBotRemoteRestart)
EndFunc   ;==>W1_T6_C_RemoteClick
Func W1_T6_C_UpdateClick()
	If GUICtrlRead($W1_T6_C_Update) = $GUI_CHECKED Then
		$sUseDiscordBotUpdate = "yes"
	Else
		$sUseDiscordBotUpdate = "no"
	EndIf
	IniWrite($aIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $sUseDiscordBotUpdate)
EndFunc   ;==>W1_T6_C_UpdateClick
Func W1_T6_I_BackOnlineChange()
	$sDiscordServersUpMessage = GUICtrlRead($W1_T6_I_BackOnline)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement when server is back online ###", $sDiscordServersUpMessage)
EndFunc   ;==>W1_T6_I_BackOnlineChange
Func W1_T6_I_BackupStartedChange()
	$aBackupDiscord = GUICtrlRead($W1_T6_I_BackupStarted)
	IniWrite($aIniFile, " --------------- BACKUP --------------- ", "Discord announcement when backup initiated ###", $aBackupDiscord)
EndFunc   ;==>W1_T6_I_BackupStartedChange
Func W1_T6_I_DailyChange()
	$sDiscordDailyMessage = GUICtrlRead($W1_T6_I_Daily)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement DAILY (\m - minutes) ###", $sDiscordDailyMessage)
EndFunc   ;==>W1_T6_I_DailyChange
Func W1_T6_I_PlayerChangeChange()
	$sDiscordPlayersMsg = GUICtrlRead($W1_T6_I_PlayerChange)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Message (see above for substitutions) ###", $sDiscordPlayersMsg)
EndFunc   ;==>W1_T6_I_PlayerChangeChange
Func W1_T6_I_PlayerChatChange()
	$sDiscordPlayerChatMsg = GUICtrlRead($W1_T6_I_PlayerChat)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Chat (\p - Player Name, \m Message) ###", $sDiscordPlayerChatMsg)
EndFunc   ;==>W1_T6_I_PlayerChatChange
Func W1_T6_I_PlayerDieChange()
	$sDiscordPlayerDiedMsg = GUICtrlRead($W1_T6_I_PlayerDie)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Player Died Message (\p - Player Name, \n Next Line) ###", $sDiscordPlayerDiedMsg)
EndFunc   ;==>W1_T6_I_PlayerDieChange
Func W1_T6_I_RemoteChange()
	$sDiscordRemoteRestartMessage = GUICtrlRead($W1_T6_I_Remote)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sDiscordRemoteRestartMessage)
EndFunc   ;==>W1_T6_I_RemoteChange
Func W1_T6_I_SubJoinedChange()
	$sDiscordPlayerJoinMsg = GUICtrlRead($W1_T6_I_SubJoined)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Join Player Sub-Message (\p - Player Name(s) of player(s) that joined server, \n Next Line) ###", $sDiscordPlayerJoinMsg)
EndFunc   ;==>W1_T6_I_SubJoinedChange
Func W1_T6_I_SubLeftChange()
	$sDiscordPlayerLeftMsg = GUICtrlRead($W1_T6_I_SubLeft)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Left Player Sub-Message (\p - Player Name(s) of player(s) that left server, \n Next Line) ###", $sDiscordPlayerLeftMsg)
EndFunc   ;==>W1_T6_I_SubLeftChange
Func W1_T6_I_SubOnlinePlayerChange()
	$sDiscordPlayerOnlineMsg = GUICtrlRead($W1_T6_I_SubOnlinePlayer)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Online Player Sub-Message (\p - Player Name(s) of player(s) online, \n Next Line) ###", $sDiscordPlayerOnlineMsg)
EndFunc   ;==>W1_T6_I_SubOnlinePlayerChange
Func W1_T6_I_UpdateChange()
	$sDiscordUpdateMessage = GUICtrlRead($W1_T6_I_Update)
	IniWrite($aIniFile, " --------------- DISCORD MESSAGES --------------- ", "Announcement UPDATES (\m - minutes) ###", $sDiscordUpdateMessage)
EndFunc   ;==>W1_T6_I_UpdateChange
Func W1_T7_C_BackupStartedClick()

EndFunc   ;==>W1_T7_C_BackupStartedClick
Func W1_T7_C_TwitchDailyClick()

EndFunc   ;==>W1_T7_C_TwitchDailyClick
Func W1_T7_C_TwitchFirstAnnounceOnlyClick()

EndFunc   ;==>W1_T7_C_TwitchFirstAnnounceOnlyClick
Func W1_T7_C_TwitchRemoteClick()

EndFunc   ;==>W1_T7_C_TwitchRemoteClick
Func W1_T7_C_TwitchUpdateClick()

EndFunc   ;==>W1_T7_C_TwitchUpdateClick
Func W1_T7_I_TwitchBackStartedChange()

EndFunc   ;==>W1_T7_I_TwitchBackStartedChange
Func W1_T7_I_TwitchChannelsChange()

EndFunc   ;==>W1_T7_I_TwitchChannelsChange
Func W1_T7_I_TwitchChatOAuthChange()

EndFunc   ;==>W1_T7_I_TwitchChatOAuthChange
Func W1_T7_I_TwitchDailyChange()

EndFunc   ;==>W1_T7_I_TwitchDailyChange
Func W1_T7_I_TwitchNickChange()

EndFunc   ;==>W1_T7_I_TwitchNickChange
Func W1_T7_I_TwitchRemoteChange()

EndFunc   ;==>W1_T7_I_TwitchRemoteChange
Func W1_T7_I_TwitchUpdateChange()

EndFunc   ;==>W1_T7_I_TwitchUpdateChange
Func W1_T8_B_ExecuteAFirstRestartAnnouncementClick()

EndFunc   ;==>W1_T8_B_ExecuteAFirstRestartAnnouncementClick
Func W1_T8_B_ExecuteAfterRestartClick()

EndFunc   ;==>W1_T8_B_ExecuteAfterRestartClick
Func W1_T8_B_ExecuteAfterSteamandStartClick()

EndFunc   ;==>W1_T8_B_ExecuteAfterSteamandStartClick
Func W1_T8_B_ExecuteAfterSteamBeforeStartClick()

EndFunc   ;==>W1_T8_B_ExecuteAfterSteamBeforeStartClick
Func W1_T8_B_ExecuteAfterUpdateClick()

EndFunc   ;==>W1_T8_B_ExecuteAfterUpdateClick
Func W1_T8_B_ExecuteRemoteRestartClick()

EndFunc   ;==>W1_T8_B_ExecuteRemoteRestartClick
Func W1_T8_C_ExecuteAFirstRestartAnnouncementClick()

EndFunc   ;==>W1_T8_C_ExecuteAFirstRestartAnnouncementClick
Func W1_T8_C_ExecuteAFirstRestartAnnouncementWaitClick()

EndFunc   ;==>W1_T8_C_ExecuteAFirstRestartAnnouncementWaitClick
Func W1_T8_C_ExecuteAfterRestartClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterRestartClick
Func W1_T8_C_ExecuteAfterRestartWaitClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterRestartWaitClick
Func W1_T8_C_ExecuteAfterSteamandStartClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterSteamandStartClick
Func W1_T8_C_ExecuteAfterSteamandStartWaitClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterSteamandStartWaitClick
Func W1_T8_C_ExecuteAfterSteamBeforeStartClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterSteamBeforeStartClick
Func W1_T8_C_ExecuteAfterSteamBeforeStartWaitClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterSteamBeforeStartWaitClick
Func W1_T8_C_ExecuteAfterUpdateClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterUpdateClick
Func W1_T8_C_ExecuteAfterUpdateWaitClick()

EndFunc   ;==>W1_T8_C_ExecuteAfterUpdateWaitClick
Func W1_T8_C_ExecuteRemoteRestartClick()

EndFunc   ;==>W1_T8_C_ExecuteRemoteRestartClick
Func W1_T8_C_ExecuteRemoteRestartWaitrClick()

EndFunc   ;==>W1_T8_C_ExecuteRemoteRestartWaitrClick
Func W1_T8_I_ExecuteAFirstRestartAnnouncementChange()

EndFunc   ;==>W1_T8_I_ExecuteAFirstRestartAnnouncementChange
Func W1_T8_I_ExecuteAfterRestartChange()

EndFunc   ;==>W1_T8_I_ExecuteAfterRestartChange
Func W1_T8_I_ExecuteAfterSteamandStartChange()

EndFunc   ;==>W1_T8_I_ExecuteAfterSteamandStartChange
Func W1_T8_I_ExecuteAfterSteamBeforeStartChange()

EndFunc   ;==>W1_T8_I_ExecuteAfterSteamBeforeStartChange
Func W1_T8_I_ExecuteAfterUpdateChange()

EndFunc   ;==>W1_T8_I_ExecuteAfterUpdateChange
Func W1_T8_I_ExecuteRemoteRestartChange()

EndFunc   ;==>W1_T8_I_ExecuteRemoteRestartChange
Func W1_T9_C_EnableFutureProofClick()

EndFunc   ;==>W1_T9_C_EnableFutureProofClick
Func W1_T9_C_RenameModFolderClick()

EndFunc   ;==>W1_T9_C_RenameModFolderClick

Func Label10Click()
EndFunc   ;==>Label10Click
Func Label11Click()
EndFunc   ;==>Label11Click
Func Label12Click()
EndFunc   ;==>Label12Click
Func Label13Click()
EndFunc   ;==>Label13Click
Func Label14Click()
EndFunc   ;==>Label14Click
Func Label15Click()
EndFunc   ;==>Label15Click
Func Label16Click()
EndFunc   ;==>Label16Click
Func Label17Click()
EndFunc   ;==>Label17Click
Func Label18Click()
EndFunc   ;==>Label18Click
Func Label19Click()
EndFunc   ;==>Label19Click
Func Label1Click()
EndFunc   ;==>Label1Click
Func Label20Click()
EndFunc   ;==>Label20Click
Func Label21Click()
EndFunc   ;==>Label21Click
Func Label22Click()
EndFunc   ;==>Label22Click
Func Label23Click()
EndFunc   ;==>Label23Click
Func Label24Click()
EndFunc   ;==>Label24Click
Func Label25Click()
EndFunc   ;==>Label25Click
Func Label26Click()
EndFunc   ;==>Label26Click
Func Label27Click()
EndFunc   ;==>Label27Click
Func Label28Click()
EndFunc   ;==>Label28Click
Func Label29Click()
EndFunc   ;==>Label29Click
Func Label2Click()
EndFunc   ;==>Label2Click
Func Label30Click()
EndFunc   ;==>Label30Click
Func Label31Click()
EndFunc   ;==>Label31Click
Func Label32Click()
EndFunc   ;==>Label32Click
Func Label33Click()
EndFunc   ;==>Label33Click
Func Label34Click()
EndFunc   ;==>Label34Click
Func Label35Click()
EndFunc   ;==>Label35Click
Func Label36Click()
EndFunc   ;==>Label36Click
Func Label37Click()
EndFunc   ;==>Label37Click
Func Label38Click()
EndFunc   ;==>Label38Click
Func Label39Click()
EndFunc   ;==>Label39Click
Func Label3Click()
EndFunc   ;==>Label3Click
Func Label40Click()
EndFunc   ;==>Label40Click
Func Label41Click()
EndFunc   ;==>Label41Click
Func Label42Click()
EndFunc   ;==>Label42Click
Func Label43Click()
EndFunc   ;==>Label43Click
Func Label44Click()
EndFunc   ;==>Label44Click
Func Label45Click()
EndFunc   ;==>Label45Click
Func Label46Click()
EndFunc   ;==>Label46Click
Func Label47Click()
EndFunc   ;==>Label47Click
Func Label48Click()
EndFunc   ;==>Label48Click
Func Label49Click()
EndFunc   ;==>Label49Click
Func Label4Click()
EndFunc   ;==>Label4Click
Func Label50Click()
EndFunc   ;==>Label50Click
Func Label51Click()
EndFunc   ;==>Label51Click
Func Label52Click()
EndFunc   ;==>Label52Click
Func Label53Click()
EndFunc   ;==>Label53Click
Func Label54Click()
EndFunc   ;==>Label54Click
Func Label55Click()
EndFunc   ;==>Label55Click
Func Label56Click()
EndFunc   ;==>Label56Click
Func Label57Click()
EndFunc   ;==>Label57Click
Func Label58Click()
EndFunc   ;==>Label58Click
Func Label59Click()
EndFunc   ;==>Label59Click
Func Label5Click()
EndFunc   ;==>Label5Click
Func Label60Click()
EndFunc   ;==>Label60Click
Func Label61Click()
EndFunc   ;==>Label61Click
Func Label62Click()
EndFunc   ;==>Label62Click
Func Label63Click()
EndFunc   ;==>Label63Click
Func Label64Click()
EndFunc   ;==>Label64Click
Func Label65Click()
EndFunc   ;==>Label65Click
Func Label66Click()
EndFunc   ;==>Label66Click
Func Label67Click()
EndFunc   ;==>Label67Click
Func Label68Click()
EndFunc   ;==>Label68Click
Func Label69Click()
EndFunc   ;==>Label69Click
Func Label6Click()
EndFunc   ;==>Label6Click
Func Label70Click()
EndFunc   ;==>Label70Click
Func Label71Click()
EndFunc   ;==>Label71Click
Func Label72Click()
EndFunc   ;==>Label72Click
Func Label73Click()
EndFunc   ;==>Label73Click
Func Label74Click()
EndFunc   ;==>Label74Click
Func Label75Click()
EndFunc   ;==>Label75Click
Func Label76Click()
EndFunc   ;==>Label76Click
Func Label77Click()
EndFunc   ;==>Label77Click
Func Label78Click()
EndFunc   ;==>Label78Click
Func Label79Click()
EndFunc   ;==>Label79Click
Func Label7Click()
EndFunc   ;==>Label7Click
Func Label80Click()
EndFunc   ;==>Label80Click
Func Label81Click()
EndFunc   ;==>Label81Click
Func Label82Click()
EndFunc   ;==>Label82Click
Func Label83Click()
EndFunc   ;==>Label83Click
Func Label84Click()
EndFunc   ;==>Label84Click
Func Label85Click()
EndFunc   ;==>Label85Click
Func Label86Click()
EndFunc   ;==>Label86Click
Func Label87Click()
EndFunc   ;==>Label87Click
Func Label88Click()
EndFunc   ;==>Label88Click
Func Label89Click()
EndFunc   ;==>Label89Click
Func Label8Click()
EndFunc   ;==>Label8Click
Func Label90Click()
EndFunc   ;==>Label90Click
Func Label91Click()
EndFunc   ;==>Label91Click
Func Label92Click()
EndFunc   ;==>Label92Click
Func Label93Click()
EndFunc   ;==>Label93Click
Func Label94Click()
EndFunc   ;==>Label94Click
Func Label95Click()
EndFunc   ;==>Label95Click
Func Label96Click()
EndFunc   ;==>Label96Click
Func Label98Click()
EndFunc   ;==>Label98Click
Func Label99Click()
EndFunc   ;==>Label99Click
Func Label9Click()
EndFunc   ;==>Label9Click
Func Pic1Click()
EndFunc   ;==>Pic1Click
Func Pic2Click()
EndFunc   ;==>Pic2Click
Func Pic3Click()
EndFunc   ;==>Pic3Click
Func Pic4Click()
EndFunc   ;==>Pic4Click
Func Pic5Click()
EndFunc   ;==>Pic5Click
Func Pic6Click()
EndFunc   ;==>Pic6Click
Func Pic7Click()
EndFunc   ;==>Pic7Click
