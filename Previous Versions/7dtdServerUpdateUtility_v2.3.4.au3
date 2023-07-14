#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\phoenixtray.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_v2.3.4.exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's ConanServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=2.3.4.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=2.3.4
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
#include <AutoItConstants.au3>
; *** End added by AutoIt3Wrapper ***

$aUtilVerStable = "v2.3.4" ; (2020-07-08)
$aUtilVerBeta = "v2.3.4" ; (2020-07-08)
$aUtilVersion = $aUtilVerStable
Global $aUtilVerNumber = 2
; 1 = v2.3.3
; 2 = v2.3.4

;**** Directives created by AutoIt3Wrapper_GUI ****
;Originally written by Dateranoth for use and modified for 7DTD by Phoenix125.com
;by https://gamercide.com on their server
;Distributed Under GNU GENERAL PUBLIC LICENSE

#include <Date.au3>
#include <Process.au3>
#include <StringConstants.au3>
#include <String.au3>
#include <IE.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>
#include <Inet.au3>
#include <TrayConstants.au3> ; Required For the $TRAY_ICONSTATE_SHOW constant.
#include <GuiConstants.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ColorConstants.au3>
#include <ListViewConstants.au3>

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Global Variables ****
Global $aTimeCheck0 = _NowCalc()
Global $aTimeCheck1 = _NowCalc()
Global $aTimeCheck2 = _NowCalc()
Global $aTimeCheck3 = _NowCalc()
Global $aTimeCheck4 = _NowCalc()
Global $aTimeCheck8 = _NowCalc()
Global Const $aUtilName = "7dtdServerUpdateUtility"
Global Const $aServerEXE = "7DaysToDieServer.exe"
Global Const $aServerShort = "7DTD"
$aGameName1 = "7 Days To Die"
Global Const $aIniFile = @ScriptDir & "\" & $aUtilName & ".ini"
Global $aUtilityVer = $aUtilName & " " & $aUtilVersion
Global $aUtilUpdateFile = @ScriptDir & "\__UTIL_UPDATE_AVAILABLE___.txt"
Global $aIniFailFile = @ScriptDir & "\___INI_FAIL_VARIABLES___.txt"
Global $aFolderLog = @ScriptDir & "\_Log\"
Global $aLogFile = $aFolderLog & $aUtilName & "_Log_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
Global $aLogDebugFile = $aFolderLog & $aUtilName & "_LogFull_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt"
Global $aFolderTemp = @ScriptDir & "\" & $aUtilName & "UtilFiles\"
Global $aUtilCFGFile = $aFolderTemp & $aUtilName & "_cfg.ini"
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
Global $aUseSteamCMD = "yes"
Global $aOnlinePlayerLast = ""
Global $aRCONError = False
Global $aServerReadyTF = False
$aServerReadyOnce = True
Global $aNoExistingPID = True
Global $hGUI = 0
Global $aGUIW = 275
Global $aGUIH = 250
Global $tUserCtTF = False
Global $iEdit = 0
Global $tUserCnt = 1
Global $aBusy = False
Global $aSteamUpdateNow = False
Global $aPlayerCountWindowTF = False
Global $tOnlinePlayerReady = False
Global $aPlayerCountShowTF = True
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

$aServerRebootReason = ""
$aRebootReason = ""
Global $aRebootConfigUpdate = "no"
$aAnnounceCount1 = 0
$aFPCount = 0
$aFPClock = _NowCalc()
$aServerName = "7 Days To Die"
Global $aSteamAppID = "294420"
$aUpdateSource = "0" ; 0 = SteamCMD , 1 = SteamDB.com
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

ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Updating config fie.")
;~ AppendConfigSettings()
;GetfromServerConfig()

If $aUpdateUtil = "yes" Then
	UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndIf

ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Creating temp config fie.")
;Func GetfromServerConfig()
Local Const $sConfigPath = $aServerDirLocal & "\" & $aConfigFile
Local $sFileExists = FileExists($sConfigPath)
If $sFileExists = 0 Then
	LogWrite("!!! ERROR !!! Could not find " & $sConfigPath)
	SplashOff()
	$aContinue = MsgBox($MB_YESNO, $aConfigFile & " Not Found", "Could not find " & $sConfigPath & ". (This is normal for New Install) " & @CRLF & "Do you wish to continue with installation?", 60)
	If $aContinue = 7 Then
		LogWrite("!!! ERROR !!! Could not find " & $sConfigPath & ". Program terminated by user.")
		Exit
	Else
	EndIf
EndIf
Global $aServerTelnetReboot = "no"
Local $kServerPort = "}ServerPort}value=}"
Local $kServerName = "}ServerName}value=}"
Local $kServerTelnetEnable = "}TelnetEnabled}value=}"
Local $kServerTelnetPort = "}TelnetPort}value=}"
Local $kServerTelnetPass = "}TelnetPassword}value=}"
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
FileClose($sConfigRead)
;EndFunc
#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
AppendConfigSettings()

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
			Exit
		EndIf
	EndIf
Else
	Local $cFileExists = FileExists($aServerDirLocal & "\" & $aServerEXE)
	If $cFileExists = 0 Then
		MsgBox(0x0, "7 Days To Die Server Not Found", "Could not find " & $aServerEXE & " at " & $aServerDirLocal)
		Exit
	EndIf
EndIf
#Region ; SteamCMD Update Files Creation
Local $ServExp = ""
If $aServerVer = "public" Then
Else
	$ServExp = " -beta " & $aServerVer
EndIf
Global $aBatchDIR = @ScriptDir & "\BatchFiles"
DirCreate($aBatchDIR)
Global $aSteamUpdateCMDValY = $aBatchDIR & "\Update_7DTD_Validate_YES.bat"
Global $aSteamUpdateCMDValN = $aBatchDIR & "\Update_7DTD_Validate_NO.bat"
Local $tCmd = 'SET steampath=' & $aSteamCMDDir & @CRLF & _
		'SET gamepath=' & $aServerDirLocal & @CRLF & _
		'"%steampath%\steamcmd.exe" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "%gamepath%" +app_update ' & $aSteamAppID & ' ' & $ServExp & ' ' & $aSteamExtraCMD
FileDelete($aSteamUpdateCMDValY)
FileWrite($aSteamUpdateCMDValY, $tCmd & " validate +quit")
FileDelete($aSteamUpdateCMDValN)
FileWrite($aSteamUpdateCMDValN, $tCmd & " +quit")
FileDelete($aBatchDIR & "\Update_7DTD_Beta_Validate_YES.bat") ; remove line after a while
FileDelete($aBatchDIR & "\Update_7DTD_Beta_Validate_NO.bat") ; remove line after a while
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

If $aRemoteRestartUse = "yes" Then
	ControlSetText($tSplash, "", "Static1", $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Starting Remote Restart.")
	TCPStartup() ; Start The TCP Services
	Global $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
	If $MainSocket = -1 Then
		MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $aRemoteRestartPort & "] Check server IP or disable Remote Restart in INI")
		LogWrite(" [Remote Restart] Remote Restart enabled. Could not bind to " & $aServerIP & ":" & $aRemoteRestartPort)
		Exit
	Else
		If $sObfuscatePass = "no" Then
			LogWrite(" [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]", " [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?" & $aRemoteRestartKey & "=" & $aRemoteRestartCode)
		Else
			LogWrite(" [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]")
		EndIf
	EndIf
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
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			GUIDelete()
			$aPlayerCountWindowTF = False
			$aPlayerCountShowTF = False
	EndSwitch

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
						Exit
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

		#EndRegion ;**** Keep Server Alive Check. ****
		#Region ;**** Show Online Players ****
		If $aServerOnlinePlayerYN = "yes" Then
			If ((_DateDiff('s', $aTimeCheck8, _NowCalc())) >= $aServerOnlinePlayerSec) Then
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
								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "update" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "mod" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aRebootReason = "daily" And $sUseDiscordBotDaily = "yes" And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
								If StringLen($aGameTime) > 5 Then _SendDiscordPlayer()
								$aAnnounceCount3 = $aAnnounceCount3 + 1
							EndIf
							If $aFirstStartDiscordAnnounce And ($aAnnounceCount3 = 0) Then
								SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
								SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
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
			If $aPlayersCount <> IniRead($aUtilCFGFile, "CFG", "Last Online Player Count", 0) Then
				_SendDiscordPlayer()
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
					If $sUseDiscordBotDaily = "yes" Then
						SendDiscordMsg($sDiscordWebHookURLs, $aDailyMsgDiscord[$aAnnounceCount0], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
					If $sUseDiscordBotRemoteRestart = "yes" Then
						SendDiscordMsg($sDiscordWebHookURLs, $aRemoteMsgDiscord[$aAnnounceCount0], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
					If $sUseDiscordBotUpdate = "yes" Then
						SendDiscordMsg($sDiscordWebHookURLs, $aUpdateMsgDiscord[$aAnnounceCount0], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
					If $sUseDiscordBotDaily = "yes" And ($sUseDiscordBotFirstAnnouncement = "no") Then
						SendDiscordMsg($sDiscordWebHookURLs, $aDailyMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
					If ($sUseDiscordBotRemoteRestart = "yes") And ($sUseDiscordBotFirstAnnouncement = "no") Then
						SendDiscordMsg($sDiscordWebHookURLs, $aRemoteMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
					If $sUseDiscordBotUpdate = "yes" And ($sUseDiscordBotFirstAnnouncement = "no") Then
						SendDiscordMsg($sDiscordWebHookURLs, $aUpdateMsgDiscord[$aAnnounceCount1], $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
					EndIf
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
			Exit
			; ----------------------------------------------------------
		ElseIf $Shutdown = 7 Then
			LogWrite(" [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			IniWrite($aUtilCFGFile, "CFG", "PID", $aServerPID)
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			LogWrite(" [Server] Stopped by User")
			Exit
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
		Exit
	EndIf
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------
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
			Local $tPlayers = IniRead($aUtilCFGFile, "CFG", "Last Online Player Count", 0)
			If $tQueryCheckResult[6] <> $tPlayers Then
				If $aGameTime = "Day 1, 00:00" Then
					If $aServerOnlinePlayerYN = "yes" Or $aTelnetCheckYN = "yes" Then GetPlayerCount(False)
				EndIf
				$aPlayersCount = $tQueryCheckResult[6]
				$aServerQueryName = StringReplace($tQueryCheckResult[1], "$~!", "|")
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
		Local $tDiscordPlayersMsg = StringReplace($sDiscordPlayersMsg, "\o", $aPlayersCount)
		$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\m", $aMaxPlayers)
		$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\t", $aGameTime)
		$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, "\n", $aNextHorde)
		$tDiscordPlayersMsg = StringReplace($tDiscordPlayersMsg, @CRLF, "")
		SendDiscordMsg($sDiscordWHPlayers, $tDiscordPlayersMsg, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
	EndIf
EndFunc   ;==>_SendDiscordPlayer
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

Func SendDiscordMsg($sHookURLs, $sBotMessage, $sBotName = "", $sBotTTS = False, $sBotAvatar = "")
	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_Discord_ErrFunc")
	Local $sJsonMessage = '{"content" : "' & $sBotMessage & '", "username" : "' & $sBotName & '", "tts" : "' & $sBotTTS & '", "avatar_url" : "' & $sBotAvatar & '"}'
	Local $oHTTPOST = ObjCreate("WinHttp.WinHttpRequest.5.1")
	Local $aHookURLs = StringSplit($sHookURLs, ",")
	For $i = 1 To $aHookURLs[0]
		$oHTTPOST.Open("POST", StringStripWS($aHookURLs[$i], 2) & "?wait=true", False)
		$oHTTPOST.SetRequestHeader("Content-Type", "application/json")
		$oHTTPOST.Send($sJsonMessage)
		Local $oStatusCode = $oHTTPOST.Status
		Local $sResponseText = ""
		$sResponseText = "Message Response: " & $oHTTPOST.ResponseText
		LogWrite(" [Discord Bot] Message sent: " & $sBotMessage, " [Discord Bot] Message Status Code {" & $oStatusCode & "} " & $sResponseText)
	Next
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
				Exit
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
				Exit
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
				Exit
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
				Exit
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
				Exit
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
				Exit
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
						Exit
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
	EndIf
EndFunc   ;==>UtilUpdate
;Func UtilUpdate($tLink, $tDL, $tUtil, $tUtilName)
;	SplashTextOn($aUtilName, $aUtilName & " started." & @CRLF & @CRLF & "Checking for " & $tUtilName & " updates.", 400, 100, -1, -1, $DLG_MOVEABLE, "")
;	Local $tVer[2]
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

Func ReadUini($sIniFile, $sLogFile)
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

	Global $aServerDirLocal = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $iniCheck)
	Global $aConfigFile = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $iniCheck)
	Global $aServerVer = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $iniCheck)
	Global $aServerExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $iniCheck)
	Global $aServerIP = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $iniCheck)
	Global $aSteamCMDDir = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $iniCheck)
	Global $aSteamExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (See note below) ###", $iniCheck)
	Global $aServerOnlinePlayerYN = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $iniCheck)
	Global $aServerOnlinePlayerSec = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $iniCheck)
	Global $aWipeServer = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $iniCheck)
	Global $aAppendVerBegin = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerEnd = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerShort = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $iniCheck)
	Global $aQueryYN = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Use Query Port to check if server is alive? (yes/no) ###", $iniCheck)
	Global $aQueryCheckSec = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query Port check interval in seconds (30-900) ###", $iniCheck)
	Global $aQueryIP = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $iniCheck)
	Global $aTelnetCheckYN = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Use telnet to check if server is alive? (yes/no) ###", $iniCheck)
	Global $aTelnetIP = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $iniCheck)
	Global $aTelnetCheckSec = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet check interval in seconds (30-900) ###", $iniCheck)
	Global $aWatchdogWaitServerUpdate = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server updated to allow map generation (1-360) ###", $iniCheck)
	Global $aWatchdogWaitServerStart = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server started to allow server to come online (1-60) ###", $iniCheck)
	Global $aWatchdogAttemptsBeforeRestart = IniRead($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", $iniCheck)

	Global $aExMemRestart = IniRead($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $iniCheck)
	Global $aExMemAmt = IniRead($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $iniCheck)
	Global $aRemoteRestartUse = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $iniCheck)
	Global $aRemoteRestartPort = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $iniCheck)
	Global $aRemoteRestartKey = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $iniCheck)
	Global $aRemoteRestartCode = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $iniCheck)
	Global $aCheckForUpdate = IniRead($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $iniCheck)
	Global $aUpdateCheckInterval = IniRead($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $iniCheck)
	Global $aRestartDaily = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $iniCheck)
	Global $aRestartDays = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $iniCheck)
	Global $bRestartHours = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $iniCheck)
	Global $bRestartMin = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $iniCheck)
	Global $sAnnounceNotifyTime1 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $iniCheck)
	Global $sAnnounceNotifyTime2 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $iniCheck)
	Global $sAnnounceNotifyTime3 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $iniCheck)
	;	Global $sAnnounceDailyMessage = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement Daily (\m - minutes) ###", $iniCheck)
	;	Global $sAnnounceDailyMessage = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement Daily (\m - minutes) ###", $iniCheck)
	Global $sInGameAnnounce = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $iniCheck)
	Global $sInGameDailyMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sInGameUpdateMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sInGameRemoteRestartMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sUseDiscordBotDaily = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotUpdate = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotRemoteRestart = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotServersUpYN = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $iniCheck)
	Global $sUseDiscordBotFirstAnnouncement = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $iniCheck)
	;	Global $sUseDiscordBotAppendServer - IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Append server name to beginning of messages? (yes/no) ###", $iniCheck)
	Global $sDiscordDailyMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sDiscordUpdateMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sDiscordRemoteRestartMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sDiscordServersUpMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement when server is back online ###", $iniCheck)
	Global $sDiscordWebHookURLs = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook URL ###", $iniCheck)
	Global $sDiscordWHPlayers = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook Online Player Count URL ###", $iniCheck)
	Global $sDiscordPlayersMsg = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Online Player Message (\o - Online Player Count, \m - Max Players, \t - Game Time, \n - Days to Next Horde) ###", $iniCheck)
	Global $sDiscordBotName = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Name ###", $iniCheck)
	Global $bDiscordBotUseTTS = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Use TTS? (yes/no) ###", $iniCheck)
	Global $sDiscordBotAvatar = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Avatar Link ###", $iniCheck)
	Global $sUseTwitchBotDaily = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for DAILY reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchBotUpdate = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for UPDATE reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchBotRemoteRestart = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for REMOTE RESTART reboot? (yes/no) ###", $iniCheck)
	Global $sUseTwitchFirstAnnouncement = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for first announcement only? (reduces bot spam)(yes/no) ###", $iniCheck)
	Global $sTwitchDailyMessage = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sTwitchUpdateMessage = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sTwitchRemoteRestartMessage = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sTwitchNick = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Nick ###", $iniCheck)
	Global $sChatOAuth = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "ChatOAuth ###", $iniCheck)
	Global $sTwitchChannels = IniRead($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Channels ###", $iniCheck)
	Global $aExecuteExternalScript = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Execute external script BEFORE update? (yes/no) ###", $iniCheck)
	Global $aExternalScriptDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script directory ###", $iniCheck)
	Global $aExternalScriptName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script filename ###", $iniCheck)
	Global $aExternalScriptValidateYN = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no) ###", $iniCheck)
	Global $aExternalScriptValidateDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script directory ###", $iniCheck)
	Global $aExternalScriptValidateName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script filename ###", $iniCheck)
	Global $aExternalScriptUpdateYN = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Execute external script for server update restarts? (yes/no) ###", $iniCheck)
	Global $aExternalScriptUpdateDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script directory ###", $iniCheck)
	Global $aExternalScriptUpdateFileName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script filename ###", $iniCheck)
	Global $aExternalScriptDailyYN = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Execute external script for daily server restarts? (yes/no) ###", $iniCheck)
	Global $aExternalScriptDailyDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script directory ###", $iniCheck)
	Global $aExternalScriptDailyFileName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script filename ###", $iniCheck)
	Global $aExternalScriptAnnounceYN = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Execute external script when first restart announcement is made? (yes/no) ###", $iniCheck)
	Global $aExternalScriptAnnounceDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script directory ###", $iniCheck)
	Global $aExternalScriptAnnounceFileName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script filename ###", $iniCheck)
	Global $aExternalScriptRemoteYN = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no) ###", $iniCheck)
	Global $aExternalScriptRemoteDir = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script directory ###", $iniCheck)
	Global $aExternalScriptRemoteFileName = IniRead($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script filename ###", $iniCheck)
	Global $aLogQuantity = IniRead($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $iniCheck)
	Global $aValidate = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $iniCheck)
	Global $aUpdateSource = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $iniCheck)
	;	Global $aUsePuttytel = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $iniCheck)
	Global $sObfuscatePass = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $iniCheck)
	Global $aUpdateUtil = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $iniCheck)
	Global $aUtilBetaYN = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $iniCheck)
	Global $aExternalScriptHideYN = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $iniCheck)
	Global $aFPAutoUpdateYN = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $iniCheck)
	;	Global $aFPAppendFPSettingsYN = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Append the following settings to new config? (yes/no) ###", $iniCheck)
	;	Global $aFPServerName = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerName ###", $iniCheck)
	;	Global $aFPServerPort = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPort ###", $iniCheck)
	;	Global $aFPServerPassword = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPassword ###", $iniCheck)
	;	Global $aFPTelnetPort = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPort ###", $iniCheck)
	;	Global $aFPTelnetPassword = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPassword ###", $iniCheck)
	;	Global $aFPServerLoginConfirmationText = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerLoginConfirmationText ###", $iniCheck)
	;	Global $aFPServerMaxPlayerCount = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerMaxPlayerCount ###", $iniCheck)
	;	Global $aFPServerDescription = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDescription ###", $iniCheck)
	;	Global $aFPServerWebsiteURL = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerWebsiteURL ###", $iniCheck)
	;	Global $aFPServerDisabledNetworkProtocols = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDisabledNetworkProtocols ###", $iniCheck)
	;	Global $aFPGameWorld = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameWorld ###", $iniCheck)
	;	Global $aFPWorldGenSeed = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSeed ###", $iniCheck)
	;	Global $aFPWorldGenSize = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSize ###", $iniCheck)
	;	Global $aFPGameName = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameName ###", $iniCheck)
	;	Global $aFPGameDifficulty = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameDifficulty ###", $iniCheck)
	;	Global $aFPAdminFileName = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "AdminFileName ###", $iniCheck)
	;	Global $aFPDropOnDeath = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "DropOnDeath ###", $iniCheck)

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
	If $iniCheck = $aSteamExtraCMD Then
		$aSteamExtraCMD = ""
		$iIniFail += 1
		$iIniError = $iIniError & "SteamExtraCMD, "
	EndIf
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
		$sUseDiscordBotDaily = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotDaily, "
	EndIf
	If $iniCheck = $sUseDiscordBotUpdate Then
		$sUseDiscordBotUpdate = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotUpdate, "
	EndIf
	If $iniCheck = $sUseDiscordBotRemoteRestart Then
		$sUseDiscordBotRemoteRestart = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotRemoteRestart, "
	EndIf
	If $iniCheck = $sUseDiscordBotServersUpYN Then
		$sUseDiscordBotServersUpYN = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotSereversUpYN, "
	EndIf

	If $iniCheck = $sUseDiscordBotFirstAnnouncement Then
		$sUseDiscordBotFirstAnnouncement = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotFirstAnnouncement, "
	EndIf
	If $iniCheck = $sDiscordWebHookURLs Then
		$sDiscordWebHookURLs = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordWebHookURLs, "
	EndIf
	If $iniCheck = $sDiscordWHPlayers Then
		$sDiscordWHPlayers = "https://discordapp.com/api/webhooks/012345678901234567/abcdefghijklmnopqrstuvwxyz01234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcde"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordWHPlayers, "
	EndIf
	If $iniCheck = $sDiscordPlayersMsg Then
		$sDiscordPlayersMsg = "Players Online: **\o / \m**  Game Time: **\t**  Next Horde: **\n days**"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordPlayersMsg, "
	EndIf
	If $iniCheck = $sDiscordBotName Then
		$sDiscordBotName = "7 Days To Die Bot"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordBotName, "
	EndIf
	If $iniCheck = $bDiscordBotUseTTS Then
		$bDiscordBotUseTTS = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordBotUseTTS, "
	EndIf
	If $iniCheck = $sDiscordBotAvatar Then
		$sDiscordBotAvatar = ""
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordBotUseTTS, "
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

	If $iIniFail > 0 Then
		iniFileCheck($sIniFile, $iIniFail, $iIniError)
	EndIf
	If $bDiscordBotUseTTS = "yes" Then
		$bDiscordBotUseTTS = True
	Else
		$bDiscordBotUseTTS = False
	EndIf

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
	$sDiscordWebHookURLs = StringRegExpReplace($sDiscordWebHookURLs, "<-NO TRAILING SLASH AND USE FULL URL FROM WEBHOOK URL ON DISCORD", "")
	LogWrite("", " . . . Server Folder = " & $aServerDirLocal)
	LogWrite("", " . . . SteamCMD Folder = " & $aSteamCMDDir)
EndFunc   ;==>ReadUini

Func iniFileCheck($sIniFile, $iIniFail, $iIniError)
	If FileExists($sIniFile) Then
		Local $aMyDate, $aMyTime
		_DateTimeSplit(_NowCalc(), $aMyDate, $aMyTime)
		Local $iniDate = StringFormat("%04i.%02i.%02i.%02i%02i", $aMyDate[1], $aMyDate[2], $aMyDate[3], $aMyTime[1], $aMyTime[2])
		FileMove($sIniFile, $sIniFile & "_" & $iniDate & ".bak", 1)
		UpdateIni($sIniFile)
		;		FileWriteLine($aIniFailFile, _NowCalc() & " INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		Local $iIniErrorCRLF = StringRegExpReplace($iIniError, ", ", @CRLF & @TAB)
		FileWriteLine($aIniFailFile, _NowCalc() & @CRLF & " ---------- Parameters missing or changed ----------" & @CRLF & @CRLF & @TAB & $iIniErrorCRLF)
		LogWrite(" INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		LogWrite(" INI MISMATCH: Parameters missing: " & $iIniFail)
		SplashOff()
		MsgBox(4096, "INI MISMATCH", "INI FILE WAS UPDATED." & @CRLF & "Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini:" & @CRLF & @CRLF & $iIniError & @CRLF & @CRLF & _
				"Backup created and all existing settings transfered to new INI." & @CRLF & @CRLF & "Please modify INI and restart." & @CRLF & @CRLF & "File created: ___INI_FAIL_VARIABLES___.txt")
		Run("notepad " & $aIniFailFile, @WindowsDir)
		Exit
	Else
		UpdateIni($sIniFile)
		SplashOff()
		MsgBox(4096, "Default INI File Created", "Please Modify Default Values and Restart Program." & @CRLF & @CRLF & "IF NEW DEDICATED SERVER INSTALL:" & @CRLF & " - Once the server is installed and running," & @CRLF & _
				"Rt-Click on " & $aUtilName & " icon and shutdown server." & @CRLF & " - Then modify the server files and restart this utility.")
		LogWrite(" Default INI File Created . . Please Modify Default Values and Restart Program.")
		Exit
	EndIf
EndFunc   ;==>iniFileCheck

Func UpdateIni($sIniFile)
	FileWriteLine($sIniFile, "[ --------------- " & StringUpper($aUtilName) & " INFORMATION --------------- ]")
	FileWriteLine($sIniFile, "Author   :  Phoenix125")
	FileWriteLine($sIniFile, "Version  :  " & $aUtilityVer)
	FileWriteLine($sIniFile, "Website  :  http://www.Phoenix125.com")
	FileWriteLine($sIniFile, "Discord  :  http://discord.gg/EU7pzPs")
	FileWriteLine($sIniFile, "Forum    :  https://phoenix125.createaforum.com/index.php")
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $aServerDirLocal)
	;	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config file (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", $aConfigFile)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $aConfigFile)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (ex. public/latest_experimental/alpha18.4) ###", $aServerVer)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $aServerExtraCMD)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $aServerIP)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $aSteamCMDDir)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (See note below) ###", $aSteamExtraCMD)
	FileWriteLine($sIniFile, ' NOTE: hardcoded steamcmd commandline includes: steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "%gamepath%" +app_update ' & $aSteamAppID)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $aServerOnlinePlayerYN)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $aServerOnlinePlayerSec)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $aWipeServer)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $aAppendVerBegin)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $aAppendVerEnd)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $aAppendVerShort)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server updated to allow map generation (1-360) ###", $aWatchdogWaitServerUpdate)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Pause watchdog for _ minutes after server started to allow server to come online (1-60) ###", $aWatchdogWaitServerStart)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Number of failed responses (after server has responded at least once) before restarting server (1-10) (Default is 3) ###", $aWatchdogAttemptsBeforeRestart)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Use Query Port to check if server is alive? (yes/no) ###", $aQueryYN)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aQueryIP)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG --------------- ", "Query Port check interval in seconds (30-900) ###", $aQueryCheckSec)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Use telnet to check if server is alive? (yes/no) ###", $aTelnetCheckYN)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aTelnetIP)
	IniWrite($sIniFile, " --------------- KEEP ALIVE WATCHDOG ---------------", "Telnet check interval in seconds (30-900) ###", $aTelnetCheckSec)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $aExMemRestart)
	IniWrite($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $aExMemAmt)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $aRemoteRestartUse)
	IniWrite($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $aRemoteRestartPort)
	IniWrite($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $aRemoteRestartKey)
	IniWrite($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $aRemoteRestartCode)
	FileWriteLine($sIniFile, "(Usage example: http://192.168.1.10:57520/?restart=password)")
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $aCheckForUpdate)
	IniWrite($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $aUpdateCheckInterval)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $aRestartDaily)
	IniWrite($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $aRestartDays)
	IniWrite($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $bRestartHours)
	IniWrite($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $bRestartMin)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $sAnnounceNotifyTime1)
	IniWrite($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $sAnnounceNotifyTime2)
	IniWrite($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $sAnnounceNotifyTime3)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $sInGameAnnounce)
	IniWrite($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sInGameDailyMessage)
	IniWrite($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sInGameUpdateMessage)
	IniWrite($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sInGameRemoteRestartMessage)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $sUseDiscordBotDaily)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $sUseDiscordBotUpdate)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $sUseDiscordBotRemoteRestart)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $sUseDiscordBotServersUpYN)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first announcement only? (reduces bot spam)(yes/no) ###", $sUseDiscordBotFirstAnnouncement)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sDiscordDailyMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sDiscordUpdateMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sDiscordRemoteRestartMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement when server is back online ###", $sDiscordServersUpMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook URL ###", $sDiscordWebHookURLs)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook Online Player Count URL ###", $sDiscordWHPlayers)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Online Player Message (\o - Online Player Count, \m - Max Players, \t - Game Time, \n - Days to Next Horde) ###", $sDiscordPlayersMsg)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Name ###", $sDiscordBotName)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Use TTS? (yes/no) ###", $bDiscordBotUseTTS)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Bot Avatar Link ###", $sDiscordBotAvatar)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for DAILY reboot? (yes/no) ###", $sUseTwitchBotDaily)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for UPDATE reboot? (yes/no) ###", $sUseTwitchBotUpdate)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for REMOTE RESTART reboot? (yes/no) ###", $sUseTwitchBotRemoteRestart)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Send Twitch message for first announcement only? (reduces bot spam)(yes/no) ###", $sUseTwitchFirstAnnouncement)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sTwitchDailyMessage)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sTwitchUpdateMessage)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sTwitchRemoteRestartMessage)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Nick ###", $sTwitchNick)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "ChatOAuth ###", $sChatOAuth)
	IniWrite($sIniFile, " --------------- TWITCH INTEGRATION --------------- ", "Channels ###", $sTwitchChannels)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Execute external script BEFORE update? (yes/no) ###", $aExecuteExternalScript)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script directory ###", $aExternalScriptDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START --------------- ", "1-Script filename ###", $aExternalScriptName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no) ###", $aExternalScriptValidateYN)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script directory ###", $aExternalScriptValidateDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START --------------- ", "2-Script filename ###", $aExternalScriptValidateName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Execute external script for server update restarts? (yes/no) ###", $aExternalScriptUpdateYN)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script directory ###", $aExternalScriptUpdateDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* --------------- ", "3-Script filename ###", $aExternalScriptUpdateFileName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Execute external script for daily server restarts? (yes/no) ###", $aExternalScriptDailyYN)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script directory ###", $aExternalScriptDailyDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART --------------- ", "4-Script filename ###", $aExternalScriptDailyFileName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Execute external script when first restart announcement is made? (yes/no) ###", $aExternalScriptAnnounceYN)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script directory ###", $aExternalScriptAnnounceDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE --------------- ", "5-Script filename ###", $aExternalScriptAnnounceFileName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no) ###", $aExternalScriptRemoteYN)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script directory ###", $aExternalScriptRemoteDir)
	IniWrite($sIniFile, " --------------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE --------------- ", "6-Script filename ###", $aExternalScriptRemoteFileName)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $aLogQuantity)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $aValidate)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $aUpdateSource)
	;	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $aUsePuttytel)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $sObfuscatePass)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $aExternalScriptHideYN)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $aUpdateUtil)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $aUtilBetaYN)
	FileWriteLine($sIniFile, @CRLF)
	FileWriteLine($sIniFile, "[--------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS ---------------]")
	FileWriteLine($sIniFile, "During updates, The Fun Pimps sometimes make changes to the ServerConfig.xml file, which can cause the server to fail to start when using the old config file.")
	FileWriteLine($sIniFile, "  This section is a best-effort attempt to temporarily adjust to those changes during server updates to keep your server running.")
	;	FileWriteLine($sIniFile, "If YES to either two questions below, this utility will make a backup of your existing serverconfig file (as listed in Game Server Configuration section),)")
	FileWriteLine($sIniFile, "  If automatic import enabled above, this utility will attempt two reboots. If The server fails to boot after the second reboot,")
	FileWriteLine($sIniFile, "  it will backup of your existing serverconfig file (as listed in Game Server Configuration section),")
	FileWriteLine($sIniFile, "  copy the contents from the new ServerConfig.xml, import data from your existing config file, and add this data")
	FileWriteLine($sIniFile, "  to your serverconfig file (as listed above) at the end of the file.")
	FileWriteLine($sIniFile, "Therefore, after an update, it is recommended that you review your config file and make any changes.")
	FileWriteLine($sIniFile, "The following parameters will be imported:")
	FileWriteLine($sIniFile, "  ServerName, ServerPort, ServerPassword, TelnetPort, TelnetPassword, ServerLoginConfirmationText, ServerMaxPlayerCount, ServerDescription,")
	FileWriteLine($sIniFile, "  ServerWebsiteURL,, ServerDisabledNetworkProtocols, GameWorld, WorldGenSeed, WorldGenSize, GameName, GameDifficulty, ServerLoginConfirmationText, DropOnDeath")
	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $aFPAutoUpdateYN)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Append the following settings to new config? (yes/no) ###", $aFPAppendFPSettingsYN)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerName ###", $aFPServerName)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPort ###", $aFPServerPort)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerPassword ###", $aFPServerPassword)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPort ###", $aFPTelnetPort)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "TelnetPassword ###", $aFPTelnetPassword)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerLoginConfirmationText ###", $aFPServerLoginConfirmationText)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerMaxPlayerCount ###", $aFPServerMaxPlayerCount)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDescription ###", $aFPServerDescription)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerWebsiteURL ###", $aFPServerWebsiteURL)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "ServerDisabledNetworkProtocols ###", $aFPServerDisabledNetworkProtocols)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameWorld ###", $aFPGameWorld)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSeed ###", $aFPWorldGenSeed)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "WorldGenSize ###", $aFPWorldGenSize)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameName ###", $aFPGameName)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "GameDifficulty ###", $aFPGameDifficulty)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "AdminFileName ###", $aFPAdminFileName)
	;	IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "DropOnDeath ###", $aFPDropOnDeath)
	FileWriteLine($sIniFile, @CRLF)
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
		Exit
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
		Exit
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
				Exit
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
		Else
			Local $tUser1 = _StringBetween($sMsg[1], ". id=", "pos=")
			Global $tUserCnt = UBound($tUser1)
			If $aQueryYN = "no" Then
				$aPlayersCount = $tUserCnt
			EndIf
			Local $tSteamIDArray = _StringBetween($sMsg[1], "steamid=", ",")
			Local $tUserAll[$tUserCnt]
			$tOnlinePlayers[1] = $tOnlinePlayers[1] & "(" & $tUserCnt & ") " & @CRLF
			$tOnlinePlayers[2] = $tOnlinePlayers[2] & "(" & $tUserCnt & ") "
			For $i = 0 To ($tUserCnt - 1)
				$tUserAll[$i] = _ArrayToString(_StringBetween($tUser1[$i], ", ", ", "))
				$tOnlinePlayers[1] = $tOnlinePlayers[1] & $tUserAll[$i] & " - " & $tSteamIDArray[$i] & @CRLF
				$tOnlinePlayers[2] = $tOnlinePlayers[2] & $tUserAll[$i] & " [" & $tSteamIDArray[$i] & "] , "
			Next
		EndIf
		If $aRCONError Then
			LogWrite(" [Online Players] Error receiving online players.")
			$aErr = True
			$aRCONError = False
		EndIf
		SplashOff()
		TraySetToolTip(@ScriptName)
		TraySetIcon(@ScriptName, 99)
		If ($aOnlinePlayerLast <> $tOnlinePlayers[1]) And $aGameTime <> "Day 1, 00:00" Then
			$tOnlinePlayers[0] = True
			LogWrite(" [Online Players] " & $tOnlinePlayers[2])
			WriteOnlineLog($tOnlinePlayers[2])
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

Func ShowOnlineGUI()
	If $aServerOnlinePlayerYN = "yes" Then
		If $aPlayerCountShowTF Then
			If $iEdit <> 0 Then
				GUICtrlSetData($iEdit, "")
			EndIf

			If $aPlayerCountWindowTF = False Then
				If $tUserCnt > 13 Then
					$aGUIH = 500 ;Create Show Online Players Window Frame
					$hGUI = GUICreate(@ScriptName, $aGUIW, $aGUIH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME)) ;Creates the GUI window
					GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
					GUICtrlSetLimit(-1, 0xFFFFFF)
				Else
					$aGUIH = 250 ;Create Show Online Players Window Frame
					$hGUI = GUICreate(@ScriptName, $aGUIW, $aGUIH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME)) ;Creates the GUI window
					GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
					GUICtrlSetLimit(-1, 0xFFFFFF)
				EndIf
				$aPlayerCountWindowTF = True
			EndIf
			If $tOnlinePlayerReady Then
				$iEdit = GUICtrlCreateEdit(_DateTimeFormat(_NowCalc(), 0) & @CRLF & $tOnlinePlayers[1], 0, 0, $aGUIW, $aGUIH, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_READONLY), $WS_EX_STATICEDGE)
			Else
				$iEdit = GUICtrlCreateEdit(_DateTimeFormat(_NowCalc(), 0) & @CRLF & "Waiting for first Online Player and Game Time check.", 0, 0, $aGUIW, $aGUIH, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_READONLY), $WS_EX_STATICEDGE)
			EndIf
			ControlClick($hGUI, "", $iEdit)
			GUISetState(@SW_SHOW) ;Shows the GUI window
		EndIf
	EndIf
EndFunc   ;==>ShowOnlineGUI

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
	FileWriteLine(@ScriptDir & "\" & $aUtilName & "_OnlineUserLog_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt", _NowCalc() & " " & $aMsg)
EndFunc   ;==>WriteOnlineLog

Func TrayShowPlayerCheckPause()
	GUIDelete()
	$aPlayerCountWindowTF = False
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

Func TelnetOnlinePlayers($ip, $port, $pwd)
	If $aBusy Then
		Return "Telnet Busy. Please try again."
	Else
		$aBusy = True
		Local $sReturn[2]
		Local $telnetfn = "ttermpro.exe"
		Local $telnetfnz = "tt.zip"
		Local $telnetfp = $aFolderTemp & "tt\" & $telnetfn
		Local $telnetSend = $aFolderTemp & "tt\_telnetSend.ttl"
		Local $telnetOut = $aFolderTemp & "tt\_telnetOut.log"
		If FileExists($telnetSend) Then FileDelete($telnetSend)
		If FileExists($telnetOut) Then FileDelete($telnetOut)
		LogWrite("", " [Telnet] Retrieving Online Players and Game Time.")
		Local $sFileExists = FileExists($telnetfp)
		If $sFileExists = 0 Then
			LogWrite(" [Telnet] Downloading Modified Tera Term Pro: http://www.phoenix125.com/share/" & $telnetfnz)
			InetGet("http://www.phoenix125.com/share/" & $telnetfnz, $aFolderTemp & $telnetfnz, 0)
			DirCreate($aFolderTemp & "tt")
			$fail = _ExtractZip($aFolderTemp & $telnetfnz, "", "tt", $aFolderTemp)
			If @error Then
				LogWrite(" [Telnet] ERROR!! Failed to extract Modified Tera Term Pro. Telnet features will not work.")
			EndIf
			If Not FileExists($telnetfp) Then
				LogWrite(" [Telnet] ERROR!! Failed to download Modified Tera Term Pro. Telnet features will not work.")
				MsgBox(0x0, "ERROR", "Modified Tera Term Pro not found. " & @CRLF & "Telnet features will not work." & @CRLF & @CRLF & "http://www.phoenix125.com/share/" & $telnetfnz, 30)
			EndIf
		EndIf
		If FileExists($telnetfp) Then
			$tCmd = "showtt -1" & @CRLF & "restoresetup '" & $aFolderTemp & "tt\7dtdTeraTerm.ini'" & @CRLF & "connect '" & $ip & ":" & $port & "'" & @CRLF & "logautoclosemode 1" & @CRLF & "logopen '" & $telnetOut & "'" & @CRLF & _
					"logstart" & @CRLF & "sendln" & @CRLF & "sendln '" & $pwd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'to end session'" & @CRLF & _
					"sendln 'gettime'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'done'" & @CRLF & _
					"sendln 'listplayers'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'game'" & @CRLF & _
					"sendln 'exit'" & @CRLF & "logclose" & @CRLF & "closett" & @CRLF
;~ 			$tCMD = "showtt -1" & @CRLF & "restoresetup '" & @ScriptDir & "\tt\7dtdTeraTerm.ini'" & @CRLF & "connect '" & $ip & ":" & $port & "'" & @CRLF & "logautoclosemode 1" & @CRLF & "logopen '" & $telnetOut & "'" & @CRLF & _
;~ 					"KimisCool" & @CRLF & "logstart" & @CRLF & "sendln" & @CRLF & "sendln '" & $pwd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'to end session'" & @CRLF & _
;~ 					"sendln 'gettime'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'done'" & @CRLF & _
;~ 					"sendln 'listplayers'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'game'" & @CRLF & _
;~ 					"sendln 'exit'" & @CRLF & "logclose" & @CRLF & "closett" & @CRLF
			FileWriteLine($telnetSend, $tCmd)
			Local $aRun = $telnetfp & " /m=""" & $telnetSend & """"
			Local $mOut = Run($aRun, $aFolderTemp & "tt", @SW_MINIMIZE)
			$tErr = ProcessWaitClose($mOut, 5)
			For $i = 0 To 3
;~ 				If WinExists("[Class:#32770]") Then
				If WinExists("MACRO -") Then
					Sleep(3000)
					WinKill("MACRO -")
				EndIf
				If WinExists("ttpmacro.exe") Then
					Sleep(3000)
					WinKill("ttpmacro.exe")
				EndIf
			Next
			If WinExists("MACRO -") Then
				$sReturn[0] = "Error: Timed Out"
				$aBusy = False
				Return $sReturn
;~ 			$tErr = ProcessWaitClose($mOut, 5)
;~ 			If $tErr = 0 Then
;~ 				$sReturn[0] = "Error: Timed Out"
;~ 				ProcessClose($mOut)
;~ 				ProcessClose("MACRO: Error")
;~ 				ProcessClose("MACRO - _telnetSend.ttl")
;~ 				"ttpmacro.exe"
;~ 				$aBusy = False
;~ 				Return $sReturn
			Else
				$aReturn = FileRead($telnetOut)
				Local $aReturn1 = _StringBetween($aReturn, "'gettime'", "listplayers")
				Local $aReturn2 = _ArrayToString($aReturn1)
				Local $sFirstLine1 = StringRegExpReplace($aReturn2, "(?s)^(\V+).*$", "\1") ; First line in string.
				Local $aReturn3 = StringRegExpReplace($aReturn2, $sFirstLine1 & "\v*", "")
				$sReturn[0] = StringRegExpReplace($aReturn3, @CRLF, "")
				Local $aReturn4 = _StringBetween($aReturn, "'listplayers'", "exit")
				Local $aReturn5 = _ArrayToString($aReturn4)
				Local $sFirstLine2 = StringRegExpReplace($aReturn2, "(?s)^(\V+).*$", "\1") ; First line in string.
				$sReturn[1] = StringRegExpReplace($aReturn5, $sFirstLine2 & "\v*", "")
				;Kim				If FileExists($telnetSend) Then FileDelete($telnetSend)
				;Kim				If FileExists($telnetOut) Then FileDelete($telnetOut)
				$aBusy = False
				Return $sReturn
			EndIf
		Else
			$sReturn[0] = "Error: Could Not Find " & $telnetfp
			$sReturn[1] = "Error: Could Not Find " & $telnetfp
			$aBusy = False
			Return $sReturn
		EndIf
	EndIf
EndFunc   ;==>TelnetOnlinePlayers

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

