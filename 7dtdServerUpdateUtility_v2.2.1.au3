#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\phoenix_5Vq_icon.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_v2.2.1.exe
#AutoIt3Wrapper_Outfile_x64=Builds\7dtdServerUpdateUtility_x64_v2.2.1.exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's ConanServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=2.2.1.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=2.2.1
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; *** Start added by AutoIt3Wrapper ***
#include <AutoItConstants.au3>
; *** End added by AutoIt3Wrapper ***

$aUtilVersion = "v2.2.1" ; (2019-03-13)

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
#include <TrayConstants.au3>

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Global Variables ****
Global $aTimeCheck0 = _NowCalc()
Global $aTimeCheck1 = _NowCalc()
Global $aTimeCheck2 = _NowCalc()
Global $aTimeCheck3 = _NowCalc()
Global $aTimeCheck4 = _NowCalc()
Global Const $aUtilName = "7dtdServerUpdateUtility"
Global Const $aServerEXE = "7DaysToDieServer.exe"
Global Const $aServerShort = "7DTD"
Global Const $aPIDServerFile = @ScriptDir & "\" & $aUtilName & "_lastpid.tmp"
Global Const $aLogFile = @ScriptDir & "\" & $aUtilName & ".log"
Global Const $aIniFile = @ScriptDir & "\" & $aUtilName & ".ini"
Global Const $aUtilityVer = $aUtilName & " " & $aUtilVersion
Global $aUtilUpdateFile = @ScriptDir & "\__UTIL_UPDATE_AVAILABLE___.txt"
Global $aIniFailFile = @ScriptDir & "\___INI_FAIL_VARIABLES___.txt"
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
Global $aUseSteamCMD = "yes"
Global $aExperimentalString = "latest_experimental"

$aServerRebootReason = ""
$aRebootReason = ""
$aRebootConfigUpdate = "no"
$aAnnounceCount1 = 0
$aFPCount = 0
$aFPClock = _NowCalc()
$aServerName = "7 Days To Die"
Global $aSteamAppID = "294420"
Global $aSteamDBURLPublic = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
Global $aSteamDBURLExperimental = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
$aUpdateSource = "0" ; 0 = SteamCMD , 1 = SteamDB.com
$aServerUpdateLinkVer = "http://www.phoenix125.com/share/7dtdlatestver.txt"
$aServerUpdateLinkDL = "http://www.phoenix125.com/share/7dtdServerUpdateUtility.zip"
Global $aShowUpdate = False

#EndRegion ;**** Global Variables ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
OnAutoItExitRegister("Gamercide")
SplashTextOn($aUtilName, "7dtdServerUpdateUtility started.", 250, 50, -1, -1, $DLG_MOVEABLE, "")
FileWriteLine($aLogFile, _NowCalc() & " ============================ " & $aUtilityVer & " Started ============================")

Global $aServerPID = PIDReadServer($aPIDServerFile)

SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Importing settings from " & $aIniFile & ".", 400, 110, -1, -1, $DLG_MOVEABLE, "")
ReadUini($aIniFile, $aLogFile)
If $aTelnetIP = "" Then
	$aTelnetIP = $aServerIP
EndIf

SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Updating config fie.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
AppendConfigSettings()
;GetfromServerConfig()

SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Creating temp config fie.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
;Func GetfromServerConfig()
Local Const $sConfigPath = $aServerDirLocal & "\" & $aConfigFile
Local $sFileExists = FileExists($sConfigPath)
If $sFileExists = 0 Then
	FileWriteLine($aLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath)
	SplashOff()
	$aContinue = MsgBox($MB_YESNO, $aConfigFile & " Not Found", "Could not find " & $sConfigPath & ". (This is normal for New Install) " & @CRLF & "Do you wish to continue with installation?", 60)
	If $aContinue = 7 Then
		FileWriteLine($aLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath & ". Program terminated by user.")
		Exit
	Else
	EndIf
EndIf
$aServerTelnetReboot = "no"
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
Local $xFPServerLoginConfirmationText = _StringBetween($sConfigRead, $kFPServerLoginConfirmationText, "}")
Global $aFPServerLoginConfirmationText = _ArrayToString($xFPServerLoginConfirmationText)

If $aServerSaveGame = "absolute path" Then
	Global $aServerSaveGame = _PathFull("7DaysToDieFolder", @AppDataDir)
EndIf
If $aServerTelnetEnable = "no" Or $aServerTelnetEnable = "false" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet was disabled. Telnet required for this utility. TelnetEnabled set to: true")
	;	Global $aServerTelnetEnable = "true"
	Global $aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet was disabled." & @CRLF
EndIf
Global $aServerTelnetEnable = "true"
If $aTelnetPort = "" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet port was blank. Port CHANGED to default value: 8081")
	Global $aTelnetPort = "8081"
	Global $aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet port was blank." & @CRLF
EndIf
If $aTelnetPass = "CHANGEME" Or $aTelnetPass = "" Then
	If $sObfuscatePass = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: [hidden]. Recommend change telnet password in " & $aConfigFile)
	Else
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: 7dtdServerUpdateUtility. Recommend change telnet password in " & $aConfigFile)
	EndIf
	Global $aTelnetPass = "7dtdServerUpdateUtility"
	Global $aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet password was blank or CHANGEME." & @CRLF
EndIf
If $aServerTerminalWindow = "false" Then
Else
	FileWriteLine($aLogFile, _NowCalc() & " . . . Terminal window was enabled. Utility cannot function with it enabled. Terminal window set to: false")
	Global $aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Terminal window was enabled." & @CRLF
EndIf
FileWriteLine($aLogFile, _NowCalc() & " [Server] Retrieving data from " & $aConfigFile & ".")
If $xDebug Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Port = " & $aServerPort)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Name = " & $aServerName)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Port = " & $aTelnetPort)
	If $sObfuscatePass = "no" Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Password = " & $aTelnetPass)
	Else
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Password = [hidden]" & $aTelnetPass)
	EndIf
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Save Game Folder = " & $aServerSaveGame)
EndIf
FileClose($sConfigRead)
;EndFunc
#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****

If $aUpdateUtil = "yes" Then
	UtilUpdate($aServerUpdateLinkVer, $aServerUpdateLinkDL, $aUtilVersion, $aUtilName)
EndIf

If $aUseSteamCMD = "yes" Then
	Local $sFileExists = FileExists($aSteamCMDDir & "\steamcmd.exe")
	If $sFileExists = 0 Then
		SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Downloading and installing SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
		DirCreate($aSteamCMDDir) ; to extract to
		_ExtractZip(@ScriptDir & "\steamcmd.zip", "", "steamcmd.exe", $aSteamCMDDir)
		FileDelete(@ScriptDir & "\steamcmd.zip")
		FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD. [steamcmd.exe +quit]")
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

#Region ;**** Check for Update At Startup ****
If ($aCheckForUpdate = "yes") Then
	FileWriteLine($aLogFile, _NowCalc() & " [Server] Running initial update check . . ")
	Local $bRestart = UpdateCheck()
	If $bRestart Then
		$aBeginDelayedShutdown = 1
	EndIf
EndIf
#EndRegion ;**** Check for Update At Startup ****

ExternalScriptExist()

If $aRemoteRestartUse = "yes" Then
	TCPStartup() ; Start The TCP Services
	Local $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
	If $MainSocket = -1 Then
		MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $aRemoteRestartPort & "] Check server IP or disable Remote Restart in INI")
		FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart enabled. Could not bind to " & $aServerIP & ":" & $aRemoteRestartPort)
		Exit
	Else
		If $xDebug And ($sObfuscatePass = "no") Then
			FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?" & $aRemoteRestartKey & "=" & $aRemoteRestartCode)
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]")
		EndIf
	EndIf
EndIf

Opt("TrayMenuMode", 3) ; The default tray menu items will not be shown and items are not checked when selected. These are options 1 and 2 for TrayMenuMode.
Local $iTrayAbout = TrayCreateItem("About")
Local $iTrayUpdateCheck = TrayCreateItem("Check for Util Update")
TrayCreateItem("") ; Create a separator line.
Local $iTraySendMessage = TrayCreateItem("Send global chat message.")
Local $iTraySendInGame = TrayCreateItem("Send telnet command.")
TrayCreateItem("") ; Create a separator line.
Local $iTrayRemoteRestart = TrayCreateItem("Initiate Remote Restart.")
TrayCreateItem("") ; Create a separator line.
Local $iTrayExitCloseN = TrayCreateItem("Exit: Do NOT Shut Down Servers")
Local $iTrayExitCloseY = TrayCreateItem("Exit: Shut Down Servers")

TraySetState($TRAY_ICONSTATE_SHOW) ; Show the tray menu.

SplashOff()
MsgBox(4096, $aUtilName, "Startup process complete." & @CRLF & "Please allow up to 5 seconds for system to respond to tray icon clicks." & @CRLF & @CRLF & "Tray icon menu ready . . .", 10)
AdlibRegister("RunUtilUpdate", 28800000)
Func RunUtilUpdate()
	UtilUpdate($aServerUpdateLinkVer, $aServerUpdateLinkDL, $aUtilVersion, $aUtilName)
EndFunc   ;==>RunUtilUpdate
$gTelnetTimeCheck0 = _NowCalc()

; -----------------------------------------------------------------------------------------------------------------------

While True ;**** Loop Until Closed ****
	Switch TrayGetMsg()
		Case $iTrayAbout
			MsgBox($MB_SYSTEMMODAL, $aUtilName, $aUtilName & @CRLF & "Version: " & $aUtilVersion & @CRLF & @CRLF & "Install Path: " & @ScriptDir & @CRLF & @CRLF & "Discord: http://discord.gg/EU7pzPs" & @CRLF & "Website: http://www.phoenix125.com", 15)
		Case $iTrayUpdateCheck
			TrayUpdateCheck()
		Case $iTraySendMessage
			TraySendMessage()
		Case $iTraySendInGame
			TraySendInGame()
		Case $iTrayRemoteRestart
			;			MsgBox($MB_SYSTEMMODAL, "", "Initiate Remote Restart.")
			TrayRemoteRestart()
		Case $iTrayExitCloseY
			;			MsgBox($MB_SYSTEMMODAL, "", "Exit: Shut Down Servers")
			TrayExitCloseY()
		Case $iTrayExitCloseN
			;			MsgBox($MB_SYSTEMMODAL, "", "Exit: Do NOT Shut Down Servers")
			TrayExitCloseN()
	EndSwitch

	#Region ;**** Listen for Remote Restart Request ****
	If $aRemoteRestartUse = "yes" Then
		Local $sRestart = _RemoteRestart($MainSocket, $aRemoteRestartCode, $aRemoteRestartKey, $aServerIP, $aServerName, $xDebug)
		Switch @error
			Case 0

				If ProcessExists($aServerPID) And ($aBeginDelayedShutdown = 0) Then
					Local $MEM = ProcessGetStats($aServerPID, 0)
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
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
				FileWriteLine($aLogFile, _NowCalc() & " " & $sRestart & @CRLF)
		EndSwitch
	EndIf
	#EndRegion ;**** Listen for Remote Restart Request ****

	#Region ;**** Keep Server Alive Check. ****
	If Not ProcessExists($aServerPID) Then
		$aBeginDelayedShutdown = 0
		If $aExecuteExternalScript = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " Executing External Script " & $aExternalScriptDir & "\" & $aExternalScriptName)
			If $aExternalScriptHideYN = "yes" Then
				Run($aExternalScriptDir & '\' & $aExternalScriptName, $aExternalScriptDir, @SW_HIDE)
			Else
				Run($aExternalScriptDir & '\' & $aExternalScriptName, $aExternalScriptDir)
			EndIf
		EndIf
		If $aUseSteamCMD = "yes" Then
			If $aServerVer = 1 Then
				Local $ServExp = " +app_update 294420 -beta latest_experimental"
			Else
				Local $ServExp = " +app_update 294420"
			EndIf

			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
			Local $sManifestExists = FileExists($aSteamCMDDir & "\steamapps\appmanifest_294420.acf")
			If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
				FileMove($aSteamCMDDir & "\steamapps\appmanifest_294420.acf", $aSteamCMDDir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: Install manifest found at " & $aSteamCMDDir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
				EndIf
			Else
				$aFirstBoot = 0
			EndIf
			If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
				FileMove($aServerDirLocal & "\steamapps\appmanifest_294420.acf", $aServerDirLocal & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: Install manifest found at " & $aServerDirLocal & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
				EndIf
			Else
				$aFirstBoot = 0
			EndIf

			If $aValidate = "yes" Then
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD with validate: [""" & $aSteamCMDDir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $aServerDirLocal & """" & $ServExp & " validate +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD with validate.")
				EndIf
				RunWait("""" & $aSteamCMDDir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $aServerDirLocal & """" & $ServExp & " " & $aSteamExtraCMD & " validate +quit")
				SplashOff()
			Else
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD without validate. [" & $aSteamCMDDir & "\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 login anonymous +force_install_dir """ & $aServerDirLocal & "" & $ServExp & " +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD without validate.")
				EndIf
				RunWait("""" & $aSteamCMDDir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $aServerDirLocal & """" & $ServExp & " " & $aSteamExtraCMD & " +quit")
				SplashOff()
			EndIf
		EndIf
		SplashOff()

		If $aExternalScriptValidateYN = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " Executing AFTER Update Check External Script " & $aExternalScriptValidateDir & "\" & $aExternalScriptValidateName)
			If $aExternalScriptHideYN = "yes" Then
				Run($aExternalScriptValidateDir & '\' & $aExternalScriptValidateName, $aExternalScriptValidateDir, @SW_HIDE)
			Else
				Run($aExternalScriptValidateDir & '\' & $aExternalScriptValidateName, $aExternalScriptValidateDir)
			EndIf
			FileWriteLine($aLogFile, _NowCalc() & " External AFTER Update Check Script Finished. Continuing Server Start.")
		EndIf

		$LogTimeStamp = "7DaysToDieServer_Data\output_log_dedi" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt"
		If $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] 7DTD Dedicated Server Started [" & $aServerDirLocal & "\" & $aServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $aConfigFileTemp & " -dedicated ]")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] 7DTD Dedicated Server Started.")
		EndIf
		PurgeLogFile($aServerDirLocal)
		SplashOff()
		If ($aRebootMe = "no") And ($aServerTelnetReboot = "no") Then
			MsgBox($MB_OK, $aUtilName, "7 Days to Die Server started . . . ", 7)
		EndIf
		$aServerPID = Run("" & $aServerDirLocal & "\" & $aServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics  " & $aServerExtraCMD & " -configfile=" & $aConfigFileTemp & " -dedicated", $aServerDirLocal, @SW_HIDE)
		$gTelnetTimeCheck0 = _NowCalc()
		$gTelnetTimeCheck0 = _NowCalc()
		$aFPCount = $aFPCount + 1
		If ($aFPCount = 3) And ($aFPAutoUpdateYN = "yes") Then
			FPRun()
		EndIf

		; **** Retrieve Server Version ****
		Local $sLogPath = $aServerDirLocal & "\" & $LogTimeStamp
		Local $sLogPathOpen = FileOpen($sLogPath, 0)
		Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 2500)
		;		Local $xGameVer[0] = 1
		;		Local $xGameVer[1] = "1"
		;		Local $xGameVer[2] = "2"
		;		Local $xGameVer[3] = "3"
		;		$xGameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
		$aGameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
		;		$aGameVer = $xGameVer[0]
		;		$aGameVer = $xGameVer
		FileClose($sLogPath)
		If $aGameVer = "-1" Then
			Sleep(2000)
			Local $sLogPath = $aServerDirLocal & "\" & $LogTimeStamp
			Local $sLogPathOpen = FileOpen($sLogPath, 0)
			Local $sLogRead = StringLeft(FileRead($sLogPathOpen), 2500)
			$xGameVer = _StringBetween($sLogRead, "INF Version: ", " Compatibility Version")
			If @error Then
				$aGameVer = "-"
			Else
				$aGameVer = $xGameVer[0]
			EndIf
			$GameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
			FileClose($sLogPath)
		EndIf
		If $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server version: " & $aGameVer & ".  Version derived from """ & $aServerDirLocal & "\" & $LogTimeStamp & """.")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server version: " & $aGameVer & ".")
		EndIf
		; **** END Retrieve Server Version ****

		; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****
		If ($aRebootMe = "yes") Or ($aServerTelnetReboot = "yes") Then
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
			If $aAppendVerShort = "short" Then
				$aGameVerTemp1 = $aGameVer
				$aGameVerTemp1 = _StringBetween($aGameVerTemp1, "(", ")")
				$aGameVer = _ArrayToString($aGameVerTemp1)
			EndIf
			If ($aAppendVerBegin = "no") And ($aAppendVerEnd = "no") Then
				$aServerNameVer = $aServerName
			Else
				If $aAppendVerBegin = "yes" Then
					$aServerNameVer = $aGameVer & $aServerName
				EndIf
				If $aAppendVerEnd = "yes" Then
					$aServerNameVer = $aServerName & $aGameVer
				EndIf
				$aPropertyName = "ServerName"
				FileWriteLine($aConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aServerNameVer & """/>")
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Changing ServerName to """ & $aServerNameVer & """ in " & $aConfigFileTempFull & ".")
				EndIf
			EndIf
			; **** END Append Server Version to Server Name ****

			; **** Change GameName to Server Version ****
			If $aWipeServer = "no" Then
				$aGameName = "[no change]"
			Else
				$aPropertyName = "GameName"
				$aGameName = StringRegExpReplace($aGameVer, "[\(\)]", "")
				FileWriteLine($aConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aGameName & """/>")
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Changing GameName to """ & $aGameName & """ in " & $aConfigFileTempFull & ".")
				EndIf
			EndIf
			; **** END Change GameName to Server Version ****

			; **** Change Telnet Settings in ServerConfig7dtdServerUtilTemp.xml ****
			FileWriteLine($aConfigFileTempFull, "<property name=""TelnetEnabled"" value=""" & $aServerTelnetEnable & """/>")
			FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aTelnetPort & """/>")
			FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aTelnetPass & """/>")
			; **** END Change Telnet Settings in ServerConfig7dtdServerUtilTemp.xml ****

			FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
			;			$xServerReboorReason =
			FileWriteLine($aLogFile, _NowCalc() & " ----- Restarting server to apply the following config change(s): " & StringRegExpReplace($aServerRebootReason, @CRLF, " "))
			FileClose($aConfigFileTempFull)
			SplashTextOn($aUtilName, "Restarting server to apply config change(s)." & @CRLF & "Server name: " & $aServerNameVer & @CRLF & "Game Name: " & $aGameName & @CRLF & @CRLF & "Reboot Reason(s):" & @CRLF & $aServerRebootReason & @CRLF & "Please wait one minute.", 600, 350, -1, -1, $DLG_MOVEABLE, "")
			Global $aRebootConfigUpdate = "yes"
			Global $aRebootMe = "no"
			Global $aServerTelnetReboot = "no"
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		EndIf
		; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****

		If @error Or Not $aServerPID Then
			If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
			$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
			Select
				Case $iMsgBoxAnswer = 4 ;Retry
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
				Case $iMsgBoxAnswer = 2 ;Cancel
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start - " & $aUtilName & " Shutdown - Initiated by User")
					Exit
				Case $iMsgBoxAnswer = -1 ;Timeout
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. Script Initiated Restart Attempt after 60 seconds of no User Input.")
			EndSelect
		EndIf
		If FileExists($aPIDServerFile) Then
			FileDelete($aPIDServerFile)
		EndIf
		FileWrite($aPIDServerFile, $aServerPID)
		FileSetAttrib($aPIDServerFile, "+HT")
	ElseIf ((_DateDiff('n', $aTimeCheck1, _NowCalc())) >= 5) Then
		Local $MEM = ProcessGetStats($aServerPID, 0)
		If $MEM[0] > $aExMemAmt And $aExMemRestart = "no" And $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1])
		ElseIf $MEM[0] > $aExMemAmt And $aExMemRestart = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " Excessive Memory Use - Restart requested by " & $aUtilName & " Script")
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		EndIf
		$aTimeCheck1 = _NowCalc()
	EndIf
	#EndRegion ;**** Keep Server Alive Check. ****

	#Region ;**** Restart Server Every X Days and X Hours & Min****
	If (($aRestartDaily = "yes") And ((_DateDiff('n', $aTimeCheck2, _NowCalc())) >= 1) And (DailyRestartCheck($aRestartDays, $aRestartHours, $aRestartMin)) And ($aBeginDelayedShutdown = 0)) Then
		If ProcessExists($aServerPID) Then
			Local $MEM = ProcessGetStats($aServerPID, 0)
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " - Daily restart requested by " & $aUtilName & ".")
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
		$TelnetCheckResult = TelnetCheck($aServerIP, $aTelnetPort, $aTelnetPass)
		$gTelnetTimeCheck0 = _NowCalc()
		If $TelnetCheckResult = 0 Then
			If $xDebug Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server not responding to telnet. Restarting server.")
			EndIf
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		Else
			If $xDebug Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server responded to telnet inquiry.")
			EndIf
		EndIf
	EndIf
	#EndRegion ;**** KeepServerAlive Telnet Check ****

	#Region ;**** Check for Update every X Minutes ****
	If ($aCheckForUpdate = "yes") And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aUpdateCheckInterval) And ($aBeginDelayedShutdown = 0) Then
		Local $bRestart = UpdateCheck()
		If $bRestart And (($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes")) Then
			$aBeginDelayedShutdown = 1
			$aRebootReason = "update"
		ElseIf $bRestart Then
			RunExternalScriptUpdate()
			CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aDailyMsgInGame[$aAnnounceCount0], True)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aRemoteMsgInGame[$aAnnounceCount0], True)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aUpdateMsgInGame[$aAnnounceCount0], True)
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
			EndIf
			If $aRebootReason = "remoterestart" Then
				SplashTextOn($aUtilName, "Remote Restart request. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
				RunExternalRemoteRestart()
			EndIf
			If $sInGameAnnounce = "yes" Then
				SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, "FINAL WARNING! Rebooting server in 10 seconds...", True)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aDailyMsgInGame[$aAnnounceCount1], True)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aRemoteMsgInGame[$aAnnounceCount1], True)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aUpdateMsgInGame[$aAnnounceCount1], True)
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

	#Region ;**** Rotate Logs ****
	If ($aLogRotate = "yes") And ((_DateDiff('h', $aTimeCheck4, _NowCalc())) >= 1) Then
		If Not FileExists($aLogFile) Then
			FileWriteLine($aLogFile, $aTimeCheck4 & " Log File Created")
			FileSetTime($aLogFile, @YEAR & @MON & @MDAY, 1)
		EndIf
		Local $aLogFileTime = FileGetTime($aLogFile, 1)
		Local $logTimeSinceCreation = _DateDiff('h', $aLogFileTime[0] & "/" & $aLogFileTime[1] & "/" & $aLogFileTime[2] & " " & $aLogFileTime[3] & ":" & $aLogFileTime[4] & ":" & $aLogFileTime[5], _NowCalc())
		If $logTimeSinceCreation >= $aLogHoursBetweenRotate Then
			RotateFile($aLogFile, $aLogQuantity)
		EndIf
		$aTimeCheck4 = _NowCalc()
	EndIf
	#EndRegion ;**** Rotate Logs ****
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
				"Click (NO) or (CANCEL) to exit utility but leave servers and redis still running.", 60)
		;				"Click (NO) to exit utility but leave servers and redis still running." & @CRLF & _
		;				"Click (CANCEL) to cancel and resume utility.", 15)
		;		$Shutdown = MsgBox(4100, "Shut Down?", "Do you wish to shutdown Server " & $aServerName & "?", 60)
		; ----------------------------------------------------------
		If $Shutdown = 6 Then
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
			SplashOff()
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Stopped by User")
			If FileExists($aPIDServerFile) Then
				FileDelete($aPIDServerFile)
			EndIf
			Exit
			; ----------------------------------------------------------
		ElseIf $Shutdown = 7 Then
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			PIDSaveServer($aServerPID, $aPIDServerFile)

			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Stopped by User")
			Exit
			; ----------------------------------------------------------
		ElseIf $Shutdown = 2 Then
			;			SplashTextOn($aUtilName, "Shutdown canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			;			Sleep(2000)
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
			If $aRemoteRestartUse = "yes" Then
				TCPShutdown()
			EndIf
			PIDSaveServer($aServerPID, $aPIDServerFile)
			MsgBox(4096, $aUtilityVer, $aMsg, 20)
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Stopped by User")
			; ----------------------------------------------------------
		EndIf
	Else
		FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
		SplashOff()
		Exit
		;		CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		;		SplashOff()
		;		If ProcessExists($aServerPIDRedis) And $aServerUseRedis = "yes" Then
		;			FileWriteLine($aLogFile, _NowCalc() & " [Redis (PID: " & $aServerPIDRedis & ")] Killing Process")
		;			ProcessClose($aServerPIDRedis)
		;		EndIf
		;		If $aRemoteRestartUse = "yes" Then
		;			TCPShutdown()
		;		EndIf
		;		MsgBox(4096, $aUtilityVer, $aMsg, 20)
		;		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped by User")
		;		Exit
	EndIf
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------

#Region 	 ;**** Close Server ****
Func CloseServer($ip, $port, $pass)
	If $aRebootConfigUpdate = "no" Then
		SplashTextOn($aUtilName, "Shutting down 7 Days to Die server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
	EndIf
	$aRebootConfigUpdate = "no"
	$aAnnounceCount1 = 0
	$aFPCount = 0
	If $aUsePuttytel = "yes" Then
		Local $sFileExists = FileExists(@ScriptDir & "\puttytel.exe")
		If $sFileExists = 0 Then
			InetGet("https://the.earth.li/~sgtatham/putty/latest/w32/puttytel.exe", @ScriptDir & "\puttytel.exe", 0)
			If Not FileExists(@ScriptDir & "\puttytel.exe") Then
				MsgBox(0x0, "puttytel.exe Not Found", "Could not find puttytel.exe at " & @ScriptDir)
				Exit
			EndIf
		EndIf
		If FileExists(@ScriptDir & "\puttytel.exe") Then
			If ProcessExists($aServerPID) Then
				Run(@ScriptDir & "\puttytel.exe -P " & $port & " " & $ip, "", @SW_HIDE)
				WinWait($ip & " - PuTTYtel", "")
				Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
				If $CrashCheck = 0 Then
					ControlSend($ip & " - PuTTYtel", "", "", @CRLF & @CRLF & $pass & @CRLF & "shutdown" & @CRLF & "exit" & @CRLF)
					WinWait("PuTTYtel Fatal Error", "", 2)
					If ProcessExists("puttytel.exe") Then
						ProcessClose("puttytel.exe")
					EndIf
				Else
					If ProcessExists("puttytel.exe") Then
						ProcessClose("puttytel.exe")
					EndIf
					If ProcessExists($aServerPID) Then
						ProcessClose($aServerPID)
					EndIf
				EndIf
			Else
				If ProcessExists($aServerPID) Then
					ProcessClose($aServerPID)
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Did not Shut Down Properly. Killing Process")
				EndIf
			EndIf
		EndIf
	Else
		TCPStartup()
		$socket = TCPConnect($ip, $port)
		Sleep(250)
		If $socket = -1 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Shut down server Telnet connection FAILED. No response from Telnet.")
		EndIf
		TCPSend($socket, @CRLF & $pass & @CRLF)
		For $i = 1 To 90
			$aRecv = TCPRecv($socket, 1024)
			If StringInStr($aRecv, "end session.") Then
				TCPSend($socket, "shutdown" & @CRLF)
				ExitLoop
			EndIf
		Next
		TCPSend($socket, "exit" & @CRLF)
		TCPCloseSocket($socket)
		TCPShutdown()
		If ProcessExists($aServerPID) Then
			ProcessClose($aServerPID)
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server did not shut down properly. Killing process.")
		EndIf
	EndIf
	If FileExists($aPIDServerFile) Then
		FileDelete($aPIDServerFile)
	EndIf

	SplashOff()
EndFunc   ;==>CloseServer
#EndRegion ;**** Close Server ****

; -----------------------------------------------------------------------------------------------------------------------

#Region	 ;**** Log File Maintenance Scripts ****
Func LogWrite($sString)
	FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] " & $sString)
EndFunc   ;==>LogWrite

Func RotateFile($sFile, $sBackupQty, $bDelOrig = True) ;Pass File to Rotate and Quantity of Files to Keep for backup. Optionally Keep Original.
	Local $hCreateTime = @YEAR & @MON & @MDAY
	For $i = $sBackupQty To 1 Step -1
		If FileExists($sFile & $i) Then
			$hCreateTime = FileGetTime($sFile & $i, 1)
			FileMove($sFile & $i, $sFile & ($i + 1), 1)
			FileSetTime($sFile & ($i + 1), $hCreateTime, 1)
		EndIf
	Next
	If FileExists($sFile & ($sBackupQty + 1)) Then
		FileDelete($sFile & ($sBackupQty + 1))
	EndIf
	If FileExists($sFile) Then
		If $bDelOrig = True Then
			$hCreateTime = FileGetTime($sFile, 1)
			FileMove($sFile, $sFile & "1", 1)
			FileWriteLine($sFile, _NowCalc() & $sFile & " Rotated")
			FileSetTime($sFile & "1", $hCreateTime, 1)
			FileSetTime($sFile, @YEAR & @MON & @MDAY, 1)
		Else
			FileCopy($sFile, $sFile & "1", 1)
		EndIf
	EndIf
EndFunc   ;==>RotateFile
#EndRegion ;**** Log File Maintenance Scripts ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Function to Send Message In Game ****
Func SendInGame($ip, $port, $pass, $g_sInGameMessage, $say = True)
	If $aUsePuttytel = "yes" Then
		If $say Then
			$g_sInGameMessage = "say """ & $g_sInGameMessage & """"
		EndIf

		FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Sending telnet command: " & $g_sInGameMessage)
		Local $sFileExists = FileExists(@ScriptDir & "\puttytel.exe")
		If $sFileExists = 0 Then
			InetGet("https://the.earth.li/~sgtatham/putty/latest/w32/puttytel.exe", @ScriptDir & "\puttytel.exe", 0)
			If Not FileExists(@ScriptDir & "\puttytel.exe") Then
				MsgBox(0x0, "puttytel.exe Not Found", "Could not find puttytel.exe at " & @ScriptDir)
				Exit
			EndIf
		EndIf
		If FileExists(@ScriptDir & "\puttytel.exe") Then
			Run(@ScriptDir & "\puttytel.exe -P " & $port & " " & $ip, "", @SW_HIDE)
			;			Run(@ScriptDir & "\puttytel.exe -P " & $port & " " & $ip, "")
			WinWait($ip & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
				ControlSend($ip & " - PuTTYtel", "", "", @CRLF & @CRLF & $pass & @CRLF & $g_sInGameMessage & @CRLF & "exit" & @CRLF)
				WinWait("PuTTYtel Fatal Error", "", 2)
				If ProcessExists("puttytel.exe") Then
					ProcessClose("puttytel.exe")
				EndIf
			Else
				If ProcessExists("puttytel.exe") Then
					ProcessClose("puttytel.exe")
				EndIf
			EndIf
		EndIf
	Else
		TCPStartup()
		$socket = TCPConnect($ip, $port)
		Sleep(250)
		If $socket = -1 Then
			FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Send telnet command FAILED. No response from Telnet.")
		EndIf
		TCPSend($socket, @CRLF & $pass & @CRLF)
		For $i = 1 To 90
			$aRecv = TCPRecv($socket, 1024)
			If StringInStr($aRecv, "end session.") Then
				TCPSend($socket, $g_sInGameMessage & @CRLF)
				FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Sending telnet command: " & $g_sInGameMessage)
				ExitLoop
			EndIf
		Next
		Sleep(200)
		TCPSend($socket, "exit" & @CRLF)
		Sleep(200)
		TCPCloseSocket($socket)
		TCPShutdown()
	EndIf
EndFunc   ;==>SendInGame
#EndRegion ;**** Function to Send Message In Game ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ; ----- KeepServerAlive TELNET Check -----
Func TelnetCheck($ip, $port, $pass)
	If $aUsePuttytel = "yes" Then
		Local $sFileExists = FileExists(@ScriptDir & "\puttytel.exe")
		If $sFileExists = 0 Then
			InetGet("https://the.earth.li/~sgtatham/putty/latest/w32/puttytel.exe", @ScriptDir & "\puttytel.exe", 0)
			If Not FileExists(@ScriptDir & "\puttytel.exe") Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Telnet KeepAlive check: Could not find puttytel.exe at " & @ScriptDir)
				Exit
			EndIf
		EndIf
		If FileExists(@ScriptDir & "\puttytel.exe") Then
			Run(@ScriptDir & "\puttytel.exe -P " & $aTelnetPort & " " & $aServerIP, "", @SW_HIDE)
			WinWait($aServerIP & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", $aTelnetPass & "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "exit")
				WinWait("PuTTYtel Fatal Error", "", 5)
				If ProcessExists("puttytel.exe") Then
					ProcessClose("puttytel.exe")
				EndIf
				Return 1
			Else
				If ProcessExists("puttytel.exe") Then
					ProcessClose("puttytel.exe")
				EndIf
				Return 0
			EndIf
		EndIf
	Else
		TCPStartup()
		$socket = TCPConnect($ip, $port)
		Sleep(250)
		If $socket = -1 Then
			Return 0 ; Server not responding
		EndIf
		TCPSend($socket, @CRLF & $pass & @CRLF)
		For $i = 1 To 90
			$aRecv = TCPRecv($socket, 1024)
			If StringInStr($aRecv, "end session.") Then
				Return 1 ; Server replied to commands
				ExitLoop
			EndIf
		Next
		Sleep(200)
		TCPSend($socket, "exit" & @CRLF)
		Sleep(200)
		TCPCloseSocket($socket)
		TCPShutdown()
	EndIf
EndFunc   ;==>TelnetCheck
#EndRegion ; ----- KeepServerAlive TELNET Check -----

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Function to Send Message to Discord ****
Func _Discord_ErrFunc($oError)
	FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Error: 0x" & Hex($oError.number) & " While Sending Discord Bot Message.")
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
		If Not $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [Discord Bot] Message sent: " & $sBotMessage)
		Else
			$sResponseText = "Message Response: " & $oHTTPOST.ResponseText
			FileWriteLine($aLogFile, _NowCalc() & " [Discord Bot] Message Status Code {" & $oStatusCode & "} " & $sResponseText)
		EndIf
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
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Successfully Connected to Twitch IRC")
		If $aTwitchIRC[1] Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Username and OAuth Accepted. [" & $aTwitchIRC[2] & "]")
			If $aTwitchIRC[3] Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] Successfully sent ( " & $sT_Msg & " ) to all Channels")
			Else
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Failed sending message ( " & $sT_Msg & " ) to one or more channels")
			EndIf
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Username and OAuth Denied [" & $aTwitchIRC[2] & "]")
		EndIf
	Else
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Twitch Bot] ERROR | Could not connect to Twitch IRC. Is this URL or port blocked? [irc.chat.twitch.tv:6667]")
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

#EndRegion ;**** Restart Server Scheduling Scripts ****

Func RunExternalScriptDaily()
	If $aExternalScriptDailyYN = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " Executing DAILY restart external script " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir, @SW_HIDE)
		Else
			Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir)
		EndIf
		;					FileWriteLine($aLogFile, _NowCalc() & " External DAILY restart script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalScriptDaily

Func RunExternalScriptAnnounce()
	If $aExternalScriptAnnounceYN = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " Executing FIRST ANNOUNCEMENT external script " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir, @SW_HIDE)
		Else
			Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir)
		EndIf
		;					FileWriteLine($aLogFile, _NowCalc() & " External DAILY restart script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalScriptAnnounce

Func RunExternalRemoteRestart()
	If $aExternalScriptRemoteYN = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " Executing REMOTE RESTART external script " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir, @SW_HIDE)
		Else
			Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir)
		EndIf
		;					FileWriteLine($aLogFile, _NowCalc() & " External REMOTE RESTART script finished. Continuing server start.")
	EndIf
EndFunc   ;==>RunExternalRemoteRestart

Func RunExternalScriptUpdate()
	If $aExternalScriptUpdateYN = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " Executing Script When Restarting For Server Update: " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
		If $aExternalScriptHideYN = "yes" Then
			Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir, @SW_HIDE)
		Else
			Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir)
		EndIf
		;					FileWriteLine($aLogFile, _NowCalc() & " Executing Script When Restarting For Server Update Finished. Continuing Server Start.")
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
				FileWriteLine($aLogFile, _NowCalc() & " External BEFORE update script execution disabled - Could not find " & $aExternalScriptDir & "\" & $aExternalScriptName)
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
				FileWriteLine($aLogFile, _NowCalc() & " External AFTER update script execution disabled - Could not find " & $aExternalScriptValidateDir & "\" & $aExternalScriptValidateName)
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
				FileWriteLine($aLogFile, _NowCalc() & " External DAILY restart script execution disabled - Could not find " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
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
				FileWriteLine($aLogFile, _NowCalc() & " External UPDATE restart script execution disabled - Could not find " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
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
				FileWriteLine($aLogFile, _NowCalc() & " External DAILY restart script execution disabled - Could not find " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
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
				FileWriteLine($aLogFile, _NowCalc() & " External DAILY restart script execution disabled - Could not find " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
			EndIf
		EndIf
	EndIf
EndFunc   ;==>ExternalScriptExist

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Functions to Check for Update ****

;**** Retreive latest build ID from SteamDB ****
Func GetLatestVerSteamDB($bSteamAppID, $bServerVer)
	Local $aReturn[2] = [False, ""]
	If $bServerVer = 0 Then
		Local $aURL = $aSteamDBURLPublic
		Local $aBranch = "stable"
	Else
		Local $aURL = $aSteamDBURLExperimental
		Local $aBranch = "experimental"
	EndIf
	$aSteamDB1 = _IECreate($aURL, 0, 0)
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
		FileWriteLine($aLogFile, _NowCalc() & " [Update] Using SteamDB " & $aBranch & " branch. Latest version: " & $hBuildID)
	EndIf
	FileClose($hFileOpen)
	If $hBuildID < 100000 Then
		SplashOff()
		MsgBox($mb_ok, "ERROR", " [Update] Error retrieving buildid via SteamDB website. Please visit:" & @CRLF & @CRLF & $aURL & @CRLF & @CRLF & _
				"in *Internet Explorer* (NOT Chrome.. must be Internet Explorer) to CAPTCHA authorize your PC or use SteamCMD for updates." & @CRLF & "! Press OK to close " & $aUtilName & " !")
		FileWriteLine($aLogFile, _NowCalc() & "Error retrieving buildid via SteamDB website. Please visit:" & $aURL & _
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
		FileWriteLine($aLogFile, _NowCalc() & " [Update] SteamCMD update check FAILED to create update file. Skipping this update check.")
		;		EndIf
	Else
		;	Local $aString = _ArrayToString($hFileOpen)
		If StringInStr($hFileRead1, "buildid") > 0 Then
			Local $hFileReadArray = _StringBetween($hFileRead1, "branches", "AppID")
			Local $hFileRead = _ArrayToString($hFileReadArray)
			If $aServerVer = 0 Then
				Local $hString1 = _StringBetween($hFileRead, "public", "timeupdated")
			Else
				Local $hString1 = _StringBetween($hFileRead, $aExperimentalString, "timeupdated")
			EndIf
			Local $hString2 = StringSplit($hString1[0], '"', 2)
			$hString3 = _ArrayToString($hString2)
			Local $hString4 = StringRegExpReplace($hString3, "\t", "")
			Local $hString5 = StringRegExpReplace($hString4, @CR & @LF, ".")
			Local $hString6 = StringRegExpReplace($hString5, "{", "")
			Local $hBuildIDArray = _StringBetween($hString6, "buildid||", "|.")
			Local $hBuildID = _ArrayToString($hBuildIDArray)
			If $xDebug And $aServerVer = 0 Then
				FileWriteLine($aLogFile, _NowCalc() & " [Update] Update Check via Stable Branch. Latest version: " & $hBuildID)
			EndIf
			If $xDebug And $aServerVer = 1 Then
				FileWriteLine($aLogFile, _NowCalc() & " [Update] Update Check via Experimental Branch. Latest version: " & $hBuildID)
			EndIf
			If FileExists($sFilePath) Then
				FileDelete($sFilePath)
			EndIf
			$aReturn[0] = True
		Else
			;			$aSteamRunCount = $aSteamRunCount + 1
			;			If $aSteamRunCount = 3 Then
			$aReturn[0] = False
			;			Else
			FileWriteLine($aLogFile, _NowCalc() & " [Update] SteamCMD update check returned a FAILURE reponse. Skipping this update check.")
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
	Local Const $sFilePath = $sGameDir & "\steamapps\appmanifest_294420.acf"
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

Func UpdateCheck()
	Local $bUpdateRequired = False
	If $aUpdateSource = "1" Then
		If $aFirstBoot Then
			SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamDB.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		EndIf
		Local $aLatestVersion = GetLatestVerSteamDB($aSteamAppID, $aServerVer)
	Else
		If $aFirstBoot Then
			SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		EndIf

		Local $aLatestVersion = GetLatestVersion($aSteamCMDDir)
	EndIf
	If $aFirstBoot Then
		SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Retrieving installed version buildid.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
	EndIf
	Local $aInstalledVersion = GetInstalledVersion($aServerDirLocal)
	SplashOff()
	If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
		If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server is Up to Date. Installed Version: " & $aInstalledVersion[1])
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server is Out of Date! Installed Version: " & $aInstalledVersion[1] & " Latest Version: " & $aLatestVersion[1])
			If $aFirstBoot Then
				SplashTextOn($aUtilName, "Server is Out of Date!" & @CRLF & "Installed Version: " & $aInstalledVersion[1] & @CRLF & "Latest Version: " & $aLatestVersion[1] & @CRLF & "Updating server . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			EndIf

			Global $aRebootMe = "yes"
			RunExternalScriptUpdate()
			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
			Local $sManifestExists = FileExists($aSteamCMDDir & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				FileMove($aSteamCMDDir & "\steamapps\appmanifest_294420.acf", $aSteamCMDDir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: """ & $aServerDirLocal & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				EndIf
			EndIf
			Local $sManifestExists = FileExists($aServerDirLocal & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				FileMove($aServerDirLocal & "\steamapps\appmanifest_294420.acf", $aServerDirLocal & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: """ & $aServerDirLocal & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				EndIf
			EndIf
			$bUpdateRequired = True
		EndIf
	ElseIf Not $aLatestVersion[0] And Not $aInstalledVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [Server] Something went wrong retrieving Latest & Installed Versions. Running update with -validate")
		SplashTextOn($aUtilName, "Something went wrong retrieving Latest & Installed Versions." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 500, 125, -1, -1, $DLG_MOVEABLE, "")
		$bUpdateRequired = True
	ElseIf Not $aInstalledVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [Server] Something went wrong retrieving Installed Version. Running update with -validate. (This is normal for new install)")
		SplashTextOn($aUtilName, "Something went wrong retrieving Installed Version." & @CRLF & "(This is normal for new install)" & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
		$bUpdateRequired = True
	ElseIf Not $aLatestVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [Update] Something went wrong retrieving Latest Version.  Skipping this update check.")
		MsgBox($MB_OK, $aUtilityVer, "Something went wrong retrieving Latest Version. Skipping this update check." & @CRLF & @CRLF & "(This window will close in 5 seconds)", 5)
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
		FileWriteLine($aLogFile, _NowCalc() & " [ERROR] Invalid character found in " & $aIniFile & ". Changed parameter from """ & $aString & """ to """ & $bString & """.")
	EndIf
	Return $bString
EndFunc   ;==>RemoveInvalidCharacters
#EndRegion ;**** Remove invalid characters ****

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

#Region ;**** _RemoteRestart ****
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
		FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & $tUtilName & " update check failed to download latest version: " & $tLink)
		If $aShowUpdate Then
			SplashTextOn($aUtilName, $aUtilName & " update check failed." & @CRLF & "Please try again later.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
			$aShowUpdate = False
		EndIf
	Else
		$tVer = StringSplit($hFileRead, "^", 2)
		If $tVer[0] = $tUtil Then
			If $xDebug Then
				FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & $tUtilName & " up to date. Version: " & $tVer[0] & " , Notes: " & $tVer[1])
				If FileExists($aUtilUpdateFile) Then
					FileDelete($aUtilUpdateFile)
				EndIf
			Else
				FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & $tUtilName & " up to date.")
			EndIf
			If $aShowUpdate Then
				SplashTextOn($aUtilName, $aUtilName & " up to date . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
				Sleep(2000)
				$aShowUpdate = False
				SplashOff()
			EndIf
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [UTIL] New " & $aUtilName & " update available. Installed version: " & $tUtil & ", Latest version: " & $tVer[0] & ", Notes: " & $tVer[1])
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
					FileWriteLine($aLogFile, _NowCalc() & " [UTIL] ERROR! " & $tUtilName & ".exe download failed.")
					SplashOff()
					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download failed . . . " & @CRLF & "Go to """ & $tLink & """ to download latest version." & @CRLF & @CRLF & "Click (OK), (CANCEL), or wait 15 seconds, to resume current version.", 15)
				Else
					SplashOff()
					$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download complete. . . " & @CRLF & @CRLF & "Click (OK) to run new version (servers will remain running) OR" & @CRLF & "Click (CANCEL), or wait 15 seconds, to resume current version.", 15)
					If $tMB = 1 Then
						FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & "] Util Shutdown - Initiated by User to run update.")
						If $aRemoteRestartUse = "yes" Then
							TCPShutdown()
						EndIf
						PIDSaveServer($aServerPID, $aPIDServerFile)
						Run(@ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".exe")
						Exit
					EndIf
				EndIf
			ElseIf $tMB = 7 Then
				$aUpdateUtil = "no"
				IniWrite($aIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", "no")
				FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & "Utility update check disabled. To enable update check, change [Check for Updates ###=yes] in the .ini.")
				SplashTextOn($aUtilName, "Utility update check disabled." & @CRLF & "To enable update check, change [Check for Updates ###=yes] in the .ini.", 500, 110, -1, -1, $DLG_MOVEABLE, "")
				Sleep(5000)
			ElseIf $tMB = 2 Then
				FileWriteLine($aLogFile, _NowCalc() & " [UTIL] Utility update check canceled by user. Resuming utility . . .")
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
;		FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & $tUtilName & " update check failed to download latest version: " & $tLink)
;	Else
;		Local $hFileRead = FileRead($hFileOpen)
;		$tVer = StringSplit($hFileRead, "^", 2)
;		FileClose($hFileOpen)
;		If $tVer[0] = $tUtil Then
;			FileWriteLine($aLogFile, _NowCalc() & " [UTIL] " & $tUtilName & " up to date. Version: " & $tVer[0] & " , Notes: " & $tVer[1])
;		Else
;			FileWriteLine($aLogFile, _NowCalc() & " [UTIL] New " & $aUtilName & " update available. Installed version: " & $tUtil & ", Latest version: " & $tVer[0] & ", Notes: " & $tVer[1])
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
;					FileWriteLine($aLogFile, _NowCalc() & " [UTIL] ERROR! " & $tUtilName & ".exe download failed.")
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

#Region ;**** Future-Proof Script ****
Func FPRun()
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
	FileWriteLine($aLogFile, _NowCalc() & " ### WARNING! ### Server failed to boot 3x's after update. The default serverconfig.xml settings and 18 existing parameters were imported to " & $aConfigFileTempFull & ".")
	FileWriteLine($aLogFile, _NowCalc() & "    PLEASE EDIT THE " & $aConfigFile & " as soon as possible to reflect desired settings.")
	$aFPCount = 0
EndFunc   ;==>FPRun
#Region ;**** Future-Proof Script ****

#Region ;**** ObfPass - Obfuscates password string for logging
Func ObfPass($sObfPassString)
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

#EndRegion ;**** ObfPass - Obfuscates password string for logging

#Region ;**** Purge 7DTD Server Files ****
Func PurgeLogFile($aServerDir)
	$aPurgeLogFileName = @ScriptDir & "\7dtdServerUpdateUtility_PurgeLogFile.bat"
	Local $sFileExists = FileExists($aPurgeLogFileName)
	If $sFileExists = 1 Then
		FileDelete($aPurgeLogFileName)
	EndIf
	FileWriteLine($aPurgeLogFileName, "for /f ""tokens=* skip=19"" %%F in " & Chr(40) & "'dir """ & $aServerDir & "\7DaysToDieServer_Data\output_log_dedi*.txt"" /o-d /tc /b'" & Chr(41) & " do del """ & $aServerDir & "\7DaysToDieServer_Data\%%F""")
	If $xDebug Then
		FileWriteLine($aLogFile, _NowCalc() & " Deleting server log files >20: " & $aServerDir & "\7DaysToDieServer_Data\output_log_dedi*.txt")
	EndIf
	Run($aPurgeLogFileName, "", @SW_HIDE)
EndFunc   ;==>PurgeLogFile
#EndRegion ;**** Purge 7DTD Server Files ****


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
	If $bString = "\" Then
		$aString = StringTrimRight($sString, 1)
	EndIf
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
Func _RemoteRestart($vMSocket, $sCodes, $sKey, $sHideCodes, $sServIP, $sName, $bDebug = False)
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
					If Not $bDebug Then
						$sRECV = "Enable Debug to Log Full TCP Request"
					Else
						$sRECV = "Full TCP Request: " & @CRLF & $sRECV
					EndIf
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
	Global $aServerVer = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (0-Stable,1-Experimental) ###", $iniCheck)
	Global $aServerExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $iniCheck)
	Global $aServerIP = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $iniCheck)
	Global $aSteamCMDDir = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $iniCheck)
	Global $aSteamExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (ex. -latest_experimental) ###", $iniCheck)
	Global $aWipeServer = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $iniCheck)
	Global $aAppendVerBegin = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerEnd = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $iniCheck)
	Global $aAppendVerShort = IniRead($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $iniCheck)
	Global $aTelnetIP = IniRead($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $iniCheck)
	Global $aTelnetCheckYN = IniRead($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Use telnet to check if server is alive? (yes/no) ###", $iniCheck)
	Global $aTelnetCheckSec = IniRead($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Telnet check interval in seconds (30-900) ###", $iniCheck)
	Global $aExMemRestart = IniRead($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Restart on excessive memory use? (yes/no) ###", $iniCheck)
	Global $aExMemAmt = IniRead($sIniFile, " --------------- RESTART ON EXCESSIVE MEMORY USE --------------- ", "Excessive memory amount? ###", $iniCheck)
	Global $aRemoteRestartUse = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", $iniCheck)
	Global $aRemoteRestartPort = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Port ###", $iniCheck)
	Global $aRemoteRestartKey = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Key ###", $iniCheck)
	Global $aRemoteRestartCode = IniRead($sIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Restart Code ###", $iniCheck)
	Global $aCheckForUpdate = IniRead($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for updates? (yes/no) ###", $iniCheck)
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
	Global $sUseDiscordBotFirstAnnouncement = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $iniCheck)
	;	Global $sUseDiscordBotAppendServer - IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Append server name to beginning of messages? (yes/no) ###", $iniCheck)
	Global $sDiscordDailyMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
	Global $sDiscordUpdateMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
	Global $sDiscordRemoteRestartMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
	Global $sDiscordWebHookURLs = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook URL ###", $iniCheck)
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
	Global $aLogRotate = IniRead($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Rotate log files? (yes/no) ###", $iniCheck)
	Global $aLogQuantity = IniRead($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $iniCheck)
	Global $aLogHoursBetweenRotate = IniRead($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Hours between log rotations ###", $iniCheck)
	Global $aValidate = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $iniCheck)
	Global $aUpdateSource = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $iniCheck)
	Global $aUsePuttytel = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $iniCheck)
	Global $sObfuscatePass = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $iniCheck)
	Global $aUpdateUtil = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $iniCheck)
	Global $aExternalScriptHideYN = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $iniCheck)
	Global $aDebug = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Enable debug to output more log detail? (yes/no) ###", $iniCheck)
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
		$aServerVer = "0"
		$iIniFail += 1
		$iIniError = $iIniError & "ServerVer, "
	EndIf
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
	If $iniCheck = $aUsePuttytel Then
		$aUsePuttytel = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "UsePuttytel, "
	EndIf
	If $iniCheck = $aTelnetIP Then
		$aTelnetIP = ""
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetIP, "
	EndIf
	If $iniCheck = $aTelnetCheckYN Then
		$aTelnetCheckYN = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetCheckYN, "
	EndIf
	If $iniCheck = $aTelnetCheckSec Then
		$aTelnetCheckSec = "300"
		$iIniFail += 1
		$iIniError = $iIniError & "TelnetCheckSec, "
	ElseIf $aTelnetCheckSec < 30 Then
		$aTelnetCheckSec = 30
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aTelnetCheckSec & " seconds.")
	ElseIf $aTelnetCheckSec > 900 Then
		$aTelnetCheckSec = 900
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Telnet server-is-alive check interval was out of range. Interval set to: " & $aTelnetCheckSec & " seconds.")
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
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Update check interval was out of range. Interval set to: " & $aUpdateCheckInterval & " minutes.")
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
	If $iniCheck = $aLogRotate Then
		$aLogRotate = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "LogRotate, "
	EndIf
	If $iniCheck = $aLogQuantity Then
		$aLogQuantity = "10"
		$iIniFail += 1
		$iIniError = $iIniError & "LogQuantity, "
	EndIf
	If $iniCheck = $aLogHoursBetweenRotate Then
		$aLogHoursBetweenRotate = "24"
		$iIniFail += 1
		$iIniError = $iIniError & "LogHoursBetweenRotate, "
	ElseIf $aLogHoursBetweenRotate < 1 Then
		$aLogHoursBetweenRotate = 1
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
	If $iniCheck = $sUseDiscordBotFirstAnnouncement Then
		$sUseDiscordBotFirstAnnouncement = "no"
		$iIniFail += 1
		$iIniError = $iIniError & "UseDiscordBotFirstAnnouncement, "
	EndIf
	If $iniCheck = $sDiscordWebHookURLs Then
		$sDiscordWebHookURLs = "https://discordapp.com/api/webhooks/XXXXXX/XXXX<-NO TRAILING SLASH AND USE FULL URL FROM WEBHOOK URL ON DISCORD"
		$iIniFail += 1
		$iIniError = $iIniError & "DiscordWebHookURLs, "
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
	If $iniCheck = $aDebug Then
		$aDebug = "yes"
		$iIniFail += 1
		$iIniError = $iIniError & "Debug, "
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

	If ($aAppendVerBegin = "yes") Or ($aAppendVerEnd = "yes") Then
		$aRebootMe = "yes"
		$aServerRebootReason = $aServerRebootReason & "Append version to server name." & @CRLF
	EndIf
	If $aWipeServer = "yes" Then
		$aServerRebootReason = $aServerRebootReason & "Change save folder (server wipe)." & @CRLF
		$aRebootMe = "yes"
	EndIf
	If $aDebug = "yes" Then
		Global $xDebug = True ; This enables Debugging. Outputs more information to log file.
	Else
		Global $xDebug = False
	EndIf
	FileWriteLine($aLogFile, _NowCalc() & " Importing settings from 7dtdServerUtil.ini.")

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



	If $xDebug Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server Folder = " & $aServerDirLocal)
		FileWriteLine($aLogFile, _NowCalc() & " . . . SteamCMD Folder = " & $aSteamCMDDir)
	Else
	EndIf
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
		FileWriteLine($aLogFile, _NowCalc() & " INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		FileWriteLine($aLogFile, _NowCalc() & " INI MISMATCH: Parameters missing: " & $iIniFail)
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
		FileWriteLine($aLogFile, _NowCalc() & " Default INI File Created . . Please Modify Default Values and Restart Program.")
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
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (0-Stable,1-Experimental) ###", $aServerVer)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $aServerExtraCMD)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $aServerIP)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $aSteamCMDDir)
	IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (ex. -latest_experimental) ###", $aSteamExtraCMD)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Rename GameSave with updates causing a SERVER WIPE (while retaining old save files) ###", $aWipeServer)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no) ###", $aAppendVerBegin)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no) ###", $aAppendVerEnd)
	IniWrite($sIniFile, " --------------- APPEND SERVER VERSION TO NAME --------------- ", "Use SHORT name (B9) or LONG (Alpha 17.1 (B9))? (short/long) ###", $aAppendVerShort)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Telnet IP (ex. 127.0.0.1 - Leave BLANK for server IP) ###", $aTelnetIP)
	IniWrite($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Use telnet to check if server is alive? (yes/no) ###", $aTelnetCheckYN)
	IniWrite($sIniFile, " --------------- USE TELNET TO CHECK IF SERVER IS ALIVE --------------- ", "Telnet check interval in seconds (30-900) ###", $aTelnetCheckSec)
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
	IniWrite($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for updates? (yes/no) ###", $aCheckForUpdate)
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
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first announcement only? (reduces bot spam)(yes/no) ###", $sUseDiscordBotFirstAnnouncement)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $sDiscordDailyMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $sDiscordUpdateMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $sDiscordRemoteRestartMessage)
	IniWrite($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "WebHook URL ###", $sDiscordWebHookURLs)
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
	IniWrite($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Rotate log files? (yes/no) ###", $aLogRotate)
	IniWrite($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Number of logs ###", $aLogQuantity)
	IniWrite($sIniFile, " --------------- LOG FILE OPTIONS --------------- ", "Hours between log rotations ###", $aLogHoursBetweenRotate)
	FileWriteLine($sIniFile, @CRLF)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Validate files with SteamCMD update? (yes/no) ###", $aValidate)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com ###", $aUpdateSource)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Use puttytel for telnet client? (yes/no) ###", $aUsePuttytel)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $sObfuscatePass)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $aExternalScriptHideYN)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $aUpdateUtil)
	IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Enable debug to output more log detail? (yes/no) ###", $aDebug)
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
	FileWriteLine($aConfigFileTempFull, "<property name=""TerminalWindowEnabled"" value=""false""/>")
	FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
EndFunc   ;==>AppendConfigSettings
#EndRegion ;**** Append Settings to Temporary Server Config ****

Func PIDReadServer($tFile)
	Local $tTmp = FileOpen($tFile)
	If $tTmp = -1 Then
		$tReturn = "0"
		FileWriteLine($aLogFile, _NowCalc() & " [Util] No existing server found. Will start new server.")
	Else
		$tReturn = FileRead($tTmp)
		FileClose($tTmp)
		If ProcessExists($tReturn) Then
			FileWriteLine($aLogFile, _NowCalc() & " [Server] Server PID(" & $tReturn & ") found.")
			SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Running server found." & @CRLF & "PID:(" & $tReturn & ")", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [Server] -ERROR- Server PID(" & $tReturn & ") NOT found. Server will be restarted.")
		EndIf
		Sleep(2500)
	EndIf
	Return $tReturn
EndFunc   ;==>PIDReadServer

Func TrayExitCloseN()
	FileWriteLine($aLogFile, _NowCalc() & " [Server] Utility exit without server shutdown initiated by user via tray icon (Exit: Do NOT Shut Down Servers).")
	$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to close this utility?" & @CRLF & "(Server will remain running)" & @CRLF & @CRLF & _
			"Click (YES) to close this utility." & @CRLF & _
			"Click (NO) or (CANCEL) to cancel.", 15)
	If $tMB = 6 Then ; (YES)
		MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & @CRLF & "SERVER IS STILL RUNNING ! ! !" & @CRLF & @CRLF & _
				"Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & _
				"Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped by User")
		PIDSaveServer($aServerPID, $aPIDServerFile)
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
	FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & "] Utility exit with server shutdown initiated by user via tray icon (Exit: Shut Down Servers).")
	$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to shut down server and exit this utility?" & @CRLF & @CRLF & _
			"Click (YES) to Shutdown server and exit." & @CRLF & _
			"Click (NO) or (CANCEL) to cancel.", 15)
	If $tMB = 6 Then ; (YES)
		CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
		SplashOff()
		MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & _
				"Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped by User")
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped")
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

Func TrayRemoteRestart()
	FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart requested by user via tray icon (Initiate Remote Restart).")
	If $aRemoteRestartUse <> "yes" Then
		$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "You must enable Remote Restart in the " & $aUtilName & ".ini." & @CRLF & @CRLF & _
				"Would you like to enable it? (Port:" & $aRemoteRestartPort & ")" & @CRLF & _
				"Click (YES) to enable Remote Restart." & @CRLF & _
				"Click (NO) or (CANCEL) to skip.", 15)
		If $tMB = 6 Then ; (YES)
			FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart enabled in " & $aUtilName & ".ini per user request")
			IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", "yes")
			MsgBox($MB_OK, $aUtilityVer, "Remote Restart enabled in " & $aUtilName & ".ini. " & @CRLF & "Please restart this utility for Remote Restart to be started.", 5)
			;ElseIf $tMB = 7 Then  ;(NO)
			;ElseIf $tMB = 2 Then  ; (CANCEL)
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] No changes made to Remote Restart setting in " & $aUtilName & ".ini per user request.")
			SplashTextOn($aUtilName, "No changes were made. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
		EndIf
	Else
		$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to initiate Remote Restart (reboot server in " & $aRemoteTime[$aRemoteCnt] & "min)?" & @CRLF & @CRLF & _
				"Click (YES) to Initiate Remote Restart." & @CRLF & _
				"Click (NO) or (CANCEL) to cancel.", 15)
		If $tMB = 6 Then ; (YES)
			If $aBeginDelayedShutdown = 0 Then
				FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart request initiated by user.")
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
			FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart request canceled by user.")
			SplashTextOn($aUtilName, "Remote Restart canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
			Sleep(2000)
		EndIf
		SplashOff()
	EndIf
EndFunc   ;==>TrayRemoteRestart

Func TrayUpdateCheck()
	FileWriteLine($aLogFile, _NowCalc() & " [Update] " & $aUtilName & " update check requested by user via tray icon (Check for Updates).")
	$aShowUpdate = True
	UtilUpdate($aServerUpdateLinkVer, $aServerUpdateLinkDL, $aUtilVersion, $aUtilName)
EndFunc   ;==>TrayUpdateCheck

Func TraySendMessage()
	FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Global chat message requested by user via tray icon. (Send global chat message).")
	SplashOff()
	$tMsg = ""
	$tMsg = InputBox($aUtilName, "Enter global chat message", "", "", 400, 125)
	If $tMsg = "" Then
		;		FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Global chat message canceled by user.")
		SplashTextOn($aUtilName, "Global chat Message canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	Else
		;		$tMsg = "say " & $tMsg
		SplashTextOn($aUtilName, "Sending global chat message:" & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		;		FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Sending global chat message: " & $tMsg)
		SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, $tMsg, True)
		SplashTextOn($aUtilName, "Global chat Message sent:" & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	EndIf
	SplashOff()
EndFunc   ;==>TraySendMessage

Func TraySendInGame()
	FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Send Telnet command requested by user via tray icon (Send telnet command).")
	SplashOff()
	;	$tMsg = ""
	$tMsg = InputBox($aUtilName, "Enter Telnet command to send to server", "", "", 400, 125)
	If $tMsg = "" Then
		;		FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Send Telnet command canceled by user.")
		SplashTextOn($aUtilName, "Send Telnet command canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	Else
		;		FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Sending Telnet command to server: " & $tMsg)
		SplashTextOn($aUtilName, "Sending Telnet command. " & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $tMsg, False)
		SplashTextOn($aUtilName, "Telnet command sent. " & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
		Sleep(2000)
	EndIf
	SplashOff()
EndFunc   ;==>TraySendInGame
Func PIDSaveServer($tPID, $tFile)
	If FileExists($tFile) Then
		FileDelete($tFile)
	EndIf
	Local $tTmp = $tPID
	FileWrite($tFile, $tTmp)
EndFunc   ;==>PIDSaveServer
