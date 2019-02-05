#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Resources\phoenix_5Vq_icon.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_v2.0.0.exe
#AutoIt3Wrapper_Outfile_x64=Builds\7dtdServerUpdateUtility_x64_v2.0.0.exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's 7dServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=2.0.0.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=2.0.0
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

$aUtilVersion = "v2.0.0" ; (2019-02-04)

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
Global Const $aUtilityName = "7dtdServerUpdateUtility"
Global Const $aServerEXE = "7DaysToDieServer.exe"
Global Const $aPIDFile = @ScriptDir & "\" & $aUtilityName & "_lastpid.tmp"
Global Const $aLogFile = @ScriptDir & "\" & $aUtilityName & ".log"
Global Const $aIniFile = @ScriptDir & "\" & $aUtilityName & ".ini"
Global Const $aUtilityVer = $aUtilityName & " " & $aUtilVersion
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
Global $aUseSteamCMD = "yes"
$aServerRebootReason = ""
$aRebootReason = ""
$aRebootConfigUpdate = "no"
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
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Shutdown - Intiated by User when closing " & $aUtilityName & " Script")
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		EndIf
		MsgBox(4096, "Thanks for using our Application", "Please visit http://www.Phoenix125.com and https://gamercide.com", 15)
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityName & " Stopped by User")
	Else
		FileWriteLine($aLogFile, _NowCalc() & " " & $aUtilityName & " Stopped")
	EndIf
	If $aRemoteRestartUse = "yes" Then
		TCPShutdown()
	EndIf
	SplashOff()
	Exit
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------

#Region 	 ;**** Close Server ****
Func CloseServer($ip, $port, $pass)
If $aRebootConfigUpdate = "no" Then
	SplashTextOn($aUtilityName, "Shutting down 7 Days to Die server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
EndIf
$aRebootConfigUpdate = "no"
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
				Run(@ScriptDir & "\puttytel.exe -P " & $aTelnetPort & " " & $aServerIP, "", @SW_HIDE)
				WinWait($aServerIP & " - PuTTYtel", "")
				Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
				If $CrashCheck = 0 Then
					ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
					ControlSend($aServerIP & " - PuTTYtel", "", "", $aTelnetPass & "{enter}")
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
			Run(@ScriptDir & "\puttytel.exe -P " & $aTelnetPort & " " & $aServerIP, "", @SW_HIDE)
			WinWait($aServerIP & " - PuTTYtel", "")
			Local $CrashCheck = WinWait("PuTTYtel Fatal Error", "", 2)
			If $CrashCheck = 0 Then
				ControlSend($aServerIP & " - PuTTYtel", "", "", "{enter}")
				ControlSend($aServerIP & " - PuTTYtel", "", "", $aTelnetPass & "{enter}")
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
EndFunc

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
	If $hBuildID < 100000 Then
		MsgBox($mb_ok, "ERROR", "Error retrieving buildid via SteamDB website. THIS IS NORMAL for first run. Please visit " & $aURL & " in Internet Explorer to authorize your PC or use SteamCMD for updates." & @CRLF & "! Press OK to close " & $aUtilName & " !")
	EndIf
EndFunc   ;==>GetLatestVerSteamDB

Func GetLatestVersion($sCmdDir)
	Local $aReturn[2] = [False, ""]
	DirRemove($sCmdDir & "\appcache", 1)
	DirRemove($sCmdDir & "\depotcache", 1)
	$sAppInfoTemp = "app_info_" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".tmp"
	RunWait('"' & @ComSpec & '" /c "' & $sCmdDir & '\steamcmd.exe" +login anonymous +app_info_update 1 +app_info_print 294420 +app_info_print 294420 +exit > ' & $sAppInfoTemp & '', $sCmdDir, @SW_MINIMIZE)
	Local Const $sFilePath = $sCmdDir & "\" & $sAppInfoTemp
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
		Local $aLatestVersion = GetLatestVersion($aSteamCMDDir)
	EndIf
	;	Local $aLatestVersion = GetLatestVersion($aSteamCMDDir)
	Local $aInstalledVersion = GetInstalledVersion($aServerDirLocal)
	SplashOff()
	If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
		If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server is Up to Date. Installed Version: " & $aInstalledVersion[1])
		Else
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server is Out of Date! Installed Version: " & $aInstalledVersion[1] & " Latest Version: " & $aLatestVersion[1])
			Global $aRebootMe = "yes"
			Global $aBotMsg = $sAnnounceUpdateMessage
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
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Latest & Installed Versions. Running update with -validate")
		SplashTextOn($aUtilityName, "Something went wrong retrieving Latest & Installed Versions." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 500, 125, -1, -1, $DLG_MOVEABLE, "")
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	ElseIf Not $aInstalledVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Installed Version. Running update with -validate. (This is normal for new install)")
		SplashTextOn($aUtilityName, "Something went wrong retrieving Installed Version." & @CRLF & "(This is normal for new install)" & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	ElseIf Not $aLatestVersion[0] Then
		FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Something went wrong retrieving Latest Version. Running update with -validate")
		SplashTextOn($aUtilityName, "Something went wrong retrieving Latest Version." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 125, -1, -1, $DLG_MOVEABLE, "") 5
		Global $aBotMsg = $sAnnounceUpdateMessage
		$bUpdateRequired = True
	EndIf
	Return $bUpdateRequired
EndFunc   ;==>UpdateCheck
#EndRegion ;**** Functions to Check for Update ****

#Region ;**** Adjust restart time for announcement delay ****
Func DailyRestartOffset($bHour0, $sMin, $sAnnounceNotifyTime1)
If $bRestartMin - $sAnnounceNotifyTime1 < 0 Then
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
	Global $aRestartMin = 60 - $sAnnounceNotifyTime1 + $bRestartMin
	Global $aRestartHours = StringTrimLeft($bHour2, 1)

Else
	Global $aRestartMin = $bRestartMin - $sAnnounceNotifyTime1
	Global $aRestartHours = $bRestartHours
EndIf
EndFunc   ;==>DailyRestartCheck
#EndRegion ;**** Adjust restart time for announcement delay ****

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
					;Return SetError(2, 0, "Invalid Restart Request by: " & $sRecvIP & ". Should be in the format of GET /?" & $sKey & "=user_pass HTTP/x.x | " & $sRECV)
					Return SetError(2, 0, "--- Server restart requested by Remote Restart.")

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

	Global $aServerDirLocal = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server directory (No trailing slash)", $iniCheck)
	Global $aConfigFile = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server Config File (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", $iniCheck)
	Global $aServerVer = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Version (0-Stable,1-Experimental)", $iniCheck)
	Global $aServerExtraCMD = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Extra commandine parameters for server.exe (ex. -serverpassword) (NOT working-coming soon)", $iniCheck)
	Global $aServerIP = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server Local IP (ex. 192.168.1.10)", $iniCheck)
	Global $aSteamCMDDir = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "SteamCMD directory (No trailing slash)", $iniCheck)
	Global $aSteamExtraCMD = IniRead($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Extra commandine parameters for SteamCMD (ex. -latest_experimental) (NOT working-coming soon)", $iniCheck)
	Global $aWipeServer = IniRead($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Use Version Name (ex. Alpha 17 (b238)) for Game Name (Folder used within SaveGameFolder)? (Leaves previous world saved but creates a new game) (yes/no)", $iniCheck)
	Global $aAppendVerBegin = IniRead($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no)", $iniCheck)
	Global $aAppendVerEnd = IniRead($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no)", $iniCheck)
	Global $aAppendVerShort = IniRead($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "If Append Server Version, then Use SHORT Name (ex B240) or LONG (ex. Aplha (B240))? (short/long)", $iniCheck)
	Global $aTelnetCheckYN = IniRead($sIniFile, " ---------- USE TELNET TO CHECK IF SERVER IS ALIVE ---------- ", "Use telnet to check if server is alive? (yes/no)", $iniCheck)
	Global $aTelnetCheckSec = IniRead($sIniFile, " ---------- USE TELNET TO CHECK IF SERVER IS ALIVE ---------- ", "Telnet check interval in seconds (30-900)", $iniCheck)
	Global $aExMemRestart = IniRead($sIniFile, " ---------- RESTART ON EXCESSIVE MEMORY USE ---------- ", "Restart on excessive memory use? (yes/no)", $iniCheck)
	Global $aExMemAmt = IniRead($sIniFile, " ---------- RESTART ON EXCESSIVE MEMORY USE ---------- ", "Excessive memory amount?", $iniCheck)
	Global $aRemoteRestartUse = IniRead($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Use Remote Restart? (yes/no)", $iniCheck)
	Global $aRemoteRestartPort = IniRead($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Port", $iniCheck)
	Global $aRemoteRestartKey = IniRead($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Key", $iniCheck)
	Global $aRemoteRestartCode = IniRead($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Code", $iniCheck)
	Global $aCheckForUpdate = IniRead($sIniFile, " ---------- CHECK FOR UPDATE ---------- ", "Check for updates? (yes/no)", $iniCheck)
	Global $aUpdateCheckInterval = IniRead($sIniFile, " ---------- CHECK FOR UPDATE ---------- ", "Update check interval in Minutes (05-59)", $iniCheck)
	Global $aRestartDaily = IniRead($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Use scheduled restarts? (yes/no)", $iniCheck)
	Global $aRestartDays = IniRead($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6)", $iniCheck)
	Global $bRestartHours = IniRead($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart hours (comma separated 00-23 ex.04,16)", $iniCheck)
	Global $bRestartMin = IniRead($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart minute (00-59)", $iniCheck)
	Global $sAnnounceScheduledMessage = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Scheduled", $iniCheck)
	Global $sAnnounceUpdateMessage = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Updates", $iniCheck)
	Global $sAnnounceRemoteRestartMessage = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Remote Restart", $iniCheck)
	Global $sAnnounceNotifyTime1 = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "First announcement __ minutes before restart (server already makes a 1 minute announcement) (2-60)", $iniCheck)
;	Global $sAnnounceNotifyTime2 = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Second announcement __ minutes before restart (0-disable) (NOT working-coming soon)", $iniCheck)
;	Global $sAnnounceNotifyTime3 = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Third announcement __ minutes before restart (0-disable) (NOT working-coming soon)", $iniCheck)
	Global $sInGameAnnounce = IniRead($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Send in-game message for restarts? Requires telnet (yes/no)", $iniCheck)
	Global $sUseDiscordBotScheduled = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for scheduled restarts? (yes/no)", $iniCheck)
	Global $sUseDiscordBotUpdate = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for update restarts? (yes/no)", $iniCheck)
	Global $sUseDiscordBotRemoteRestart = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for Remote Restart restarts? (yes/no) (NOT working-coming soon)", $iniCheck)
	Global $sDiscordWebHookURLs = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "WebHook URL", $iniCheck)
	Global $sDiscordBotName = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Bot Name", $iniCheck)
	Global $bDiscordBotUseTTS = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Use TTS? (yes/no)", $iniCheck)
	Global $sDiscordBotAvatar = IniRead($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Bot Avatar Link", $iniCheck)
	Global $sUseTwitchBotScheduled = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for scheduled restarts? (yes/no)", $iniCheck)
	Global $sUseTwitchBotUpdate = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for update restarts? (yes/no)", $iniCheck)
	Global $sUseTwitchBotRemoteRestart = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for Remote Restart restarts? (yes/no) (NOT working-coming soon)", $iniCheck)
	Global $sTwitchNick = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Nick", $iniCheck)
	Global $sChatOAuth = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "ChatOAuth", $iniCheck)
	Global $sTwitchChannels = IniRead($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Channels", $iniCheck)
	Global $aExecuteExternalScript = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Execute external script BEFORE update? (yes/no)", $iniCheck)
	Global $aExternalScriptDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Script directory", $iniCheck)
	Global $aExternalScriptName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Script filename", $iniCheck)
	Global $aExternalScriptValidateYN = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no)", $iniCheck)
	Global $aExternalScriptValidateDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Script directory", $iniCheck)
	Global $aExternalScriptValidateName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Script filename", $iniCheck)
	Global $aExternalScriptUpdateYN = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Execute external script for server update restarts? (yes/no)", $iniCheck)
	Global $aExternalScriptUpdateDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Script directory", $iniCheck)
	Global $aExternalScriptUpdateFileName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Script filename", $iniCheck)
	Global $aExternalScriptDailyYN = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Execute external script for daily server restarts? (yes/no)", $iniCheck)
	Global $aExternalScriptDailyDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Script directory", $iniCheck)
	Global $aExternalScriptDailyFileName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Script filename", $iniCheck)
	Global $aExternalScriptAnnounceYN = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Execute external script when first restart announcement is made? (yes/no)", $iniCheck)
	Global $aExternalScriptAnnounceDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Script directory", $iniCheck)
	Global $aExternalScriptAnnounceFileName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Script filename", $iniCheck)
	Global $aExternalScriptRemoteYN = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no)", $iniCheck)
	Global $aExternalScriptRemoteDir = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Script directory", $iniCheck)
	Global $aExternalScriptRemoteFileName = IniRead($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Script filename", $iniCheck)
	Global $aLogRotate = IniRead($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Rotate log files? (yes/no)", $iniCheck)
	Global $aLogQuantity = IniRead($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Number of logs", $iniCheck)
	Global $aLogHoursBetweenRotate = IniRead($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Hours between log rotations", $iniCheck)
	Global $aValidate = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Validate files with SteamCMD update? (yes/no)", $iniCheck)
	Global $aUpdateSource = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com", $iniCheck)
	Global $aUsePuttytel = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Use puttytel for telnet client? (puttytel is more reliable but has popup windows) (yes/no)", $iniCheck)
	Global $sObfuscatePass = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Hide passwords in log files? (yes/no)", $iniCheck)
	Global $aExternalScriptHideYN = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no)", $iniCheck)
	Global $aDebug = IniRead($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Enable debug to output more log detail? (yes/no)", $iniCheck)

	If $iniCheck = $aServerDirLocal Then
		$aServerDirLocal = "D:\Game Servers\7 Days to Die Dedicated Server"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aSteamCMDDir Then
		$aSteamCMDDir = "D:\Game Servers\7 Days to Die Dedicated Server\SteamCMD"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aSteamExtraCMD Then
		$aSteamExtraCMD = ""
		$iIniFail += 1
	EndIf
	If $iniCheck = $aServerVer Then
		$aServerVer = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aServerExtraCMD Then
		$aServerExtraCMD = ""
		$iIniFail += 1
	EndIf
	If $iniCheck = $aConfigFile Then
		$aConfigFile = "serverconfig.xml"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aWipeServer Then
		$aWipeServer = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aAppendVerBegin Then
		$aAppendVerBegin = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aAppendVerEnd Then
		$aAppendVerEnd = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aAppendVerShort Then
		$aAppendVerShort = "long"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aServerIP Then
		$aServerIP = "192.168.1.10"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aValidate Then
		$aValidate = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aUpdateSource Then
		$aUpdateSource = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aRemoteRestartUse Then
		$aRemoteRestartUse = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aRemoteRestartPort Then
		$aRemoteRestartPort = "57520"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aRemoteRestartKey Then
		$aRemoteRestartKey = "restart"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aRemoteRestartCode Then
		$aRemoteRestartCode = "password"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aUsePuttytel Then
		$aUsePuttytel = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aTelnetCheckYN Then
		$aTelnetCheckYN = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aTelnetCheckSec Then
		$aTelnetCheckSec = "300"
		$iIniFail += 1
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
	EndIf
	If $iniCheck = $aCheckForUpdate Then
		$aCheckForUpdate = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aUpdateCheckInterval Then
		$aUpdateCheckInterval = "15"
		$iIniFail += 1
	ElseIf $aUpdateCheckInterval < 5 Then
		$aUpdateCheckInterval = 5
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Update check interval was out of range. Interval set to: " & $aUpdateCheckInterval & " minutes.")
	EndIf
	If $iniCheck = $aRestartDaily Then
		$aRestartDaily = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aRestartDays Then
		$aRestartDays = "0"
		$iIniFail += 1
	EndIf
	If $iniCheck = $bRestartHours Then
		$bRestartHours = "04,16"
		$iIniFail += 1
	EndIf
	If $iniCheck = $bRestartMin Then
		$bRestartMin = "00"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExMemAmt Then
		$aExMemAmt = "6000000000"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExMemRestart Then
		$aExMemRestart = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aLogRotate Then
		$aLogRotate = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aLogQuantity Then
		$aLogQuantity = "10"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aLogHoursBetweenRotate Then
		$aLogHoursBetweenRotate = "24"
		$iIniFail += 1
	ElseIf $aLogHoursBetweenRotate < 1 Then
		$aLogHoursBetweenRotate = 1
	EndIf
	If $iniCheck = $sAnnounceScheduledMessage Then
		$sAnnounceScheduledMessage = "Scheduled server restart."
		$iIniFail += 1
	EndIf
	If $iniCheck = $sAnnounceNotifyTime1 Then
		$sAnnounceNotifyTime1 = "5"
		$iIniFail += 1
	ElseIf $sAnnounceNotifyTime1 < 2 Then
		$sAnnounceNotifyTime1 = 2
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Announcement __ minutes before restart was out of range. Interval set to: " & $sAnnounceNotifyTime1 & " minutes.")
	ElseIf $sAnnounceNotifyTime1 > 60 Then
		$sAnnounceNotifyTime1 = 60
		FileWriteLine($aLogFile, _NowCalc() & " [Notice] Announcement __ minutes before restart was out of range. Interval set to: " & $sAnnounceNotifyTime1 & " minutes.")
	EndIf
;	If $iniCheck = $sAnnounceNotifyTime2 Then
;		$sAnnounceNotifyTime2 = "0"
;		$iIniFail += 1
;	ElseIf $sAnnounceNotifyTime2 < 5 And $sAnnounceNotifyTime2 > 0 Then
;		$sAnnounceNotifyTime2 = 5
;	EndIf
;	If $iniCheck = $sAnnounceNotifyTime3 Then
;		$sAnnounceNotifyTime3 = "0"
;		$iIniFail += 1
;	ElseIf $sAnnounceNotifyTime3 < 5 And $sAnnounceNotifyTime2 > 0 Then
;		$sAnnounceNotifyTime3 = 5
;	EndIf
	If $iniCheck = $sAnnounceUpdateMessage Then
		$sAnnounceUpdateMessage = "New server update."
		$iIniFail += 1
	EndIf
	If $iniCheck = $sAnnounceRemoteRestartMessage Then
		$sAnnounceRemoteRestartMessage = "Server maintence."
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
	If $iniCheck = $sUseDiscordBotRemoteRestart Then
		$sUseDiscordBotRemoteRestart = "no"
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
	If $iniCheck = $sUseTwitchBotRemoteRestart Then
		$sUseTwitchBotRemoteRestart = "no"
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
	If $iniCheck = $aExecuteExternalScript Then
		$aExecuteExternalScript = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptDir Then
		$aExternalScriptDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptName Then
		$aExternalScriptName = "beforesteamcmd.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptValidateYN Then
		$aExternalScriptValidateYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptValidateDir Then
		$aExternalScriptValidateDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptValidateName Then
		$aExternalScriptValidateName = "aftersteamcmd.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptUpdateYN Then
		$aExternalScriptUpdateYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptUpdateDir Then
		$aExternalScriptUpdateDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptUpdateFileName Then
		$aExternalScriptUpdateFileName = "update.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptDailyYN Then
		$aExternalScriptDailyYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptDailyDir Then
		$aExternalScriptDailyDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptDailyFileName Then
		$aExternalScriptDailyFileName = "daily.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptAnnounceYN Then
		$aExternalScriptAnnounceYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptAnnounceDir Then
		$aExternalScriptAnnounceDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptAnnounceFileName Then
		$aExternalScriptAnnounceFileName = "firstannounce.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptRemoteYN Then
		$aExternalScriptRemoteYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptRemoteDir Then
		$aExternalScriptRemoteDir = "D:\Game Servers\7 Days to Die Dedicated Server\Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptRemoteFileName Then
		$aExternalScriptRemoteFileName = "remoterestart.bat"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aExternalScriptHideYN Then
		$aExternalScriptHideYN = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $aDebug Then
		$aDebug = "no"
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
		$aDelayShutdownTime = $sAnnounceNotifyTime1
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
	$aSteamCMDDir = RemoveInvalidCharacters($aSteamCMDDir)
	$aConfigFile = RemoveInvalidCharacters($aConfigFile)
	$aExternalScriptDir = RemoveInvalidCharacters($aExternalScriptDir)
	$aExternalScriptName = RemoveInvalidCharacters($aExternalScriptName)
	$aExternalScriptValidateDir = RemoveInvalidCharacters($aExternalScriptValidateDir)
	$aExternalScriptValidateName = RemoveInvalidCharacters($aExternalScriptValidateName)
	$aExternalScriptUpdateDir = RemoveInvalidCharacters($aExternalScriptUpdateDir)
	$aExternalScriptUpdateFileName = RemoveInvalidCharacters($aExternalScriptUpdateFileName)
	$aExternalScriptAnnounceDir = RemoveInvalidCharacters($aExternalScriptAnnounceDir)
	$aExternalScriptAnnounceFileName = RemoveInvalidCharacters($aExternalScriptAnnounceFileName)
	$aExternalScriptDailyDir = RemoveInvalidCharacters($aExternalScriptDailyDir)
	$aExternalScriptDailyFileName = RemoveInvalidCharacters($aExternalScriptDailyFileName)

	If $sUseDiscordBotRemoteRestart = "yes" or $sUseDiscordBotScheduled = "yes" or $sUseDiscordBotUpdate = "yes" or $sUseTwitchBotRemoteRestart = "yes" or $sUseTwitchBotScheduled = "yes" or $sUseTwitchBotUpdate = "yes" or $sInGameAnnounce = "yes" Then
		DailyRestartOffset($bRestartHours,$bRestartMin,$sAnnounceNotifyTime1)
	EndIf
	If $xDebug Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server Folder = " & $aServerDirLocal)
		FileWriteLine($aLogFile, _NowCalc() & " . . . SteamCMD Folder = " & $aSteamCMDDir)
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
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server directory (No trailing slash)", $aServerDirLocal)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server Config File (New install: leave as ServerConfig.xml... after files downloaded, CHANGE name... SteamCMD WILL overwrite it)", $aConfigFile)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Version (0-Stable,1-Experimental)", $aServerVer)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Extra commandine parameters for server.exe (ex. -serverpassword) (NOT working-coming soon)", $aServerExtraCMD)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Server Local IP (ex. 192.168.1.10)", $aServerIP)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "SteamCMD directory (No trailing slash)", $aSteamCMDDir)
	IniWrite($sIniFile, " ---------- SERVER INFORMATION ---------- ", "Extra commandine parameters for SteamCMD (ex. -latest_experimental) (NOT working-coming soon)", $aSteamExtraCMD)
	IniWrite($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Use Version Name (ex. Alpha 17 (b238)) for Game Name (Folder used within SaveGameFolder)? (Leaves previous world saved but creates a new game) (yes/no)", $aWipeServer)
	IniWrite($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at BEGINNING of Server Name? (yes/no)", $aAppendVerBegin)
	IniWrite($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "Append Server Version (ex. Alpha 16.4 (b8)) at END of Server Name? (yes/no)", $aAppendVerEnd)
	IniWrite($sIniFile, " ---------- APPEND SERVER VERSION TO NAME ---------- ", "If Append Server Version, then Use SHORT Name (ex B240) or LONG (ex. Aplha (B240))? (short/long)", $aAppendVerShort)
	IniWrite($sIniFile, " ---------- USE TELNET TO CHECK IF SERVER IS ALIVE ---------- ", "Use telnet to check if server is alive? (yes/no)", $aTelnetCheckYN)
	IniWrite($sIniFile, " ---------- USE TELNET TO CHECK IF SERVER IS ALIVE ---------- ", "Telnet check interval in seconds (30-900)", $aTelnetCheckSec)
	IniWrite($sIniFile, " ---------- RESTART ON EXCESSIVE MEMORY USE ---------- ", "Restart on excessive memory use? (yes/no)", $aExMemRestart)
	IniWrite($sIniFile, " ---------- RESTART ON EXCESSIVE MEMORY USE ---------- ", "Excessive memory amount?", $aExMemAmt)
	IniWrite($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Use Remote Restart? (yes/no)", $aRemoteRestartUse)
	IniWrite($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Port", $aRemoteRestartPort)
	IniWrite($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Key", $aRemoteRestartKey)
	IniWrite($sIniFile, " ---------- REMOTE RESTART OPTIONS ---------- (http://IP:Port/?RestartKey=RestartCode. ex: 192.168.1.10:57520/?restart=password)", "Restart Code", $aRemoteRestartCode)
	IniWrite($sIniFile, " ---------- CHECK FOR UPDATE ---------- ", "Check for updates? (yes/no)", $aCheckForUpdate)
	IniWrite($sIniFile, " ---------- CHECK FOR UPDATE ---------- ", "Update check interval in Minutes (05-59)", $aUpdateCheckInterval)
	IniWrite($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Use scheduled restarts? (yes/no)", $aRestartDaily)
	IniWrite($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6)", $aRestartDays)
	IniWrite($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart hours (comma separated 00-23 ex.04,16)", $bRestartHours)
	IniWrite($sIniFile, " ---------- SCHEDULED RESTARTS ---------- ", "Restart minute (00-59)", $bRestartMin)
	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Scheduled", $sAnnounceScheduledMessage)
	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Updates", $sAnnounceUpdateMessage)
	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Announcement message: Remote Restart", $sAnnounceRemoteRestartMessage)
	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "First announcement __ minutes before restart (server already makes a 1 minute announcement) (2-60)", $sAnnounceNotifyTime1)
;	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Second announcement __ minutes before restart (0-disable) (NOT working-coming soon)", $sAnnounceNotifyTime2)
;	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Third announcement __ minutes before restart (0-disable) (NOT working-coming soon)", $sAnnounceNotifyTime3)
	IniWrite($sIniFile, " ---------- ANNOUNCEMENT MESSAGES ---------- (if announcements enabled)", "Send in-game message for restarts? Requires telnet (yes/no)", $sInGameAnnounce)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for scheduled restarts? (yes/no)", $sUseDiscordBotScheduled)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for update restarts? (yes/no)", $sUseDiscordBotUpdate)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Send Discord message for Remote Restart restarts? (yes/no) (NOT working-coming soon)", $sUseDiscordBotRemoteRestart)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "WebHook URL", $sDiscordWebHookURLs)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Bot Name", $sDiscordBotName)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Use TTS? (yes/no)", $bDiscordBotUseTTS)
	IniWrite($sIniFile, " ---------- DISCORD ANNOUNCEMENTS ---------- ", "Bot Avatar Link", $sDiscordBotAvatar)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for scheduled restarts? (yes/no)", $sUseTwitchBotScheduled)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for update restarts? (yes/no)", $sUseTwitchBotUpdate)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Send Twitch message for Remote Restart restarts? (yes/no) (NOT working-coming soon)", $sUseTwitchBotRemoteRestart)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Nick", $sTwitchNick)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "ChatOAuth", $sChatOAuth)
	IniWrite($sIniFile, " ---------- TWITCH ANNOUNCEMENTS ---------- ", "Channels", $sTwitchChannels)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Execute external script BEFORE update? (yes/no)", $aExecuteExternalScript)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Script directory", $aExternalScriptDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT BEFORE SteamCMD UPDATE AND SERVER START ---------- ", "1-Script filename", $aExternalScriptName)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Execute external script AFTER update but BEFORE server start? (yes/no)", $aExternalScriptValidateYN)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Script directory", $aExternalScriptValidateDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT AFTER SteamCMD BUT BEFORE SERVER START ---------- ", "2-Script filename", $aExternalScriptValidateName)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Execute external script for server update restarts? (yes/no)", $aExternalScriptUpdateYN)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Script directory", $aExternalScriptUpdateDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR SERVER *UPDATE* ---------- ", "3-Script filename", $aExternalScriptUpdateFileName)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Execute external script for daily server restarts? (yes/no)", $aExternalScriptDailyYN)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Script directory", $aExternalScriptDailyDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN RESTARTING FOR *DAILY* SERVER RESTART ---------- ", "4-Script filename", $aExternalScriptDailyFileName)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Execute external script when first restart announcement is made? (yes/no)", $aExternalScriptAnnounceYN)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Script directory", $aExternalScriptAnnounceDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT WHEN FIRST RESTART ANNOUNCEMENT IS MADE ---------- ", "5-Script filename", $aExternalScriptAnnounceFileName)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Execute external script during restart when a remote restart request is made? (yes/no)", $aExternalScriptRemoteYN)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Script directory", $aExternalScriptRemoteDir)
	IniWrite($sIniFile, " ---------- EXECUTE EXTERNAL SCRIPT DURING RESTART WHEN REMOTE RESTART REQUEST IS MADE ---------- ", "6-Script filename", $aExternalScriptRemoteFileName)
	IniWrite($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Rotate log files? (yes/no)", $aLogRotate)
	IniWrite($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Number of logs", $aLogQuantity)
	IniWrite($sIniFile, " ---------- LOG FILE OPTIONS ---------- ", "Hours between log rotations", $aLogHoursBetweenRotate)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Validate files with SteamCMD update? (yes/no)", $aValidate)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "For update checks, use (0)SteamCMD or (1)SteamDB.com", $aUpdateSource)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Use puttytel for telnet client? (puttytel is more reliable but has popup windows) (yes/no)", $aUsePuttytel)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Hide passwords in log files? (yes/no)", $sObfuscatePass)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no)", $aExternalScriptHideYN)
	IniWrite($sIniFile, " ---------- ServerUpdateUtility MISC OPTIONS ---------- ", "Enable debug to output more log detail? (yes/no)", $aDebug)
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

#Region ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
OnAutoItExitRegister("Gamercide")
SplashTextOn($aUtilityName, "7dtdServerUpdateUtility started.", 250, 50, -1, -1, $DLG_MOVEABLE, "")
FileWriteLine($aLogFile, _NowCalc() & " ============================ " & $aUtilityVer & " Started ============================")
ReadUini($aIniFile, $aLogFile)
AppendConfigSettings()

;**** Retrieve Data From serverconfig.xml File ****
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
$kServerPort = "}ServerPort}value=}"
$kServerName = "}ServerName}value=}"
$kServerTelnetEnable = "}TelnetEnabled}value=}"
$kServerTelnetPort = "}TelnetPort}value=}"
$kServerTelnetPass = "}TelnetPassword}value=}"
$kServerSaveGame = "}SaveGameFolder}value=}"
$kServerTerminalWindow = "}TerminalWindowEnabled}value=}"
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
$aTelnetPort = _ArrayToString($xServerTelnetPort)
$xServerTelnetPass = _StringBetween($sConfigRead, $kServerTelnetPass, "}")
$aTelnetPass = _ArrayToString($xServerTelnetPass)
$xServerSaveGame = _StringBetween($sConfigRead, $kServerSaveGame, "}")
$aServerSaveGame = _ArrayToString($xServerSaveGame)
$xServerTerminalWindow = _StringBetween($sConfigRead, $kServerTerminalWindow, "}")
$aServerTerminalWindow = _ArrayToString($xServerTerminalWindow)
If $aServerSaveGame = "absolute path" Then
	$aServerSaveGame = _PathFull("7DaysToDieFolder", @AppDataDir)
EndIf
If $aServerTelnetEnable = "no" Or $aServerTelnetEnable = "false" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet was disabled. Telnet required for this utility. TelnetEnabled set to: true")
	$aServerTelnetEnable = "true"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet was disabled." & @CRLF
EndIf
If $aTelnetPort = "" Then
	FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet port was blank. Port CHANGED to default value: 8081")
	$aTelnetPort = "8081"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet port was blank." & @CRLF
EndIf
If $aTelnetPass = "CHANGEME" Or $aTelnetPass = "" Then
	If $sObfuscatePass = "yes" Then
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: [hidden]. Recommend change telnet password in " & $aConfigFile)
	Else
		FileWriteLine($aLogFile, _NowCalc() & " . . . Server telnet password was " & $aTelnetPass & ". Password CHANGED to: 7dtdServerUpdateUtility. Recommend change telnet password in " & $aConfigFile)
	EndIf
	$aTelnetPass = "7dtdServerUpdateUtility"
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Telnet password was blank or CHANGEME." & @CRLF
EndIf
If $aServerTerminalWindow = "false" Then
Else
	FileWriteLine($aLogFile, _NowCalc() & " . . . Terminal window was enabled. Utility cannot function with it enabled. Terminal window set to: false")
	$aServerTelnetReboot = "yes"
	$aServerRebootReason = $aServerRebootReason & "Terminal window was enabled." & @CRLF
EndIf
FileWriteLine($aLogFile, _NowCalc() & " Retrieving data from " & $aConfigFile & ".")
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
;**** END Retrieve Data From serverconfig.xml File ****

If $aUseSteamCMD = "yes" Then
	Local $sFileExists = FileExists($aSteamCMDDir & "\steamcmd.exe")
	If $sFileExists = 0 Then
		InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
		DirCreate($aSteamCMDDir) ; to extract to
		_ExtractZip(@ScriptDir & "\steamcmd.zip", "", "steamcmd.exe", $aSteamCMDDir)
		FileDelete(@ScriptDir & "\steamcmd.zip")
		FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD. [steamcmd.exe +quit]")
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
	FileWriteLine($aLogFile, _NowCalc() & " Running initial update check . . ")
	Local $bRestart = UpdateCheck()
	If $bRestart Then
		$aBeginDelayedShutdown = 1
	EndIf
EndIf
#EndRegion ;**** Check for Update At Startup ****

ExternalScriptExist()

If $aRemoteRestartUse = "yes" Then
	; Start The TCP Services
	TCPStartup()
	Local $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
	If $MainSocket = -1 Then
		MsgBox(0x0, "Remote Restart", "Could not bind to [" & $aServerIP & ":" & $aRemoteRestartPort & "] Check server IP or disable Remote Restart in INI")
		FileWriteLine($aLogFile, _NowCalc() & " Remote Restart enabled. Could not bind to " & $aServerIP & ":" & $aRemoteRestartPort)
		Exit
	Else
		If $xDebug And ($sObfuscatePass = "no") Then
			FileWriteLine($aLogFile, _NowCalc() & " Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?" & $aRemoteRestartKey & "=" & $aRemoteRestartCode)
		Else
			FileWriteLine($aLogFile, _NowCalc() & " Remote Restart enabled. Listening for restart request at http://" & $aServerIP & ":" & $aRemoteRestartPort & "/?[key]=[password]")
		EndIf
	EndIf
EndIf


#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****

; -----------------------------------------------------------------------------------------------------------------------

$gTelnetTimeCheck0 = _NowCalc()
While True ;**** Loop Until Closed ****
	#Region ;**** Listen for Remote Restart Request ****
	If $aRemoteRestartUse = "yes" Then
		Local $sRestart = _RemoteRestart($MainSocket, $aRemoteRestartCode, $aRemoteRestartKey, $aServerIP, $aServerName, $xDebug)
		Switch @error
			Case 0

				If ProcessExists($aServerPID) And ($aBeginDelayedShutdown = 0) Then
					Local $MEM = ProcessGetStats($aServerPID, 0)
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
					If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
						Local $aMaintenanceMsg = """WARNING! " & $sAnnounceRemoteRestartMessage & " Restarting server in " & $aDelayShutdownTime & " minutes...""" & @CRLF
						$aBotMsg = $aMaintenanceMsg
						$aBeginDelayedShutdown = 1
						$aRebootReason = "remoterestart"
						$aTimeCheck0 = _NowCalc
					Else
						RunExternalRemoteRestart()
						CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
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
			;			FileWriteLine($aLogFile, _NowCalc() & " External Script Finished. Continuing Server Start.")
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
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD with validate: [""" & $aSteamCMDDir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $aServerDirLocal & """" & $ServExp & " validate +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD with validate.")
				EndIf
				RunWait("""" & $aSteamCMDDir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $aServerDirLocal & """" & $ServExp & " " & $aSteamExtraCMD & " validate +quit")
				SplashOff()
			Else
				If $xDebug Then
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD without validate. [" & $aSteamCMDDir & "\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 login anonymous +force_install_dir """ & $aServerDirLocal & "" & $ServExp & " +quit")
				Else
					FileWriteLine($aLogFile, _NowCalc() & " Running SteamCMD without validate.")
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
			FileWriteLine($aLogFile, _NowCalc() & " 7DTD Dedicated Server Started [" & $aServerDirLocal & "\" & $aServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $aConfigFileTemp & " -dedicated ]")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " 7DTD Dedicated Server Started.")
		EndIf
		PurgeLogFile($aServerDirLocal)
		SplashOff()
		If ($aRebootMe = "no") And ($aServerTelnetReboot = "no") Then
			MsgBox($MB_OK,$aUtilityName, "7 Days to Die Server started . . . ", 7)
		EndIf
		$aServerPID = Run("" & $aServerDirLocal & "\" & $aServerEXE & " -logfile " & $LogTimeStamp & " -quit -batchmode -nographics  " & $aServerExtraCMD & " -configfile=" & $aConfigFileTemp & " -dedicated", $aServerDirLocal, @SW_HIDE)
		$gTelnetTimeCheck0 = _NowCalc()

		; **** Retrieve Server Version ****
		Sleep(2000)
		Local $sLogPath = $aServerDirLocal & "\" & $LogTimeStamp
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
		If $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " Server version: " & $aGameVer & ".  Version derived from """ & $aServerDirLocal & "\" & $LogTimeStamp & """.")
		Else
			FileWriteLine($aLogFile, _NowCalc() & " Server version: " & $aGameVer & ".")
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
			SplashTextOn($aUtilityName, "Restarting server to apply config change(s)." & @CRLF & "Server name: " & $aServerNameVer & @CRLF & "Game Name: " & $aGameName & @CRLF & @CRLF & "Reboot Reason(s):" & @CRLF & $aServerRebootReason & @CRLF & "Please wait one minute.", 600, 350, -1, -1, $DLG_MOVEABLE, "")
			Global $aRebootConfigUpdate = "yes"
			Global $aRebootMe = "no"
			Global $aServerTelnetReboot = "no"
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		EndIf
		; **** Append Server Version to Server Name And/Or Change GameName to Server Version ****

		If @error Or Not $aServerPID Then
			If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
			$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
			Select
				Case $iMsgBoxAnswer = 4 ;Retry
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
				Case $iMsgBoxAnswer = 2 ;Cancel
					FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start - " & $aUtilityName & " Shutdown - Intiated by User")
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
		If $MEM[0] > $aExMemAmt And $aExMemRestart = "no" And $xDebug Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1])
		ElseIf $MEM[0] > $aExMemAmt And $aExMemRestart = "yes" Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " Excessive Memory Use - Restart requested by " & $aUtilityName & " Script")
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		EndIf
		$aTimeCheck1 = _NowCalc()
	EndIf
	#EndRegion ;**** Keep Server Alive Check. ****

	#Region ;**** Restart Server Every X Days and X Hours & Min****
	If (($aRestartDaily = "yes") And ((_DateDiff('n', $aTimeCheck2, _NowCalc())) >= 1) And (DailyRestartCheck($aRestartDays, $aRestartHours, $aRestartMin)) And ($aBeginDelayedShutdown = 0)) Then
		If ProcessExists($aServerPID) Then
			Local $MEM = ProcessGetStats($aServerPID, 0)
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " - Daily restart requested by " & $aUtilityName & ".")
			If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
				Global $aBotMsg = $sAnnounceScheduledMessage
				$aBeginDelayedShutdown = 1
				$aRebootReason = "daily"
				$aTimeCheck0 = _NowCalc
			Else
				RunExternalScriptDaily()
				CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
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
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
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
		If $bRestart And (($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes")) Then
			$aBeginDelayedShutdown = 1
			$aRebootReason = "update"
		ElseIf $bRestart Then
			RunExternalScriptUpdate()
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		EndIf
		$aTimeCheck0 = _NowCalc()
	EndIf
	#EndRegion ;**** Check for Update every X Minutes ****

	#Region ;**** Announce to Twitch, In Game, Discord ****
	If ($sUseDiscordBotScheduled = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotScheduled = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
		If $aBeginDelayedShutdown = 1 Then
			FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Bot in Use. Delaying Shutdown for " & $aDelayShutdownTime & " minutes. Notifying Channel")
			RunExternalScriptAnnounce()
			Local $sShutdownMessage = $aServerName & ":" & $aBotMsg & " Restarting in " & $aDelayShutdownTime & " minutes"
			Local $sInGameMsg = """WARNING! Server restarts in 1 minute....""" & @CRLF
			Local $sInGameMsgDaily = """WARNING! Daily server restart begins in " & $aDelayShutdownTime & " minutes...""" & @CRLF
			Local $sInGameMsgUpdate = """WARNING! New Update. Server restarting in " & $aDelayShutdownTime & " minutes...""" & @CRLF
			If $aBotMsg = $sAnnounceScheduledMessage Then
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $sInGameMsgDaily)
				EndIf
				If $sUseDiscordBotScheduled = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotScheduled = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf

			If $aBotMsg = $aMaintenanceMsg Then
				$sShutdownMessage = $aServerName & ": " & $sAnnounceRemoteRestartMessage & " Server restarting in " & $aDelayShutdownTime & " minutes"
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $aMaintenanceMsg)
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
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $sInGameMsgUpdate)
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
			If $aRebootReason = "daily" Then
			SplashTextOn($aUtilityName,"Daily server request. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
				RunExternalScriptDaily()
			EndIf
			If $aRebootReason = "update" Then
			SplashTextOn($aUtilityName,"New server update. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
				RunExternalScriptUpdate()
			EndIf
			If $aRebootReason = "remoterestart" Then
			SplashTextOn($aUtilityName,"Remote Restart request. Restarting server . . .", 350, 50, -1, -1, $DLG_MOVEABLE, "")
				RunExternalRemoteRestart()
			EndIf
			CloseServer($aServerIP, $aTelnetPort, $aTelnetPass)
		ElseIf $aBeginDelayedShutdown = 2 And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= ($aDelayShutdownTime - 1)) Then
			Local $sShutdownMessage = $aServerName & ". Restarting in 1 minute. Final Warning"
			If ($aBotMsg = $sAnnounceScheduledMessage) Or ($aBotMsg = $aMaintenanceMsg) Or ($aBotMsg = $sAnnounceUpdateMessage) Then
				If $sInGameAnnounce = "yes" Then
					SendInGame($aServerIP, $aTelnetPort, $aTelnetPass, $sInGameMsg)
				EndIf
				If $sUseDiscordBotScheduled = "yes" Then
					SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
				EndIf
				If $sUseTwitchBotScheduled = "yes" Then
					TwitchMsgLog($sShutdownMessage)
				EndIf
			EndIf
			$aBeginDelayedShutdown = 3
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
	Sleep(1000)
WEnd
