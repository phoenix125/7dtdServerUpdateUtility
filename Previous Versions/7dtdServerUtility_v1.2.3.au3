#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\resources\favicon.ico
#AutoIt3Wrapper_Outfile=..\..\build\7dtdServerUtility_x86_v1.0.exe
#AutoIt3Wrapper_Outfile_x64=..\..\build\7dtdServerUtility_x64_v1.0.exe
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's 7dServerUtility v3.3.0-Beta.3 - June 18, 2018
#AutoIt3Wrapper_Res_Description=Utility for 7 Days To Die Servers
#AutoIt3Wrapper_Res_Fileversion=1.2.3
#AutoIt3Wrapper_Res_LegalCopyright=Phoenix125 @ Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;Version:1.2.3 (2018-12-20)

;**** Directives created by AutoIt3Wrapper_GUI ****
;Originally written by Dateranoth for use and modified for 7DTD by Phoenix125.com
;by https://gamercide.com on their server
;Distributed Under GNU GENERAL PUBLIC LICENSE

;RCON notifications will download external application mcrcon if enabled.
;Tiiffi/mcrcon is licensed under the zlib License
;https://github.com/Tiiffi/mcrcon/blob/master/LICENSE
;https://github.com/Tiiffi/mcrcon

#include <Date.au3>
#include <Process.au3>
#include <StringConstants.au3>
#include <String.au3>
#include <IE.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>


; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Global Variables ****
Global $g_sTimeCheck0 = _NowCalc()
Global $g_sTimeCheck1 = _NowCalc()
Global $g_sTimeCheck2 = _NowCalc()
Global $g_sTimeCheck3 = _NowCalc()
Global $g_sTimeCheck4 = _NowCalc()
Global Const $g_c_sUtilityVer = "7dtdServerUtility v1.0"
Global Const $g_c_sServerEXE = "7DaysToDieServer.exe"
Global Const $g_c_sPIDFile = @ScriptDir & "\7dtdServerUtility_lastpid_tmp"
Global Const $g_c_sHwndFile = @ScriptDir & "\7dtdServerUtility_lasthwnd_tmp"
Global Const $g_c_sLogFile = @ScriptDir & "\7dtdServerUtility.log"
;Global Const $g_c_sVersionFile = @ScriptDir & "\7dtdServerUtility-ServerLatestVersion.txt"
Global Const $g_c_sIniFile = @ScriptDir & "\7dtdServerUtility.ini"
Global $g_iBeginDelayedShutdown = 0
Global $aFirstBoot = 1

If FileExists($g_c_sPIDFile) Then
	Global $g_s7dtdPID = FileRead($g_c_sPIDFile)
Else
	Global $g_s7dtdPID = "0"
EndIf
If FileExists($g_c_sHwndFile) Then
	Global $g_h7dtdhWnd = HWnd(FileRead($g_c_sHwndFile))
Else
	Global $g_h7dtdhWnd = "0"
EndIf
#EndRegion ;**** Global Variables ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ; **** Gamercide Shutdown Protocol ****
Func Gamercide()
	If @exitMethod <> 1 Then
		$Shutdown = MsgBox(4100, "Shut Down?", "Do you wish to shutdown Server " & $aServerName & "? (PID: " & $g_s7dtdPID & ")", 60)
		If $Shutdown = 6 Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server Shutdown - Intiated by User when closing " & $g_c_sUtilityVer & " Script")
			CloseServer()
		EndIf
		MsgBox(4096, "Thanks for using our Application", "Please visit http://www.Phoenix125.com and https://gamercide.com", 5)
		FileWriteLine($g_c_sLogFile, _NowCalc() & " " & $g_c_sUtilityVer & " Stopped by User")
	Else
		FileWriteLine($g_c_sLogFile, _NowCalc() & " " & $g_c_sUtilityVer & " Stopped")
	EndIf
	If $UseRemoteRestart = "yes" Then
		TCPShutdown()
	EndIf
	Exit
EndFunc   ;==>Gamercide
#EndRegion ; **** Gamercide Shutdown Protocol ****

; -----------------------------------------------------------------------------------------------------------------------

#Region 	;**** Close Server ****
Func CloseServer()
   Local $sFileExists = FileExists(@ScriptDir & "\puttytel.exe")
	  If $sFileExists = 0 Then
		 InetGet("https://the.earth.li/~sgtatham/putty/latest/w32/puttytel.exe", @ScriptDir & "\puttytel.exe", 0)
		 If Not FileExists(@ScriptDir & "\puttytel.exe") Then
			MsgBox(0x0, "puttytel.exe Not Found", "Could not find puttytel.exe at " & @ScriptDir)
			Exit
		EndIf
	EndIf
   If FileExists(@ScriptDir & "\puttytel.exe") Then
	  Run(@ScriptDir & "\puttytel.exe -P "& $aServerTelnetPort & " "& $g_IP)
	  WinWait($g_IP &" - PuTTYtel","")
	  Local $CrashCheck = WinWait("PuTTYtel Fatal Error","",5)
	  If $CrashCheck = 0 Then
		 ControlSend($g_IP &" - PuTTYtel", "", "", "{enter}")
		 ControlSend($g_IP &" - PuTTYtel", "", "", $aServerTelnetPass & "{enter}")
		 ControlSend($g_IP &" - PuTTYtel", "", "", "{enter}")
		 ControlSend($g_IP &" - PuTTYtel", "", "", "shutdown{enter}")
		 WinWait("PuTTYtel Fatal Error","",10)
		 Local $PID = ProcessExists("puttytel.exe")
		 If $PID Then
			ProcessClose($PID)
		 EndIf
	  Else
		 Local $PID = ProcessExists("puttytel.exe")
		 Local $PID2 = ProcessExists("7DaysToDieServer.exe")
			If $PID Then
			   ProcessClose($PID)
			EndIf
			If $PID2 Then
			   ProcessClose($PID2)
			   ProcessClose($g_s7dtdPID)
			EndIf
	  EndIf
   Else
      Local $PID = ProcessExists("7DaysToDieServer.exe")
	  If $PID Then
		ProcessClose($PID)
	    ProcessClose($g_s7dtdPID)
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server Did not Shut Down Properly. Killing Process")
	  EndIf
   EndIf
EndFunc
#EndRegion 	;**** Close Server ****

; -----------------------------------------------------------------------------------------------------------------------

#Region	;**** Log File Maintenance Scripts ****
Func LogWrite($sString)
	FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] " & $sString)
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
#EndRegion	;**** Log File Maintenance Scripts ****

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Function to Send Message to Discord ****
Func _Discord_ErrFunc($oError)
	FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Error: 0x" & Hex($oError.number) & " While Sending Discord Bot Message.")
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
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Discord Bot] Message Status Code {" & $oStatusCode & "} " & $sResponseText)
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
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] Successfully Connected to Twitch IRC")
		If $aTwitchIRC[1] Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] Username and OAuth Accepted. [" & $aTwitchIRC[2] & "]")
			If $aTwitchIRC[3] Then
				FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] Successfully sent ( " & $sT_Msg & " ) to all Channels")
			Else
				FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] ERROR | Failed sending message ( " & $sT_Msg & " ) to one or more channels")
			EndIf
		Else
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] ERROR | Username and OAuth Denied [" & $aTwitchIRC[2] & "]")
		EndIf
	Else
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Twitch Bot] ERROR | Could not connect to Twitch IRC. Is this URL or port blocked? [irc.chat.twitch.tv:6667]")
	EndIf
EndFunc   ;==>TwitchMsgLog
#EndRegion ;**** Post to Twitch Chat Function ****

#Region ;*** MCRCON Commands
Func MCRCONcmd($l_sPath, $l_sIP, $l_sPort, $l_sPass, $l_sCommand, $l_sMessage = "")
	If $l_sCommand = "broadcast" Then
		RunWait($l_sPath & '\mcrcon.exe -c -s -H ' & $l_sIP & ' -P ' & $l_sPort & ' -p ' & $l_sPass & ' "broadcast ' & $l_sMessage & '"', $l_sPath, @SW_HIDE)
	EndIf
EndFunc   ;==>MCRCONcmd
#EndRegion ;*** MCRCON Commands

; -----------------------------------------------------------------------------------------------------------------------

#Region	;**** Restart Server Scheduling Scrips ****
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

#EndRegion

; -----------------------------------------------------------------------------------------------------------------------

#Region ;**** Functions to Check for Update ****
Func GetLatestVersion($sCmdDir)
Local $aReturn[2] = [False, ""]
	If FileExists($sCmdDir & "\appcache") Then
		DirRemove($sCmdDir & "\appcache", 1)
	EndIf
	RunWait('"' & @ComSpec & '" /c "' & $sCmdDir & '\steamcmd.exe" +login anonymous +app_info_update 1 +app_info_print 294420 +app_info_print 294420 +exit > app_info.tmp', $sCmdDir, @SW_HIDE)
    Local Const $sFilePath = $sCmdDir & "\app_info.tmp"
    Local $hFileOpen = FileOpen($sFilePath, 0)
	If $hFileOpen = -1 Then
		$aReturn[0] = False
	Else
	  If $ServerVer = 1 Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Update Check via 7DTD Experimental Branch")
		Local $sFileRead = FileRead($hFileOpen)
		$aAppInfo2 = StringReplace($sFileRead,"latest_experimental","latestexperimental",2)
		Local $aAppInfo = StringSplit($aAppInfo2, "latest_experimental", 1)
		If UBound($aAppInfo) >= 3 Then
			$aAppInfo = StringSplit($aAppInfo[2], "AppID", 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], "}", 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], '"', 1)
		EndIf
		If UBound($aAppInfo) >= 7 Then
			$aReturn[0] = True
			$aReturn[1] = $aAppInfo[5]
		EndIf
		FileClose($hFileOpen)
		If FileExists($sFilePath) Then
			FileDelete($sFilePath)
		EndIf
	  Else
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Update Check via 7DTD Stable Branch")
		Local $sFileRead = FileRead($hFileOpen)
		Local $aAppInfo = StringSplit($sFileRead, '"branches"', 1)

		If UBound($aAppInfo) >= 3 Then
			$aAppInfo = StringSplit($aAppInfo[2], "AppID", 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], "}", 1)
		EndIf
		If UBound($aAppInfo) >= 2 Then
			$aAppInfo = StringSplit($aAppInfo[1], '"', 1)
		EndIf
		If UBound($aAppInfo) >= 7 Then
			$aReturn[0] = True
			$aReturn[1] = $aAppInfo[6]
		EndIf
		FileClose($hFileOpen)
		If FileExists($sFilePath) Then
			FileDelete($sFilePath)
		EndIf
	 EndIf
	EndIf
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
	If FileExists($steamcmddir & "\app_info.tmp") Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Delaying Update Check for 1 minute. | Found Existing " & $steamcmddir & "\app_info.tmp")
		Sleep(60000)
		If FileExists($steamcmddir & "\app_info.tmp") Then
			FileDelete($steamcmddir & "\app_info.tmp")
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Deleted " & $steamcmddir & "\app_info.tmp")
		EndIf
	EndIf

	FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Update Check Starting.")
	Local $bUpdateRequired = False
	Local $aLatestVersion = GetLatestVersion($steamcmddir)
	Local $aInstalledVersion = GetInstalledVersion($serverdir)
	If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
		If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server is Up to Date. Version: " & $aInstalledVersion[1])
		Else
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server is Out of Date! Installed Version: " & $aInstalledVersion[1] & " Latest Version: " & $aLatestVersion[1])
			Global $aBotMsg = " Yay. New Server Update. "
			$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
			Local $sManifestExists = FileExists($steamcmddir & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				  FileMove ($steamcmddir & "\steamapps\appmanifest_294420.acf", $steamcmddir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				  If $g_bDebug Then
						FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: """ & $serverdir & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				  EndIf
			EndIf
			Local $sManifestExists = FileExists($serverdir & "\steamapps\appmanifest_294420.acf")
			If $sManifestExists = 1 Then
				  FileMove ($serverdir & "\steamapps\appmanifest_294420.acf", $serverdir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
				  If $g_bDebug Then
						FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: """ & $serverdir & "\steamapps\appmanifest_294420.acf"" renamed to ""appmanifest_294420_" & $TimeStamp & ".acf""")
				  EndIf
			EndIf
			$bUpdateRequired = True
		EndIf
	ElseIf Not $aLatestVersion[0] And Not $aInstalledVersion[0] Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Something went wrong retrieving Latest Version")
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Something went wrong retrieving Installed Version")
	ElseIf Not $aInstalledVersion[0] Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Something went wrong retrieving Installed Version")
	ElseIf Not $aLatestVersion[0] Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Something went wrong retrieving Latest Version")
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

	;Local $oOriginFile = $oOriginFolder.Items.Item($sFile)
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
;                  $sHideCodes - Obfuscate codes or not, ((yes/no)) string
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
#EndRegion ;**** Function to Check Request from Browswer and return restart string if request is valid****

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
Func _RemoteRestart($vMSocket, $sCodes, $sKey = "restart", $sHideCodes = "no", $sServIP = "0.0.0.0", $sName = "Server", $bDebug = False)
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






#Region	;**** Backup Server Files Before Update **** (WORK IN PROGRESS)
;Func BackupSaves()
;   If $WipeServer = "yes" Then
;	Local Const $sWipePath = $serverdir & "\" & $ConfigFile
;    Local $hWipeOpen = FileOpen($sWipePath, 0)
;	FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Backing up old game save folder and " & $ConfigFile & " . . .")



;	  DirMove(
;   Else
;   EndIf
;EndFunc
#EndRegion






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
	Global $ServerVer = IniRead($sIniFile, "Version: 0-Stable/1-Latest Experimental", "ServerVer", $iniCheck)
	Global $ConfigFile = IniRead($sIniFile, "Server Config File (Do NOT use default ServerConfig.xml.. it WILL get overwritten during validation)", "ConfigFile", $iniCheck)
	Global $WipeServer = IniRead($sIniFile, "Backup Old Game Save & Serverconfig and Wipe Server With Update? ((yes/no))", "WipeServer", $iniCheck)
	Global $g_IP = IniRead($sIniFile, "Game Server IP", "ListenIP", $iniCheck)
	Global $UseSteamCMD = IniRead($sIniFile, "Use SteamCMD To Update Server? (yes/no)", "UseSteamCMD", $iniCheck)
	Global $validategame = IniRead($sIniFile, "Validate Files Every Time SteamCMD Runs? (yes/no)", "validategame", $iniCheck)
	Global $UseRemoteRestart = IniRead($sIniFile, "Use Remote Restart? (yes/no)", "UseRemoteRestart", $iniCheck)
	Global $g_Port = IniRead($sIniFile, "Remote Restart Port", "ListenPort", $iniCheck)
	Global $g_sRKey = IniRead($sIniFile, "Remote Restart Request Key http://IP:Port?KEY=user_pass", "RestartKey", $iniCheck)
	Global $RestartCode = IniRead($sIniFile, "Remote Restart Password", "RestartCode", $iniCheck)
	Global $sObfuscatePass = IniRead($sIniFile, "Hide Passwords in Log? (yes/no)", "ObfuscatePass", $iniCheck)
	Global $CheckForUpdate = IniRead($sIniFile, "Check for Update Every X Minutes? (yes/no)", "CheckForUpdate", $iniCheck)
	Global $UpdateInterval = IniRead($sIniFile, "Update Check Interval in Minutes 05-59", "UpdateInterval", $iniCheck)
	Global $g_sRestartDaily = IniRead($sIniFile, "Restart Server Daily? (yes/no)", "RestartDaily", $iniCheck)
	Global $g_sRestartDays = IniRead($sIniFile, "Daily Restart Hours Comma Seperated 0=Everyday Sunday=1 Saturday=7 0-7. ex: 2,4,6", "RestartDays", $iniCheck)
	Global $g_sRestartHours = IniRead($sIniFile, "Daily Restart Hours Comma Seperated 00-23", "RestartHours", $iniCheck)
	Global $g_sRestartMin = IniRead($sIniFile, "Daily Restart Minute 00-59", "RestartMinute", $iniCheck)
	Global $ExMem = IniRead($sIniFile, "Excessive Memory Amount?", "ExMem", $iniCheck)
	Global $ExMemRestart = IniRead($sIniFile, "Restart On Excessive Memory Use? (yes/no)", "ExMemRestart", $iniCheck)
	Global $SteamFix = IniRead($sIniFile, "Running Server with Steam Open? ((yes/no))", "SteamFix", $iniCheck)
	Global $logRotate = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logRotate", $iniCheck)
	Global $logQuantity = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logQuantity", $iniCheck)
	Global $logHoursBetweenRotate = IniRead($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logHoursBetweenRotate", $iniCheck)
	Global $sAnnounceScheduled = IniRead($sIniFile, "Use Enabled Discord/MCRCON/Twitch Bot to Announce Server SCHEDULED Restarts? (yes/no)", "AnnounceScheduled", $iniCheck)
	Global $sAnnounceUpdate = IniRead($sIniFile, "Use Enabled Discord/MCRCON/Twitch Bot to Announce Server UPDATE Restarts? (yes/no)", "AnnounceUpdate", $iniCheck)
	Global $sUseDiscordBot = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "UseDiscordBot", $iniCheck)
	Global $sDiscordWebHookURLs = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordWebHookURL", $iniCheck)
	Global $sDiscordBotName = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotName", $iniCheck)
	Global $bDiscordBotUseTTS = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotUseTTS", $iniCheck)
	Global $sDiscordBotAvatar = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotAvatarLink", $iniCheck)
	Global $iDiscordBotNotifyTime = IniRead($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotTimeBeforeRestart", $iniCheck)
	Global $g_sUseMCRCON = IniRead($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "use_mcrcon", $iniCheck)
	Global $g_sMCrconPath = IniRead($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "mcrconPath", $iniCheck)
	Global $g_iMCrconNotifyTime = IniRead($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "mcrconTimeBeforeRestart", $iniCheck)
	Global $sUseTwitchBot = IniRead($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "UseTwitchBot", $iniCheck)
	Global $sTwitchNick = IniRead($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchNick", $iniCheck)
	Global $sChatOAuth = IniRead($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "ChatOAuth", $iniCheck)
	Global $sTwitchChannels = IniRead($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchChannels", $iniCheck)
	Global $iTwitchBotNotifyTime = IniRead($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchBotTimeBeforeRestart", $iniCheck)
	Global $g_sExecuteExternalScript = IniRead($sIniFile, "Execute External Script Before Server Start? (yes/no)", "ExecuteExternalScript", $iniCheck)
	Global $g_sExternalScriptDir = IniRead($sIniFile, "External Script Directory", "ExternalScriptDir", $iniCheck)
	Global $g_sExternalScriptName = IniRead($sIniFile, "External Script Filename", "ExternalScriptName", $iniCheck)
	Global $g_sEnableDebug = IniRead($sIniFile, "Enable Debug to Output More Log Detail? (yes/no)", "EnableDebug", $iniCheck)

	If $iniCheck = $serverdir Then
		$serverdir = "D:\Game Servers\SteamCMD\steamapps\common\7 Days to Die Dedicated Server"
		$iIniFail += 1
	EndIf
	If $iniCheck = $steamcmddir Then
		$steamcmddir = "D:\Game Servers\SteamCMD"
		$iIniFail += 1
	EndIf
	If $iniCheck = $ServerVer Then
		$ServerVer = "0"
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
	If $iniCheck = $g_IP Then
		$g_IP = "127.0.0.1"
		$iIniFail += 1
	EndIf
	If $iniCheck = $UseSteamCMD Then
		$UseSteamCMD = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $validategame Then
		$validategame = "yes"
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
		$RestartCode = "-AllowedCharacters=1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@$%^&*()+=-{}[]\|:;./?"
		$iIniFail += 1
	EndIf
	If $iniCheck = $sObfuscatePass Then
		$sObfuscatePass = "yes"
		$iIniFail += 1
	EndIf
	If $iniCheck = $CheckForUpdate Then
		$CheckForUpdate = "yes"
		$iIniFail += 1
	ElseIf $CheckForUpdate = "yes" And $UseSteamCMD <> "yes" Then
		$CheckForUpdate = "no"
		FileWriteLine($sLogFile, _NowCalc() & " SteamCMD disabled. Disabling CheckForUpdate. Update will not work without SteamCMD to update it!")
	EndIf
;	If $iniCheck = $UpdateInterval Then
;		$UpdateInterval = "15"
;		$iIniFail += 1
;	ElseIf $UpdateInterval < 5 Then
;		$UpdateInterval = 5
;	EndIf
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
	If $iniCheck = $SteamFix Then
		$SteamFix = "no"
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
	If $iniCheck = $g_sUseMCRCON Then
		$g_sUseMCRCON = "no"
		$iIniFail += 1
	ElseIf $g_sUseMCRCON = "yes" And $g_sRconEnabled <> "yes" Then
		$g_sUseMCRCON = "no"
		FileWriteLine($sLogFile, _NowCalc() & " Server RCON is Disabled. Disabling MCRCON Notifications. Cannot send RCON message without RCON enabled!")
	EndIf
	If $iniCheck = $g_sMCrconPath Then
		$g_sMCrconPath = "D:\Game Servers\mcrcon"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_iMCrconNotifyTime Then
		$g_iMCrconNotifyTime = "5"
		$iIniFail += 1
	EndIf
    If $iniCheck = $sAnnounceScheduled Then
		$sAnnounceScheduled = "yes"
		$iIniFail += 1
	EndIf
    If $iniCheck = $sAnnounceUpdate Then
		$sAnnounceUpdate = "yes"
		$iIniFail += 1
	EndIf
    If $iniCheck = $sUseDiscordBot Then
		$sUseDiscordBot = "no"
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
	If $iniCheck = $iDiscordBotNotifyTime Then
		$iDiscordBotNotifyTime = "5"
		$iIniFail += 1
	ElseIf $iDiscordBotNotifyTime < 1 Then
		$iDiscordBotNotifyTime = 1
	EndIf
	If $iniCheck = $sUseTwitchBot Then
		$sUseTwitchBot = "no"
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
	If $iniCheck = $iTwitchBotNotifyTime Then
		$iTwitchBotNotifyTime = "5"
		$iIniFail += 1
	ElseIf $iTwitchBotNotifyTime < 1 Then
		$iTwitchBotNotifyTime = 1
	EndIf
	If $iniCheck = $g_sExecuteExternalScript Then
		$g_sExecuteExternalScript = "no"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptDir Then
		$g_sExternalScriptDir = "D:\Game Servers\SQL_Scripts"
		$iIniFail += 1
	EndIf
	If $iniCheck = $g_sExternalScriptName Then
		$g_sExternalScriptName = "CleanDB.bat"
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


	Global $g_iDelayShutdownTime = 0
	If ($sUseDiscordBot = "yes") Or ($sUseTwitchBot = "yes") Or ($g_sUseMCRCON = "yes") Then
		If ($sUseDiscordBot = "yes") And ($iDiscordBotNotifyTime > $g_iDelayShutdownTime) Then
			$g_iDelayShutdownTime = $iDiscordBotNotifyTime
		EndIf
		If ($sUseTwitchBot = "yes") And ($iTwitchBotNotifyTime > $g_iDelayShutdownTime) Then
			$g_iDelayShutdownTime = $iTwitchBotNotifyTime
		EndIf
		If ($g_sUseMCRCON = "yes") And ($g_iMCrconNotifyTime > $g_iDelayShutdownTime) Then
			$g_iDelayShutdownTime = $g_iMCrconNotifyTime
		EndIf
	Else
		$g_iDelayShutdownTime = $g_iMCrconNotifyTime
	EndIf

	If $g_sEnableDebug = "yes" Then
		Global $g_bDebug = True ; This enables Debugging. Outputs more information to log file.
	Else
		Global $g_bDebug = False
	EndIf
FileWriteLine($g_c_sLogFile, _NowCalc() & " Importing settings from 7dtdServerUtil.ini.")
	If $g_bDebug Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Folder = " & $serverdir)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . SteamCMD Folder = " & $steamcmddir)
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
		MsgBox(4096, "INI MISMATCH", "Found " & $iIniFail & " Missing Variables" & @CRLF & @CRLF & "Backup created and all existing settings transfered to new INI." & @CRLF & @CRLF & "Modify INI and restart.")
		Exit
	Else
		UpdateIni($sIniFile)
		MsgBox(4096, "Default INI File Created", "Please Modify Default Values and Restart Program." & @CRLF & @CRLF & "IF NEW DEDICATED SERVER INSTALL:" & @CRLF & " - Once the server is running," & @CRLF & "Rt-Click on 7dtdServerUtility icon and shutdown server." & @CRLF & " - Then modify default values in serverconfig.xml" & @CRLF & "and restart 7dtdServerUtility.exe")
		FileWriteLine($g_c_sLogFile, _NowCalc() & "  Default INI File Created . . Please Modify Default Values and Restart Program.")
		Exit
	EndIf
EndFunc   ;==>iniFileCheck

Func UpdateIni($sIniFile)
	IniWrite($sIniFile, "Server Directory. NO TRAILING SLASH", "serverdir", $serverdir)
	IniWrite($sIniFile, "SteamCMD Directory. NO TRAILING SLASH", "steamcmddir", $steamcmddir)
	IniWrite($sIniFile, "Version: 0-Stable/1-Latest Experimental", "ServerVer", $ServerVer)
	IniWrite($sIniFile, "Server Config File (Do NOT use default ServerConfig.xml.. it WILL get overwritten during validation)", "ConfigFile", $ConfigFile)
	IniWrite($sIniFile, "Backup Old Game Save & Serverconfig and Wipe Server With Update? ((yes/no))", "WipeServer", $WipeServer)
	IniWrite($sIniFile, "Game Server IP", "ListenIP", $g_IP)
	IniWrite($sIniFile, "Use SteamCMD To Update Server? (yes/no)", "UseSteamCMD", $UseSteamCMD)
	IniWrite($sIniFile, "Validate Files Every Time SteamCMD Runs? (yes/no)", "validategame", $validategame)
	IniWrite($sIniFile, "Use Remote Restart? (yes/no)", "UseRemoteRestart", $UseRemoteRestart)
	IniWrite($sIniFile, "Remote Restart Port", "ListenPort", $g_Port)
	IniWrite($sIniFile, "Remote Restart Request Key http://IP:Port?KEY=user_pass", "RestartKey", $g_sRKey)
	IniWrite($sIniFile, "Remote Restart Password", "RestartCode", $RestartCode)
	IniWrite($sIniFile, "Hide Passwords in Log? (yes/no)", "ObfuscatePass", $sObfuscatePass)
	IniWrite($sIniFile, "Check for Update Every X Minutes? (yes/no)", "CheckForUpdate", $CheckForUpdate)
	IniWrite($sIniFile, "Update Check Interval in Minutes 05-59", "UpdateInterval", $UpdateInterval)
	IniWrite($sIniFile, "Restart Server Daily? (yes/no)", "RestartDaily", $g_sRestartDaily)
	IniWrite($sIniFile, "Daily Restart Hours Comma Seperated 0=Everyday Sunday=1 Saturday=7 0-7. ex: 2,4,6", "RestartDays", $g_sRestartDays)
	IniWrite($sIniFile, "Daily Restart Hours Comma Seperated 00-23", "RestartHours", $g_sRestartHours)
	IniWrite($sIniFile, "Daily Restart Minute 00-59", "RestartMinute", $g_sRestartMin)
	IniWrite($sIniFile, "Excessive Memory Amount?", "ExMem", $ExMem)
	IniWrite($sIniFile, "Restart On Excessive Memory Use? (yes/no)", "ExMemRestart", $ExMemRestart)
	IniWrite($sIniFile, "Running Server with Steam Open? ((yes/no))", "SteamFix", $SteamFix)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logRotate", $logRotate)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logQuantity", $logQuantity)
	IniWrite($sIniFile, "Rotate X Number of Logs every X Hours? (yes/no)", "logHoursBetweenRotate", $logHoursBetweenRotate)
	IniWrite($sIniFile, "Use Enabled Discord/MCRCON/Twitch Bot to Announce Server SCHEDULED Restarts? (yes/no)", "AnnounceScheduled", $sAnnounceScheduled)
	IniWrite($sIniFile, "Use Enabled Discord/MCRCON/Twitch Bot to Announce Server UPDATE Restarts? (yes/no)", "AnnounceUpdate", $sAnnounceUpdate)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "UseDiscordBot", $sUseDiscordBot)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordWebHookURL", $sDiscordWebHookURLs)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotName", $sDiscordBotName)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotUseTTS", $bDiscordBotUseTTS)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotAvatarLink", $sDiscordBotAvatar)
	IniWrite($sIniFile, "Use Discord Bot to Announce Restart? (yes/no)", "DiscordBotTimeBeforeRestart", $iDiscordBotNotifyTime)
	IniWrite($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "use_mcrcon", $g_sUseMCRCON)
	IniWrite($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "mcrconPath", $g_sMCrconPath)
	IniWrite($sIniFile, "Use MCRCON to Announce Restart? (yes/no)", "mcrconTimeBeforeRestart", $g_iMCrconNotifyTime)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "UseTwitchBot", $sUseTwitchBot)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchNick", $sTwitchNick)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "ChatOAuth", $sChatOAuth)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchChannels", $sTwitchChannels)
	IniWrite($sIniFile, "Use Twitch Bot to Announce Restart? (yes/no)", "TwitchBotTimeBeforeRestart", $iTwitchBotNotifyTime)
	IniWrite($sIniFile, "Execute External Script Before Server Start? (yes/no)", "ExecuteExternalScript", $g_sExecuteExternalScript)
	IniWrite($sIniFile, "External Script Directory", "ExternalScriptDir", $g_sExternalScriptDir)
	IniWrite($sIniFile, "External Script Filename", "ExternalScriptName", $g_sExternalScriptName)
	IniWrite($sIniFile, "Enable Debug to Output More Log Detail? (yes/no)", "EnableDebug", $g_sEnableDebug)
EndFunc   ;==>UpdateIni
#EndRegion ;**** INI Settings - User Variables ****

#Region ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****
OnAutoItExitRegister("Gamercide")
FileWriteLine($g_c_sLogFile, _NowCalc() & " " & $g_c_sUtilityVer & " Started . . .")
ReadUini($g_c_sIniFile, $g_c_sLogFile)

;**** Retrieve Data From serverconfig.xml File ****
   Local Const $sConfigPath = $serverdir & "\" & $ConfigFile
   Local $sFileExists = FileExists($sConfigPath)
	If $sFileExists = 0 Then
		FileWriteLine($g_c_sLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath)
		 $aContinue = MsgBox($MB_YESNO, $ConfigFile & " Not Found", "Could not find " & $sConfigPath & ". Do you wish to continue with installation?", 60)
		If $aContinue = 7 Then
		   FileWriteLine($g_c_sLogFile, _NowCalc() & "!!! ERROR !!! Could not find " & $sConfigPath & ". Program terminated by user.")
		   Exit
	    Else
		EndIf
    EndIf
   $kServerPort = "|ServerPort|value=|"
   $kServerName = "|ServerName|value=|"
   $kServerTelnetPort = "|TelnetPort|value=|"
   $kServerTelnetPass = "|TelnetPassword|value=|"
   $kServerSaveGame = "|SaveGameFolder|value=|"
   Local $sConfigPathOpen = FileOpen($sConfigPath, 0)
   Local $sConfigRead4= FileRead($sConfigPathOpen)
   Local $sConfigRead3= StringRegExpReplace($sConfigRead4, """", "|")
   Local $sConfigRead2= StringRegExpReplace($sConfigRead3, "\t", "")
   Local $sConfigRead1= StringRegExpReplace($sConfigRead2, "  ", "")
   Local $sConfigRead= StringRegExpReplace($sConfigRead1, " value=", "value=")
   $xServerPort = _StringBetween($sConfigRead, $kServerPort, "|")
   $aServerPort = _ArrayToString($xServerPort)
   $xServerName = _StringBetween($sConfigRead, $kServername, "|")
   $aServerName = _ArrayToString($xServerName)
   $xServerTelnetPort = _StringBetween($sConfigRead, $kServerTelnetPort, "|")
   $aServerTelnetPort = _ArrayToString($xServerTelnetPort)
   $xServerTelnetPass = _StringBetween($sConfigRead, $kServerTelnetPass, "|")
   $aServerTelnetPass = _ArrayToString($xServerTelnetPass)
   $xServerSaveGame = _StringBetween($sConfigRead, $kServerSaveGame, "|")
   $aServerSaveGame = _ArrayToString($xServerSaveGame)
   If $aServerSaveGame = "absolute path" Then
	  $aServerSaveGame = _PathFull("7DaysToDieFolder", @AppDataDir)
   EndIf
   FileWriteLine($g_c_sLogFile, _NowCalc() & " Retrieving data from " & $ConfigFile & ".")
		If $g_bDebug Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Port = " & $aServerPort)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Name = " & $aServerName)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Telnet Port = " & $aServerTelnetPort)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Telnet Password = " & $aServerTelnetPass)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " . . . Server Save Game Folder = " & $aServerSaveGame)
		Else
		EndIf
FileClose($sConfigRead)
;END **** Retrieve Data From serverconfig.xml File ****

If $UseSteamCMD = "yes" Then
	Local $sFileExists = FileExists($steamcmddir & "\steamcmd.exe")
	If $sFileExists = 0 Then
		InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
		DirCreate($steamcmddir) ; to extract to
		_ExtractZip(@ScriptDir & "\steamcmd.zip", "", "steamcmd.exe", $steamcmddir)
		FileDelete(@ScriptDir & "\steamcmd.zip")
		FileWriteLine($g_c_sLogFile, _NowCalc() & " Running SteamCMD. [steamcmd.exe +quit]")
		RunWait("" & $steamcmddir & "\steamcmd.exe +quit")
		If Not FileExists($steamcmddir & "\steamcmd.exe") Then
			MsgBox(0x0, "SteamCMD Not Found", "Could not find steamcmd.exe at " & $steamcmddir)
			Exit
		EndIf
	EndIf

;	$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
;	Local $sManifestExists = FileExists($steamcmddir & "\steamapps\appmanifest_294420.acf")
;	If $sManifestExists = 1 Then
;		 FileMove ($steamcmddir & "\steamapps\appmanifest_294420.acf", $steamcmddir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
;		 If $g_bDebug Then
;			   FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: Install manifest found at " & $steamcmddir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
;		 EndIf
;    EndIf
;	Local $sManifestExists = FileExists($serverdir & "\steamapps\appmanifest_294420.acf")
;	If $sManifestExists = 1 Then
;		 FileMove ($serverdir & "\steamapps\appmanifest_294420.acf", $serverdir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
;		 If $g_bDebug Then
;			   FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: Install manifest found at " & $serverdir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
;		 EndIf
;	EndIf



Else
	Local $cFileExists = FileExists($serverdir & "\" & $g_c_sServerEXE)
	If $cFileExists = 0 Then
		MsgBox(0x0, "7 Days To Die Server Not Found", "Could not find " & $g_c_sServerEXE & " at " & $serverdir)
		Exit
	EndIf
EndIf

#Region ;**** Check for Update At Startup ****
If ($CheckForUpdate = "yes") Then
	FileWriteLine($g_c_sLogFile, _NowCalc() & "  Running initial update check . . ")
    Local $bRestart = UpdateCheck()
	If $bRestart Then
		$g_iBeginDelayedShutdown = 1
	EndIf
EndIf
#EndRegion ;**** Check for Update At Startup ****


If $g_sUseMCRCON = "yes" Then
	Local $sFileExists = FileExists($g_sMCrconPath & "\mcrcon.exe")
	If $sFileExists = 0 Then
		InetGet("https://github.com/Tiiffi/mcrcon/releases/download/v0.0.5/mcrcon-0.0.5-windows.zip", @ScriptDir & "\mcrcon.zip", 0)
		DirCreate($g_sMCrconPath) ; to extract to
		_ExtractZip(@ScriptDir & "\mcrcon.zip", "", "mcrcon.exe", $g_sMCrconPath)
		FileDelete(@ScriptDir & "\mcrcon.zip")
		If Not FileExists($g_sMCrconPath & "\mcrcon.exe") Then
			MsgBox(0x0, "MCRCON Not Found", "Could not find mcrcon.exe at " & $g_sMCrconPath)
			Exit
		EndIf
	EndIf
EndIf

If $g_sExecuteExternalScript = "yes" Then
	Local $sFileExists = FileExists($g_sExternalScriptDir & "\" & $g_sExternalScriptName)
	If $sFileExists = 0 Then
		Local $ExtScriptNotFound = MsgBox(4100, "External Script Not Found", "Could not find " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName & @CRLF & "Would you like to Exit Now to fix?", 20)
		If $ExtScriptNotFound = 6 Then
			Exit
		Else
			$g_sExecuteExternalScript = "no"
			FileWriteLine($g_c_sLogFile, _NowCalc() & " External Script Execution Disabled - Could not find " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName)
		EndIf
	EndIf
EndIf

If $UseRemoteRestart = "yes" Then
	; Start The TCP Services
	TCPStartup()
	Local $MainSocket = TCPListen($g_IP, $g_Port, 100)
	If $MainSocket = -1 Then
		MsgBox(0x0, "TCP Error", "Could not bind to [" & $g_IP & "] Check server IP or disable Remote Restart in INI")
		FileWriteLine($g_c_sLogFile, _NowCalc() & " Remote Restart Enabled. Could not bind to " & $g_IP & ":" & $g_Port)
		Exit
	Else
		FileWriteLine($g_c_sLogFile, _NowCalc() & " Remote Restart Enabled. Listening for Restart Request at " & $g_IP & ":" & $g_Port)
	EndIf
EndIf
#EndRegion ;**** Startup Checks. Initial Log, Read INI, Check for Correct Paths, Check Remote Restart is bound to port. ****

; -----------------------------------------------------------------------------------------------------------------------

While True ;**** Loop Until Closed ****
	#Region ;**** Listen for Remote Restart Request ****
	If $UseRemoteRestart = "yes" Then
		Local $sRestart = _RemoteRestart($MainSocket, $RestartCode, $g_sRKey, $g_IP, $aServerName, $g_bDebug)
		Switch @error
			Case 0

				If ProcessExists($g_s7dtdPID) And ($g_iBeginDelayedShutdown = 0) Then
					Local $MEM = ProcessGetStats($g_s7dtdPID, 0)
					FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
					If ($sUseDiscordBot = "yes") Or ($sUseTwitchBot = "yes") Or ($g_sUseMCRCON = "yes") Then
						$g_iBeginDelayedShutdown = 1
						$g_sTimeCheck0 = _NowCalc
					Else
						CloseServer()
					EndIf
				EndIf
			Case 1 To 4
				FileWriteLine($g_c_sLogFile, _NowCalc() & " " & $sRestart & @CRLF)
		EndSwitch
	EndIf
	#EndRegion ;**** Listen for Remote Restart Request ****

	#Region ;**** Keep Server Alive Check. ****
	If Not ProcessExists($g_s7dtdPID) Then
		$g_iBeginDelayedShutdown = 0
		If $g_sExecuteExternalScript = "yes" Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " Executing External Script " & $g_sExternalScriptDir & "\" & $g_sExternalScriptName)
			RunWait($g_sExternalScriptDir & '\' & $g_sExternalScriptName, $g_sExternalScriptDir)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " External Script Finished. Continuing Server Start.")
		EndIf
		If $UseSteamCMD = "yes" Then
	    If $ServerVer = 1 Then
			   Local $ServExp = " +app_update 294420 -beta latest_experimental"
		Else
			   Local $servExp = " +app_update 294420"
	    EndIf

	    $TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
	    Local $sManifestExists = FileExists($steamcmddir & "\steamapps\appmanifest_294420.acf")
	    If $sManifestExists = 1  And $aFirstBoot = 0 Then
			FileMove ($steamcmddir & "\steamapps\appmanifest_294420.acf", $steamcmddir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
			If $g_bDebug Then
			   FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: Install manifest found at " & $steamcmddir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
			EndIf
		Else
			   $aFirstBoot = 0
	    EndIf
	    If $sManifestExists = 1  And $aFirstBoot = 0 Then
			FileMove ($serverdir & "\steamapps\appmanifest_294420.acf", $serverdir & "\steamapps\appmanifest_294420_" & $TimeStamp & ".acf", 1)
			If $g_bDebug Then
			   FileWriteLine($g_c_sLogFile, _NowCalc() & " Notice: Install manifest found at " & $serverdir & "\steamapps\appmanifest_294420.acf & renamed to appmanifest_294420_" & $TimeStamp & ".acf")
			EndIf
		Else
			   $aFirstBoot = 0
	    EndIf

			If $validategame = "yes" Then
				FileWriteLine($g_c_sLogFile, _NowCalc() & " Running SteamCMD with validate: [""" & $steamcmddir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $serverdir & """" & $ServExp & " validate +quit")
				RunWait("""" & $steamcmddir & "\steamcmd.exe"" +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir """ & $serverdir & """" & $ServExp & " validate +quit")
			Else
				FileWriteLine($g_c_sLogFile, _NowCalc() & " Running SteamCMD without validate. [" & $steamcmddir & "\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 login anonymous +force_install_dir """ & $serverdir & "" & $ServExp & " +quit")
				RunWait("" & $steamcmddir & "\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 login anonymous +force_install_dir """ & $serverdir & "" & $ServExp & " +quit")
			EndIf
		EndIf
		$LogTimeStamp = " -logfile 7DaysToDieServer_Data\output_log_dedi" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt"
		FileWriteLine($g_c_sLogFile, _NowCalc() & " 7DTD Dedicated Server Started [" & $serverdir & "\" & $g_c_sServerEXE & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $ConfigFile & " -dedicated ]")
		$g_s7dtdPID = Run("" & $serverdir & "\" & $g_c_sServerEXE & $LogTimeStamp & " -quit -batchmode -nographics -configfile=" & $ConfigFile & " -dedicated" , $serverdir)
		If @error Or Not $g_s7dtdPID Then
			If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
			$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
			Select
				Case $iMsgBoxAnswer = 4 ;Retry
					FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
				Case $iMsgBoxAnswer = 2 ;Cancel
					FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server Failed to Start - " & $g_c_sUtilityVer & " Shutdown - Intiated by User")
					Exit
				Case $iMsgBoxAnswer = -1 ;Timeout
					FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Server Failed to Start. Script Initiated Restart Attempt after 60 seconds of no User Input.")
			EndSelect
		EndIf

		If $SteamFix = "yes" Then
			For $i = 3 To 1 Step -1
				CloseEPointError($i * 5)
			Next
		EndIf

		$g_h7dtdhWnd = WinGetHandle(WinWait("" & $g_c_sServerEXE & "", "", 70))
		If FileExists($g_c_sPIDFile) Then
			FileDelete($g_c_sPIDFile)
		EndIf
		If FileExists($g_c_sHwndFile) Then
			FileDelete($g_c_sHwndFile)
		EndIf
		FileWrite($g_c_sPIDFile, $g_s7dtdPID)
		FileWrite($g_c_sHwndFile, String($g_h7dtdhWnd))
		FileSetAttrib($g_c_sPIDFile, "+HT")
		FileSetAttrib($g_c_sHwndFile, "+HT")
		FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Window Handle Found: " & $g_h7dtdhWnd)
	ElseIf ((_DateDiff('n', $g_sTimeCheck1, _NowCalc())) >= 5) Then
		Local $MEM = ProcessGetStats($g_s7dtdPID, 0)
		If $MEM[0] > $ExMem And $ExMemRestart = "no" And $g_bDebug Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1])
		ElseIf $MEM[0] > $ExMem And $ExMemRestart = "yes" Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " Excessive Memory Use - Restart Requested by " & $g_c_sUtilityVer & " Script")
			CloseServer()
		EndIf
		$g_sTimeCheck1 = _NowCalc()
	EndIf
	#EndRegion ;**** Keep Server Alive Check. ****

	#Region ;**** Restart Server Every X Days and X Hours & Min****
	If (($g_sRestartDaily = "yes") And ((_DateDiff('n', $g_sTimeCheck2, _NowCalc())) >= 1) And (DailyRestartCheck($g_sRestartDays, $g_sRestartHours, $g_sRestartMin))  And ($g_iBeginDelayedShutdown = 0) ) Then
		If ProcessExists($g_s7dtdPID) Then
			Local $MEM = ProcessGetStats($g_s7dtdPID, 0)
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Work Memory:" & $MEM[0] & " Peak Memory:" & $MEM[1] & " - Daily Restart Requested by " & $g_c_sUtilityVer & " Script")
			If ($sUseDiscordBot = "yes") Or ($sUseTwitchBot = "yes") Or ($g_sUseMCRCON = "yes") Then
			    Global $aBotMsg = " Scheduled "
			    $g_iBeginDelayedShutdown = 1
				$g_sTimeCheck0 = _NowCalc
			Else
				CloseServer()
			EndIf
		EndIf
		$g_sTimeCheck2 = _NowCalc()
	EndIf
	#EndRegion ;**** Restart Server Every X Hours ****

	#Region ;**** Check for Update every X Minutes ****
	If ($CheckForUpdate = "yes") And ((_DateDiff('n', $g_sTimeCheck0, _NowCalc())) >= $UpdateInterval) And ($g_iBeginDelayedShutdown = 0) Then
		Local $bRestart = UpdateCheck()
		If $bRestart And (($sUseDiscordBot = "yes") Or ($sUseTwitchBot = "yes") Or ($g_sUseMCRCON = "yes")) Then
			$g_iBeginDelayedShutdown = 1
		ElseIf $bRestart Then
			CloseServer()
		EndIf
		$g_sTimeCheck0 = _NowCalc()
	EndIf
	#EndRegion ;**** Check for Update every X Minutes ****

	#Region ;**** Announce to Twitch or Discord or Both ****
     If ($sUseDiscordBot = "yes") Or ($sUseTwitchBot = "yes") Or ($g_sUseMCRCON = "yes") Then
		If $g_iBeginDelayedShutdown = 1 Then
			FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] Bot in Use. Delaying Shutdown for " & $g_iDelayShutdownTime & " minutes. Notifying Channel")
			Local $sShutdownMessage = $aServerName & $aBotMsg & "Restarting in " & $g_iDelayShutdownTime & " minutes"

			If $sAnnounceScheduled = "yes" And $aBotMsg = " Scheduled " Then
			   If $g_sUseMCRCON = "yes" Then
					 MCRCONcmd($g_sMCrconPath, $g_IP, $g_iRconPort, $g_sRconPass, "broadcast", $sShutdownMessage)
					 FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [RCON] Sent ( " & $sShutdownMessage & " ) to Players")
			   EndIf
			   If $sUseDiscordBot = "yes" Then
					 SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			   EndIf
			   If $sUseTwitchBot = "yes" Then
					 TwitchMsgLog($sShutdownMessage)
			   EndIf
			EndIf

			If $sAnnounceUpdate = "yes" And $aBotMsg = " Yay. New Server Update. " Then
			   If $g_sUseMCRCON = "yes" Then
					 MCRCONcmd($g_sMCrconPath, $g_IP, $g_iRconPort, $g_sRconPass, "broadcast", $sShutdownMessage)
					 FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [RCON] Sent ( " & $sShutdownMessage & " ) to Players")
			   EndIf
			   If $sUseDiscordBot = "yes" Then
					 SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			   EndIf
			   If $sUseTwitchBot = "yes" Then
					 TwitchMsgLog($sShutdownMessage)
			   EndIf
			EndIf

			$g_iBeginDelayedShutdown = 2
			$g_sTimeCheck0 = _NowCalc()
		ElseIf ($g_iBeginDelayedShutdown >= 2 And ((_DateDiff('n', $g_sTimeCheck0, _NowCalc())) >= $g_iDelayShutdownTime)) Then
			$g_iBeginDelayedShutdown = 0
			$g_sTimeCheck0 = _NowCalc()
			CloseServer()
		ElseIf $g_iBeginDelayedShutdown = 2 And ((_DateDiff('n', $g_sTimeCheck0, _NowCalc())) >= ($g_iDelayShutdownTime - 1)) Then
			Local $sShutdownMessage = $aServerName & " Restarting in 1 minute. Final Warning"

			If $sAnnounceScheduled = "yes" And $aBotMsg = " Scheduled " Then
			   If $g_sUseMCRCON = "yes" Then
					 MCRCONcmd($g_sMCrconPath, $g_IP, $g_iRconPort, $g_sRconPass, "broadcast", $sShutdownMessage)
					 FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [RCON] Sent ( " & $sShutdownMessage & " ) to Players")
			   EndIf
			   If $sUseDiscordBot = "yes" Then
					 SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			   EndIf
			   If $sUseTwitchBot = "yes" Then
					 TwitchMsgLog($sShutdownMessage)
			   EndIf
			EndIf
			If $sAnnounceUpdate = "yes" And $aBotMsg = " Yay. New Server Update. " Then
			   If $g_sUseMCRCON = "yes" Then
					 MCRCONcmd($g_sMCrconPath, $g_IP, $g_iRconPort, $g_sRconPass, "broadcast", $sShutdownMessage)
					 FileWriteLine($g_c_sLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $g_s7dtdPID & ")] [RCON] Sent ( " & $sShutdownMessage & " ) to Players")
			   EndIf
			   If $sUseDiscordBot = "yes" Then
					 SendDiscordMsg($sDiscordWebHookURLs, $sShutdownMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
			   EndIf
			   If $sUseTwitchBot = "yes" Then
					 TwitchMsgLog($sShutdownMessage)
			   EndIf
			EndIf

			    $g_iBeginDelayedShutdown = 3
		EndIf
	Else
		$g_iBeginDelayedShutdown = 0
	EndIf
	#EndRegion ;**** Announce to Twitch or Discord or Both ****

	#Region ;**** Rotate Logs ****
	If ($logRotate = "yes") And ((_DateDiff('h', $g_sTimeCheck4, _NowCalc())) >= 1) Then
		If Not FileExists($g_c_sLogFile) Then
			FileWriteLine($g_c_sLogFile, $g_sTimeCheck4 & " Log File Created")
			FileSetTime($g_c_sLogFile, @YEAR & @MON & @MDAY, 1)
		EndIf
		Local $g_c_sLogFileTime = FileGetTime($g_c_sLogFile, 1)
		Local $logTimeSinceCreation = _DateDiff('h', $g_c_sLogFileTime[0] & "/" & $g_c_sLogFileTime[1] & "/" & $g_c_sLogFileTime[2] & " " & $g_c_sLogFileTime[3] & ":" & $g_c_sLogFileTime[4] & ":" & $g_c_sLogFileTime[5], _NowCalc())
		If $logTimeSinceCreation >= $logHoursBetweenRotate Then
			RotateFile($g_c_sLogFile, $logQuantity)
		EndIf
		$g_sTimeCheck4 = _NowCalc()
	EndIf
	#EndRegion ;**** Rotate Logs ****

	If $SteamFix = "yes" And WinExists("" & $g_c_sServerEXE & " - Entry Point Not Found") Then
		CloseEPointError(15)
	EndIf

	Sleep(1000)
WEnd
