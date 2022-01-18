Func LogWrite(
Func ReadUini(
Func SendTelnetTT(
Func SendDiscordMsg(
Func _UpdateTray()
Func UpdateCheck(
Func _ProcessGetLocation(
Func PIDReadServer()
Func _CheckForExistingServer()
Func ShowOnlineGUI(
Func _GetServerNameFromLog($tSplash = 0)
Func _GetQuery(
Func _BackupGame($tMinimizeTF = True, $tFullTF = False, $tRunWait = False)

Func CloseServer($ip, $port, $pass)
Func GUI_Config($tNewInstallTF = False)
Func W2_RestartServer()

Func GetPlayerCount($tSplash)
Func TelnetOnlinePlayers($ip, $port, $pwd)

Func _PlinkConnect($tIP, $tPort, $tPwd, $tLog012 = 2, $tSkipVerifyTF = False) ; $tLog0123: 0 = no log, 1 = Detailed log only, 2 = Both logs
Func _PlinkSend($sCmd, $tReadTF = True, $aSkipConnectTF = False)
Func _PlinkRead($aSkipConnectTF = False)
Func _TelnetLookForDeath($tArray3[$t1])
Func _TelnetLookForJoin($tArray3[$t1])
Func _TelnetLookForLeave($tArray3[$t1])
Func _TelnetLookForChat($tArray3[$t1])
Func _TelnetLookForAll(

Func _SendDiscordJoin($tMsg)
Func _SendDiscordLeave($tMsg)

Func _SendInGameMsg($tMsg1, $tSplash = False)
Func _SendInGameDaily()
Func _SendMsgSubs($tMsg3, $tDest = "D") ; $tDest D = Discord , I = InGame
Func _SendTelnetSafe($tMsgt, $tSkipLookForAllTF = False)

Func TrayRestartNow()
Func TrayRemoteRestart()
Func TrayUpdateUtilCheck()
Func TraySendMessage()
Func TraySendInGame()
Func TrayUpdateServCheck()

