#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\phoenix_5Vq_icon.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_v1.8.5.exe
#AutoIt3Wrapper_Outfile_x64=Builds\7dtdServerUpdateUtility_x64_v1.8.5.exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's 7dServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=1.8.4.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=1.8.4
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$aUtilVersion = "v1.8.5" ; (2019-02-02)

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

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Global Variables ****
Global $aTimeCheck0 = _NowCalc()
Global $aTimeCheck1 = _NowCalc()
Global $aTimeCheck2 = _NowCalc()
Global $aTimeCheck3 = _NowCalc()
Global $aTimeCheck4 = _NowCalc()
Global Const $aUtilityVer = "7dtdServerUpdateUtility" & " " & $aUtilVersion
Global Const $g_c_sServerEXE = "7DaysToDieServer.exe"
Global Const $aPIDFile = @ScriptDir & "\7dtdServerUpdateUtility_lastpid.tmp"
Global Const $aLogFile = @ScriptDir & "\7dtdServerUpdateUtility.log"
Global Const $g_c_sIniFile = @ScriptDir & "\7dtdServerUpdateUtility.ini"
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
$aServerRebootReason = ""
$aMaintenanceMsg = "Server maintenance restart."
Global $aSteamAppID = "294420"
Global $aSteamDBURLPublic = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
Global $aSteamDBURLExperimental = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
$aUpdateSource = "0" ; 0 = SteamCMD , 1 = SteamDB.com

If FileExists($aPIDFile) Then
	Global $aServerPID = FileRead($aPIDFile)
Else
	Global $aServerPID = "0"
EndIf
#EndRegion ;**** Global Variables ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ; **** Gamercide Shutdown Protocol ****
Func Gamercide()
	If @exitMethod <> 1 Then
		$Shutdown = MsgBox(4100, "Shut Down?", "Do you wish to shutdown Server " & $aServerName & "? (PID: " & $aServerPID & ")", 60)
		If $Shutdown = 6 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Shutdown - Intiated by User when closing " & $aUtilityVer & " Script")
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		EndIf
		MsgBox(4096, "Thanks for using our Application", "Please visit http://www.Phoenix125.com and https://gamercide.com", 15)
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped by User")
	Else
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityVer & " Stopped")
	EndIf
	If $UseRemoteRestart = "yes" Then
		TCPShutdown()
	EndIf
	SplashOff()
	Exit
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------

#Region 	 ;**** Close Server ****
Func CloseServer($ip, $port, $pass)
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
			Run(@ScriptDir & "\puttytel.exe -P " & $aServerTelnetPort & " " & $aServerIP)
			WinWait($aServerIP & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", $aServerTelnetPass & "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "shutdown{enter}")
				WinWait("PuTTYtel Fatal Error", "", 5)
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
Func SendInGame($ip, $port, $pass, $g_sInGameMessage)
	If $aUsePuttytel = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Send Message In Game: " & $g_sInGameMessage)
		Local $sFileExists = FileExists(@ScriptDir & "\puttytel.exe")
		If $sFileExists = 0 Then
			InetGet("https://the.earth.li/~sgtatham/putty/latest/w32/puttytel.exe", @ScriptDir & "\puttytel.exe", 0)
			If Not FileExists(@ScriptDir & "\puttytel.exe") Then
				MsgBox(0x0, "puttytel.exe Not Found", "Could not find puttytel.exe at " & @ScriptDir)
				Exit
			EndIf
		EndIf
		If FileExists(@ScriptDir & "\puttytel.exe") Then
			Run(@ScriptDir & "\puttytel.exe -P " & $aServerTelnetPort & " " & $aServerIP)
			WinWait($aServerIP & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", $aServerTelnetPass & "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", "Say " & $g_sInGameMessage)
				ControlSend($aServerIP & " - PuTTYtel", "", "", "exit")
				WinWait("PuTTYtel Fatal Error", "", 5)
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
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Send Message In Game FAILED. No response from Telnet.")
		EndIf
		TCPSend($socket, @CRLF & $pass & @CRLF)
		For $i = 1 To 90
			$aRecv = TCPRecv($socket, 1024)
			If StringInStr($aRecv, "end session.") Then
				TCPSend($socket, "Say " & $g_sInGameMessage & @CRLF)
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Send Message In Game: " & $g_sInGameMessage)
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
			Run(@ScriptDir & "\puttytel.exe -P " & $aServerTelnetPort & " " & $aServerIP)
			WinWait($aServerIP & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
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
		If Not $g_bDebug Then
			$sResponseText = "Enable Debugging to See Full Response Message"
		Else
			$sResponseText = "Message Response: " & $oHTTPOST.ResponseText
		EndIf
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Discord Bot] Message Status Code {" & $oStatusCode & "} " & $sResponseText)
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

#Region	 ;**** Restart Server Scheduling Scrips ****
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

#EndRegion ;**** Restart Server Scheduling Scrips ****

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
		Local $hBuildID = _ArrayToString(_StringBetween($hFileRead1, "buildid:</i> <b>", "</b></li><li><i>timeupdated"))
		FileWriteLine($aLogFile, _NowCalc() & " [Update Check] Using SteamDB " & $aBranch & " branch. Latest version: " & $hBuildID)
	EndIf
	FileClose($hFileOpen)
	If FileExists($sFilePath) Then
		FileDelete($sFilePath)
	EndIf
	$aReturn[0] = True
	$aReturn[1] = $hBuildID
	Return $aReturn
	If $hBuildID <100000 Then
		MsgBox($mb_ok, "ERROR", "Error retrieving buildid via SteamDB website. THIS IS NORMAL for first run. Please visit " & $aURL & " in Internet Explorer to authorize your PC or use SteamCMD for updates." & @CRLF & "! Press OK to close " & $aUtilName & " !")
	EndIf
EndFunc   ;==>GetLatestVerSteamDB

Func GetLatestVersion($sCmdDir)
	Local $aReturn[2] = [False, ""]
	DirRemove($sCmdDir & "\appcache",1)
	DirRemove($sCmdDir & "\depotcache",1)
	$sAppInfoTemp = "app_info_" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".tmp"
	RunWait('"' & @ComSpec & '" /c "' & $sCmdDir & '\steamcmd.exe" +login anonymous +app_info_update 1 +app_info_print 294420 +app_info_print 294420 +exit > ' & $sAppInfoTemp & '', $sCmdDir, @SW_MINIMIZE)
	Local Const $sFilePath = $sCmdDir & "\" & $sAppInfoTemp
	;	Local Const $sFilePath = $sCmdDir & "\app_info.tmp"
	Local $hFileOpen = FileOpen($sFilePath, 0)
	Local $hFileRead1 = FileRead($hFileOpen)
	$hBuildID = "0"
	If $hFileOpen = -1 Then
		$aReturn[0] = False
	Else
		Local $hFileReadArray = _StringBetween($hFileRead1, "branches", "AppID")
		Local $hFileRead = _ArrayToString($hFileReadArray)
		If $aServerVer = 0 Then
			Local $hString1 = _StringBetween($hFileRead, "public", "timeupdated")
		Else
			Local $hString1 = _StringBetween($hFileRead, "latest_experimental", "timeupdated")

		EndIf
		Local $hString2 = StringSplit($hString1[0], '"', 2)
		$hString3 = _ArrayToString($hString2)
		Local $hString4 = StringRegExpReplace($hString3, "\t", "")
		Local $hString5 = StringRegExpReplace($hString4, @CR & @LF, ".")
		Local $hString6 = StringRegExpReplace($hString5, "{", "")
		Local $hBuildIDArray = _StringBetween($hString6, "buildid||", "|.")
		Local $hBuildID = _ArrayToString($hBuildIDArray)
		If $aServerVer = 0 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Update Check] Using SteamCMD Stable Branch. Latest version: " & $hBuildID)
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Update Check] Using SteamCMD Experimental Branch. Latest version: " & $hBuildID)
		EndIf
	EndIf
	FileClose($hFileOpen)
	If FileExists($sFilePath) Then
		FileDelete($sFilePath)
	EndIf
	$aReturn[0] = True
	$aReturn[1] = $hBuildID
	Global $hBuildIDLatest = $hBuildID
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
		Local $aLatestVersion = GetLatestVerSteamDB($aSteamAppID, $aServerVer)
	Else
		Local $aLatestVersion = GetLatestVersion($steamcmddir)
	EndIf
;	Local $aLatestVersion = GetLatestVersion($steamcmddir)
	Local $aInstalledVersion = GetInstalledVersion($serverdir)
	SplashOff()
	If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
		If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server is Up to Date. Installed Version: " & $aInstalledVersion[1])
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server is Out of Date! Installed Version: " & $aInstalledVersion[1] & " Latest Version: " & $aLatestVersion[1])
			Global $aRebootMe = "yes"
			Global $aBotMsg = $sAnnounceUpdateMessage
			If $g_sExternalScriptUpdate = "yes" Then
				FileWriteLine($aLogFile, _NowCalc() & " Executing Script When Restarting For Server Update: " & $g_sExternalScriptUpdateDir & "\" & $g_sExternalScriptUpdateFileName)
				RunWait($g_sExternalScriptUpdateDir & '\' & $g_sExternalScriptUpdateFileName, $g_sExternalScriptUpdateDir, @SW_HIDE)
				FileWriteLine($aLogFile, _NowCalc() & " Executing Script When Restarting For Server Update Finished. Continuing Server Start.")
			EndIf
			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
			Local $sManifestExists = FileExists($steamcmddir & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				FileMove($steamcmddir & "\steamapps\appmanifest_294420.acf", $steamcmddir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: """ & $serverdir & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				EndIf
			EndIf
			Local $sManifestExists = FileExists($serverdir & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				FileMove($serverdir & "\steamapps\appmanifest_294420.acf", $serverdir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: """ & $serverdir & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				EndIf
			EndIf
			$bUpdateRequired = True
		EndIf
	ElseIf Not $aLatestVersion[0] And Not $aInstalledVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Latest & Installed Versions. Running update with -validate")
		SplashTextOn("7dtdServerUtil", "Something went wrong retrieving Latest & Installed Versions." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 500, 125, -1, -1, $DLG_MOVEABLE, "")
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	ElseIf Not $aInstalledVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Installed Version. Running update with -validate. (This is normal for new install)")
		SplashTextOn("7dtdServerUtil", "Something went wrong retrieving Installed Version." & @CRLF & "(This is normal for new install)" & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	ElseIf Not $aLatestVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Latest Version. Running update with -validate")
		SplashTextOn("7dtdServerUtil", "Something went wrong retrieving Latest Version." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 125, -1, -1, $DLG_MOVEABLE, "") 5
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	EndIf
	Return $bUpdateRequired
EndFunc   ;==>UpdateCheck
#EndRegion ;**** Functions to Check for Update ****

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
	If $g_bDebug Then
		FileWriteLine($aLogFile, _NowCalc() & " Deleting server log files >20: " & $aServerDir & "\7DaysToDieServer_Data\output_log_dedi*.txt")
	EndIf
	Run($aPurgeLogFileName)
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

#Region ;**** Function to Check for Multiple Password Failures****
Local $aPassFailure[1][3] = [[0, 0, 0]]
Func MultipleAttempts($sRemoteIP, $bFailure = False, $bSuccess = False)
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
					Return SetError(2, 0, "Invalid Restart Request by: " & $sRecvIP & ". Should be in the format of GET /?" & $sKey & "=user_pass HTTP/x.x | " & $sRECV)
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
	Local $iIniFail = 0
	Local $iniCheck = ""
	Local $aChar[3]
	For $i = 1 To 13
		$aChar[0] = Chr(Random(97, 122, 1)) ;a-z
		$aChar[1] = Chr(Random(48, 57, 1)) ;0-9
		$iniCheck &= $aChar[Random(0, 1, 1)]
	Next

	Global $serverdir = IniRead($sIniFile, "Server Directory. NO TRAILING SLASH", "serverdir", $iniCheck)
	Global $steamcmddir = IniRead($sIniFile, "SteamCMD Directory. NO TRAILING SLASH", "steamcmddir", $iniCheck)
	Global $aServerVer = IniRead($sIniFile, "Version: 0-Stable/1-Latest Experimental", "ServerVer", $iniCheck)
	Global $ConfigFile = IniRead($sIniFile, "Server Config File (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", "ConfigFile", $iniCheck)
	Global $WipeServer = IniRead($sIniFile, "Use Version Name (ex. Alpha 17 (b238)) for Game Name (Folder used within SaveGameFolder)? (yes/no) (Leaves previous world saved but creates a new game)", "WipeServer", $iniCheck)
	Global $AppendVerBegin = IniRead($sIniFile, "Append Server Version (ex. Alpha 16.4 (b8)) at Beginning/End of Server Name? (yes/no)", "AppendVerBegin", $iniCheck)
	Global $AppendVerEnd = IniRead($sIniFile, "Append Server Version (ex. Alpha 16.4 (b8)) at Beginning/End of Server Name? (yes/no)", "AppendVerEnd", $iniCheck)
	Global $AppendVerShort = IniRead($sIniFile, "If Append Server Version, then Use SHORT Name (ex B240) or LONG (ex. Aplha (B240))? (short/long)", "AppendVerShort", $iniCheck)
	Global $aServerIP = IniRead($sIniFile, "Game Server IP", "ListenIP", $iniCheck)
	Global $UseSteamCMD = IniRead($sIniFile, "Use SteamCMD To Update Server? (yes/no)", "UseSteamCMD", $iniCheck)
	Global $validategame = IniRead($sIniFile, "Validate Files Every Time SteamCMD Runs? (yes/no)", "validategame", $iniCheck)
	Global $aUpdateSource = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "For update checks, use (0-SteamCMD or 1-SteamDB.com)", $iniCheck)
	Global $UseRemoteRestart = IniRead($sIniFile, "Use Remote Restart? (yes/no)", "UseRemoteRestart", $iniCheck)
	Global $g_Port = IniRead($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "ListenPort", $iniCheck)
	Global $g_sRKey = IniRead($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "RestartKey", $iniCheck)
	Global $RestartCode = IniRead($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "RestartCode", $iniCheck)
	Global $aUsePuttytel = IniRead($sIniFile, "Use puttytel for telnet? (yes/no) puttytel is more reliable but has popup windows", "Use puttytel", $iniCheck)
	Global $aTelnetCheck = IniRead($sIniFile, "Use Telnet to Check if Server is Alive? (yes/no)", "TelnetCheck", $iniCheck)
	Global $aTelnetCheckSec = IniRead($sIniFile, "Use Telnet to Check if Server is Alive? (yes/no)", "TelnetCheckInterval(30-900_seconds)", $iniCheck)
	Global $sObfuscatePass = IniRead($sIniFile, "Hide Passwords in Log? (yes/no)", "ObfuscatePass", $iniCheck)
	Global $CheckForUpdate = IniRead($sIniFile, "Check for Update Every X Minutes? (yes/no)", "CheckForUpdate", $iniCheck)
	Global $UpdateInterval = IniRead($sIniFile, "Update Check Interval in Minutes 05-59", "UpdateInterval", $iniCheck)
	Global $g_sRestartDaily = IniRead($sIniFile, "Restart Server Daily? (yes/no)", "RestartDaily", $iniCheck)
	Global $g_sRestartDays = IniRead($sIniFile, "Daily Restart Hours Comma Seperated 0=Everyday Sunday=1 Saturday=7 0-7. ex: 2,4,6", "RestartDays", $iniCheck)
	Global $g_sRestartHours = IniRead($sIniFile, "Daily Restart Hours Comma Seperated 00-23", "RestartHours", $iniCheck)
	Global $g_sRestartMin = IniRead($sIniFile, "Daily Restart Minute 00-59", "RestartMinute", $iniCheck)
	Global $ExMem = IniRead($sIniFile, "Excessive Memory Amount?", "ExMem", $iniCheck)
	Global $ExMemRestart = IniRead($sIniFile, "Restart On Excessive Memory Use? (yes/no)", "ExMemRestart", $iniCheck)
	Global $logRotate = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logRotate", $iniCheck)
	Global $logQuantity = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logQuantity", $iniCheck)
	Global $logHoursBetweenRotate = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logHoursBetweenRotate", $iniCheck)
	Global $sAnnounceScheduledMessage = IniRead($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceSCHEDULEDMessage", $iniCheck)
	Global $sAnnounceUpdateMessage = IniRead($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceUPDATEMessage", $iniCheck)
	Global $sAnnounceNotifyTime = IniRead($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceMinutesBeforeRestart", $iniCheck)
	Global $sInGameAnnounce = IniRead($sIniFile, "Send In Game Message to Announce Restart? (yes/no)", "InGameAnnounce", $iniCheck)
	Global $sUseDiscordBotScheduled = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseDiscordBotSCHEDULED", $iniCheck)
	Global $sUseDiscordBotUpdate = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseDiscordBotUPDATE", $iniCheck)
	Global $sDiscordWebHookURLs = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordWebHookURL", $iniCheck)
	Global $sDiscordBotName = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotName", $iniCheck)
	Global $bDiscordBotUseTTS = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotUseTTS", $iniCheck)
	Global $sDiscordBotAvatar = IniRead($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotAvatarLink", $iniCheck)
	Global $sUseTwitchBotScheduled = IniRead($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseTwitchBotSCHEDULED", $iniCheck)
	Global $sUseTwitchBotUpdate = IniRead($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseTwitchBotUPDATE", $iniCheck)
	Global $sTwitchNick = IniRead($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "TwitchNick", $iniCheck)
	Global $sChatOAuth = IniRead($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "ChatOAuth", $iniCheck)
	Global $sTwitchChannels = IniRead($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "TwitchChannels", $iniCheck)
	Global $g_sExecuteExternalScript = IniRead($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExecuteExternalScriptBeforeUpdate", $iniCheck)
	Global $g_sExternalScriptDir = IniRead($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExternalScriptBeforeDirectory", $iniCheck)
	Global $g_sExternalScriptName = IniRead($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExternalScriptBeforeFileName", $iniCheck)
	Global $g_sExecuteExternalScriptValidate = IniRead($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExecuteExternalScriptAfterUpdate", $iniCheck)
	Global $g_sExternalScriptDirValidate = IniRead($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExternalScriptAfterDirectory", $iniCheck)
	Global $g_sExternalScriptNameValidate = IniRead($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExternalScriptAfterFileName", $iniCheck)
	Global $g_sExternalScriptUpdate = IniRead($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdate(yes/no)", $iniCheck)
	Global $g_sExternalScriptUpdateDir = IniRead($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdateDirectory", $iniCheck)
	Global $g_sExternalScriptUpdateFileName = IniRead($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdateFileName", $iniCheck)
	Global $g_sEnableDebug = IniRead($sIniFile, "Enable Debug to Output More Log Detail? (yes/no)", "EnableDebug", $iniCheck)

	If $iniCheck = $serverdir Then
		$serverdir = "D:\Game Servers\7 Days to Die Dedicated Server"
		$iIniFail += 1
	EndIf
	If $iniCheck = $steamcmddir Then
		$steamcmddir = "D:\Game Servers\7 Days to Die Dedicated Server\SteamCMD"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aServerVer Then
		$aServerVer = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $ConfigFile Then
		$ConfigFile = "serverconfig.xml"
		$iIniFail += 1
	EndIf
	If $iniCheck = $WipeServer Then
		$WipeServer = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $AppendVerBegin Then
		$AppendVerBegin = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $AppendVerEnd Then
		$AppendVerEnd = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $AppendVerShort Then
		$AppendVerShort = "long"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aServerIP Then
		$aServerIP = "127.0.0.1"
		$iIniFail += 1
	EndIf
	If $iniCheck = $UseSteamCMD Then
		$UseSteamCMD = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $validategame Then
		$validategame = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aUpdateSource Then
		$aUpdateSource = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $UseRemoteRestart Then
		$UseRemoteRestart = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_Port Then
		$g_Port = "57520"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sRKey Then
		$g_sRKey = "restart"
		$iIniFail += 1
	EndIf
	If $iniCheck = $RestartCode Then
		$RestartCode = "password"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aUsePuttytel Then
		$aUsePuttytel = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aTelnetCheck Then
		$aTelnetCheck = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aTelnetCheckSec Then
		$aTelnetCheckSec = "300"
		$iIniFail += 1
	ElseIf $aTelnetCheckSec < 30 Then
		$UpdateInterval = 30
	ElseIf $UpdateInterval > 900 Then
		$UpdateInterval = 900
	EndIf
	If $iniCheck = $sObfuscatePass Then
		$sObfuscatePass = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $CheckForUpdate Then
		$CheckForUpdate = "yes"
		$iIniFail += 1
	ElseIf $CheckForUpdate = "yes" And $UseSteamCMD <> "yes" Then
		$CheckForUpdate = "no"
		FileWriteLine($sLogFile, _NowCalc() & " SteamCMD disabled. Disabling CheckForUpdate. Update will not work without SteamCMD to update it!")
	EndIf
	If $iniCheck = $UpdateInterval Then
		$UpdateInterval = "15"
		$iIniFail += 1
	ElseIf $UpdateInterval < 5 Then
		$UpdateInterval = 5
	EndIf
	If $iniCheck = $g_sRestartDaily Then
		$g_sRestartDaily = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sRestartDays Then
		$g_sRestartDays = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sRestartHours Then
		$g_sRestartHours = "04,16"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sRestartMin Then
		$g_sRestartMin = "00"
		$iIniFail += 1
	EndIf
	If $iniCheck = $ExMem Then
		$ExMem = "6000000000"
		$iIniFail += 1
	EndIf
	If $iniCheck = $ExMemRestart Then
		$ExMemRestart = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $logRotate Then
		$logRotate = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $logQuantity Then
		$logQuantity = "10"
		$iIniFail += 1
	EndIf
	If $iniCheck = $logHoursBetweenRotate Then
		$logHoursBetweenRotate = "24"
		$iIniFail += 1
	ElseIf $logHoursBetweenRotate < 1 Then
		$logHoursBetweenRotate = 1
	EndIf
	If $iniCheck = $sAnnounceScheduledMessage Then
		$sAnnounceScheduledMessage = "Scheduled server restart."
		$iIniFail += 1
	EndIf
	If $iniCheck = $sAnnounceNotifyTime Then
		$sAnnounceNotifyTime = "5"
		$iIniFail += 1
	ElseIf $sAnnounceNotifyTime < 5 Then
		$sAnnounceNotifyTime = 5
	EndIf
	If $iniCheck = $sAnnounceUpdateMessage Then
		$sAnnounceUpdateMessage = "New server update."
		$iIniFail += 1
	EndIf
	If $iniCheck = $sInGameAnnounce Then
		$sInGameAnnounce = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sUseDiscordBotScheduled Then
		$sUseDiscordBotScheduled = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sUseDiscordBotUpdate Then
		$sUseDiscordBotUpdate = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sDiscordWebHookURLs Then
		$sDiscordWebHookURLs = "https://discordapp.com/api/webhooks/XXXXXX/XXXX<-NO TRAILING SLASH AND USE FULL URL FROM WEBHOOK URL ON DISCORD"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sDiscordBotName Then
		$sDiscordBotName = "7 Days To Die Bot"
		$iIniFail += 1
	EndIf
	If $iniCheck = $bDiscordBotUseTTS Then
		$bDiscordBotUseTTS = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sDiscordBotAvatar Then
		$sDiscordBotAvatar = ""
		$iIniFail += 1
	EndIf
	If $iniCheck = $sUseTwitchBotScheduled Then
		$sUseTwitchBotScheduled = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sUseTwitchBotUpdate Then
		$sUseTwitchBotUpdate = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sTwitchNick Then
		$sTwitchNick = "twitchbotusername"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sChatOAuth Then
		$sChatOAuth = "oauth:1234(Generate OAuth Token Here: https://twitchapps.com/tmi)"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sTwitchChannels Then
		$sTwitchChannels = "channel1,channel2,channel3"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExecuteExternalScript Then
		$g_sExecuteExternalScript = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptDir Then
		$g_sExternalScriptDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptName Then
		$g_sExternalScriptName = "before.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExecuteExternalScriptValidate Then
		$g_sExecuteExternalScriptValidate = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptDirValidate Then
		$g_sExternalScriptDirValidate = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptNameValidate Then
		$g_sExternalScriptNameValidate = "after.bat"
		$iIniFail += 1
	EndIf

	If $iniCheck = $g_sExternalScriptUpdate Then
		$g_sExternalScriptUpdate = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptUpdateDir Then
		$g_sExternalScriptUpdateDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptUpdateFileName Then
		$g_sExternalScriptUpdateFileName = "update.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sEnableDebug Then
		$g_sEnableDebug = "no"
		$iIniFail += 1
	EndIf

	If $iIniFail > 0 Then
		iniFileCheck($sIniFile, $iIniFail)
	EndIf
	If $bDiscordBotUseTTS = "yes" Then
		$bDiscordBotUseTTS = True
	Else
		$bDiscordBotUseTTS = False
	EndIf

	Global $aDelayShutdownTime = 0
	If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
		$aDelayShutdownTime = $sAnnounceNotifyTime
	EndIf
	If ($AppendVerBegin = "yes") Or ($AppendVerEnd = "yes") Then
		$aRebootMe = "yes"
		$aServerRebootReason = $aServerRebootReason & "Append version to server name. "
	EndIf
	If $WipeServer = "yes" Then
		$aServerRebootReason = $aServerRebootReason & "Change save folder (server wipe). "
		$aRebootMe = "yes"
	EndIf
	If $g_sEnableDebug = "yes" Then
		Global $g_bDebug = True ; This enables Debugging. Outputs more information to log file.
	Else
		Global $g_bDebug = False
	EndIf
	FileWriteLine($aLogFile, _NowCalc() & " Importing settings from 7dtdServerUtil.ini.")
	If $g_bDebug Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server Folder = " & $serverdir)
		FileWriteLine($aLogFile, _NowCalc() & " . . . SteamCMD Folder = " & $steamcmddir)
	Else
	EndIf
EndFunc   ;==>ReadUini


Func iniFileCheck($sIniFile, $iIniFail)
	If FileExists($sIniFile) Then
		Local $aMyDate, $aMyTime
		_DateTimeSplit(_NowCalc(), $aMyDate, $aMyTime)
		Local $iniDate = StringFormat("%04i.%02i.%02i.%02i%02i", $aMyDate[1], $aMyDate[2], $aMyDate[3], $aMyTime[1], $aMyTime[2])
		FileMove($sIniFile, $sIniFile & "_" & $iniDate & ".bak", 1)
		UpdateIni($sIniFile)
		FileWriteLine($aLogFile, _NowCalc() & " INI MISMATCH: Found " & $iIniFail & " missing variable(s) in 7dtdServerUpdateUtility.ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
		MsgBox(4096, "INI MISMATCH", "Found " & $iIniFail & " missing variable(s) in 7dtdServerUpdateUtility.ini." & @CRLF & @CRLF & "Backup created and all existing settings transfered to new INI." & @CRLF & @CRLF & "Please modify INI and restart.")
		Exit
	Else
		UpdateIni($sIniFile)
		SplashOff()
		MsgBox(4096, "Default INI File Created", "Please Modify Default Values and Restart Program." & @CRLF & @CRLF & "IF NEW DEDICATED SERVER INSTALL:" & @CRLF & " - Once the server is installed and running," & @CRLF & "Rt-Click on 7dtdServerUpdateUtility icon and shutdown server." & @CRLF & " - Then modify default values in serverconfig.xml" & @CRLF & "and restart 7dtdServerUpdateUtility.exe")
		FileWriteLine($aLogFile, _NowCalc() & "  Default INI File Created . . Please Modify Default Values and Restart Program.")
		Exit
	EndIf
EndFunc   ;==>iniFileCheck

Func UpdateIni($sIniFile)
	IniWrite($sIniFile, "Server Directory. NO TRAILING SLASH", "serverdir", $serverdir)
	IniWrite($sIniFile, "SteamCMD Directory. NO TRAILING SLASH", "steamcmddir", $steamcmddir)
	IniWrite($sIniFile, "Version: 0-Stable/1-Latest Experimental", "ServerVer", $aServerVer)
	IniWrite($sIniFile, "Server Config File (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", "ConfigFile", $ConfigFile)
	IniWrite($sIniFile, "Use Version Name (ex. Alpha 17 (b238)) for Game Name (Folder used within SaveGameFolder)? (yes/no) (Leaves previous world saved but creates a new game)", "WipeServer", $WipeServer)
	IniWrite($sIniFile, "Append Server Version (ex. Alpha 16.4 (b8)) at Beginning/End of Server Name? (yes/no)", "AppendVerBegin", $AppendVerBegin)
	IniWrite($sIniFile, "Append Server Version (ex. Alpha 16.4 (b8)) at Beginning/End of Server Name? (yes/no)", "AppendVerEnd", $AppendVerEnd)
	IniWrite($sIniFile, "If Append Server Version, then Use SHORT Name (ex B240) or LONG (ex. Aplha (B240))? (short/long)", "AppendVerShort", $AppendVerShort)
	IniWrite($sIniFile, "Game Server IP", "ListenIP", $aServerIP)
	IniWrite($sIniFile, "Use SteamCMD To Update Server? (yes/no)", "UseSteamCMD", $UseSteamCMD)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "For update checks, use (0-SteamCMD or 1-SteamDB.com)", $aUpdateSource)
	IniWrite($sIniFile, "Validate Files Every Time SteamCMD Runs? (yes/no)", "validategame", $validategame)
	IniWrite($sIniFile, "Use Remote Restart? (yes/no)", "UseRemoteRestart", $UseRemoteRestart)
	IniWrite($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "ListenPort", $g_Port)
	IniWrite($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "RestartKey", $g_sRKey)
	IniWrite($sIniFile, "Remote Restart Request Key http://IP:Port?RestartKey=RestartCode (Ex: 127.0.0.1:57520?restart=password)", "RestartCode", $RestartCode)
	IniWrite($sIniFile, "Use puttytel for telnet? (yes/no) puttytel is more reliable but has popup windows", "Use puttytel", $aUsePuttytel)
	IniWrite($sIniFile, "Use Telnet to Check if Server is Alive? (yes/no)", "TelnetCheck", $aTelnetCheck)
	IniWrite($sIniFile, "Use Telnet to Check if Server is Alive? (yes/no)", "TelnetCheckInterval(30-900_seconds)", $aTelnetCheckSec)
	IniWrite($sIniFile, "Hide Passwords in Log? (yes/no)", "ObfuscatePass", $sObfuscatePass)
	IniWrite($sIniFile, "Check for Update Every X Minutes? (yes/no)", "CheckForUpdate", $CheckForUpdate)
	IniWrite($sIniFile, "Update Check Interval in Minutes 05-59", "UpdateInterval", $UpdateInterval)
	IniWrite($sIniFile, "Restart Server Daily? (yes/no)", "RestartDaily", $g_sRestartDaily)
	IniWrite($sIniFile, "Daily Restart Hours Comma Seperated 0=Everyday Sunday=1 Saturday=7 0-7. ex: 2,4,6", "RestartDays", $g_sRestartDays)
	IniWrite($sIniFile, "Daily Restart Hours Comma Seperated 00-23", "RestartHours", $g_sRestartHours)
	IniWrite($sIniFile, "Daily Restart Minute 00-59", "RestartMinute", $g_sRestartMin)
	IniWrite($sIniFile, "Excessive Memory Amount?", "ExMem", $ExMem)
	IniWrite($sIniFile, "Restart On Excessive Memory Use? (yes/no)", "ExMemRestart", $ExMemRestart)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logRotate", $logRotate)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logQuantity", $logQuantity)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logHoursBetweenRotate", $logHoursBetweenRotate)
	IniWrite($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceScheduledMessage", $sAnnounceScheduledMessage)
	IniWrite($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceUpdateMessage", $sAnnounceUpdateMessage)
	IniWrite($sIniFile, "Message to Announce Server Restarts on Discord/MRCON/Twitch (if enabled)?", "AnnounceMinutesBeforeRestart", $sAnnounceNotifyTime)
	IniWrite($sIniFile, "Send In Game Message to Announce Restart? (yes/no)", "InGameAnnounce", $sInGameAnnounce)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseDiscordBotSCHEDULED", $sUseDiscordBotScheduled)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseDiscordBotUPDATE", $sUseDiscordBotUpdate)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordWebHookURL", $sDiscordWebHookURLs)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotName", $sDiscordBotName)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotUseTTS", $bDiscordBotUseTTS)
	IniWrite($sIniFile, "Use Discord Bot to Announce Scheduled/Update Restarts? (yes/no)", "DiscordBotAvatarLink", $sDiscordBotAvatar)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseTwitchBotSCHEDULED", $sUseTwitchBotScheduled)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "UseTwitchBotUPDATE", $sUseTwitchBotUpdate)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "TwitchNick", $sTwitchNick)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "ChatOAuth", $sChatOAuth)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Scheduled/Update Restarts? (yes/no)", "TwitchChannels", $sTwitchChannels)
	IniWrite($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExecuteExternalScriptBeforeUpdate", $g_sExecuteExternalScript)
	IniWrite($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExternalScriptBeforeDirectory", $g_sExternalScriptDir)
	IniWrite($sIniFile, "Execute External Script Before SteamCMD Update and Server Start? (yes/no)", "ExternalScriptBeforeFileName", $g_sExternalScriptName)
	IniWrite($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExecuteExternalScriptAfterUpdate", $g_sExecuteExternalScriptValidate)
	IniWrite($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExternalScriptAfterDirectory", $g_sExternalScriptDirValidate)
	IniWrite($sIniFile, "Execute External Script AFTER SteamCMD Update and BEFORE Server Start? (yes/no)", "ExternalScriptAfterFileName", $g_sExternalScriptNameValidate)
	IniWrite($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdate(yes/no)", $g_sExternalScriptUpdate)
	IniWrite($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdateDirectory", $g_sExternalScriptUpdateDir)
	IniWrite($sIniFile, "Execute External Script When Restarting For Server Update?", "ExternalScriptUpdateFileName", $g_sExternalScriptUpdateFileName)
	IniWrite($sIniFile, "Enable Debug to Output More Log Detail? (yes/no)", "EnableDebug", $g_sEnableDebug)
EndFunc   ;==>UpdateIni
#EndRegion ;**** INI Settings - User Variables ****

#Region ;**** Append Settings to Temporary Server Config ****
Func AppendConfigSettings()
	Global $ConfigFileTemp = "ServerConfig7dtdServerUtilTemp.xml"
	Global $ConfigFileTempFull = $serverdir & "\" & $ConfigFileTemp
	Local $tConfigPath = $serverdir & "\" & $ConfigFile
	Local $sConfigFileTempExists = FileExists($ConfigFileTempFull)
	If $sConfigFileTempExists = 1 Then
		FileDelete($ConfigFileTempFull)
	EndIf
	Local $tConfigPathOpen = FileOpen($tConfigPath, 0)
	Local $tConfigRead2 = FileRead($tConfigPathOpen)
	Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "<!-- BEGIN 7dtdtSEerverUtility Changes -->" & @CRLF)
	FileWrite($ConfigFileTempFull, $tConfigRead1)
	FileClose($tConfigPath)
	FileWriteLine($ConfigFileTempFull, "<property name=""TerminalWindowEnabled"" value=""false""/>")
	FileWriteLine($ConfigFileTempFull, "</ServerSettings>")
EndFunc   ;==>AppendConfigSettings
#EndRegion ;**** Append Settings to Temporary Server Config ****

#Region ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
OnAutoItExitRegister("Gamercide")
SplashTextOn("7dtdServerUtil", "7dtdServerUpdateUtility started.", 250, 50, -1, -1, $DLG_MOVEABLE, "")
FileWriteLine($aLogFile, _NowCalc() & " ============================ " & $aUtilityVer & " Started ============================")
ReadUini($g_c_sIniFile, $aLogFile)
AppendConfigSettings()

;**** Retrieve Data From serverconfig.xml File ****
Local Const $sConfigPath = $serverdir & "\" & $ConfigFile
Local $sFileExists = FileExists($sConfigPath)
If $sFileExists = 0 Then
	FileWriteLine($aLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath)
	SplashOff()
	$aContinue = MsgBox($MB_YESNO, $ConfigFile & " Not Found", "Could not find " & $sConfigPath & ". (This is normal for New Install) " & @CRLF & "Do you wish to continue with installation?", 60)
	If $aContinue = 7 Then
		FileWriteLine($aLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath & ". Program terminated by user.")
		Exit
	Else
	EndIf
EndIf
$aServerTelnetReboot = "no"
$kServerPort = "}ServerPort}value=}"
$kServerName = "}ServerName}value=}"
$kServerTelnetEnable = "}TelnetEnabled}value=}"
$kServerTelnetPort = "}TelnetPort}value=}"
$kServerTelnetPass = "}TelnetPassword}value=}"
$kServerSaveGame = "}SaveGameFolder}value=}"
Local $sConfigPathOpen = FileOpen($sConfigPath, 0)
Local $sConfigRead4 = FileRead($sConfigPathOpen)
Local $sConfigRead3 = StringRegExpReplace($sConfigRead4, """", "}")
Local $sConfigRead2 = StringRegExpReplace($sConfigRead3, "\t", "")
Local $sConfigRead1 = StringRegExpReplace($sConfigRead2, "  ", "")
Local $sConfigRead = StringRegExpReplace($sConfigRead1, " value=", "value=")
$xServerPort = _StringBetween($sConfigRead, $kServerPort, "}")
$aServerPort = _ArrayToString($xServerPort)
$xServerName = _StringBetween($sConfigRead, $kServerName, "}")
$aServerName = _ArrayToString($xServerName)
$xServerTelnetEnable = _StringBetween($sConfigRead, $kServerTelnetEnable, "}")
$aServerTelnetEnable = _ArrayToString($xServerTelnetEnable)
$xServerTelnetPort = _StringBetween($sConfigRead, $kServerTelnetPort, "}")
$aServerTelnetPort = _ArrayToString($xServerTelnetPort)
$xServerTelnetPass = _StringBetween($sConfigRead, $kServerTelnetPass, "}")
$aServerTelnetPass = _ArrayToString($xServerTelnetPass)
$xServerSaveGame = _StringBetween($sConfigRead, $kServerSaveGame, "}")
$aServerSaveGame = _ArrayToString($xServerSaveGame)
If $aServerSaveGame = "absolute path" Then
	$aServerSaveGame = _PathFull("7DaysToDieFolder", @AppDataDir)
EndIf
If $aServerTelnetEnable = "no" Or $aServerTelnetEnable = "false" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet was disabled. Telnet required for this utility. TelnetEnabled set to: yes")
	$aServerTelnetEnable = "true"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet was disabled. "
EndIf
If $aServerTelnetPort = "" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Port was blank. Port CHANGED to default value: 8081")
	$aServerTelnetPort = "8081"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & " Telnet port was blank."
EndIf
If $aServerTelnetPass = "CHANGEME" Or $aServerTelnetPass = "" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Password was " & $aServerTelnetPass & ". Password CHANGED to: 7dtdServerUpdateUtility")
	$aServerTelnetPass = "7dtdServerUpdateUtility"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & " Telnet password was blank."
EndIf
FileWriteLine($aLogFile, _NowCalc() & " Retrieving data from " & $ConfigFile & ".")
If $g_bDebug Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Port = " & $aServerPort)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Name = " & $aServerName)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Port = " & $aServerTelnetPort)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Telnet Password = " & $aServerTelnetPass)
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server Save Game Folder = " & $aServerSaveGame)
EndIf
FileClose($sConfigRead)
;**** END Retrieve Data From serverconfig.xml File ****

If $UseSteamCMD = "yes" Then
	Local $sFileExists = FileExists($steamcmddir & "\steamcmd.exe")
	If $sFileExists = 0 Then
		InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
		DirCreate($steamcmddir) ; to extract to
		_ExtractZip(@ScriptDir & "\steamcmd.zip", "", "steamcmd.exe", $steamcmddir)
		FileDelete(@ScriptDir & "\steamcmd.zip")
		FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD. [steamcmd.exe +quit]")
		RunWait("" & $steamcmddir & "\steamcmd.exe +quit", @SW_MINIMIZE)
		If Not FileExists($steamcmddir & "\steamcmd.exe") Then
			MsgBox(0x0, "SteamCMD Not Found", "Could not find steamcmd.exe at " & $steamcmddir)
			Exit
		EndIf
	EndIf
Else
	Local $cFileExists = FileExists($serverdir & "\" & $g_c_sServerEXE)
	If $cFileExists = 0 Then
		MsgBox(0x0, "7 Days To Die Server Not Found", "Could not find " & $g_c_sServerEXE & " at " & $serverdir)
		Exit
	EndIf
EndIf

#Region ;**** Check for Update At Startup ****
If ($CheckForUpdate = "yes") Then
	FileWriteLine($aLogFile, _NowCalc() & " Running initial update check . . ")
	Local $bRestart = UpdateCheck()
	If $bRestart Then
		$aBeginDelayedShutdown = 1
	EndIf
EndIf
#EndRegion ;**** Check for Update At Startup ****

If $g_sExecuteExternalScript = "yes" Then
	Local $sFileExists = FileExists($g_sExternalScriptDir & "\" & $g_sExternalScriptName)
	If $sFileExists = 0 Then
		SplashOff()
		Local $ExtScriptNotFound = MsgBox(4100, "External BEFORE Update Script Not Found", "Could not find " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName & @CRLF & "Would you like to Exit Now to fix?", 20)
		If $ExtScriptNotFound = 6 Then
			Exit
		Else
			$g_sExecuteExternalScript = "no"
			FileWriteLine($aLogFile, _NowCalc() & " External BEFORE Update Script Execution Disabled - Could not find " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName)
		EndIf
	EndIf
EndIf

If $g_sExecuteExternalScriptValidate = "yes" Then
	Local $sFileExists = FileExists($g_sExternalScriptDirValidate & "\" & $g_sExternalScriptNameValidate)
	If $sFileExists = 0 Then
		SplashOff()
		Local $ExtScriptNotFound = MsgBox(4100, "External AFTER Update Script Not Found", "Could not find " & $g_sExternalScriptDirValidate & "\" & $g_sExternalScriptNameValidate & @CRLF & "Would you like to Exit Now to fix?", 20)
		If $ExtScriptNotFound = 6 Then
			Exit
		Else
			$g_sExecuteExternalScriptValidate = "no"
			FileWriteLine($aLogFile, _NowCalc() & " External AFTER Update Script Execution Disabled - Could not find " & $g_sExternalScriptDirValidate & "\" & $g_sExternalScriptNameValidate)
		EndIf
	EndIf
EndIf


If $UseRemoteRestart = "yes" Then
	; Start The TCP Services
	TCPStartup()
	Local $MainSocket = TCPListen($aServerIP, $g_Port, 100)
	If $MainSocket = -1 Then
		MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $g_Port & "] Check server IP or disable Remote Restart in INI")
		FileWriteLine($aLogFile, _NowCalc() & " Remote Restart Enabled. Could not bind to " & $aServerIP & ":" & $g_Port)
		Exit
	Else
		FileWriteLine($aLogFile, _NowCalc() & " Remote Restart Enabled. Listening for Restart Request at " & $aServerIP & ":" & $g_Port)
	EndIf
EndIf


#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****

; -----------------------------------------------------------------------------------------------------------------------

$gTelnetTimeCheck0 = _NowCalc()
While True ;**** Loop Until Closed ****
	#Region ;**** Listen for Remote Restart Request ****
	If $UseRemoteRestart = "yes" Then
		Local $sRestart = _RemoteRestart($MainSocket, $RestartCode, $g_sRKey, $aServerIP, $aServerName, $g_bDebug)
		Switch @error
			Case 0

				If ProcessExists($aServerPID) And ($aBeginDelayedShutdown = 0) Then
					Local $MEM = ProcessGetStats($aServerPID, 0)
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
					If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
						Local $aMaintenanceMsg = """WARNING! Server maintenance restart begins in " & $aDelayShutdownTime & " minutes...""" & @CRLF
						$aBotMsg = $aMaintenanceMsg
						$aBeginDelayedShutdown = 1
						$aTimeCheck0 = _NowCalc
					Else
						CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
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
		If $g_sExecuteExternalScript = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " Executing External Script " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName)
			RunWait($g_sExternalScriptDir & '\' & $g_sExternalScriptName, $g_sExternalScriptDir, @SW_HIDE)
			FileWriteLine($aLogFile, _NowCalc() & " External Script Finished. Continuing Server Start.")
		EndIf
		If $UseSteamCMD = "yes" Then
			If $aServerVer = 1 Then
				Local $ServExp = " +app_update 294420 -beta latest_experimental"
			Else
				Local $ServExp = " +app_update 294420"
			EndIf

			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
			Local $sManifestExists = FileExists($steamcmddir & "\steamapps\appmanifest_294420.acf")
			If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
				FileMove($steamcmddir & "\steamapps\appmanifest_294420.acf", $steamcmddir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: Install manifest found at " & $steamcmddir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
				EndIf
			Else
				$aFirstBoot = 0
			EndIf
			If ($sManifestExists = 1) And ($aFirstBoot = 0) Then
				FileMove($serverdir & "\steamapps\appmanifest_294420.acf", $serverdir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Notice: Install manifest found at " & $serverdir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
				EndIf
			Else
				$aFirstBoot = 0
			EndIf

			If $validategame = "yes" Then
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD with validate: [""" & $steamcmddir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $serverdir & """" & $ServExp & " validate +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD with validate.")
				EndIf
				RunWait("""" & $steamcmddir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $serverdir & """" & $ServExp & " validate +quit")
				SplashOff()
			Else
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD without validate. [" & $steamcmddir & "\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 login anonymous +force_install_dir """ & $serverdir & "" & $ServExp & " +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD without validate.")
				EndIf
				RunWait("""" & $steamcmddir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $serverdir & """" & $ServExp & " +quit")
				SplashOff()
			EndIf
		EndIf
		SplashOff()

		If $g_sExecuteExternalScriptValidate = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " Executing AFTER Update Check External Script " & $g_sExternalScriptDirValidate & "\" & $g_sExternalScriptNameValidate)
			RunWait($g_sExternalScriptDirValidate & '\' & $g_sExternalScriptNameValidate, $g_sExternalScriptDirValidate, @SW_HIDE)
			FileWriteLine($aLogFile, _NowCalc() & " External AFTER Update Check Script Finished. Continuing Server Start.")
		EndIf

		$LogTimeStamp = "7DaysToDieServer_Data\output_log_dedi" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt"
		If $g_bDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " 7DTD Dedicated Server Started [" & $serverdir & "\" & $g_c_sServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $ConfigFileTemp & " -dedicated ]")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " 7DTD Dedicated Server Started.")
		EndIf
		SplashOff()
		PurgeLogFile($serverdir)
		$aServerPID = Run("" & $serverdir & "\" & $g_c_sServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $ConfigFileTemp & " -dedicated", $serverdir)
		$gTelnetTimeCheck0 = _NowCalc()

		; **** Retrieve Server Version ****
		Sleep(2000)
		Local $sLogPath = $serverdir & "\" & $LogTimeStamp
		Local $sLogPathOpen = FileOpen($sLogPath, 0)
		Local $sLogRead = FileRead($sLogPathOpen)
		$xGameVer = _StringBetween($sLogRead, "INF Version: ", " Compatibility Version")
		$aGameVer = _ArrayToString($xGameVer)
		FileClose($sLogPath)
		If $aGameVer = "-1" Then
			Sleep(2000)
			Local $sLogPathOpen = FileOpen($sLogPath, 0)
			Local $sLogRead = FileRead($sLogPathOpen)
			$xGameVer = _StringBetween($sLogRead, "INF Version: ", " Compatibility Version")
			$aGameVer = _ArrayToString($xGameVer)
			FileClose($sLogPath)
		EndIf
		If $g_bDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " Server version: " & $aGameVer & ".  Version derived from """ & $serverdir & "\" & $LogTimeStamp & """.")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " Server version: " & $aGameVer & ".")
		EndIf
		; **** END Retrieve Server Version ****

		; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****
		;		If $AppendVerBegin = "yes" Or $AppendVerEnd = "yes" Or $WipeServer = "yes" Or $aRebootMe = "yes" Or $aServerTelnetReboot = "yes" Then
		If ($aRebootMe = "yes") Or ($aServerTelnetReboot = "yes") Then
			Local $tConfigPathOpen = FileOpen($ConfigFileTempFull, 0)
			Local $tConfigRead2 = FileRead($tConfigPathOpen)
			FileClose($tConfigPathOpen)
			Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "")
			Local $sConfigFileTempExists = FileExists($ConfigFileTempFull)
			If $sConfigFileTempExists = 1 Then
				FileDelete($ConfigFileTempFull)
			EndIf
			FileWrite($ConfigFileTempFull, $tConfigRead1)

			; **** Append Server Version to Server Name ****
			If $AppendVerShort = "short" Then
				$aGameVerTemp1 = $aGameVer
				$aGameVerTemp1 = _StringBetween($aGameVerTemp1, "(", ")")
				$aGameVer = _ArrayToString($aGameVerTemp1)
			EndIf
			If ($AppendVerBegin = "no") And ($AppendVerEnd = "no") Then
					$aServerNameVer = $aServerName
			Else
				If $AppendVerBegin = "yes" Then
					$aServerNameVer = $aGameVer & $aServerName
				EndIf
				If $AppendVerEnd = "yes" Then
					$aServerNameVer = $aServerName & $aGameVer
				EndIf
				$aPropertyName = "ServerName"
				FileWriteLine($ConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aServerNameVer & """/>")
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Changing ServerName to """ & $aServerNameVer & """ in " & $ConfigFileTempFull & ".")
				EndIf
			EndIf
			; **** END Append Server Version to Server Name ****

			; **** Change GameName to Server Version ****
			If $WipeServer = "no" Then
				$aGameName = "[no change]"
			Else
				$aPropertyName = "GameName"
				$aGameName = StringRegExpReplace($aGameVer, "[\(\)]", "")
				FileWriteLine($ConfigFileTempFull, "<property name=""" & $aPropertyName & """ value=""" & $aGameName & """/>")
				If $g_bDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Changing GameName to """ & $aGameName & """ in " & $ConfigFileTempFull & ".")
				EndIf
			EndIf
			; **** END Change GameName to Server Version ****

			; **** Change Telnet Settings in ServerConfig7dtdServerUtilTemp.xml ****
			FileWriteLine($ConfigFileTempFull, "<property name=""TelnetEnabled"" value=""" & $aServerTelnetEnable & """/>")
			FileWriteLine($ConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aServerTelnetPort & """/>")
			FileWriteLine($ConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aServerTelnetPass & """/>")
			; **** END Change Telnet Settings in ServerConfig7dtdServerUtilTemp.xml ****

			FileWriteLine($ConfigFileTempFull, "</ServerSettings>")
			FileWriteLine($aLogFile, _NowCalc() & " ----- Restarting server to apply the following config change(s): " & $aServerRebootReason)
			FileClose($ConfigFileTempFull)
			SplashTextOn("7dtdServerUtil", "Restarting server to apply config change(s)." & @CRLF & "Server name: " & $aServerNameVer & @CRLF & "Game Name: " & $aGameName & @CRLF & $aServerRebootReason & @CRLF & "Please wait one minute.", 600, 150, -1, -1, $DLG_MOVEABLE, "")
			Global $aRebootMe = "no"
			Global $aServerTelnetReboot = "no"
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		EndIf
		; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****

		If @error Or Not $aServerPID Then
			If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
			$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
			Select
				Case $iMsgBoxAnswer = 4 ;Retry
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
				Case $iMsgBoxAnswer = 2 ;Cancel
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start - " & $aUtilityVer & " Shutdown - Intiated by User")
					Exit
				Case $iMsgBoxAnswer = -1 ;Timeout
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. Script Initiated Restart Attempt after 60 seconds of no User Input.")
			EndSelect
		EndIf
		If FileExists($aPIDFile) Then
			FileDelete($aPIDFile)
		EndIf
		FileWrite($aPIDFile, $aServerPID)
		FileSetAttrib($aPIDFile, "+HT")
	ElseIf ((_DateDiff('n', $aTimeCheck1, _NowCalc())) >= 5) Then
		Local $MEM = ProcessGetStats($aServerPID, 0)
		If $MEM[0] > $ExMem And $ExMemRestart = "no" And $g_bDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1])
		ElseIf $MEM[0] > $ExMem And $ExMemRestart = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " Excessive Memory Use - Restart Requested by " & $aUtilityVer & " Script")
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		EndIf
		$aTimeCheck1 = _NowCalc()
	EndIf
	#EndRegion ;**** Keep Server Alive Check. ****

	#Region ;**** Restart Server Every X Days and X Hours & Min****
	If (($g_sRestartDaily = "yes") And ((_DateDiff('n', $aTimeCheck2, _NowCalc())) >= 1) And (DailyRestartCheck($g_sRestartDays, $g_sRestartHours, $g_sRestartMin)) And ($aBeginDelayedShutdown = 0)) Then
		If ProcessExists($aServerPID) Then
			Local $MEM = ProcessGetStats($aServerPID, 0)
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " - Daily Restart Requested by " & $aUtilityVer & " Script")
			If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
				Global $aBotMsg = $sAnnounceScheduledMessage
				$aBeginDelayedShutdown = 1
				$aTimeCheck0 = _NowCalc
			Else
				CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
			EndIf
		EndIf
		$aTimeCheck2 = _NowCalc()
	EndIf
	#EndRegion ;**** Restart Server Every X Days and X Hours & Min****

	#Region ;**** KeepServerAlive Telnet Check ****
	If ($aTelnetCheck = "yes") And (_DateDiff('s', $gTelnetTimeCheck0, _NowCalc()) >= $aTelnetCheckSec) Then
		$TelnetCheckResult = TelnetCheck($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		$gTelnetTimeCheck0 = _NowCalc()
		If $TelnetCheckResult = 0 Then
			If $g_bDebug Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server not responding to telnet. Restarting server.")
			EndIf
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		Else
			If $g_bDebug Then
				FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server responded to telnet Commands.")
			EndIf
		EndIf
	EndIf
	#EndRegion ;**** KeepServerAlive Telnet Check ****

	#Region ;**** Check for Update every X Minutes ****
	If ($CheckForUpdate = "yes") And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $UpdateInterval) And ($aBeginDelayedShutdown = 0) Then
		Local $bRestart = UpdateCheck()
		If $bRestart And (($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes")) Then
			$aBeginDelayedShutdown = 1
		ElseIf $bRestart Then
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		EndIf
		$aTimeCheck0 = _NowCalc()
	EndIf
	#EndRegion ;**** Check for Update every X Minutes ****

	#Region ;**** Announce to Twitch, In Game, Discord ****
	If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
		If $aBeginDelayedShutdown = 1 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Bot in Use. Delaying Shutdown for " & $aDelayShutdownTime & " minutes. Notifying Channel")
			Local $sShutdownMessage = $aServerName & ":" & $aBotMsg & " Restarting in " & $aDelayShutdownTime & " minutes"
			Local $sInGameMsg = """WARNING! Server restarts in 1 minute....""" & @CRLF
			Local $sInGameMsgDaily = """WARNING! Daily server restart begins in " & $aDelayShutdownTime & " minutes...""" & @CRLF
			Local $sInGameMsgUpdate = """WARNING! New Update. Server restarting in " & $aDelayShutdownTime & " minutes...""" & @CRLF
			If $aBotMsg = $sAnnounceScheduledMessage Then
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $sInGameMsgDaily)
				EndIf
				If $sUseDiscordBotScheduled = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotScheduled = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf

			If $aBotMsg = $aMaintenanceMsg Then
				$sShutdownMessage = $aServerName & ": Server maintenance. Restarting in " & $aDelayShutdownTime & " minutes"
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $aMaintenanceMsg)
				EndIf
				If $sUseDiscordBotUpdate = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotUpdate = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf

			If $aBotMsg = $sAnnounceUpdateMessage Then
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $sInGameMsgUpdate)
				EndIf
				If $sUseDiscordBotUpdate = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotUpdate = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf

			$aBeginDelayedShutdown = 2
			$aTimeCheck0 = _NowCalc()
		ElseIf ($aBeginDelayedShutdown >= 2 And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aDelayShutdownTime)) Then
			$aBeginDelayedShutdown = 0
			$aTimeCheck0 = _NowCalc()
			CloseServer($aServerIP, $aServerTelnetPort, $aServerTelnetPass)
		ElseIf $aBeginDelayedShutdown = 2 And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= ($aDelayShutdownTime - 1)) Then
			Local $sShutdownMessage = $aServerName & " Restarting in 1 minute. Final Warning"
			If ($aBotMsg = $sAnnounceScheduledMessage) Or ($aBotMsg = $aMaintenanceMsg) Or ($aBotMsg = $sAnnounceUpdateMessage) Then
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $sInGameMsg)
				EndIf
				If $sUseDiscordBotScheduled = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotScheduled = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf

			;			If $aBotMsg = $aMaintenanceMsg Then
			;				If $sInGameAnnounce = "yes" Then
			;					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $sInGameMsg)
			;				EndIf
			;				If $sUseDiscordBotUpdate = "yes" Then
			;					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			;				EndIf
			;				If $sUseTwitchBotUpdate = "yes" Then
			;					TwitchMsgLog($sShutdownMessage)
			;				EndIf
			;			EndIf

			;			If $aBotMsg = $sAnnounceUpdateMessage Then
			;				If $sInGameAnnounce = "yes" Then
			;					SendInGame($aServerIP, $aServerTelnetPort, $aServerTelnetPass, $sInGameMsg)
			;				EndIf
			;				If $sUseDiscordBotUpdate = "yes" Then
			;					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			;				EndIf
			;				If $sUseTwitchBotUpdate = "yes" Then
			;					TwitchMsgLog($sShutdownMessage)
			;				EndIf
			;			EndIf

			$aBeginDelayedShutdown = 3
		EndIf
	Else
		$aBeginDelayedShutdown = 0
	EndIf
	#EndRegion ;**** Announce to Twitch, In Game, Discord ****

	#Region ;**** Rotate Logs ****
	If ($logRotate = "yes") And ((_DateDiff('h', $aTimeCheck4, _NowCalc())) >= 1) Then
		If Not FileExists($aLogFile) Then
			FileWriteLine($aLogFile, $aTimeCheck4 & " Log File Created")
			FileSetTime($aLogFile, @YEAR & @MON & @MDAY, 1)
		EndIf
		Local $aLogFileTime = FileGetTime($aLogFile, 1)
		Local $logTimeSinceCreation = _DateDiff('h', $aLogFileTime[0] & "/" & $aLogFileTime[1] & "/" & $aLogFileTime[2] & " " & $aLogFileTime[3] & ":" & $aLogFileTime[4] & ":" & $aLogFileTime[5], _NowCalc())
		If $logTimeSinceCreation >= $logHoursBetweenRotate Then
			RotateFile($aLogFile, $logQuantity)
		EndIf
		$aTimeCheck4 = _NowCalc()
	EndIf
	#EndRegion ;**** Rotate Logs ****
	Sleep(1000)
WEnd

