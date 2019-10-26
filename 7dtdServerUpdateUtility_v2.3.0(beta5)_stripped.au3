#Region
#AutoIt3Wrapper_Icon=Resources\phoenixtray.ico
#AutoIt3Wrapper_Outfile=Builds\7dtdServerUpdateUtility_v2.3.0(beta5).exe
#AutoIt3Wrapper_Res_Comment=By Phoenix125 based on Dateranoth's ConanServerUtility v3.3.0-Beta.3
#AutoIt3Wrapper_Res_Description=7 Days To Die Dedicated Server Update Utility
#AutoIt3Wrapper_Res_Fileversion=2.3.0.0
#AutoIt3Wrapper_Res_ProductName=7dtdServerUpdateUtility
#AutoIt3Wrapper_Res_ProductVersion=2.3.0
#AutoIt3Wrapper_Res_CompanyName=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_LegalCopyright=http://www.Phoenix125.com
#AutoIt3Wrapper_Res_Language=1033
#AutoIt3Wrapper_Res_Icon_Add=Resources\phoenixfaded.ico
#AutoIt3Wrapper_Run_AU3Check=n
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/mo
#EndRegion
Global Const $OPT_COORDSRELATIVE = 0
Global Const $OPT_COORDSABSOLUTE = 1
Global Const $OPT_COORDSCLIENT = 2
Global Const $OPT_ERRORSILENT = 0
Global Const $OPT_ERRORFATAL = 1
Global Const $OPT_CAPSNOSTORE = 0
Global Const $OPT_CAPSSTORE = 1
Global Const $OPT_MATCHSTART = 1
Global Const $OPT_MATCHANY = 2
Global Const $OPT_MATCHEXACT = 3
Global Const $OPT_MATCHADVANCED = 4
Global Const $CCS_TOP = 0x01
Global Const $CCS_NOMOVEY = 0x02
Global Const $CCS_BOTTOM = 0x03
Global Const $CCS_NORESIZE = 0x04
Global Const $CCS_NOPARENTALIGN = 0x08
Global Const $CCS_NOHILITE = 0x10
Global Const $CCS_ADJUSTABLE = 0x20
Global Const $CCS_NODIVIDER = 0x40
Global Const $CCS_VERT = 0x0080
Global Const $CCS_LEFT = 0x0081
Global Const $CCS_NOMOVEX = 0x0082
Global Const $CCS_RIGHT = 0x0083
Global Const $DT_DRIVETYPE = 1
Global Const $DT_SSDSTATUS = 2
Global Const $DT_BUSTYPE = 3
Global Const $PROXY_IE = 0
Global Const $PROXY_NONE = 1
Global Const $PROXY_SPECIFIED = 2
Global Const $OBJID_WINDOW = 0x00000000
Global Const $OBJID_TITLEBAR = 0xFFFFFFFE
Global Const $OBJID_SIZEGRIP = 0xFFFFFFF9
Global Const $OBJID_CARET = 0xFFFFFFF8
Global Const $OBJID_CURSOR = 0xFFFFFFF7
Global Const $OBJID_ALERT = 0xFFFFFFF6
Global Const $OBJID_SOUND = 0xFFFFFFF5
Global Const $DLG_CENTERONTOP = 0
Global Const $DLG_NOTITLE = 1
Global Const $DLG_NOTONTOP = 2
Global Const $DLG_TEXTLEFT = 4
Global Const $DLG_TEXTRIGHT = 8
Global Const $DLG_MOVEABLE = 16
Global Const $DLG_TEXTVCENTER = 32
Global Const $IDC_UNKNOWN = 0
Global Const $IDC_APPSTARTING = 1
Global Const $IDC_ARROW = 2
Global Const $IDC_CROSS = 3
Global Const $IDC_HAND = 32649
Global Const $IDC_HELP = 4
Global Const $IDC_IBEAM = 5
Global Const $IDC_ICON = 6
Global Const $IDC_NO = 7
Global Const $IDC_SIZE = 8
Global Const $IDC_SIZEALL = 9
Global Const $IDC_SIZENESW = 10
Global Const $IDC_SIZENS = 11
Global Const $IDC_SIZENWSE = 12
Global Const $IDC_SIZEWE = 13
Global Const $IDC_UPARROW = 14
Global Const $IDC_WAIT = 15
Global Const $IDI_APPLICATION = 32512
Global Const $IDI_ASTERISK = 32516
Global Const $IDI_EXCLAMATION = 32515
Global Const $IDI_HAND = 32513
Global Const $IDI_QUESTION = 32514
Global Const $IDI_WINLOGO = 32517
Global Const $IDI_SHIELD = 32518
Global Const $IDI_ERROR = $IDI_HAND
Global Const $IDI_INFORMATION = $IDI_ASTERISK
Global Const $IDI_WARNING = $IDI_EXCLAMATION
Global Const $SD_LOGOFF = 0
Global Const $SD_SHUTDOWN = 1
Global Const $SD_REBOOT = 2
Global Const $SD_FORCE = 4
Global Const $SD_POWERDOWN = 8
Global Const $SD_FORCEHUNG = 16
Global Const $SD_STANDBY = 32
Global Const $SD_HIBERNATE = 64
Global Const $STDIN_CHILD = 1
Global Const $STDOUT_CHILD = 2
Global Const $STDERR_CHILD = 4
Global Const $STDERR_MERGED = 8
Global Const $STDIO_INHERIT_PARENT = 0x10
Global Const $RUN_CREATE_NEW_CONSOLE = 0x00010000
Global Const $UBOUND_DIMENSIONS = 0
Global Const $UBOUND_ROWS = 1
Global Const $UBOUND_COLUMNS = 2
Global Const $MOUSEEVENTF_ABSOLUTE = 0x8000
Global Const $MOUSEEVENTF_MOVE = 0x0001
Global Const $MOUSEEVENTF_LEFTDOWN = 0x0002
Global Const $MOUSEEVENTF_LEFTUP = 0x0004
Global Const $MOUSEEVENTF_RIGHTDOWN = 0x0008
Global Const $MOUSEEVENTF_RIGHTUP = 0x0010
Global Const $MOUSEEVENTF_MIDDLEDOWN = 0x0020
Global Const $MOUSEEVENTF_MIDDLEUP = 0x0040
Global Const $MOUSEEVENTF_WHEEL = 0x0800
Global Const $MOUSEEVENTF_XDOWN = 0x0080
Global Const $MOUSEEVENTF_XUP = 0x0100
Global Const $REG_NONE = 0
Global Const $REG_SZ = 1
Global Const $REG_EXPAND_SZ = 2
Global Const $REG_BINARY = 3
Global Const $REG_DWORD = 4
Global Const $REG_DWORD_LITTLE_ENDIAN = 4
Global Const $REG_DWORD_BIG_ENDIAN = 5
Global Const $REG_LINK = 6
Global Const $REG_MULTI_SZ = 7
Global Const $REG_RESOURCE_LIST = 8
Global Const $REG_FULL_RESOURCE_DESCRIPTOR = 9
Global Const $REG_RESOURCE_REQUIREMENTS_LIST = 10
Global Const $REG_QWORD = 11
Global Const $REG_QWORD_LITTLE_ENDIAN = 11
Global Const $HWND_BOTTOM = 1
Global Const $HWND_NOTOPMOST = -2
Global Const $HWND_TOP = 0
Global Const $HWND_TOPMOST = -1
Global Const $SWP_NOSIZE = 0x0001
Global Const $SWP_NOMOVE = 0x0002
Global Const $SWP_NOZORDER = 0x0004
Global Const $SWP_NOREDRAW = 0x0008
Global Const $SWP_NOACTIVATE = 0x0010
Global Const $SWP_FRAMECHANGED = 0x0020
Global Const $SWP_DRAWFRAME = 0x0020
Global Const $SWP_SHOWWINDOW = 0x0040
Global Const $SWP_HIDEWINDOW = 0x0080
Global Const $SWP_NOCOPYBITS = 0x0100
Global Const $SWP_NOOWNERZORDER = 0x0200
Global Const $SWP_NOREPOSITION = 0x0200
Global Const $SWP_NOSENDCHANGING = 0x0400
Global Const $SWP_DEFERERASE = 0x2000
Global Const $SWP_ASYNCWINDOWPOS = 0x4000
Global Const $KEYWORD_DEFAULT = 1
Global Const $KEYWORD_NULL = 2
Global Const $DECLARED_LOCAL = -1
Global Const $DECLARED_UNKNOWN = 0
Global Const $DECLARED_GLOBAL = 1
Global Const $ASSIGN_CREATE = 0
Global Const $ASSIGN_FORCELOCAL = 1
Global Const $ASSIGN_FORCEGLOBAL = 2
Global Const $ASSIGN_EXISTFAIL = 4
Global Const $BI_ENABLE = 0
Global Const $BI_DISABLE = 1
Global Const $BREAK_ENABLE = 1
Global Const $BREAK_DISABLE = 0
Global Const $CDTRAY_OPEN = "open"
Global Const $CDTRAY_CLOSED = "closed"
Global Const $SEND_DEFAULT = 0
Global Const $SEND_RAW = 1
Global Const $DIR_DEFAULT = 0
Global Const $DIR_EXTENDED= 1
Global Const $DIR_NORECURSE = 2
Global Const $DIR_REMOVE= 1
Global Const $DT_ALL = "ALL"
Global Const $DT_CDROM = "CDROM"
Global Const $DT_REMOVABLE = "REMOVABLE"
Global Const $DT_FIXED = "FIXED"
Global Const $DT_NETWORK = "NETWORK"
Global Const $DT_RAMDISK = "RAMDISK"
Global Const $DT_UNKNOWN = "UNKNOWN"
Global Const $DT_UNDEFINED = 1
Global Const $DT_FAT = "FAT"
Global Const $DT_FAT32 = "FAT32"
Global Const $DT_EXFAT = "exFAT"
Global Const $DT_NTFS = "NTFS"
Global Const $DT_NWFS = "NWFS"
Global Const $DT_CDFS = "CDFS"
Global Const $DT_UDF = "UDF"
Global Const $DMA_DEFAULT = 0
Global Const $DMA_PERSISTENT = 1
Global Const $DMA_AUTHENTICATION = 8
Global Const $DS_UNKNOWN = "UNKNOWN"
Global Const $DS_READY = "READY"
Global Const $DS_NOTREADY = "NOTREADY"
Global Const $DS_INVALID = "INVALID"
Global Const $MOUSE_CLICK_LEFT = "left"
Global Const $MOUSE_CLICK_RIGHT = "right"
Global Const $MOUSE_CLICK_MIDDLE = "middle"
Global Const $MOUSE_CLICK_MAIN = "main"
Global Const $MOUSE_CLICK_MENU = "menu"
Global Const $MOUSE_CLICK_PRIMARY = "primary"
Global Const $MOUSE_CLICK_SECONDARY = "secondary"
Global Const $MOUSE_WHEEL_UP = "up"
Global Const $MOUSE_WHEEL_DOWN = "down"
Global Const $NUMBER_AUTO = 0
Global Const $NUMBER_32BIT = 1
Global Const $NUMBER_64BIT = 2
Global Const $NUMBER_DOUBLE = 3
Global Const $OBJ_NAME = 1
Global Const $OBJ_STRING = 2
Global Const $OBJ_PROGID = 3
Global Const $OBJ_FILE = 4
Global Const $OBJ_MODULE = 5
Global Const $OBJ_CLSID = 6
Global Const $OBJ_IID = 7
Global Const $EXITCLOSE_NORMAL = 0
Global Const $EXITCLOSE_BYEXIT = 1
Global Const $EXITCLOSE_BYCLICK = 2
Global Const $EXITCLOSE_BYLOGOFF = 3
Global Const $EXITCLOSE_BYSHUTDOWN = 4
Global Const $PROCESS_STATS_MEMORY = 0
Global Const $PROCESS_STATS_IO = 1
Global Const $PROCESS_LOW = 0
Global Const $PROCESS_BELOWNORMAL = 1
Global Const $PROCESS_NORMAL = 2
Global Const $PROCESS_ABOVENORMAL = 3
Global Const $PROCESS_HIGH = 4
Global Const $PROCESS_REALTIME = 5
Global Const $RUN_LOGON_NOPROFILE = 0
Global Const $RUN_LOGON_PROFILE = 1
Global Const $RUN_LOGON_NETWORK = 2
Global Const $RUN_LOGON_INHERIT = 4
Global Const $SOUND_NOWAIT = 0
Global Const $SOUND_WAIT = 1
Global Const $SHEX_OPEN = "open"
Global Const $SHEX_EDIT = "edit"
Global Const $SHEX_PRINT = "print"
Global Const $SHEX_PROPERTIES = "properties"
Global Const $TCP_DATA_DEFAULT = 0
Global Const $TCP_DATA_BINARY = 1
Global Const $UDP_OPEN_DEFAULT = 0
Global Const $UDP_OPEN_BROADCAST = 1
Global Const $UDP_DATA_DEFAULT = 0
Global Const $UDP_DATA_BINARY = 1
Global Const $UDP_DATA_ARRAY = 2
Global Const $TIP_NOICON = 0
Global Const $TIP_INFOICON = 1
Global Const $TIP_WARNINGICON = 2
Global Const $TIP_ERRORICON = 3
Global Const $TIP_BALLOON = 1
Global Const $TIP_CENTER = 2
Global Const $TIP_FORCEVISIBLE = 4
Global Const $WINDOWS_NOONTOP = 0
Global Const $WINDOWS_ONTOP = 1
Global Const $WIN_STATE_EXISTS = 1
Global Const $WIN_STATE_VISIBLE  = 2
Global Const $WIN_STATE_ENABLED = 4
Global Const $WIN_STATE_ACTIVE = 8
Global Const $WIN_STATE_MINIMIZED = 16
Global Const $WIN_STATE_MAXIMIZED = 32
$aUtilVerStable = "v2.2.1"
$aUtilVerBeta = "v2.3.0(beta5)"
$aUtilVersion = $aUtilVerStable
Global Const $DTS_SHORTDATEFORMAT = 0
Global Const $DTS_UPDOWN = 1
Global Const $DTS_SHOWNONE = 2
Global Const $DTS_LONGDATEFORMAT = 4
Global Const $DTS_TIMEFORMAT = 9
Global Const $DTS_RIGHTALIGN = 32
Global Const $DTS_SHORTDATECENTURYFORMAT = 0x0000000C
Global Const $DTS_APPCANPARSE = 0x00000010
Global Const $DMW_LONGNAME = 0
Global Const $DMW_SHORTNAME = 1
Global Const $DMW_LOCALE_LONGNAME = 2
Global Const $DMW_LOCALE_SHORTNAME = 3
Global Const $GDT_ERROR = -1
Global Const $GDT_VALID = 0
Global Const $GDT_NONE = 1
Global Const $GDTR_MIN = 0x0001
Global Const $GDTR_MAX = 0x0002
Global Const $MCHT_NOWHERE = 0x00000000
Global Const $MCHT_TITLE = 0x00010000
Global Const $MCHT_CALENDAR = 0x00020000
Global Const $MCHT_TODAYLINK = 0x00030000
Global Const $MCHT_NEXT = 0x01000000
Global Const $MCHT_PREV = 0x02000000
Global Const $MCHT_TITLEBK = 0x00010000
Global Const $MCHT_TITLEMONTH = 0x00010001
Global Const $MCHT_TITLEYEAR = 0x00010002
Global Const $MCHT_TITLEBTNNEXT = 0x01010003
Global Const $MCHT_TITLEBTNPREV = 0x02010003
Global Const $MCHT_CALENDARBK = 0x00020000
Global Const $MCHT_CALENDARDATE = 0x00020001
Global Const $MCHT_CALENDARDAY = 0x00020002
Global Const $MCHT_CALENDARWEEKNUM = 0x00020003
Global Const $MCHT_CALENDARDATENEXT = 0x01020000
Global Const $MCHT_CALENDARDATEPREV = 0x02020000
Global Const $MCS_DAYSTATE = 0x0001
Global Const $MCS_MULTISELECT = 0x0002
Global Const $MCS_WEEKNUMBERS = 0x0004
Global Const $MCS_NOTODAYCIRCLE = 0x0008
Global Const $MCS_NOTODAY = 0x0010
Global Const $MCS_NOTRAILINGDATES = 0x0040
Global Const $MCS_SHORTDAYSOFWEEK = 0x0080
Global Const $MCS_NOSELCHANGEONNAV = 0x0100
Global Const $MCM_FIRST = 0x1000
Global Const $MCM_GETCALENDARBORDER = ($MCM_FIRST + 31)
Global Const $MCM_GETCALENDARCOUNT = ($MCM_FIRST + 23)
Global Const $MCM_GETCALENDARGRIDINFO = ($MCM_FIRST + 24)
Global Const $MCM_GETCALID = ($MCM_FIRST + 27)
Global Const $MCM_GETCOLOR = ($MCM_FIRST + 11)
Global Const $MCM_GETCURRENTVIEW = ($MCM_FIRST + 22)
Global Const $MCM_GETCURSEL = ($MCM_FIRST + 1)
Global Const $MCM_GETFIRSTDAYOFWEEK = ($MCM_FIRST + 16)
Global Const $MCM_GETMAXSELCOUNT = ($MCM_FIRST + 3)
Global Const $MCM_GETMAXTODAYWIDTH = ($MCM_FIRST + 21)
Global Const $MCM_GETMINREQRECT = ($MCM_FIRST + 9)
Global Const $MCM_GETMONTHDELTA = ($MCM_FIRST + 19)
Global Const $MCM_GETMONTHRANGE = ($MCM_FIRST + 7)
Global Const $MCM_GETRANGE = ($MCM_FIRST + 17)
Global Const $MCM_GETSELRANGE = ($MCM_FIRST + 5)
Global Const $MCM_GETTODAY = ($MCM_FIRST + 13)
Global Const $MCM_GETUNICODEFORMAT = 0x2000 + 6
Global Const $MCM_HITTEST = ($MCM_FIRST + 14)
Global Const $MCM_SETCALENDARBORDER = ($MCM_FIRST + 30)
Global Const $MCM_SETCALID = ($MCM_FIRST + 28)
Global Const $MCM_SETCOLOR = ($MCM_FIRST + 10)
Global Const $MCM_SETCURRENTVIEW = ($MCM_FIRST + 32)
Global Const $MCM_SETCURSEL = ($MCM_FIRST + 2)
Global Const $MCM_SETDAYSTATE = ($MCM_FIRST + 8)
Global Const $MCM_SETFIRSTDAYOFWEEK = ($MCM_FIRST + 15)
Global Const $MCM_SETMAXSELCOUNT = ($MCM_FIRST + 4)
Global Const $MCM_SETMONTHDELTA = ($MCM_FIRST + 20)
Global Const $MCM_SETRANGE = ($MCM_FIRST + 18)
Global Const $MCM_SETSELRANGE = ($MCM_FIRST + 6)
Global Const $MCM_SETTODAY = ($MCM_FIRST + 12)
Global Const $MCM_SETUNICODEFORMAT = 0x2000 + 5
Global Const $MCM_SIZERECTTOMIN = ($MCM_FIRST + 29)
Global Const $MCN_FIRST = -746
Global Const $MCN_SELCHANGE = ($MCN_FIRST - 3)
Global Const $MCN_GETDAYSTATE = ($MCN_FIRST - 1)
Global Const $MCN_SELECT = ($MCN_FIRST)
Global Const $MCN_VIEWCHANGE = ($MCN_FIRST - 4)
Global Const $MCSC_BACKGROUND = 0
Global Const $MCSC_MONTHBK = 4
Global Const $MCSC_TEXT = 1
Global Const $MCSC_TITLEBK = 2
Global Const $MCSC_TITLETEXT = 3
Global Const $MCSC_TRAILINGTEXT = 5
Global Const $DTM_FIRST = 0x1000
Global Const $DTM_GETSYSTEMTIME = $DTM_FIRST + 1
Global Const $DTM_SETSYSTEMTIME = $DTM_FIRST + 2
Global Const $DTM_GETRANGE = $DTM_FIRST + 3
Global Const $DTM_SETRANGE = $DTM_FIRST + 4
Global Const $DTM_SETFORMAT = $DTM_FIRST + 5
Global Const $DTM_SETMCCOLOR = $DTM_FIRST + 6
Global Const $DTM_GETMCCOLOR = $DTM_FIRST + 7
Global Const $DTM_GETMONTHCAL = $DTM_FIRST + 8
Global Const $DTM_SETMCFONT = $DTM_FIRST + 9
Global Const $DTM_GETMCFONT = $DTM_FIRST + 10
Global Const $DTM_SETFORMATW = $DTM_FIRST + 50
Global Const $DTN_FIRST = -740
Global Const $DTN_FIRST2 = -753
Global Const $DTN_DATETIMECHANGE = $DTN_FIRST2 - 6
Global Const $DTN_USERSTRING = $DTN_FIRST2 - 5
Global Const $DTN_WMKEYDOWN = $DTN_FIRST2 - 4
Global Const $DTN_FORMAT = $DTN_FIRST2 - 3
Global Const $DTN_FORMATQUERY = $DTN_FIRST2 - 2
Global Const $DTN_DROPDOWN = $DTN_FIRST2 - 1
Global Const $DTN_CLOSEUP = $DTN_FIRST2 - 0
Global Const $DTN_USERSTRINGW = $DTN_FIRST - 5
Global Const $DTN_WMKEYDOWNW = $DTN_FIRST - 4
Global Const $DTN_FORMATW = $DTN_FIRST - 3
Global Const $DTN_FORMATQUERYW = $DTN_FIRST - 2
Global Const $GUI_SS_DEFAULT_DATE = $DTS_LONGDATEFORMAT
Global Const $GUI_SS_DEFAULT_MONTHCAL = 0
Global Const $GMEM_FIXED = 0x0000
Global Const $GMEM_MOVEABLE = 0x0002
Global Const $GMEM_NOCOMPACT = 0x0010
Global Const $GMEM_NODISCARD = 0x0020
Global Const $GMEM_ZEROINIT = 0x0040
Global Const $GMEM_MODIFY = 0x0080
Global Const $GMEM_DISCARDABLE = 0x0100
Global Const $GMEM_NOT_BANKED = 0x1000
Global Const $GMEM_SHARE = 0x2000
Global Const $GMEM_DDESHARE = 0x2000
Global Const $GMEM_NOTIFY = 0x4000
Global Const $GMEM_LOWER = 0x1000
Global Const $GMEM_VALID_FLAGS = 0x7F72
Global Const $GMEM_INVALID_HANDLE = 0x8000
Global Const $GPTR = BitOR($GMEM_FIXED, $GMEM_ZEROINIT)
Global Const $GHND = BitOR($GMEM_MOVEABLE, $GMEM_ZEROINIT)
Global Const $MEM_COMMIT = 0x00001000
Global Const $MEM_RESERVE = 0x00002000
Global Const $MEM_TOP_DOWN = 0x00100000
Global Const $MEM_SHARED = 0x08000000
Global Const $PAGE_NOACCESS = 0x00000001
Global Const $PAGE_READONLY = 0x00000002
Global Const $PAGE_READWRITE = 0x00000004
Global Const $PAGE_EXECUTE = 0x00000010
Global Const $PAGE_EXECUTE_READ = 0x00000020
Global Const $PAGE_EXECUTE_READWRITE = 0x00000040
Global Const $PAGE_EXECUTE_WRITECOPY = 0x00000080
Global Const $PAGE_GUARD = 0x00000100
Global Const $PAGE_NOCACHE = 0x00000200
Global Const $PAGE_WRITECOMBINE = 0x00000400
Global Const $PAGE_WRITECOPY = 0x00000008
Global Const $MEM_DECOMMIT = 0x00004000
Global Const $MEM_RELEASE = 0x00008000
Global Enum $MEM_LOAD, $MEM_TOTALPHYSRAM, $MEM_AVAILPHYSRAM, $MEM_TOTALPAGEFILE, $MEM_AVAILPAGEFILE, $MEM_TOTALVIRTUAL, $MEM_AVAILVIRTUAL
Global Const $PROCESS_TERMINATE = 0x00000001
Global Const $PROCESS_CREATE_THREAD = 0x00000002
Global Const $PROCESS_SET_SESSIONID = 0x00000004
Global Const $PROCESS_VM_OPERATION = 0x00000008
Global Const $PROCESS_VM_READ = 0x00000010
Global Const $PROCESS_VM_WRITE = 0x00000020
Global Const $PROCESS_DUP_HANDLE = 0x00000040
Global Const $PROCESS_CREATE_PROCESS = 0x00000080
Global Const $PROCESS_SET_QUOTA = 0x00000100
Global Const $PROCESS_SET_INFORMATION = 0x00000200
Global Const $PROCESS_QUERY_INFORMATION = 0x00000400
Global Const $PROCESS_QUERY_LIMITED_INFORMATION = 0x1000
Global Const $PROCESS_SUSPEND_RESUME = 0x00000800
Global Const $PROCESS_ALL_ACCESS = 0x001F0FFF
Global Const $SE_ASSIGNPRIMARYTOKEN_NAME = "SeAssignPrimaryTokenPrivilege"
Global Const $SE_AUDIT_NAME = "SeAuditPrivilege"
Global Const $SE_BACKUP_NAME = "SeBackupPrivilege"
Global Const $SE_CHANGE_NOTIFY_NAME = "SeChangeNotifyPrivilege"
Global Const $SE_CREATE_GLOBAL_NAME = "SeCreateGlobalPrivilege"
Global Const $SE_CREATE_PAGEFILE_NAME = "SeCreatePagefilePrivilege"
Global Const $SE_CREATE_PERMANENT_NAME = "SeCreatePermanentPrivilege"
Global Const $SE_CREATE_SYMBOLIC_LINK_NAME = 'SeCreateSymbolicLinkPrivilege'
Global Const $SE_CREATE_TOKEN_NAME = "SeCreateTokenPrivilege"
Global Const $SE_DEBUG_NAME = "SeDebugPrivilege"
Global Const $SE_ENABLE_DELEGATION_NAME = "SeEnableDelegationPrivilege"
Global Const $SE_IMPERSONATE_NAME = "SeImpersonatePrivilege"
Global Const $SE_INC_BASE_PRIORITY_NAME = "SeIncreaseBasePriorityPrivilege"
Global Const $SE_INC_WORKING_SET_NAME = 'SeIncreaseWorkingSetPrivilege'
Global Const $SE_INCREASE_QUOTA_NAME = "SeIncreaseQuotaPrivilege"
Global Const $SE_LOAD_DRIVER_NAME = "SeLoadDriverPrivilege"
Global Const $SE_LOCK_MEMORY_NAME = "SeLockMemoryPrivilege"
Global Const $SE_MACHINE_ACCOUNT_NAME = "SeMachineAccountPrivilege"
Global Const $SE_MANAGE_VOLUME_NAME = "SeManageVolumePrivilege"
Global Const $SE_PROF_SINGLE_PROCESS_NAME = "SeProfileSingleProcessPrivilege"
Global Const $SE_RELABEL_NAME = 'SeRelabelPrivilege'
Global Const $SE_REMOTE_SHUTDOWN_NAME = "SeRemoteShutdownPrivilege"
Global Const $SE_RESTORE_NAME = "SeRestorePrivilege"
Global Const $SE_SECURITY_NAME = "SeSecurityPrivilege"
Global Const $SE_SHUTDOWN_NAME = "SeShutdownPrivilege"
Global Const $SE_SYNC_AGENT_NAME = "SeSyncAgentPrivilege"
Global Const $SE_SYSTEM_ENVIRONMENT_NAME = "SeSystemEnvironmentPrivilege"
Global Const $SE_SYSTEM_PROFILE_NAME = "SeSystemProfilePrivilege"
Global Const $SE_SYSTEMTIME_NAME = "SeSystemtimePrivilege"
Global Const $SE_TAKE_OWNERSHIP_NAME = "SeTakeOwnershipPrivilege"
Global Const $SE_TCB_NAME = "SeTcbPrivilege"
Global Const $SE_TIME_ZONE_NAME = 'SeTimeZonePrivilege'
Global Const $SE_TRUSTED_CREDMAN_ACCESS_NAME = 'SeTrustedCredManAccessPrivilege'
Global Const $SE_UNSOLICITED_INPUT_NAME = "SeUnsolicitedInputPrivilege"
Global Const $SE_UNDOCK_NAME = "SeUndockPrivilege"
Global Const $SE_PRIVILEGE_ENABLED_BY_DEFAULT = 0x00000001
Global Const $SE_PRIVILEGE_ENABLED = 0x00000002
Global Const $SE_PRIVILEGE_REMOVED = 0x00000004
Global Const $SE_PRIVILEGE_USED_FOR_ACCESS = 0x80000000
Global Const $SE_GROUP_MANDATORY = 0x00000001
Global Const $SE_GROUP_ENABLED_BY_DEFAULT = 0x00000002
Global Const $SE_GROUP_ENABLED = 0x00000004
Global Const $SE_GROUP_OWNER = 0x00000008
Global Const $SE_GROUP_USE_FOR_DENY_ONLY = 0x00000010
Global Const $SE_GROUP_INTEGRITY = 0x00000020
Global Const $SE_GROUP_INTEGRITY_ENABLED = 0x00000040
Global Const $SE_GROUP_RESOURCE = 0x20000000
Global Const $SE_GROUP_LOGON_ID = 0xC0000000
Global Enum $TOKENPRIMARY = 1, $TOKENIMPERSONATION
Global Enum $SECURITYANONYMOUS = 0, $SECURITYIDENTIFICATION, $SECURITYIMPERSONATION, $SECURITYDELEGATION
Global Enum $TOKENUSER = 1, $TOKENGROUPS, $TOKENPRIVILEGES, $TOKENOWNER, $TOKENPRIMARYGROUP, $TOKENDEFAULTDACL, $TOKENSOURCE, $TOKENTYPE, $TOKENIMPERSONATIONLEVEL, $TOKENSTATISTICS, $TOKENRESTRICTEDSIDS, $TOKENSESSIONID, $TOKENGROUPSANDPRIVILEGES, $TOKENSESSIONREFERENCE, $TOKENSANDBOXINERT, $TOKENAUDITPOLICY, $TOKENORIGIN, $TOKENELEVATIONTYPE, $TOKENLINKEDTOKEN, $TOKENELEVATION, $TOKENHASRESTRICTIONS, $TOKENACCESSINFORMATION, $TOKENVIRTUALIZATIONALLOWED, $TOKENVIRTUALIZATIONENABLED, $TOKENINTEGRITYLEVEL, $TOKENUIACCESS, $TOKENMANDATORYPOLICY, $TOKENLOGONSID
Global Const $TOKEN_ASSIGN_PRIMARY = 0x00000001
Global Const $TOKEN_DUPLICATE = 0x00000002
Global Const $TOKEN_IMPERSONATE = 0x00000004
Global Const $TOKEN_QUERY = 0x00000008
Global Const $TOKEN_QUERY_SOURCE = 0x00000010
Global Const $TOKEN_ADJUST_PRIVILEGES = 0x00000020
Global Const $TOKEN_ADJUST_GROUPS = 0x00000040
Global Const $TOKEN_ADJUST_DEFAULT = 0x00000080
Global Const $TOKEN_ADJUST_SESSIONID = 0x00000100
Global Const $TOKEN_ALL_ACCESS = 0x000F01FF
Global Const $TOKEN_READ = 0x00020008
Global Const $TOKEN_WRITE = 0x000200E0
Global Const $TOKEN_EXECUTE = 0x00020000
Global Const $TOKEN_HAS_TRAVERSE_PRIVILEGE = 0x00000001
Global Const $TOKEN_HAS_BACKUP_PRIVILEGE = 0x00000002
Global Const $TOKEN_HAS_RESTORE_PRIVILEGE = 0x00000004
Global Const $TOKEN_HAS_ADMIN_GROUP = 0x00000008
Global Const $TOKEN_IS_RESTRICTED = 0x00000010
Global Const $TOKEN_SESSION_NOT_REFERENCED = 0x00000020
Global Const $TOKEN_SANDBOX_INERT = 0x00000040
Global Const $TOKEN_HAS_IMPERSONATE_PRIVILEGE = 0x00000080
Global Const $RIGHTS_DELETE = 0x00010000
Global Const $READ_CONTROL = 0x00020000
Global Const $WRITE_DAC = 0x00040000
Global Const $WRITE_OWNER = 0x00080000
Global Const $SYNCHRONIZE = 0x00100000
Global Const $ACCESS_SYSTEM_SECURITY = 0x01000000
Global Const $STANDARD_RIGHTS_REQUIRED = 0x000f0000
Global Const $STANDARD_RIGHTS_READ = $READ_CONTROL
Global Const $STANDARD_RIGHTS_WRITE = $READ_CONTROL
Global Const $STANDARD_RIGHTS_EXECUTE = $READ_CONTROL
Global Const $STANDARD_RIGHTS_ALL = 0x001F0000
Global Const $SPECIFIC_RIGHTS_ALL = 0x0000FFFF
Global Enum $NOT_USED_ACCESS = 0, $GRANT_ACCESS, $SET_ACCESS, $DENY_ACCESS, $REVOKE_ACCESS, $SET_AUDIT_SUCCESS, $SET_AUDIT_FAILURE
Global Enum $TRUSTEE_IS_UNKNOWN = 0, $TRUSTEE_IS_USER, $TRUSTEE_IS_GROUP, $TRUSTEE_IS_DOMAIN, $TRUSTEE_IS_ALIAS, $TRUSTEE_IS_WELL_KNOWN_GROUP, $TRUSTEE_IS_DELETED, $TRUSTEE_IS_INVALID, $TRUSTEE_IS_COMPUTER
Global Const $LOGON_WITH_PROFILE = 0x00000001
Global Const $LOGON_NETCREDENTIALS_ONLY = 0x00000002
Global Enum $SIDTYPEUSER = 1, $SIDTYPEGROUP, $SIDTYPEDOMAIN, $SIDTYPEALIAS, $SIDTYPEWELLKNOWNGROUP, $SIDTYPEDELETEDACCOUNT, $SIDTYPEINVALID, $SIDTYPEUNKNOWN, $SIDTYPECOMPUTER, $SIDTYPELABEL
Global Const $SID_ADMINISTRATORS = "S-1-5-32-544"
Global Const $SID_USERS = "S-1-5-32-545"
Global Const $SID_GUESTS = "S-1-5-32-546"
Global Const $SID_ACCOUNT_OPERATORS = "S-1-5-32-548"
Global Const $SID_SERVER_OPERATORS = "S-1-5-32-549"
Global Const $SID_PRINT_OPERATORS = "S-1-5-32-550"
Global Const $SID_BACKUP_OPERATORS = "S-1-5-32-551"
Global Const $SID_REPLICATOR = "S-1-5-32-552"
Global Const $SID_OWNER = "S-1-3-0"
Global Const $SID_EVERYONE = "S-1-1-0"
Global Const $SID_NETWORK = "S-1-5-2"
Global Const $SID_INTERACTIVE = "S-1-5-4"
Global Const $SID_SYSTEM = "S-1-5-18"
Global Const $SID_AUTHENTICATED_USERS = "S-1-5-11"
Global Const $SID_SCHANNEL_AUTHENTICATION = "S-1-5-64-14"
Global Const $SID_DIGEST_AUTHENTICATION = "S-1-5-64-21"
Global Const $SID_NT_SERVICE = "S-1-5-80"
Global Const $SID_UNTRUSTED_MANDATORY_LEVEL = "S-1-16-0"
Global Const $SID_LOW_MANDATORY_LEVEL = "S-1-16-4096"
Global Const $SID_MEDIUM_MANDATORY_LEVEL = "S-1-16-8192"
Global Const $SID_MEDIUM_PLUS_MANDATORY_LEVEL = "S-1-16-8448"
Global Const $SID_HIGH_MANDATORY_LEVEL = "S-1-16-12288"
Global Const $SID_SYSTEM_MANDATORY_LEVEL = "S-1-16-16384"
Global Const $SID_PROTECTED_PROCESS_MANDATORY_LEVEL = "S-1-16-20480"
Global Const $SID_SECURE_PROCESS_MANDATORY_LEVEL = "S-1-16-28672"
Global Const $SID_ALL_SERVICES = "S-1-5-80-0"
Global Const $MB_OK = 0
Global Const $MB_OKCANCEL = 1
Global Const $MB_ABORTRETRYIGNORE = 2
Global Const $MB_YESNOCANCEL = 3
Global Const $MB_YESNO = 4
Global Const $MB_RETRYCANCEL = 5
Global Const $MB_CANCELTRYCONTINUE = 6
Global Const $MB_HELP = 0x4000
Global Const $MB_ICONSTOP = 16
Global Const $MB_ICONERROR = 16
Global Const $MB_ICONHAND = 16
Global Const $MB_ICONQUESTION = 32
Global Const $MB_ICONEXCLAMATION = 48
Global Const $MB_ICONWARNING = 48
Global Const $MB_ICONINFORMATION = 64
Global Const $MB_ICONASTERISK = 64
Global Const $MB_USERICON = 0x00000080
Global Const $MB_DEFBUTTON1 = 0
Global Const $MB_DEFBUTTON2 = 256
Global Const $MB_DEFBUTTON3 = 512
Global Const $MB_DEFBUTTON4 = 768
Global Const $MB_APPLMODAL = 0
Global Const $MB_SYSTEMMODAL = 4096
Global Const $MB_TASKMODAL = 8192
Global Const $MB_DEFAULT_DESKTOP_ONLY = 0x00020000
Global Const $MB_RIGHT = 0x00080000
Global Const $MB_RTLREADING = 0x00100000
Global Const $MB_SETFOREGROUND = 0x00010000
Global Const $MB_TOPMOST = 0x00040000
Global Const $MB_SERVICE_NOTIFICATION = 0x00200000
Global Const $MB_RIGHTJUSTIFIED = $MB_RIGHT
Global Const $IDTIMEOUT = -1
Global Const $IDOK = 1
Global Const $IDCANCEL = 2
Global Const $IDABORT = 3
Global Const $IDRETRY = 4
Global Const $IDIGNORE = 5
Global Const $IDYES = 6
Global Const $IDNO = 7
Global Const $IDCLOSE = 8
Global Const $IDHELP = 9
Global Const $IDTRYAGAIN = 10
Global Const $IDCONTINUE = 11
Global Const $STR_NOCASESENSE = 0
Global Const $STR_CASESENSE = 1
Global Const $STR_NOCASESENSEBASIC = 2
Global Const $STR_STRIPLEADING = 1
Global Const $STR_STRIPTRAILING = 2
Global Const $STR_STRIPSPACES = 4
Global Const $STR_STRIPALL = 8
Global Const $STR_CHRSPLIT = 0
Global Const $STR_ENTIRESPLIT = 1
Global Const $STR_NOCOUNT = 2
Global Const $STR_REGEXPMATCH = 0
Global Const $STR_REGEXPARRAYMATCH = 1
Global Const $STR_REGEXPARRAYFULLMATCH = 2
Global Const $STR_REGEXPARRAYGLOBALMATCH = 3
Global Const $STR_REGEXPARRAYGLOBALFULLMATCH = 4
Global Const $STR_ENDISSTART = 0
Global Const $STR_ENDNOTSTART = 1
Global Const $SB_ANSI = 1
Global Const $SB_UTF16LE = 2
Global Const $SB_UTF16BE = 3
Global Const $SB_UTF8 = 4
Global Const $SE_UTF16 = 0
Global Const $SE_ANSI = 1
Global Const $SE_UTF8 = 2
Global Const $STR_UTF16 = 0
Global Const $STR_UCS2 = 1
#Region Global Variables and Constants
Global Const $FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100
Global Const $FORMAT_MESSAGE_IGNORE_INSERTS = 0x00000200
Global Const $FORMAT_MESSAGE_FROM_STRING = 0x00000400
Global Const $FORMAT_MESSAGE_FROM_HMODULE = 0x00000800
Global Const $FORMAT_MESSAGE_FROM_SYSTEM = 0x00001000
Global Const $FORMAT_MESSAGE_ARGUMENT_ARRAY = 0x00002000
#EndRegion Global Variables and Constants
Func _WinAPI_Beep($iFreq = 500, $iDuration = 1000)
Local $aResult = DllCall("kernel32.dll", "bool", "Beep", "dword", $iFreq, "dword", $iDuration)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_FormatMessage($iFlags, $pSource, $iMessageID, $iLanguageID, ByRef $pBuffer, $iSize, $vArguments)
Local $sBufferType = "struct*"
If IsString($pBuffer) Then $sBufferType = "wstr"
Local $aResult = DllCall("kernel32.dll", "dword", "FormatMessageW", "dword", $iFlags, "struct*", $pSource, "dword", $iMessageID,  "dword", $iLanguageID, $sBufferType, $pBuffer, "dword", $iSize, "ptr", $vArguments)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, 0)
If $sBufferType = "wstr" Then $pBuffer = $aResult[5]
Return $aResult[0]
EndFunc
Func _WinAPI_GetErrorMessage($iCode, $iLanguage = 0, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $aRet = DllCall('kernel32.dll', 'dword', 'FormatMessageW', 'dword', 0x1000, 'ptr', 0, 'dword', $iCode,  'dword', $iLanguage, 'wstr', '', 'dword', 4096, 'ptr', 0)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return SetError($_iCurrentError, $_iCurrentExtended, StringRegExpReplace($aRet[5], '[' & @LF & ',' & @CR & ']*\Z', ''))
EndFunc
Func _WinAPI_GetLastError(Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $aResult = DllCall("kernel32.dll", "dword", "GetLastError")
Return SetError($_iCurrentError, $_iCurrentExtended, $aResult[0])
EndFunc
Func _WinAPI_GetLastErrorMessage(Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $iLastError = _WinAPI_GetLastError()
Local $tBufferPtr = DllStructCreate("ptr")
Local $nCount = _WinAPI_FormatMessage(BitOR($FORMAT_MESSAGE_ALLOCATE_BUFFER, $FORMAT_MESSAGE_FROM_SYSTEM),  0, $iLastError, 0, $tBufferPtr, 0, 0)
If @error Then Return SetError(-@error, @extended, "")
Local $sText = ""
Local $pBuffer = DllStructGetData($tBufferPtr, 1)
If $pBuffer Then
If $nCount > 0 Then
Local $tBuffer = DllStructCreate("wchar[" & ($nCount + 1) & "]", $pBuffer)
$sText = DllStructGetData($tBuffer, 1)
If StringRight($sText, 2) = @CRLF Then $sText = StringTrimRight($sText, 2)
EndIf
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pBuffer)
EndIf
Return SetError($_iCurrentError, $_iCurrentExtended, $sText)
EndFunc
Func _WinAPI_MessageBeep($iType = 1)
Local $iSound
Switch $iType
Case 1
$iSound = 0
Case 2
$iSound = 16
Case 3
$iSound = 32
Case 4
$iSound = 48
Case 5
$iSound = 64
Case Else
$iSound = -1
EndSwitch
Local $aResult = DllCall("user32.dll", "bool", "MessageBeep", "uint", $iSound)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_MsgBox($iFlags, $sTitle, $sText)
BlockInput(0)
MsgBox($iFlags, $sTitle, $sText & "      ")
EndFunc
Func _WinAPI_SetLastError($iErrorCode, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
DllCall("kernel32.dll", "none", "SetLastError", "dword", $iErrorCode)
Return SetError($_iCurrentError, $_iCurrentExtended, Null)
EndFunc
Func _WinAPI_ShowError($sText, $bExit = True)
BlockInput(0)
MsgBox($MB_SYSTEMMODAL, "Error", $sText & "      ")
If $bExit Then Exit
EndFunc
Func _WinAPI_ShowLastError($sText = '', $bAbort = False, $iLanguage = 0, Const $_iCurrentError = @error, Const $_iCurrentExtended = @extended)
Local $sError
Local $iLastError = _WinAPI_GetLastError()
While 1
$sError = _WinAPI_GetErrorMessage($iLastError, $iLanguage)
If @error And $iLanguage Then
$iLanguage = 0
Else
ExitLoop
EndIf
WEnd
If StringStripWS($sText, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sText &= @CRLF & @CRLF
Else
$sText = ''
EndIf
_WinAPI_MsgBox(BitOR(0x00040000, BitShift(0x00000010, -2 * (Not $iLastError))), $iLastError, $sText & $sError)
If $iLastError Then
_WinAPI_SetLastError($iLastError)
If $bAbort Then
Exit $iLastError
EndIf
EndIf
Return SetError($_iCurrentError, $_iCurrentExtended, 1)
EndFunc
Func _WinAPI_ShowMsg($sText)
_WinAPI_MsgBox($MB_SYSTEMMODAL, "Information", $sText)
EndFunc
Func __COMErrorFormating(ByRef $oCOMError, $sPrefix = @TAB)
Local Const $STR_STRIPTRAILING = 2
Local $sError = "COM Error encountered in " & @ScriptName & " (" & $oCOMError.Scriptline & ") :" & @CRLF &  $sPrefix & "Number        " & @TAB & "= 0x" & Hex($oCOMError.Number, 8) & " (" & $oCOMError.Number & ")" & @CRLF &  $sPrefix & "WinDescription" & @TAB & "= " & StringStripWS($oCOMError.WinDescription, $STR_STRIPTRAILING) & @CRLF &  $sPrefix & "Description   " & @TAB & "= " & StringStripWS($oCOMError.Description, $STR_STRIPTRAILING) & @CRLF &  $sPrefix & "Source        " & @TAB & "= " & $oCOMError.Source & @CRLF &  $sPrefix & "HelpFile      " & @TAB & "= " & $oCOMError.HelpFile & @CRLF &  $sPrefix & "HelpContext   " & @TAB & "= " & $oCOMError.HelpContext & @CRLF &  $sPrefix & "LastDllError  " & @TAB & "= " & $oCOMError.LastDllError & @CRLF &  $sPrefix & "Retcode       " & @TAB & "= 0x" & Hex($oCOMError.retcode)
Return $sError
EndFunc
Func _Security__AdjustTokenPrivileges($hToken, $bDisableAll, $tNewState, $iBufferLen, $tPrevState = 0, $pRequired = 0)
Local $aCall = DllCall("advapi32.dll", "bool", "AdjustTokenPrivileges", "handle", $hToken, "bool", $bDisableAll, "struct*", $tNewState, "dword", $iBufferLen, "struct*", $tPrevState, "struct*", $pRequired)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__CreateProcessWithToken($hToken, $iLogonFlags, $sCommandLine, $iCreationFlags, $sCurDir, $tSTARTUPINFO, $tPROCESS_INFORMATION)
Local $aCall = DllCall("advapi32.dll", "bool", "CreateProcessWithTokenW", "handle", $hToken, "dword", $iLogonFlags, "ptr", 0, "wstr", $sCommandLine, "dword", $iCreationFlags, "struct*", 0, "wstr", $sCurDir, "struct*", $tSTARTUPINFO, "struct*", $tPROCESS_INFORMATION)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, False)
Return True
EndFunc
Func _Security__DuplicateTokenEx($hExistingToken, $iDesiredAccess, $iImpersonationLevel, $iTokenType)
Local $aCall = DllCall("advapi32.dll", "bool", "DuplicateTokenEx", "handle", $hExistingToken, "dword", $iDesiredAccess, "struct*", 0, "int", $iImpersonationLevel, "int", $iTokenType, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[6]
EndFunc
Func _Security__GetAccountSid($sAccount, $sSystem = "")
Local $aAcct = _Security__LookupAccountName($sAccount, $sSystem)
If @error Then Return SetError(@error, @extended, 0)
If IsArray($aAcct) Then Return _Security__StringSidToSid($aAcct[0])
Return ''
EndFunc
Func _Security__GetLengthSid($pSID)
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, @extended, 0)
Local $aCall = DllCall("advapi32.dll", "dword", "GetLengthSid", "struct*", $pSID)
If @error Then Return SetError(@error, @extended, 0)
Return $aCall[0]
EndFunc
Func _Security__GetTokenInformation($hToken, $iClass)
Local $aCall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $hToken, "int", $iClass, "struct*", 0, "dword", 0, "dword*", 0)
If @error Or Not $aCall[5] Then Return SetError(@error + 10, @extended, 0)
Local $iLen = $aCall[5]
Local $tBuffer = DllStructCreate("byte[" & $iLen & "]")
$aCall = DllCall("advapi32.dll", "bool", "GetTokenInformation", "handle", $hToken, "int", $iClass, "struct*", $tBuffer, "dword", DllStructGetSize($tBuffer), "dword*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $tBuffer
EndFunc
Func _Security__ImpersonateSelf($iLevel = $SECURITYIMPERSONATION)
Local $aCall = DllCall("advapi32.dll", "bool", "ImpersonateSelf", "int", $iLevel)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__IsValidSid($pSID)
Local $aCall = DllCall("advapi32.dll", "bool", "IsValidSid", "struct*", $pSID)
If @error Then Return SetError(@error, @extended, False)
Return Not ($aCall[0] = 0)
EndFunc
Func _Security__LookupAccountName($sAccount, $sSystem = "")
Local $tData = DllStructCreate("byte SID[256]")
Local $aCall = DllCall("advapi32.dll", "bool", "LookupAccountNameW", "wstr", $sSystem, "wstr", $sAccount, "struct*", $tData, "dword*", DllStructGetSize($tData), "wstr", "", "dword*", DllStructGetSize($tData), "int*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $aAcct[3]
$aAcct[0] = _Security__SidToStringSid(DllStructGetPtr($tData, "SID"))
$aAcct[1] = $aCall[5]
$aAcct[2] = $aCall[7]
Return $aAcct
EndFunc
Func _Security__LookupAccountSid($vSID, $sSystem = "")
Local $pSID, $aAcct[3]
If IsString($vSID) Then
$pSID = _Security__StringSidToSid($vSID)
Else
$pSID = $vSID
EndIf
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, @extended, 0)
Local $sTypeSystem = "ptr"
If $sSystem Then $sTypeSystem = "wstr"
Local $aCall = DllCall("advapi32.dll", "bool", "LookupAccountSidW", $sTypeSystem, $sSystem, "struct*", $pSID, "wstr", "", "dword*", 65536, "wstr", "", "dword*", 65536, "int*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $aAcct[3]
$aAcct[0] = $aCall[3]
$aAcct[1] = $aCall[5]
$aAcct[2] = $aCall[7]
Return $aAcct
EndFunc
Func _Security__LookupPrivilegeValue($sSystem, $sName)
Local $aCall = DllCall("advapi32.dll", "bool", "LookupPrivilegeValueW", "wstr", $sSystem, "wstr", $sName, "int64*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[3]
EndFunc
Func _Security__OpenProcessToken($hProcess, $iAccess)
Local $aCall = DllCall("advapi32.dll", "bool", "OpenProcessToken", "handle", $hProcess, "dword", $iAccess, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[3]
EndFunc
Func _Security__OpenThreadToken($iAccess, $hThread = 0, $bOpenAsSelf = False)
If $hThread = 0 Then
Local $aResult = DllCall("kernel32.dll", "handle", "GetCurrentThread")
If @error Then Return SetError(@error + 10, @extended, 0)
$hThread = $aResult[0]
EndIf
Local $aCall = DllCall("advapi32.dll", "bool", "OpenThreadToken", "handle", $hThread, "dword", $iAccess, "bool", $bOpenAsSelf, "handle*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Return $aCall[4]
EndFunc
Func _Security__OpenThreadTokenEx($iAccess, $hThread = 0, $bOpenAsSelf = False)
Local $hToken = _Security__OpenThreadToken($iAccess, $hThread, $bOpenAsSelf)
If $hToken = 0 Then
Local Const $ERROR_NO_TOKEN = 1008
If _WinAPI_GetLastError() <> $ERROR_NO_TOKEN Then Return SetError(20, _WinAPI_GetLastError(), 0)
If Not _Security__ImpersonateSelf() Then Return SetError(@error + 10, _WinAPI_GetLastError(), 0)
$hToken = _Security__OpenThreadToken($iAccess, $hThread, $bOpenAsSelf)
If $hToken = 0 Then Return SetError(@error, _WinAPI_GetLastError(), 0)
EndIf
Return $hToken
EndFunc
Func _Security__SetPrivilege($hToken, $sPrivilege, $bEnable)
Local $iLUID = _Security__LookupPrivilegeValue("", $sPrivilege)
If $iLUID = 0 Then Return SetError(@error + 10, @extended, False)
Local Const $tagTOKEN_PRIVILEGES = "dword Count;align 4;int64 LUID;dword Attributes"
Local $tCurrState = DllStructCreate($tagTOKEN_PRIVILEGES)
Local $iCurrState = DllStructGetSize($tCurrState)
Local $tPrevState = DllStructCreate($tagTOKEN_PRIVILEGES)
Local $iPrevState = DllStructGetSize($tPrevState)
Local $tRequired = DllStructCreate("int Data")
DllStructSetData($tCurrState, "Count", 1)
DllStructSetData($tCurrState, "LUID", $iLUID)
If Not _Security__AdjustTokenPrivileges($hToken, False, $tCurrState, $iCurrState, $tPrevState, $tRequired) Then Return SetError(2, @error, False)
DllStructSetData($tPrevState, "Count", 1)
DllStructSetData($tPrevState, "LUID", $iLUID)
Local $iAttributes = DllStructGetData($tPrevState, "Attributes")
If $bEnable Then
$iAttributes = BitOR($iAttributes, $SE_PRIVILEGE_ENABLED)
Else
$iAttributes = BitAND($iAttributes, BitNOT($SE_PRIVILEGE_ENABLED))
EndIf
DllStructSetData($tPrevState, "Attributes", $iAttributes)
If Not _Security__AdjustTokenPrivileges($hToken, False, $tPrevState, $iPrevState, $tCurrState, $tRequired) Then  Return SetError(3, @error, False)
Return True
EndFunc
Func _Security__SetTokenInformation($hToken, $iTokenInformation, $vTokenInformation, $iTokenInformationLength)
Local $aCall = DllCall("advapi32.dll", "bool", "SetTokenInformation", "handle", $hToken, "int", $iTokenInformation, "struct*", $vTokenInformation, "dword", $iTokenInformationLength)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, False)
Return True
EndFunc
Func _Security__SidToStringSid($pSID)
If Not _Security__IsValidSid($pSID) Then Return SetError(@error + 10, 0, "")
Local $aCall = DllCall("advapi32.dll", "bool", "ConvertSidToStringSidW", "struct*", $pSID, "ptr*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, "")
Local $pStringSid = $aCall[2]
Local $aLen = DllCall("kernel32.dll", "int", "lstrlenW", "struct*", $pStringSid)
Local $sSID = DllStructGetData(DllStructCreate("wchar Text[" & $aLen[0] + 1 & "]", $pStringSid), "Text")
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pStringSid)
Return $sSID
EndFunc
Func _Security__SidTypeStr($iType)
Switch $iType
Case $SIDTYPEUSER
Return "User"
Case $SIDTYPEGROUP
Return "Group"
Case $SIDTYPEDOMAIN
Return "Domain"
Case $SIDTYPEALIAS
Return "Alias"
Case $SIDTYPEWELLKNOWNGROUP
Return "Well Known Group"
Case $SIDTYPEDELETEDACCOUNT
Return "Deleted Account"
Case $SIDTYPEINVALID
Return "Invalid"
Case $SIDTYPEUNKNOWN
Return "Unknown Type"
Case $SIDTYPECOMPUTER
Return "Computer"
Case $SIDTYPELABEL
Return "A mandatory integrity label SID"
Case Else
Return "Unknown SID Type"
EndSwitch
EndFunc
Func _Security__StringSidToSid($sSID)
Local $aCall = DllCall("advapi32.dll", "bool", "ConvertStringSidToSidW", "wstr", $sSID, "ptr*", 0)
If @error Or Not $aCall[0] Then Return SetError(@error, @extended, 0)
Local $pSID = $aCall[2]
Local $tBuffer = DllStructCreate("byte Data[" & _Security__GetLengthSid($pSID) & "]", $pSID)
Local $tSID = DllStructCreate("byte Data[" & DllStructGetSize($tBuffer) & "]")
DllStructSetData($tSID, "Data", DllStructGetData($tBuffer, "Data"))
DllCall("kernel32.dll", "handle", "LocalFree", "handle", $pSID)
Return $tSID
EndFunc
Global Const $tagPOINT = "struct;long X;long Y;endstruct"
Global Const $tagRECT = "struct;long Left;long Top;long Right;long Bottom;endstruct"
Global Const $tagSIZE = "struct;long X;long Y;endstruct"
Global Const $tagMARGINS = "int cxLeftWidth;int cxRightWidth;int cyTopHeight;int cyBottomHeight"
Global Const $tagFILETIME = "struct;dword Lo;dword Hi;endstruct"
Global Const $tagSYSTEMTIME = "struct;word Year;word Month;word Dow;word Day;word Hour;word Minute;word Second;word MSeconds;endstruct"
Global Const $tagTIME_ZONE_INFORMATION = "struct;long Bias;wchar StdName[32];word StdDate[8];long StdBias;wchar DayName[32];word DayDate[8];long DayBias;endstruct"
Global Const $tagNMHDR = "struct;hwnd hWndFrom;uint_ptr IDFrom;INT Code;endstruct"
Global Const $tagCOMBOBOXEXITEM = "uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;int SelectedImage;int OverlayImage;" &  "int Indent;lparam Param"
Global Const $tagNMCBEDRAGBEGIN = $tagNMHDR & ";int ItemID;wchar szText[260]"
Global Const $tagNMCBEENDEDIT = $tagNMHDR & ";bool fChanged;int NewSelection;wchar szText[260];int Why"
Global Const $tagNMCOMBOBOXEX = $tagNMHDR & ";uint Mask;int_ptr Item;ptr Text;int TextMax;int Image;" &  "int SelectedImage;int OverlayImage;int Indent;lparam Param"
Global Const $tagDTPRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;" &  "word MinSecond;word MinMSecond;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;" &  "word MaxMinute;word MaxSecond;word MaxMSecond;bool MinValid;bool MaxValid"
Global Const $tagNMDATETIMECHANGE = $tagNMHDR & ";dword Flag;" & $tagSYSTEMTIME
Global Const $tagNMDATETIMEFORMAT = $tagNMHDR & ";ptr Format;" & $tagSYSTEMTIME & ";ptr pDisplay;wchar Display[64]"
Global Const $tagNMDATETIMEFORMATQUERY = $tagNMHDR & ";ptr Format;struct;long SizeX;long SizeY;endstruct"
Global Const $tagNMDATETIMEKEYDOWN = $tagNMHDR & ";int VirtKey;ptr Format;" & $tagSYSTEMTIME
Global Const $tagNMDATETIMESTRING = $tagNMHDR & ";ptr UserString;" & $tagSYSTEMTIME & ";dword Flags"
Global Const $tagEVENTLOGRECORD = "dword Length;dword Reserved;dword RecordNumber;dword TimeGenerated;dword TimeWritten;dword EventID;" &  "word EventType;word NumStrings;word EventCategory;word ReservedFlags;dword ClosingRecordNumber;dword StringOffset;" &  "dword UserSidLength;dword UserSidOffset;dword DataLength;dword DataOffset"
Global Const $tagGDIP_EFFECTPARAMS_Blur = "float Radius; bool ExpandEdge"
Global Const $tagGDIP_EFFECTPARAMS_BrightnessContrast = "int BrightnessLevel; int ContrastLevel"
Global Const $tagGDIP_EFFECTPARAMS_ColorBalance = "int CyanRed; int MagentaGreen; int YellowBlue"
Global Const $tagGDIP_EFFECTPARAMS_ColorCurve = "int Adjustment; int Channel; int AdjustValue"
Global Const $tagGDIP_EFFECTPARAMS_ColorLUT = "byte LutB[256]; byte LutG[256]; byte LutR[256]; byte LutA[256]"
Global Const $tagGDIP_EFFECTPARAMS_HueSaturationLightness = "int HueLevel; int SaturationLevel; int LightnessLevel"
Global Const $tagGDIP_EFFECTPARAMS_Levels = "int Highlight; int Midtone; int Shadow"
Global Const $tagGDIP_EFFECTPARAMS_RedEyeCorrection = "uint NumberOfAreas; ptr Areas"
Global Const $tagGDIP_EFFECTPARAMS_Sharpen = "float Radius; float Amount"
Global Const $tagGDIP_EFFECTPARAMS_Tint = "int Hue; int Amount"
Global Const $tagGDIPBITMAPDATA = "uint Width;uint Height;int Stride;int Format;ptr Scan0;uint_ptr Reserved"
Global Const $tagGDIPCOLORMATRIX = "float m[25]"
Global Const $tagGDIPENCODERPARAM = "struct;byte GUID[16];ulong NumberOfValues;ulong Type;ptr Values;endstruct"
Global Const $tagGDIPENCODERPARAMS = "uint Count;" & $tagGDIPENCODERPARAM
Global Const $tagGDIPRECTF = "struct;float X;float Y;float Width;float Height;endstruct"
Global Const $tagGDIPSTARTUPINPUT = "uint Version;ptr Callback;bool NoThread;bool NoCodecs"
Global Const $tagGDIPSTARTUPOUTPUT = "ptr HookProc;ptr UnhookProc"
Global Const $tagGDIPIMAGECODECINFO = "byte CLSID[16];byte FormatID[16];ptr CodecName;ptr DllName;ptr FormatDesc;ptr FileExt;" &  "ptr MimeType;dword Flags;dword Version;dword SigCount;dword SigSize;ptr SigPattern;ptr SigMask"
Global Const $tagGDIPPENCODERPARAMS = "uint Count;byte Params[1]"
Global Const $tagHDITEM = "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State"
Global Const $tagNMHDDISPINFO = $tagNMHDR & ";int Item;uint Mask;ptr Text;int TextMax;int Image;lparam lParam"
Global Const $tagNMHDFILTERBTNCLICK = $tagNMHDR & ";int Item;" & $tagRECT
Global Const $tagNMHEADER = $tagNMHDR & ";int Item;int Button;ptr pItem"
Global Const $tagGETIPAddress = "byte Field4;byte Field3;byte Field2;byte Field1"
Global Const $tagNMIPADDRESS = $tagNMHDR & ";int Field;int Value"
Global Const $tagLVFINDINFO = "struct;uint Flags;ptr Text;lparam Param;" & $tagPOINT & ";uint Direction;endstruct"
Global Const $tagLVHITTESTINFO = $tagPOINT & ";uint Flags;int Item;int SubItem;int iGroup"
Global Const $tagLVITEM = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" &  "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
Global Const $tagNMLISTVIEW = $tagNMHDR & ";int Item;int SubItem;uint NewState;uint OldState;uint Changed;" &  "struct;long ActionX;long ActionY;endstruct;lparam Param"
Global Const $tagNMLVCUSTOMDRAW = "struct;" & $tagNMHDR & ";dword dwDrawStage;handle hdc;" & $tagRECT &  ";dword_ptr dwItemSpec;uint uItemState;lparam lItemlParam;endstruct" &  ";dword clrText;dword clrTextBk;int iSubItem;dword dwItemType;dword clrFace;int iIconEffect;" &  "int iIconPhase;int iPartID;int iStateID;struct;long TextLeft;long TextTop;long TextRight;long TextBottom;endstruct;uint uAlign"
Global Const $tagNMLVDISPINFO = $tagNMHDR & ";" & $tagLVITEM
Global Const $tagNMLVFINDITEM = $tagNMHDR & ";int Start;" & $tagLVFINDINFO
Global Const $tagNMLVGETINFOTIP = $tagNMHDR & ";dword Flags;ptr Text;int TextMax;int Item;int SubItem;lparam lParam"
Global Const $tagNMITEMACTIVATE = $tagNMHDR & ";int Index;int SubItem;uint NewState;uint OldState;uint Changed;" &  $tagPOINT & ";lparam lParam;uint KeyFlags"
Global Const $tagNMLVKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagNMLVSCROLL = $tagNMHDR & ";int DX;int DY"
Global Const $tagMCHITTESTINFO = "uint Size;" & $tagPOINT & ";uint Hit;" & $tagSYSTEMTIME &  ";" & $tagRECT & ";int iOffset;int iRow;int iCol"
Global Const $tagMCMONTHRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds;short Span"
Global Const $tagMCRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds;short MinSet;short MaxSet"
Global Const $tagMCSELRANGE = "word MinYear;word MinMonth;word MinDOW;word MinDay;word MinHour;word MinMinute;word MinSecond;" &  "word MinMSeconds;word MaxYear;word MaxMonth;word MaxDOW;word MaxDay;word MaxHour;word MaxMinute;word MaxSecond;" &  "word MaxMSeconds"
Global Const $tagNMDAYSTATE = $tagNMHDR & ";" & $tagSYSTEMTIME & ";int DayState;ptr pDayState"
Global Const $tagNMSELCHANGE = $tagNMHDR &  ";struct;word BegYear;word BegMonth;word BegDOW;word BegDay;word BegHour;word BegMinute;word BegSecond;word BegMSeconds;endstruct;" &  "struct;word EndYear;word EndMonth;word EndDOW;word EndDay;word EndHour;word EndMinute;word EndSecond;word EndMSeconds;endstruct"
Global Const $tagNMOBJECTNOTIFY = $tagNMHDR & ";int Item;ptr piid;ptr pObject;long Result;dword dwFlags"
Global Const $tagNMTCKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagTVITEM = "struct;uint Mask;handle hItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;int SelectedImage;" &  "int Children;lparam Param;endstruct"
Global Const $tagTVITEMEX = "struct;" & $tagTVITEM & ";int Integral;uint uStateEx;hwnd hwnd;int iExpandedImage;int iReserved;endstruct"
Global Const $tagNMTREEVIEW = $tagNMHDR & ";uint Action;" &  "struct;uint OldMask;handle OldhItem;uint OldState;uint OldStateMask;" &  "ptr OldText;int OldTextMax;int OldImage;int OldSelectedImage;int OldChildren;lparam OldParam;endstruct;" &  "struct;uint NewMask;handle NewhItem;uint NewState;uint NewStateMask;" &  "ptr NewText;int NewTextMax;int NewImage;int NewSelectedImage;int NewChildren;lparam NewParam;endstruct;" &  "struct;long PointX;long PointY;endstruct"
Global Const $tagNMTVCUSTOMDRAW = "struct;" & $tagNMHDR & ";dword DrawStage;handle HDC;" & $tagRECT &  ";dword_ptr ItemSpec;uint ItemState;lparam ItemParam;endstruct" &  ";dword ClrText;dword ClrTextBk;int Level"
Global Const $tagNMTVDISPINFO = $tagNMHDR & ";" & $tagTVITEM
Global Const $tagNMTVGETINFOTIP = $tagNMHDR & ";ptr Text;int TextMax;handle hItem;lparam lParam"
Global Const $tagNMTVITEMCHANGE = $tagNMHDR & ";uint Changed;handle hItem;uint StateNew;uint StateOld;lparam lParam;"
Global Const $tagTVHITTESTINFO = $tagPOINT & ";uint Flags;handle Item"
Global Const $tagNMTVKEYDOWN = "align 1;" & $tagNMHDR & ";word VKey;uint Flags"
Global Const $tagNMMOUSE = $tagNMHDR & ";dword_ptr ItemSpec;dword_ptr ItemData;" & $tagPOINT & ";lparam HitInfo"
Global Const $tagTOKEN_PRIVILEGES = "dword Count;align 4;int64 LUID;dword Attributes"
Global Const $tagIMAGEINFO = "handle hBitmap;handle hMask;int Unused1;int Unused2;" & $tagRECT
Global Const $tagMENUINFO = "dword Size;INT Mask;dword Style;uint YMax;handle hBack;dword ContextHelpID;ulong_ptr MenuData"
Global Const $tagMENUITEMINFO = "uint Size;uint Mask;uint Type;uint State;uint ID;handle SubMenu;handle BmpChecked;handle BmpUnchecked;" &  "ulong_ptr ItemData;ptr TypeData;uint CCH;handle BmpItem"
Global Const $tagREBARBANDINFO = "uint cbSize;uint fMask;uint fStyle;dword clrFore;dword clrBack;ptr lpText;uint cch;" &  "int iImage;hwnd hwndChild;uint cxMinChild;uint cyMinChild;uint cx;handle hbmBack;uint wID;uint cyChild;uint cyMaxChild;" &  "uint cyIntegral;uint cxIdeal;lparam lParam;uint cxHeader" & ((@OSVersion = "WIN_XP") ? "" : ";" & $tagRECT & ";uint uChevronState")
Global Const $tagNMREBARAUTOBREAK = $tagNMHDR & ";uint uBand;uint wID;lparam lParam;uint uMsg;uint fStyleCurrent;bool fAutoBreak"
Global Const $tagNMRBAUTOSIZE = $tagNMHDR & ";bool fChanged;" &  "struct;long TargetLeft;long TargetTop;long TargetRight;long TargetBottom;endstruct;" &  "struct;long ActualLeft;long ActualTop;long ActualRight;long ActualBottom;endstruct"
Global Const $tagNMREBAR = $tagNMHDR & ";dword dwMask;uint uBand;uint fStyle;uint wID;lparam lParam"
Global Const $tagNMREBARCHEVRON = $tagNMHDR & ";uint uBand;uint wID;lparam lParam;" & $tagRECT & ";lparam lParamNM"
Global Const $tagNMREBARCHILDSIZE = $tagNMHDR & ";uint uBand;uint wID;" &  "struct;long CLeft;long CTop;long CRight;long CBottom;endstruct;" &  "struct;long BLeft;long BTop;long BRight;long BBottom;endstruct"
Global Const $tagCOLORSCHEME = "dword Size;dword BtnHighlight;dword BtnShadow"
Global Const $tagNMTOOLBAR = $tagNMHDR & ";int iItem;" &  "struct;int iBitmap;int idCommand;byte fsState;byte fsStyle;dword_ptr dwData;int_ptr iString;endstruct" &  ";int cchText;ptr pszText;" & $tagRECT
Global Const $tagNMTBHOTITEM = $tagNMHDR & ";int idOld;int idNew;dword dwFlags"
Global Const $tagTBBUTTON = "int Bitmap;int Command;byte State;byte Style;dword_ptr Param;int_ptr String"
Global Const $tagTBBUTTONINFO = "uint Size;dword Mask;int Command;int Image;byte State;byte Style;word CX;dword_ptr Param;ptr Text;int TextMax"
Global Const $tagNETRESOURCE = "dword Scope;dword Type;dword DisplayType;dword Usage;ptr LocalName;ptr RemoteName;ptr Comment;ptr Provider"
Global Const $tagOVERLAPPED = "ulong_ptr Internal;ulong_ptr InternalHigh;struct;dword Offset;dword OffsetHigh;endstruct;handle hEvent"
Global Const $tagOPENFILENAME = "dword StructSize;hwnd hwndOwner;handle hInstance;ptr lpstrFilter;ptr lpstrCustomFilter;" &  "dword nMaxCustFilter;dword nFilterIndex;ptr lpstrFile;dword nMaxFile;ptr lpstrFileTitle;dword nMaxFileTitle;" &  "ptr lpstrInitialDir;ptr lpstrTitle;dword Flags;word nFileOffset;word nFileExtension;ptr lpstrDefExt;lparam lCustData;" &  "ptr lpfnHook;ptr lpTemplateName;ptr pvReserved;dword dwReserved;dword FlagsEx"
Global Const $tagBITMAPINFOHEADER = "struct;dword biSize;long biWidth;long biHeight;word biPlanes;word biBitCount;" &  "dword biCompression;dword biSizeImage;long biXPelsPerMeter;long biYPelsPerMeter;dword biClrUsed;dword biClrImportant;endstruct"
Global Const $tagBITMAPINFO = $tagBITMAPINFOHEADER & ";dword biRGBQuad[1]"
Global Const $tagBLENDFUNCTION = "byte Op;byte Flags;byte Alpha;byte Format"
Global Const $tagGUID = "struct;ulong Data1;ushort Data2;ushort Data3;byte Data4[8];endstruct"
Global Const $tagWINDOWPLACEMENT = "uint length;uint flags;uint showCmd;long ptMinPosition[2];long ptMaxPosition[2];long rcNormalPosition[4]"
Global Const $tagWINDOWPOS = "hwnd hWnd;hwnd InsertAfter;int X;int Y;int CX;int CY;uint Flags"
Global Const $tagSCROLLINFO = "uint cbSize;uint fMask;int nMin;int nMax;uint nPage;int nPos;int nTrackPos"
Global Const $tagSCROLLBARINFO = "dword cbSize;" & $tagRECT & ";int dxyLineButton;int xyThumbTop;" &  "int xyThumbBottom;int reserved;dword rgstate[6]"
Global Const $tagLOGFONT = "struct;long Height;long Width;long Escapement;long Orientation;long Weight;byte Italic;byte Underline;" &  "byte Strikeout;byte CharSet;byte OutPrecision;byte ClipPrecision;byte Quality;byte PitchAndFamily;wchar FaceName[32];endstruct"
Global Const $tagKBDLLHOOKSTRUCT = "dword vkCode;dword scanCode;dword flags;dword time;ulong_ptr dwExtraInfo"
Global Const $tagPROCESS_INFORMATION = "handle hProcess;handle hThread;dword ProcessID;dword ThreadID"
Global Const $tagSTARTUPINFO = "dword Size;ptr Reserved1;ptr Desktop;ptr Title;dword X;dword Y;dword XSize;dword YSize;dword XCountChars;" &  "dword YCountChars;dword FillAttribute;dword Flags;word ShowWindow;word Reserved2;ptr Reserved3;handle StdInput;" &  "handle StdOutput;handle StdError"
Global Const $tagSECURITY_ATTRIBUTES = "dword Length;ptr Descriptor;bool InheritHandle"
Global Const $tagWIN32_FIND_DATA = "dword dwFileAttributes;dword ftCreationTime[2];dword ftLastAccessTime[2];dword ftLastWriteTime[2];dword nFileSizeHigh;dword nFileSizeLow;dword dwReserved0;dword dwReserved1;wchar cFileName[260];wchar cAlternateFileName[14]"
Global Const $tagTEXTMETRIC = "long tmHeight;long tmAscent;long tmDescent;long tmInternalLeading;long tmExternalLeading;" &  "long tmAveCharWidth;long tmMaxCharWidth;long tmWeight;long tmOverhang;long tmDigitizedAspectX;long tmDigitizedAspectY;" &  "wchar tmFirstChar;wchar tmLastChar;wchar tmDefaultChar;wchar tmBreakChar;byte tmItalic;byte tmUnderlined;byte tmStruckOut;" &  "byte tmPitchAndFamily;byte tmCharSet"
Global Const $tagMEMMAP = "handle hProc;ulong_ptr Size;ptr Mem"
Func _MemFree(ByRef $tMemMap)
Local $pMemory = DllStructGetData($tMemMap, "Mem")
Local $hProcess = DllStructGetData($tMemMap, "hProc")
Local $bResult = _MemVirtualFreeEx($hProcess, $pMemory, 0, $MEM_RELEASE)
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hProcess)
If @error Then Return SetError(@error, @extended, False)
Return $bResult
EndFunc
Func _MemGlobalAlloc($iBytes, $iFlags = 0)
Local $aResult = DllCall("kernel32.dll", "handle", "GlobalAlloc", "uint", $iFlags, "ulong_ptr", $iBytes)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalFree($hMemory)
Local $aResult = DllCall("kernel32.dll", "ptr", "GlobalFree", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemGlobalLock($hMemory)
Local $aResult = DllCall("kernel32.dll", "ptr", "GlobalLock", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalSize($hMemory)
Local $aResult = DllCall("kernel32.dll", "ulong_ptr", "GlobalSize", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemGlobalUnlock($hMemory)
Local $aResult = DllCall("kernel32.dll", "bool", "GlobalUnlock", "handle", $hMemory)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemInit($hWnd, $iSize, ByRef $tMemMap)
Local $aResult = DllCall("user32.dll", "dword", "GetWindowThreadProcessId", "hwnd", $hWnd, "dword*", 0)
If @error Then Return SetError(@error + 10, @extended, 0)
Local $iProcessID = $aResult[2]
If $iProcessID = 0 Then Return SetError(1, 0, 0)
Local $iAccess = BitOR($PROCESS_VM_OPERATION, $PROCESS_VM_READ, $PROCESS_VM_WRITE)
Local $hProcess = __Mem_OpenProcess($iAccess, False, $iProcessID, True)
Local $iAlloc = BitOR($MEM_RESERVE, $MEM_COMMIT)
Local $pMemory = _MemVirtualAllocEx($hProcess, 0, $iSize, $iAlloc, $PAGE_READWRITE)
If $pMemory = 0 Then Return SetError(2, 0, 0)
$tMemMap = DllStructCreate($tagMEMMAP)
DllStructSetData($tMemMap, "hProc", $hProcess)
DllStructSetData($tMemMap, "Size", $iSize)
DllStructSetData($tMemMap, "Mem", $pMemory)
Return $pMemory
EndFunc
Func _MemMoveMemory($pSource, $pDest, $iLength)
DllCall("kernel32.dll", "none", "RtlMoveMemory", "struct*", $pDest, "struct*", $pSource, "ulong_ptr", $iLength)
If @error Then Return SetError(@error, @extended)
EndFunc
Func _MemRead(ByRef $tMemMap, $pSrce, $pDest, $iSize)
Local $aResult = DllCall("kernel32.dll", "bool", "ReadProcessMemory", "handle", DllStructGetData($tMemMap, "hProc"),  "ptr", $pSrce, "struct*", $pDest, "ulong_ptr", $iSize, "ulong_ptr*", 0)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemWrite(ByRef $tMemMap, $pSrce, $pDest = 0, $iSize = 0, $sSrce = "struct*")
If $pDest = 0 Then $pDest = DllStructGetData($tMemMap, "Mem")
If $iSize = 0 Then $iSize = DllStructGetData($tMemMap, "Size")
Local $aResult = DllCall("kernel32.dll", "bool", "WriteProcessMemory", "handle", DllStructGetData($tMemMap, "hProc"),  "ptr", $pDest, $sSrce, $pSrce, "ulong_ptr", $iSize, "ulong_ptr*", 0)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemVirtualAlloc($pAddress, $iSize, $iAllocation, $iProtect)
Local $aResult = DllCall("kernel32.dll", "ptr", "VirtualAlloc", "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iAllocation, "dword", $iProtect)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemVirtualAllocEx($hProcess, $pAddress, $iSize, $iAllocation, $iProtect)
Local $aResult = DllCall("kernel32.dll", "ptr", "VirtualAllocEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iAllocation, "dword", $iProtect)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _MemVirtualFree($pAddress, $iSize, $iFreeType)
Local $aResult = DllCall("kernel32.dll", "bool", "VirtualFree", "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iFreeType)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _MemVirtualFreeEx($hProcess, $pAddress, $iSize, $iFreeType)
Local $aResult = DllCall("kernel32.dll", "bool", "VirtualFreeEx", "handle", $hProcess, "ptr", $pAddress, "ulong_ptr", $iSize, "dword", $iFreeType)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func __Mem_OpenProcess($iAccess, $bInherit, $iPID, $bDebugPriv = False)
Local $aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $bInherit, "dword", $iPID)
If @error Then Return SetError(@error, @extended, 0)
If $aResult[0] Then Return $aResult[0]
If Not $bDebugPriv Then Return SetError(100, 0, 0)
Local $hToken = _Security__OpenThreadTokenEx(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
If @error Then Return SetError(@error + 10, @extended, 0)
_Security__SetPrivilege($hToken, "SeDebugPrivilege", True)
Local $iError = @error
Local $iExtended = @extended
Local $iRet = 0
If Not @error Then
$aResult = DllCall("kernel32.dll", "handle", "OpenProcess", "dword", $iAccess, "bool", $bInherit, "dword", $iPID)
$iError = @error
$iExtended = @extended
If $aResult[0] Then $iRet = $aResult[0]
_Security__SetPrivilege($hToken, "SeDebugPrivilege", False)
If @error Then
$iError = @error + 20
$iExtended = @extended
EndIf
Else
$iError = @error + 30
EndIf
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hToken)
Return SetError($iError, $iExtended, $iRet)
EndFunc
Global Const $FC_NOOVERWRITE = 0
Global Const $FC_OVERWRITE = 1
Global Const $FC_CREATEPATH = 8
Global Const $FT_MODIFIED = 0
Global Const $FT_CREATED = 1
Global Const $FT_ACCESSED = 2
Global Const $FT_ARRAY = 0
Global Const $FT_STRING = 1
Global Const $FSF_CREATEBUTTON = 1
Global Const $FSF_NEWDIALOG = 2
Global Const $FSF_EDITCONTROL = 4
Global Const $FT_NONRECURSIVE = 0
Global Const $FT_RECURSIVE = 1
Global Const $FO_READ = 0
Global Const $FO_APPEND = 1
Global Const $FO_OVERWRITE = 2
Global Const $FO_CREATEPATH = 8
Global Const $FO_BINARY = 16
Global Const $FO_UNICODE = 32
Global Const $FO_UTF16_LE = 32
Global Const $FO_UTF16_BE = 64
Global Const $FO_UTF8 = 128
Global Const $FO_UTF8_NOBOM = 256
Global Const $FO_ANSI = 512
Global Const $FO_UTF16_LE_NOBOM = 1024
Global Const $FO_UTF16_BE_NOBOM = 2048
Global Const $FO_UTF8_FULL = 16384
Global Const $FO_FULLFILE_DETECT = 16384
Global Const $EOF = -1
Global Const $FD_FILEMUSTEXIST = 1
Global Const $FD_PATHMUSTEXIST = 2
Global Const $FD_MULTISELECT = 4
Global Const $FD_PROMPTCREATENEW = 8
Global Const $FD_PROMPTOVERWRITE = 16
Global Const $CREATE_NEW = 1
Global Const $CREATE_ALWAYS = 2
Global Const $OPEN_EXISTING = 3
Global Const $OPEN_ALWAYS = 4
Global Const $TRUNCATE_EXISTING = 5
Global Const $INVALID_SET_FILE_POINTER = -1
Global Const $FILE_BEGIN = 0
Global Const $FILE_CURRENT = 1
Global Const $FILE_END = 2
Global Const $FILE_ATTRIBUTE_READONLY = 0x00000001
Global Const $FILE_ATTRIBUTE_HIDDEN = 0x00000002
Global Const $FILE_ATTRIBUTE_SYSTEM = 0x00000004
Global Const $FILE_ATTRIBUTE_DIRECTORY = 0x00000010
Global Const $FILE_ATTRIBUTE_ARCHIVE = 0x00000020
Global Const $FILE_ATTRIBUTE_DEVICE = 0x00000040
Global Const $FILE_ATTRIBUTE_NORMAL = 0x00000080
Global Const $FILE_ATTRIBUTE_TEMPORARY = 0x00000100
Global Const $FILE_ATTRIBUTE_SPARSE_FILE = 0x00000200
Global Const $FILE_ATTRIBUTE_REPARSE_POINT = 0x00000400
Global Const $FILE_ATTRIBUTE_COMPRESSED = 0x00000800
Global Const $FILE_ATTRIBUTE_OFFLINE = 0x00001000
Global Const $FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 0x00002000
Global Const $FILE_ATTRIBUTE_ENCRYPTED = 0x00004000
Global Const $FILE_SHARE_READ = 0x00000001
Global Const $FILE_SHARE_WRITE = 0x00000002
Global Const $FILE_SHARE_DELETE = 0x00000004
Global Const $FILE_SHARE_READWRITE = BitOR($FILE_SHARE_READ, $FILE_SHARE_WRITE)
Global Const $FILE_SHARE_ANY = BitOR($FILE_SHARE_READ, $FILE_SHARE_WRITE, $FILE_SHARE_DELETE)
Global Const $GENERIC_ALL = 0x10000000
Global Const $GENERIC_EXECUTE = 0x20000000
Global Const $GENERIC_WRITE = 0x40000000
Global Const $GENERIC_READ = 0x80000000
Global Const $GENERIC_READWRITE = BitOR($GENERIC_READ, $GENERIC_WRITE)
Global Const $FILE_ENCODING_UTF16LE = 32
Global Const $FE_ENTIRE_UTF8 = 1
Global Const $FE_PARTIALFIRST_UTF8 = 2
Global Const $FN_FULLPATH = 0
Global Const $FN_RELATIVEPATH = 1
Global Const $FV_COMMENTS = "Comments"
Global Const $FV_COMPANYNAME = "CompanyName"
Global Const $FV_FILEDESCRIPTION = "FileDescription"
Global Const $FV_FILEVERSION = "FileVersion"
Global Const $FV_INTERNALNAME = "InternalName"
Global Const $FV_LEGALCOPYRIGHT = "LegalCopyright"
Global Const $FV_LEGALTRADEMARKS = "LegalTrademarks"
Global Const $FV_ORIGINALFILENAME = "OriginalFilename"
Global Const $FV_PRODUCTNAME = "ProductName"
Global Const $FV_PRODUCTVERSION = "ProductVersion"
Global Const $FV_PRIVATEBUILD = "PrivateBuild"
Global Const $FV_SPECIALBUILD = "SpecialBuild"
Global Const $FRTA_NOCOUNT = 0
Global Const $FRTA_COUNT = 1
Global Const $FRTA_INTARRAYS = 2
Global Const $FRTA_ENTIRESPLIT = 4
Global Const $FLTA_FILESFOLDERS = 0
Global Const $FLTA_FILES = 1
Global Const $FLTA_FOLDERS = 2
Global Const $FLTAR_FILESFOLDERS = 0
Global Const $FLTAR_FILES = 1
Global Const $FLTAR_FOLDERS = 2
Global Const $FLTAR_NOHIDDEN = 4
Global Const $FLTAR_NOSYSTEM = 8
Global Const $FLTAR_NOLINK = 16
Global Const $FLTAR_NORECUR = 0
Global Const $FLTAR_RECUR = 1
Global Const $FLTAR_NOSORT = 0
Global Const $FLTAR_SORT = 1
Global Const $FLTAR_FASTSORT = 2
Global Const $FLTAR_NOPATH = 0
Global Const $FLTAR_RELPATH = 1
Global Const $FLTAR_FULLPATH = 2
Global Const $PATH_ORIGINAL = 0
Global Const $PATH_DRIVE = 1
Global Const $PATH_DIRECTORY = 2
Global Const $PATH_FILENAME = 3
Global Const $PATH_EXTENSION = 4
#Region Global Variables and Constants
Global $__g_vEnum, $__g_vExt = 0
Global $__g_iRGBMode = 1
Global Const $tagOSVERSIONINFO = 'struct;dword OSVersionInfoSize;dword MajorVersion;dword MinorVersion;dword BuildNumber;dword PlatformId;wchar CSDVersion[128];endstruct'
Global Const $IMAGE_BITMAP = 0
Global Const $IMAGE_ICON = 1
Global Const $IMAGE_CURSOR = 2
Global Const $IMAGE_ENHMETAFILE = 3
Global Const $LR_DEFAULTCOLOR = 0x0000
Global Const $LR_MONOCHROME = 0x0001
Global Const $LR_COLOR = 0x0002
Global Const $LR_COPYRETURNORG = 0x0004
Global Const $LR_COPYDELETEORG = 0x0008
Global Const $LR_LOADFROMFILE = 0x0010
Global Const $LR_LOADTRANSPARENT = 0x0020
Global Const $LR_DEFAULTSIZE = 0x0040
Global Const $LR_VGACOLOR = 0x0080
Global Const $LR_LOADMAP3DCOLORS = 0x1000
Global Const $LR_CREATEDIBSECTION = 0x2000
Global Const $LR_COPYFROMRESOURCE = 0x4000
Global Const $LR_SHARED = 0x8000
Global Const $__tagCURSORINFO = "dword Size;dword Flags;handle hCursor;" & "struct;long X;long Y;endstruct"
Global Const $__WINVER = __WINVER()
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CreateFile($sFileName, $iCreation, $iAccess = 4, $iShare = 0, $iAttributes = 0, $tSecurity = 0)
Local $iDA = 0, $iSM = 0, $iCD = 0, $iFA = 0
If BitAND($iAccess, 1) <> 0 Then $iDA = BitOR($iDA, $GENERIC_EXECUTE)
If BitAND($iAccess, 2) <> 0 Then $iDA = BitOR($iDA, $GENERIC_READ)
If BitAND($iAccess, 4) <> 0 Then $iDA = BitOR($iDA, $GENERIC_WRITE)
If BitAND($iShare, 1) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_DELETE)
If BitAND($iShare, 2) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_READ)
If BitAND($iShare, 4) <> 0 Then $iSM = BitOR($iSM, $FILE_SHARE_WRITE)
Switch $iCreation
Case 0
$iCD = $CREATE_NEW
Case 1
$iCD = $CREATE_ALWAYS
Case 2
$iCD = $OPEN_EXISTING
Case 3
$iCD = $OPEN_ALWAYS
Case 4
$iCD = $TRUNCATE_EXISTING
EndSwitch
If BitAND($iAttributes, 1) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_ARCHIVE)
If BitAND($iAttributes, 2) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_HIDDEN)
If BitAND($iAttributes, 4) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_READONLY)
If BitAND($iAttributes, 8) <> 0 Then $iFA = BitOR($iFA, $FILE_ATTRIBUTE_SYSTEM)
Local $aResult = DllCall("kernel32.dll", "handle", "CreateFileW", "wstr", $sFileName, "dword", $iDA, "dword", $iSM,  "struct*", $tSecurity, "dword", $iCD, "dword", $iFA, "ptr", 0)
If @error Or ($aResult[0] = Ptr(-1)) Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_FreeLibrary($hModule)
Local $aResult = DllCall("kernel32.dll", "bool", "FreeLibrary", "handle", $hModule)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_GetCursorInfo()
Local $tCursor = DllStructCreate($__tagCURSORINFO)
Local $iCursor = DllStructGetSize($tCursor)
DllStructSetData($tCursor, "Size", $iCursor)
Local $aRet = DllCall("user32.dll", "bool", "GetCursorInfo", "struct*", $tCursor)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, 0)
Local $aCursor[5]
$aCursor[0] = True
$aCursor[1] = DllStructGetData($tCursor, "Flags") <> 0
$aCursor[2] = DllStructGetData($tCursor, "hCursor")
$aCursor[3] = DllStructGetData($tCursor, "X")
$aCursor[4] = DllStructGetData($tCursor, "Y")
Return $aCursor
EndFunc
Func _WinAPI_GetDlgCtrlID($hWnd)
Local $aResult = DllCall("user32.dll", "int", "GetDlgCtrlID", "hwnd", $hWnd)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetModuleHandle($sModuleName)
Local $sModuleNameType = "wstr"
If $sModuleName = "" Then
$sModuleName = 0
$sModuleNameType = "ptr"
EndIf
Local $aResult = DllCall("kernel32.dll", "handle", "GetModuleHandleW", $sModuleNameType, $sModuleName)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetString($pString, $bUnicode = True)
Local $iLength = _WinAPI_StrLen($pString, $bUnicode)
If @error Or Not $iLength Then Return SetError(@error + 10, @extended, '')
Local $tString = DllStructCreate(($bUnicode ? 'wchar' : 'char') & '[' & ($iLength + 1) & ']', $pString)
If @error Then Return SetError(@error, @extended, '')
Return SetExtended($iLength, DllStructGetData($tString, 1))
EndFunc
Func _WinAPI_IsWow64Process($iPID = 0)
If Not $iPID Then $iPID = @AutoItPID
Local $hProcess = DllCall('kernel32.dll', 'handle', 'OpenProcess', 'dword', ($__WINVER < 0x0600 ? 0x00000400 : 0x00001000),  'bool', 0, 'dword', $iPID)
If @error Or Not $hProcess[0] Then Return SetError(@error + 20, @extended, False)
Local $aRet = DllCall('kernel32.dll', 'bool', 'IsWow64Process', 'handle', $hProcess[0], 'bool*', 0)
If __CheckErrorCloseHandle($aRet, $hProcess[0]) Then Return SetError(@error, @extended, False)
Return $aRet[2]
EndFunc
Func _WinAPI_LoadImage($hInstance, $sImage, $iType, $iXDesired, $iYDesired, $iLoad)
Local $aResult, $sImageType = "int"
If IsString($sImage) Then $sImageType = "wstr"
$aResult = DllCall("user32.dll", "handle", "LoadImageW", "handle", $hInstance, $sImageType, $sImage, "uint", $iType,  "int", $iXDesired, "int", $iYDesired, "uint", $iLoad)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_LoadLibrary($sFileName)
Local $aResult = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sFileName)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_PathIsDirectory($sFilePath)
Local $aRet = DllCall('shlwapi.dll', 'bool', 'PathIsDirectoryW', 'wstr', $sFilePath)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
Func _WinAPI_ReadFile($hFile, $pBuffer, $iToRead, ByRef $iRead, $tOverlapped = 0)
Local $aResult = DllCall("kernel32.dll", "bool", "ReadFile", "handle", $hFile, "struct*", $pBuffer, "dword", $iToRead,  "dword*", 0, "struct*", $tOverlapped)
If @error Then Return SetError(@error, @extended, False)
$iRead = $aResult[4]
Return $aResult[0]
EndFunc
Func _WinAPI_StrLen($pString, $bUnicode = True)
Local $W = ''
If $bUnicode Then $W = 'W'
Local $aRet = DllCall('kernel32.dll', 'int', 'lstrlen' & $W, 'struct*', $pString)
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_SwitchColor($iColor)
If $iColor = -1 Then Return $iColor
Return BitOR(BitAND($iColor, 0x00FF00), BitShift(BitAND($iColor, 0x0000FF), -16), BitShift(BitAND($iColor, 0xFF0000), 16))
EndFunc
Func _WinAPI_WriteFile($hFile, $pBuffer, $iToWrite, ByRef $iWritten, $tOverlapped = 0)
Local $aResult = DllCall("kernel32.dll", "bool", "WriteFile", "handle", $hFile, "struct*", $pBuffer, "dword", $iToWrite,  "dword*", 0, "struct*", $tOverlapped)
If @error Then Return SetError(@error, @extended, False)
$iWritten = $aResult[4]
Return $aResult[0]
EndFunc
#EndRegion Public Functions
#Region Internal Functions
Func __CheckErrorArrayBounds(Const ByRef $aData, ByRef $iStart, ByRef $iEnd, $nDim = 1, $iDim = $UBOUND_DIMENSIONS)
If Not IsArray($aData) Then Return SetError(1, 0, 1)
If UBound($aData, $iDim) <> $nDim Then Return SetError(2, 0, 1)
If $iStart < 0 Then $iStart = 0
Local $iUBound = UBound($aData) - 1
If $iEnd < 1 Or $iEnd > $iUBound Then $iEnd = $iUBound
If $iStart > $iEnd Then Return SetError(4, 0, 1)
Return 0
EndFunc
Func __CheckErrorCloseHandle($aRet, $hFile, $bLastError = False, $iCurErr = @error, $iCurExt = @extended)
If Not $iCurErr And Not $aRet[0] Then $iCurErr = 10
Local $aLastError = DllCall("kernel32.dll", "dword", "GetLastError")
DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hFile)
If $iCurErr Then DllCall("kernel32.dll", "none", "SetLastError", "dword", $aLastError[0])
If $bLastError Then $iCurExt = $aLastError[0]
Return SetError($iCurErr, $iCurExt, $iCurErr)
EndFunc
Func __DLL($sPath, $bPin = False)
Local $aRet = DllCall('kernel32.dll', 'bool', 'GetModuleHandleExW', 'dword', ($bPin ? 0x0001 : 0x0002), "wstr", $sPath, 'ptr*', 0)
If Not $aRet[3] Then
Local $aResult = DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sPath)
If Not $aResult[0] Then Return 0
EndIf
Return 1
EndFunc
Func __EnumWindowsProc($hWnd, $bVisible)
Local $aResult
If $bVisible Then
$aResult = DllCall("user32.dll", "bool", "IsWindowVisible", "hwnd", $hWnd)
If Not $aResult[0] Then
Return 1
EndIf
EndIf
__Inc($__g_vEnum)
$__g_vEnum[$__g_vEnum[0][0]][0] = $hWnd
$aResult = DllCall("user32.dll", "int", "GetClassNameW", "hwnd", $hWnd, "wstr", "", "int", 4096)
$__g_vEnum[$__g_vEnum[0][0]][1] = $aResult[2]
Return 1
EndFunc
Func __FatalExit($iCode, $sText = '')
If $sText Then MsgBox($MB_SYSTEMMODAL, 'AutoIt', $sText)
DllCall('kernel32.dll', 'none', 'FatalExit', 'int', $iCode)
EndFunc
Func __Inc(ByRef $aData, $iIncrement = 100)
Select
Case UBound($aData, $UBOUND_COLUMNS)
If $iIncrement < 0 Then
ReDim $aData[$aData[0][0] + 1][UBound($aData, $UBOUND_COLUMNS)]
Else
$aData[0][0] += 1
If $aData[0][0] > UBound($aData) - 1 Then
ReDim $aData[$aData[0][0] + $iIncrement][UBound($aData, $UBOUND_COLUMNS)]
EndIf
EndIf
Case UBound($aData, $UBOUND_ROWS)
If $iIncrement < 0 Then
ReDim $aData[$aData[0] + 1]
Else
$aData[0] += 1
If $aData[0] > UBound($aData) - 1 Then
ReDim $aData[$aData[0] + $iIncrement]
EndIf
EndIf
Case Else
Return 0
EndSelect
Return 1
EndFunc
Func __RGB($iColor)
If $__g_iRGBMode Then
$iColor = _WinAPI_SwitchColor($iColor)
EndIf
Return $iColor
EndFunc
Func __WINVER()
Local $tOSVI = DllStructCreate($tagOSVERSIONINFO)
DllStructSetData($tOSVI, 1, DllStructGetSize($tOSVI))
Local $aRet = DllCall('kernel32.dll', 'bool', 'GetVersionExW', 'struct*', $tOSVI)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return BitOR(BitShift(DllStructGetData($tOSVI, 2), -8), DllStructGetData($tOSVI, 3))
EndFunc
#EndRegion Internal Functions
#Region Global Variables and Constants
Global Const $DUPLICATE_CLOSE_SOURCE = 0x00000001
Global Const $DUPLICATE_SAME_ACCESS = 0x00000002
Global Const $OBJ_BITMAP = 7
Global Const $OBJ_BRUSH = 2
Global Const $OBJ_COLORSPACE = 14
Global Const $OBJ_DC = 3
Global Const $OBJ_ENHMETADC = 12
Global Const $OBJ_ENHMETAFILE = 13
Global Const $OBJ_EXTPEN = 11
Global Const $OBJ_FONT = 6
Global Const $OBJ_MEMDC = 10
Global Const $OBJ_METADC = 4
Global Const $OBJ_METAFILE = 9
Global Const $OBJ_PAL = 5
Global Const $OBJ_PEN = 1
Global Const $OBJ_REGION = 8
Global Const $NULL_BRUSH = 5
Global Const $NULL_PEN = 8
Global Const $BLACK_BRUSH = 4
Global Const $DKGRAY_BRUSH = 3
Global Const $DC_BRUSH = 18
Global Const $GRAY_BRUSH = 2
Global Const $HOLLOW_BRUSH = $NULL_BRUSH
Global Const $LTGRAY_BRUSH = 1
Global Const $WHITE_BRUSH = 0
Global Const $BLACK_PEN = 7
Global Const $DC_PEN = 19
Global Const $WHITE_PEN = 6
Global Const $ANSI_FIXED_FONT = 11
Global Const $ANSI_VAR_FONT = 12
Global Const $DEVICE_DEFAULT_FONT = 14
Global Const $DEFAULT_GUI_FONT = 17
Global Const $OEM_FIXED_FONT = 10
Global Const $SYSTEM_FONT = 13
Global Const $SYSTEM_FIXED_FONT = 16
Global Const $DEFAULT_PALETTE = 15
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CloseHandle($hObject)
Local $aResult = DllCall("kernel32.dll", "bool", "CloseHandle", "handle", $hObject)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DeleteObject($hObject)
Local $aResult = DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hObject)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_DuplicateHandle($hSourceProcessHandle, $hSourceHandle, $hTargetProcessHandle, $iDesiredAccess, $iInheritHandle, $iOptions)
Local $aResult = DllCall("kernel32.dll", "bool", "DuplicateHandle",  "handle", $hSourceProcessHandle,  "handle", $hSourceHandle,  "handle", $hTargetProcessHandle,  "handle*", 0,  "dword", $iDesiredAccess,  "bool", $iInheritHandle,  "dword", $iOptions)
If @error Or Not $aResult[0] Then Return SetError(@error, @extended, 0)
Return $aResult[4]
EndFunc
Func _WinAPI_GetCurrentObject($hDC, $iType)
Local $aRet = DllCall('gdi32.dll', 'handle', 'GetCurrentObject', 'handle', $hDC, 'uint', $iType)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetCurrentProcess()
Local $aResult = DllCall("kernel32.dll", "handle", "GetCurrentProcess")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetObject($hObject, $iSize, $pObject)
Local $aResult = DllCall("gdi32.dll", "int", "GetObjectW", "handle", $hObject, "int", $iSize, "struct*", $pObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_GetObjectInfoByHandle($hObject)
Local $tagPUBLIC_OBJECT_BASIC_INFORMATION = 'ulong Attributes;ulong GrantedAcess;ulong HandleCount;ulong PointerCount;ulong Reserved[10]'
Local $tPOBI = DllStructCreate($tagPUBLIC_OBJECT_BASIC_INFORMATION)
Local $aRet = DllCall('ntdll.dll', 'long', 'ZwQueryObject', 'handle', $hObject, 'uint', 0, 'struct*', $tPOBI,  'ulong', DllStructGetSize($tPOBI), 'ptr', 0)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] Then Return SetError(10, $aRet[0], 0)
Local $aResult[4]
For $i = 0 To 3
$aResult[$i] = DllStructGetData($tPOBI, $i + 1)
Next
Return $aResult
EndFunc
Func _WinAPI_GetObjectNameByHandle($hObject)
Local $tagUNICODE_STRING = 'struct;ushort Length;ushort MaximumLength;ptr Buffer;endstruct'
Local $tagPUBLIC_OBJECT_TYPE_INFORMATION = 'struct;' & $tagUNICODE_STRING & ';ulong Reserved[22];endstruct'
Local $tPOTI = DllStructCreate($tagPUBLIC_OBJECT_TYPE_INFORMATION & ';byte[32]')
Local $aRet = DllCall('ntdll.dll', 'long', 'ZwQueryObject', 'handle', $hObject, 'uint', 2, 'struct*', $tPOTI,  'ulong', DllStructGetSize($tPOTI), 'ulong*', 0)
If @error Then Return SetError(@error, @extended, '')
If $aRet[0] Then Return SetError(10, $aRet[0], '')
Local $pData = DllStructGetData($tPOTI, 3)
If Not $pData Then Return SetError(11, 0, '')
Return _WinAPI_GetString($pData)
EndFunc
Func _WinAPI_GetObjectType($hObject)
Local $aRet = DllCall('gdi32.dll', 'dword', 'GetObjectType', 'handle', $hObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetStdHandle($iStdHandle)
If $iStdHandle < 0 Or $iStdHandle > 2 Then Return SetError(2, 0, -1)
Local Const $aHandle[3] = [-10, -11, -12]
Local $aResult = DllCall("kernel32.dll", "handle", "GetStdHandle", "dword", $aHandle[$iStdHandle])
If @error Then Return SetError(@error, @extended, -1)
Return $aResult[0]
EndFunc
Func _WinAPI_GetStockObject($iObject)
Local $aResult = DllCall("gdi32.dll", "handle", "GetStockObject", "int", $iObject)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _WinAPI_SelectObject($hDC, $hGDIObj)
Local $aResult = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hDC, "handle", $hGDIObj)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _WinAPI_SetHandleInformation($hObject, $iMask, $iFlags)
Local $aResult = DllCall("kernel32.dll", "bool", "SetHandleInformation", "handle", $hObject, "dword", $iMask, "dword", $iFlags)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
#EndRegion Public Functions
Global Const $LINGUISTIC_IGNORECASE = 0x00000010
Global Const $LINGUISTIC_IGNOREDIACRITIC = 0x00000020
Global Const $NORM_IGNORECASE = 0x00000001
Global Const $NORM_IGNOREKANATYPE = 0x00010000
Global Const $NORM_IGNORENONSPACE = 0x00000002
Global Const $NORM_IGNORESYMBOLS = 0x00000004
Global Const $NORM_IGNOREWIDTH = 0x00020000
Global Const $NORM_LINGUISTIC_CASING = 0x08000000
Global Const $SORT_DIGITSASNUMBERS = 0x00000008
Global Const $SORT_STRINGSORT = 0x00001000
Global Const $CSTR_LESS_THAN = 1
Global Const $CSTR_EQUAL = 2
Global Const $CSTR_GREATER_THAN = 3
Global Const $MUI_LANGUAGE_ID = 0x0004
Global Const $MUI_LANGUAGE_NAME = 0x0008
Global Const $DATE_AUTOLAYOUT = 0x40
Global Const $DATE_LONGDATE = 0x02
Global Const $DATE_LTRREADING = 0x10
Global Const $DATE_SHORTDATE = 0x01
Global Const $DATE_RTLREADING = 0x20
Global Const $DATE_USE_ALT_CALENDAR = 0x04
Global Const $DATE_YEARMONTH = 0x08
Global Const $GEO_NATION = 1
Global Const $GEO_LATITUDE = 2
Global Const $GEO_LONGITUDE = 3
Global Const $GEO_ISO2 = 4
Global Const $GEO_ISO3 = 5
Global Const $GEO_RFC1766 = 6
Global Const $GEO_LCID = 7
Global Const $GEO_FRIENDLYNAME = 8
Global Const $GEO_OFFICIALNAME = 9
Global Const $GEO_TIMEZONES = 10
Global Const $GEO_OFFICIALLANGUAGES = 11
Global Const $GEO_ISO_UN_NUMBER = 12
Global Const $GEO_PARENT = 13
Global Const $LOCALE_ILANGUAGE = 0x0001
Global Const $LOCALE_SLANGUAGE = 0x0002
Global Const $LOCALE_SENGLANGUAGE = 0x1001
Global Const $LOCALE_SABBREVLANGNAME = 0x0003
Global Const $LOCALE_SNATIVELANGNAME = 0x0004
Global Const $LOCALE_ICOUNTRY = 0x0005
Global Const $LOCALE_SCOUNTRY = 0x0006
Global Const $LOCALE_SENGCOUNTRY = 0x1002
Global Const $LOCALE_SABBREVCTRYNAME = 0x0007
Global Const $LOCALE_SNATIVECTRYNAME = 0x0008
Global Const $LOCALE_IDEFAULTLANGUAGE = 0x0009
Global Const $LOCALE_IDEFAULTCOUNTRY = 0x000A
Global Const $LOCALE_IDEFAULTCODEPAGE = 0x000B
Global Const $LOCALE_IDEFAULTANSICODEPAGE = 0x1004
Global Const $LOCALE_IDEFAULTMACCODEPAGE = 0x1011
Global Const $LOCALE_SLIST = 0x000C
Global Const $LOCALE_IMEASURE = 0x000D
Global Const $LOCALE_SDECIMAL = 0x000E
Global Const $LOCALE_STHOUSAND = 0x000F
Global Const $LOCALE_SGROUPING = 0x0010
Global Const $LOCALE_IDIGITS = 0x0011
Global Const $LOCALE_ILZERO = 0x0012
Global Const $LOCALE_INEGNUMBER = 0x1010
Global Const $LOCALE_SNATIVEDIGITS = 0x0013
Global Const $LOCALE_SCURRENCY = 0x0014
Global Const $LOCALE_SINTLSYMBOL = 0x0015
Global Const $LOCALE_SMONDECIMALSEP = 0x0016
Global Const $LOCALE_SMONTHOUSANDSEP = 0x0017
Global Const $LOCALE_SMONGROUPING = 0x0018
Global Const $LOCALE_ICURRDIGITS = 0x0019
Global Const $LOCALE_IINTLCURRDIGITS = 0x001A
Global Const $LOCALE_ICURRENCY = 0x001B
Global Const $LOCALE_INEGCURR = 0x001C
Global Const $LOCALE_SDATE = 0x001D
Global Const $LOCALE_STIME = 0x001E
Global Const $LOCALE_SSHORTDATE = 0x001F
Global Const $LOCALE_SLONGDATE = 0x0020
Global Const $LOCALE_STIMEFORMAT = 0x1003
Global Const $LOCALE_IDATE = 0x0021
Global Const $LOCALE_ILDATE = 0x0022
Global Const $LOCALE_ITIME = 0x0023
Global Const $LOCALE_ITIMEMARKPOSN = 0x1005
Global Const $LOCALE_ICENTURY = 0x0024
Global Const $LOCALE_ITLZERO = 0x0025
Global Const $LOCALE_IDAYLZERO = 0x0026
Global Const $LOCALE_IMONLZERO = 0x0027
Global Const $LOCALE_S1159 = 0x0028
Global Const $LOCALE_S2359 = 0x0029
Global Const $LOCALE_ICALENDARTYPE = 0x1009
Global Const $LOCALE_IOPTIONALCALENDAR = 0x100B
Global Const $LOCALE_IFIRSTDAYOFWEEK = 0x100C
Global Const $LOCALE_IFIRSTWEEKOFYEAR = 0x100D
Global Const $LOCALE_SDAYNAME1 = 0x002A
Global Const $LOCALE_SDAYNAME2 = 0x002B
Global Const $LOCALE_SDAYNAME3 = 0x002C
Global Const $LOCALE_SDAYNAME4 = 0x002D
Global Const $LOCALE_SDAYNAME5 = 0x002E
Global Const $LOCALE_SDAYNAME6 = 0x002F
Global Const $LOCALE_SDAYNAME7 = 0x0030
Global Const $LOCALE_SABBREVDAYNAME1 = 0x0031
Global Const $LOCALE_SABBREVDAYNAME2 = 0x0032
Global Const $LOCALE_SABBREVDAYNAME3 = 0x0033
Global Const $LOCALE_SABBREVDAYNAME4 = 0x0034
Global Const $LOCALE_SABBREVDAYNAME5 = 0x0035
Global Const $LOCALE_SABBREVDAYNAME6 = 0x0036
Global Const $LOCALE_SABBREVDAYNAME7 = 0x0037
Global Const $LOCALE_SMONTHNAME1 = 0x0038
Global Const $LOCALE_SMONTHNAME2 = 0x0039
Global Const $LOCALE_SMONTHNAME3 = 0x003A
Global Const $LOCALE_SMONTHNAME4 = 0x003B
Global Const $LOCALE_SMONTHNAME5 = 0x003C
Global Const $LOCALE_SMONTHNAME6 = 0x003D
Global Const $LOCALE_SMONTHNAME7 = 0x003E
Global Const $LOCALE_SMONTHNAME8 = 0x003F
Global Const $LOCALE_SMONTHNAME9 = 0x0040
Global Const $LOCALE_SMONTHNAME10 = 0x0041
Global Const $LOCALE_SMONTHNAME11 = 0x0042
Global Const $LOCALE_SMONTHNAME12 = 0x0043
Global Const $LOCALE_SMONTHNAME13 = 0x100E
Global Const $LOCALE_SABBREVMONTHNAME1 = 0x0044
Global Const $LOCALE_SABBREVMONTHNAME2 = 0x0045
Global Const $LOCALE_SABBREVMONTHNAME3 = 0x0046
Global Const $LOCALE_SABBREVMONTHNAME4 = 0x0047
Global Const $LOCALE_SABBREVMONTHNAME5 = 0x0048
Global Const $LOCALE_SABBREVMONTHNAME6 = 0x0049
Global Const $LOCALE_SABBREVMONTHNAME7 = 0x004A
Global Const $LOCALE_SABBREVMONTHNAME8 = 0x004B
Global Const $LOCALE_SABBREVMONTHNAME9 = 0x004C
Global Const $LOCALE_SABBREVMONTHNAME10 = 0x004D
Global Const $LOCALE_SABBREVMONTHNAME11 = 0x004E
Global Const $LOCALE_SABBREVMONTHNAME12 = 0x004F
Global Const $LOCALE_SABBREVMONTHNAME13 = 0x100F
Global Const $LOCALE_SPOSITIVESIGN = 0x0050
Global Const $LOCALE_SNEGATIVESIGN = 0x0051
Global Const $LOCALE_IPOSSIGNPOSN = 0x0052
Global Const $LOCALE_INEGSIGNPOSN = 0x0053
Global Const $LOCALE_IPOSSYMPRECEDES = 0x0054
Global Const $LOCALE_IPOSSEPBYSPACE = 0x0055
Global Const $LOCALE_INEGSYMPRECEDES = 0x0056
Global Const $LOCALE_INEGSEPBYSPACE = 0x0057
Global Const $LOCALE_FONTSIGNATURE = 0x0058
Global Const $LOCALE_SISO639LANGNAME = 0x0059
Global Const $LOCALE_SISO3166CTRYNAME = 0x005A
Global Const $LOCALE_IDEFAULTEBCDICCODEPAGE = 0x1012
Global Const $LOCALE_IPAPERSIZE = 0x100A
Global Const $LOCALE_SENGCURRNAME = 0x1007
Global Const $LOCALE_SNATIVECURRNAME = 0x1008
Global Const $LOCALE_SYEARMONTH = 0x1006
Global Const $LOCALE_SSORTNAME = 0x1013
Global Const $LOCALE_IDIGITSUBSTITUTION = 0x1014
Global Const $LOCALE_CUSTOM_DEFAULT = 0x0C00
Global Const $LOCALE_CUSTOM_UI_DEFAULT = 0x1400
Global Const $LOCALE_CUSTOM_UNSPECIFIED = 0x1000
Global Const $LOCALE_INVARIANT = 0x007F
Global Const $LOCALE_SYSTEM_DEFAULT = 0x0800
Global Const $LOCALE_USER_DEFAULT = 0x0400
Global Const $TIME_FORCE24HOURFORMAT = 0x08
Global Const $TIME_NOMINUTESORSECONDS = 0x01
Global Const $TIME_NOSECONDS = 0x02
Global Const $TIME_NOTIMEMARKER = 0x04
Global Const $LCID_INSTALLED = 1
Global Const $LCID_SUPPORTED = 2
#Region Global Variables and Constants
Global Const $tagNUMBERFMT = 'uint NumDigits;uint LeadingZero;uint Grouping;ptr DecimalSep;ptr ThousandSep;uint NegativeOrder'
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
#Region Public Functions
Func _WinAPI_CompareString($iLCID, $sString1, $sString2, $iFlags = 0)
Local $aRet = DllCall('kernel32.dll', 'int', 'CompareStringW', 'dword', $iLCID, 'dword', $iFlags, 'wstr', $sString1,  'int', -1, 'wstr', $sString2, 'int', -1)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_CreateNumberFormatInfo($iNumDigits, $iLeadingZero, $iGrouping, $sDecimalSep, $sThousandSep, $iNegativeOrder)
Local $tFMT = DllStructCreate($tagNUMBERFMT & ';wchar[' & (StringLen($sDecimalSep) + 1) & '];wchar[' & (StringLen($sThousandSep) + 1) & ']')
DllStructSetData($tFMT, 1, $iNumDigits)
DllStructSetData($tFMT, 2, $iLeadingZero)
DllStructSetData($tFMT, 3, $iGrouping)
DllStructSetData($tFMT, 4, DllStructGetPtr($tFMT, 7))
DllStructSetData($tFMT, 5, DllStructGetPtr($tFMT, 8))
DllStructSetData($tFMT, 6, $iNegativeOrder)
DllStructSetData($tFMT, 7, $sDecimalSep)
DllStructSetData($tFMT, 8, $sThousandSep)
Return $tFMT
EndFunc
Func _WinAPI_EnumSystemGeoID()
Local $hEnumProc = DllCallbackRegister('__EnumGeoIDProc', 'bool', 'long')
Dim $__g_vEnum[101] = [0]
Local $aRet = DllCall('kernel32.dll', 'bool', 'EnumSystemGeoID', 'dword', 16, 'long', 0, 'ptr', DllCallbackGetPtr($hEnumProc))
If @error Or Not $aRet[0] Or Not $__g_vEnum[0] Then
$__g_vEnum = @error + 10
EndIf
DllCallbackFree($hEnumProc)
If $__g_vEnum Then Return SetError($__g_vEnum, 0, 0)
__Inc($__g_vEnum, -1)
Return $__g_vEnum
EndFunc
Func _WinAPI_EnumSystemLocales($iFlag)
Local $hEnumProc = DllCallbackRegister('__EnumLocalesProc', 'bool', 'ptr')
Dim $__g_vEnum[101] = [0]
Local $aRet = DllCall('kernel32.dll', 'bool', 'EnumSystemLocalesW', 'ptr', DllCallbackGetPtr($hEnumProc), 'dword', $iFlag)
If @error Or Not $aRet[0] Or Not $__g_vEnum[0] Then
$__g_vEnum = @error + 10
EndIf
DllCallbackFree($hEnumProc)
If $__g_vEnum Then Return SetError($__g_vEnum, 0, 0)
__Inc($__g_vEnum, -1)
Return $__g_vEnum
EndFunc
Func _WinAPI_EnumUILanguages($iFlag = 0)
Local $hEnumProc = DllCallbackRegister('__EnumUILanguagesProc', 'bool', 'ptr;long_ptr')
Local $iID = 1
If $__WINVER >= 0x0600 Then
If BitAND($iFlag, 0x0008) Then
$iID = 0
EndIf
Else
$iFlag = 0
EndIf
Dim $__g_vEnum[101] = [0]
Local $aRet = DllCall('kernel32.dll', 'bool', 'EnumUILanguagesW', 'ptr', DllCallbackGetPtr($hEnumProc), 'dword', $iFlag,  'long_ptr', $iID)
If @error Or Not $aRet[0] Or Not $__g_vEnum[0] Then
$__g_vEnum = @error + 10
EndIf
DllCallbackFree($hEnumProc)
If $__g_vEnum Then Return SetError($__g_vEnum, 0, 0)
__Inc($__g_vEnum, -1)
Return $__g_vEnum
EndFunc
Func _WinAPI_GetDateFormat($iLCID = 0, $tSYSTEMTIME = 0, $iFlags = 0, $sFormat = '')
If Not $iLCID Then $iLCID = 0x0400
Local $sTypeOfFormat = 'wstr'
If Not StringStripWS($sFormat, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sTypeOfFormat = 'ptr'
$sFormat = 0
EndIf
Local $aRet = DllCall('kernel32.dll', 'int', 'GetDateFormatW', 'dword', $iLCID, 'dword', $iFlags, 'struct*', $tSYSTEMTIME,  $sTypeOfFormat, $sFormat, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return $aRet[5]
EndFunc
Func _WinAPI_GetDurationFormat($iLCID, $iDuration, $sFormat = '')
If Not $iLCID Then $iLCID = 0x0400
Local $pST, $iVal
If IsDllStruct($iDuration) Then
$pST = DllStructGetPtr($iDuration)
$iVal = 0
Else
$pST = 0
$iVal = $iDuration
EndIf
Local $sTypeOfFormat = 'wstr'
If Not StringStripWS($sFormat, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sTypeOfFormat = 'ptr'
$sFormat = 0
EndIf
Local $aRet = DllCall('kernel32.dll', 'int', 'GetDurationFormat', 'dword', $iLCID, 'dword', 0, 'ptr', $pST, 'uint64', $iVal,  $sTypeOfFormat, $sFormat, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return $aRet[6]
EndFunc
Func _WinAPI_GetGeoInfo($iGEOID, $iType, $iLanguage = 0)
Local $aRet = DllCall('kernel32.dll', 'int', 'GetGeoInfoW', 'long', $iGEOID, 'dword', $iType, 'wstr', '', 'int', 4096,  'word', $iLanguage)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, 0)
Return $aRet[3]
EndFunc
Func _WinAPI_GetLocaleInfo($iLCID, $iType)
Local $aRet = DllCall('kernel32.dll', 'int', 'GetLocaleInfoW', 'dword', $iLCID, 'dword', $iType, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[3]
EndFunc
Func _WinAPI_GetNumberFormat($iLCID, $sNumber, $tNUMBERFMT = 0)
If Not $iLCID Then $iLCID = 0x0400
Local $aRet = DllCall('kernel32.dll', 'int', 'GetNumberFormatW', 'dword', $iLCID, 'dword', 0, 'wstr', $sNumber,  'struct*', $tNUMBERFMT, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error, @extended, '')
Return $aRet[5]
EndFunc
Func _WinAPI_GetSystemDefaultLangID()
Local $aRet = DllCall('kernel32.dll', 'word', 'GetSystemDefaultLangID')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetSystemDefaultLCID()
Local $aRet = DllCall('kernel32.dll', 'dword', 'GetSystemDefaultLCID')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetSystemDefaultUILanguage()
Local $aRet = DllCall('kernel32.dll', 'word', 'GetSystemDefaultUILanguage')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetThreadLocale()
Local $aRet = DllCall('kernel32.dll', 'dword', 'GetThreadLocale')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetThreadUILanguage()
Local $aRet = DllCall('kernel32.dll', 'word', 'GetThreadUILanguage')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetTimeFormat($iLCID = 0, $tSYSTEMTIME = 0, $iFlags = 0, $sFormat = '')
If Not $iLCID Then $iLCID = 0x0400
Local $sTypeOfFormat = 'wstr'
If Not StringStripWS($sFormat, $STR_STRIPLEADING + $STR_STRIPTRAILING) Then
$sTypeOfFormat = 'ptr'
$sFormat = 0
EndIf
Local $aRet = DllCall('kernel32.dll', 'int', 'GetTimeFormatW', 'dword', $iLCID, 'dword', $iFlags, 'struct*', $tSYSTEMTIME,  $sTypeOfFormat, $sFormat, 'wstr', '', 'int', 2048)
If @error Or Not $aRet[0] Then Return SetError(@error + 10, @extended, '')
Return $aRet[5]
EndFunc
Func _WinAPI_GetUserDefaultLangID()
Local $aRet = DllCall('kernel32.dll', 'word', 'GetUserDefaultLangID')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetUserDefaultLCID()
Local $aRet = DllCall('kernel32.dll', 'dword', 'GetUserDefaultLCID')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetUserDefaultUILanguage()
Local $aRet = DllCall('kernel32.dll', 'word', 'GetUserDefaultUILanguage')
If @error Then Return SetError(@error, @extended, 0)
Return $aRet[0]
EndFunc
Func _WinAPI_GetUserGeoID()
Local $aRet = DllCall('kernel32.dll', 'long', 'GetUserGeoID', 'uint', 16)
If @error Then Return SetError(@error, @extended, -1)
Return $aRet[0]
EndFunc
Func _WinAPI_IsValidLocale($iLCID, $iFlag = 0)
Local $aRet = DllCall('kernel32.dll', 'bool', 'IsValidLocale', 'dword', $iLCID, 'dword', $iFlag)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
Func _WinAPI_SetLocaleInfo($iLCID, $iType, $sData)
Local $aRet = DllCall('kernel32.dll', 'bool', 'SetLocaleInfoW', 'dword', $iLCID, 'dword', $iType, 'wstr', $sData)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
Func _WinAPI_SetThreadLocale($iLCID)
Local $aRet = DllCall('kernel32.dll', 'bool', 'SetThreadLocale', 'dword', $iLCID)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
Func _WinAPI_SetThreadUILanguage($iLanguage)
Local $aRet = DllCall('kernel32.dll', 'word', 'SetThreadUILanguage', 'word', $iLanguage)
If @error Then Return SetError(@error, @extended, False)
Return ($aRet[0] = $aRet[1])
EndFunc
Func _WinAPI_SetUserGeoID($iGEOID)
Local $aRet = DllCall('kernel32.dll', 'bool', 'SetUserGeoID', 'long', $iGEOID)
If @error Then Return SetError(@error, @extended, False)
Return $aRet[0]
EndFunc
#EndRegion Public Functions
#Region Internal Functions
Func __EnumGeoIDProc($iID)
__Inc($__g_vEnum)
$__g_vEnum[$__g_vEnum[0]] = $iID
Return 1
EndFunc
Func __EnumLocalesProc($pLocale)
__Inc($__g_vEnum)
$__g_vEnum[$__g_vEnum[0]] = Dec(DllStructGetData(DllStructCreate('wchar[' & (_WinAPI_StrLen($pLocale) + 1) & ']', $pLocale), 1))
Return 1
EndFunc
Func __EnumUILanguagesProc($pLanguage, $iID)
__Inc($__g_vEnum)
$__g_vEnum[$__g_vEnum[0]] = DllStructGetData(DllStructCreate('wchar[' & (_WinAPI_StrLen($pLanguage) + 1) & ']', $pLanguage), 1)
If $iID Then
$__g_vEnum[$__g_vEnum[0]] = Dec($__g_vEnum[$__g_vEnum[0]])
EndIf
Return 1
EndFunc
#EndRegion Internal Functions
Func _DateAdd($sType, $iNumber, $sDate)
Local $asTimePart[4]
Local $asDatePart[4]
Local $iJulianDate
$sType = StringLeft($sType, 1)
If StringInStr("D,M,Y,w,h,n,s", $sType) = 0 Or $sType = "" Then
Return SetError(1, 0, 0)
EndIf
If Not StringIsInt($iNumber) Then
Return SetError(2, 0, 0)
EndIf
If Not _DateIsValid($sDate) Then
Return SetError(3, 0, 0)
EndIf
_DateTimeSplit($sDate, $asDatePart, $asTimePart)
If $sType = "d" Or $sType = "w" Then
If $sType = "w" Then $iNumber = $iNumber * 7
$iJulianDate = _DateToDayValue($asDatePart[1], $asDatePart[2], $asDatePart[3]) + $iNumber
_DayValueToDate($iJulianDate, $asDatePart[1], $asDatePart[2], $asDatePart[3])
EndIf
If $sType = "m" Then
$asDatePart[2] = $asDatePart[2] + $iNumber
While $asDatePart[2] > 12
$asDatePart[2] = $asDatePart[2] - 12
$asDatePart[1] = $asDatePart[1] + 1
WEnd
While $asDatePart[2] < 1
$asDatePart[2] = $asDatePart[2] + 12
$asDatePart[1] = $asDatePart[1] - 1
WEnd
EndIf
If $sType = "y" Then
$asDatePart[1] = $asDatePart[1] + $iNumber
EndIf
If $sType = "h" Or $sType = "n" Or $sType = "s" Then
Local $iTimeVal = _TimeToTicks($asTimePart[1], $asTimePart[2], $asTimePart[3]) / 1000
If $sType = "h" Then $iTimeVal = $iTimeVal + $iNumber * 3600
If $sType = "n" Then $iTimeVal = $iTimeVal + $iNumber * 60
If $sType = "s" Then $iTimeVal = $iTimeVal + $iNumber
Local $iDay2Add = Int($iTimeVal / (24 * 60 * 60))
$iTimeVal = $iTimeVal - $iDay2Add * 24 * 60 * 60
If $iTimeVal < 0 Then
$iDay2Add = $iDay2Add - 1
$iTimeVal = $iTimeVal + 24 * 60 * 60
EndIf
$iJulianDate = _DateToDayValue($asDatePart[1], $asDatePart[2], $asDatePart[3]) + $iDay2Add
_DayValueToDate($iJulianDate, $asDatePart[1], $asDatePart[2], $asDatePart[3])
_TicksToTime($iTimeVal * 1000, $asTimePart[1], $asTimePart[2], $asTimePart[3])
EndIf
Local $iNumDays = _DaysInMonth($asDatePart[1])
If $iNumDays[$asDatePart[2]] < $asDatePart[3] Then $asDatePart[3] = $iNumDays[$asDatePart[2]]
$sDate = $asDatePart[1] & '/' & StringRight("0" & $asDatePart[2], 2) & '/' & StringRight("0" & $asDatePart[3], 2)
If $asTimePart[0] > 0 Then
If $asTimePart[0] > 2 Then
$sDate = $sDate & " " & StringRight("0" & $asTimePart[1], 2) & ':' & StringRight("0" & $asTimePart[2], 2) & ':' & StringRight("0" & $asTimePart[3], 2)
Else
$sDate = $sDate & " " & StringRight("0" & $asTimePart[1], 2) & ':' & StringRight("0" & $asTimePart[2], 2)
EndIf
EndIf
Return $sDate
EndFunc
Func _DateDayOfWeek($iDayNum, $iFormat = Default)
Local Const $MONDAY_IS_NO1 = 128
If $iFormat = Default Then $iFormat = 0
$iDayNum = Int($iDayNum)
If $iDayNum < 1 Or $iDayNum > 7 Then Return SetError(1, 0, "")
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSYSTEMTIME, "Year", BitAND($iFormat, $MONDAY_IS_NO1) ? 2007 : 2006)
DllStructSetData($tSYSTEMTIME, "Month", 1)
DllStructSetData($tSYSTEMTIME, "Day", $iDayNum)
Return _WinAPI_GetDateFormat(BitAND($iFormat, $DMW_LOCALE_LONGNAME) ? $LOCALE_USER_DEFAULT : $LOCALE_INVARIANT, $tSYSTEMTIME, 0, BitAND($iFormat, $DMW_SHORTNAME) ? "ddd" : "dddd")
EndFunc
Func _DateDaysInMonth($iYear, $iMonthNum)
$iMonthNum = Int($iMonthNum)
$iYear = Int($iYear)
Return __DateIsMonth($iMonthNum) And __DateIsYear($iYear) ? _DaysInMonth($iYear)[$iMonthNum] : SetError(1, 0, 0)
EndFunc
Func _DateDiff($sType, $sStartDate, $sEndDate)
$sType = StringLeft($sType, 1)
If StringInStr("d,m,y,w,h,n,s", $sType) = 0 Or $sType = "" Then
Return SetError(1, 0, 0)
EndIf
If Not _DateIsValid($sStartDate) Then
Return SetError(2, 0, 0)
EndIf
If Not _DateIsValid($sEndDate) Then
Return SetError(3, 0, 0)
EndIf
Local $asStartDatePart[4], $asStartTimePart[4], $asEndDatePart[4], $asEndTimePart[4]
_DateTimeSplit($sStartDate, $asStartDatePart, $asStartTimePart)
_DateTimeSplit($sEndDate, $asEndDatePart, $asEndTimePart)
Local $aDaysDiff = _DateToDayValue($asEndDatePart[1], $asEndDatePart[2], $asEndDatePart[3]) - _DateToDayValue($asStartDatePart[1], $asStartDatePart[2], $asStartDatePart[3])
Local $iTimeDiff, $iYearDiff, $iStartTimeInSecs, $iEndTimeInSecs
If $asStartTimePart[0] > 1 And $asEndTimePart[0] > 1 Then
$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
If $iTimeDiff < 0 Then
$aDaysDiff = $aDaysDiff - 1
$iTimeDiff = $iTimeDiff + 24 * 60 * 60
EndIf
Else
$iTimeDiff = 0
EndIf
Select
Case $sType = "d"
Return $aDaysDiff
Case $sType = "m"
$iYearDiff = $asEndDatePart[1] - $asStartDatePart[1]
Local $iMonthDiff = $asEndDatePart[2] - $asStartDatePart[2] + $iYearDiff * 12
If $asEndDatePart[3] < $asStartDatePart[3] Then $iMonthDiff = $iMonthDiff - 1
$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
If $asEndDatePart[3] = $asStartDatePart[3] And $iTimeDiff < 0 Then $iMonthDiff = $iMonthDiff - 1
Return $iMonthDiff
Case $sType = "y"
$iYearDiff = $asEndDatePart[1] - $asStartDatePart[1]
If $asEndDatePart[2] < $asStartDatePart[2] Then $iYearDiff = $iYearDiff - 1
If $asEndDatePart[2] = $asStartDatePart[2] And $asEndDatePart[3] < $asStartDatePart[3] Then $iYearDiff = $iYearDiff - 1
$iStartTimeInSecs = $asStartTimePart[1] * 3600 + $asStartTimePart[2] * 60 + $asStartTimePart[3]
$iEndTimeInSecs = $asEndTimePart[1] * 3600 + $asEndTimePart[2] * 60 + $asEndTimePart[3]
$iTimeDiff = $iEndTimeInSecs - $iStartTimeInSecs
If $asEndDatePart[2] = $asStartDatePart[2] And $asEndDatePart[3] = $asStartDatePart[3] And $iTimeDiff < 0 Then $iYearDiff = $iYearDiff - 1
Return $iYearDiff
Case $sType = "w"
Return Int($aDaysDiff / 7)
Case $sType = "h"
Return $aDaysDiff * 24 + Int($iTimeDiff / 3600)
Case $sType = "n"
Return $aDaysDiff * 24 * 60 + Int($iTimeDiff / 60)
Case $sType = "s"
Return $aDaysDiff * 24 * 60 * 60 + $iTimeDiff
EndSelect
EndFunc
Func _DateIsLeapYear($iYear)
If StringIsInt($iYear) Then
Select
Case Mod($iYear, 4) = 0 And Mod($iYear, 100) <> 0
Return 1
Case Mod($iYear, 400) = 0
Return 1
Case Else
Return 0
EndSelect
EndIf
Return SetError(1, 0, 0)
EndFunc
Func __DateIsMonth($iNumber)
$iNumber = Int($iNumber)
Return $iNumber >= 1 And $iNumber <= 12
EndFunc
Func _DateIsValid($sDate)
Local $asDatePart[4], $asTimePart[4]
_DateTimeSplit($sDate, $asDatePart, $asTimePart)
If Not StringIsInt($asDatePart[1]) Then Return 0
If Not StringIsInt($asDatePart[2]) Then Return 0
If Not StringIsInt($asDatePart[3]) Then Return 0
$asDatePart[1] = Int($asDatePart[1])
$asDatePart[2] = Int($asDatePart[2])
$asDatePart[3] = Int($asDatePart[3])
Local $iNumDays = _DaysInMonth($asDatePart[1])
If $asDatePart[1] < 1000 Or $asDatePart[1] > 2999 Then Return 0
If $asDatePart[2] < 1 Or $asDatePart[2] > 12 Then Return 0
If $asDatePart[3] < 1 Or $asDatePart[3] > $iNumDays[$asDatePart[2]] Then Return 0
If $asTimePart[0] < 1 Then Return 1
If $asTimePart[0] < 2 Then Return 0
If $asTimePart[0] = 2 Then $asTimePart[3] = "00"
If Not StringIsInt($asTimePart[1]) Then Return 0
If Not StringIsInt($asTimePart[2]) Then Return 0
If Not StringIsInt($asTimePart[3]) Then Return 0
$asTimePart[1] = Int($asTimePart[1])
$asTimePart[2] = Int($asTimePart[2])
$asTimePart[3] = Int($asTimePart[3])
If $asTimePart[1] < 0 Or $asTimePart[1] > 23 Then Return 0
If $asTimePart[2] < 0 Or $asTimePart[2] > 59 Then Return 0
If $asTimePart[3] < 0 Or $asTimePart[3] > 59 Then Return 0
Return 1
EndFunc
Func __DateIsYear($iNumber)
Return StringLen($iNumber) = 4
EndFunc
Func _DateLastWeekdayNum($iWeekdayNum)
Select
Case Not StringIsInt($iWeekdayNum)
Return SetError(1, 0, 0)
Case $iWeekdayNum < 1 Or $iWeekdayNum > 7
Return SetError(2, 0, 0)
Case Else
Local $iLastWeekdayNum
If $iWeekdayNum = 1 Then
$iLastWeekdayNum = 7
Else
$iLastWeekdayNum = $iWeekdayNum - 1
EndIf
Return $iLastWeekdayNum
EndSelect
EndFunc
Func _DateLastMonthNum($iMonthNum)
Select
Case Not StringIsInt($iMonthNum)
Return SetError(1, 0, 0)
Case Not __DateIsMonth($iMonthNum)
Return SetError(2, 0, 0)
Case Else
Local $iLastMonthNum
If $iMonthNum = 1 Then
$iLastMonthNum = 12
Else
$iLastMonthNum = $iMonthNum - 1
EndIf
$iLastMonthNum = StringFormat("%02d", $iLastMonthNum)
Return $iLastMonthNum
EndSelect
EndFunc
Func _DateLastMonthYear($iMonthNum, $iYear)
Select
Case Not StringIsInt($iMonthNum) Or Not StringIsInt($iYear)
Return SetError(1, 0, 0)
Case Not __DateIsMonth($iMonthNum)
Return SetError(2, 0, 0)
Case Else
Local $iLastYear
If $iMonthNum = 1 Then
$iLastYear = $iYear - 1
Else
$iLastYear = $iYear
EndIf
$iLastYear = StringFormat("%04d", $iLastYear)
Return $iLastYear
EndSelect
EndFunc
Func _DateNextWeekdayNum($iWeekdayNum)
Select
Case Not StringIsInt($iWeekdayNum)
Return SetError(1, 0, 0)
Case $iWeekdayNum < 1 Or $iWeekdayNum > 7
Return SetError(2, 0, 0)
Case Else
Local $iNextWeekdayNum
If $iWeekdayNum = 7 Then
$iNextWeekdayNum = 1
Else
$iNextWeekdayNum = $iWeekdayNum + 1
EndIf
Return $iNextWeekdayNum
EndSelect
EndFunc
Func _DateNextMonthNum($iMonthNum)
Select
Case Not StringIsInt($iMonthNum)
Return SetError(1, 0, 0)
Case Not __DateIsMonth($iMonthNum)
Return SetError(2, 0, 0)
Case Else
Local $iNextMonthNum
If $iMonthNum = 12 Then
$iNextMonthNum = 1
Else
$iNextMonthNum = $iMonthNum + 1
EndIf
$iNextMonthNum = StringFormat("%02d", $iNextMonthNum)
Return $iNextMonthNum
EndSelect
EndFunc
Func _DateNextMonthYear($iMonthNum, $iYear)
Select
Case Not StringIsInt($iMonthNum) Or Not StringIsInt($iYear)
Return SetError(1, 0, 0)
Case Not __DateIsMonth($iMonthNum)
Return SetError(2, 0, 0)
Case Else
Local $iNextYear
If $iMonthNum = 12 Then
$iNextYear = $iYear + 1
Else
$iNextYear = $iYear
EndIf
$iNextYear = StringFormat("%04d", $iNextYear)
Return $iNextYear
EndSelect
EndFunc
Func _DateTimeFormat($sDate, $sType)
Local $asDatePart[4], $asTimePart[4]
Local $sTempDate = "", $sTempTime = ""
Local $sAM, $sPM, $sTempString = ""
If Not _DateIsValid($sDate) Then
Return SetError(1, 0, "")
EndIf
If $sType < 0 Or $sType > 5 Or Not IsInt($sType) Then
Return SetError(2, 0, "")
EndIf
_DateTimeSplit($sDate, $asDatePart, $asTimePart)
Switch $sType
Case 0
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SSHORTDATE)
If Not @error And Not ($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "M/d/yyyy"
EndIf
If $asTimePart[0] > 1 Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIMEFORMAT)
If Not @error And Not ($sTempString = '') Then
$sTempTime = $sTempString
Else
$sTempTime = "h:mm:ss tt"
EndIf
EndIf
Case 1
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SLONGDATE)
If Not @error And Not ($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "dddd, MMMM dd, yyyy"
EndIf
Case 2
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SSHORTDATE)
If Not @error And Not ($sTempString = '') Then
$sTempDate = $sTempString
Else
$sTempDate = "M/d/yyyy"
EndIf
Case 3
If $asTimePart[0] > 1 Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIMEFORMAT)
If Not @error And Not ($sTempString = '') Then
$sTempTime = $sTempString
Else
$sTempTime = "h:mm:ss tt"
EndIf
EndIf
Case 4
If $asTimePart[0] > 1 Then
$sTempTime = "hh:mm"
EndIf
Case 5
If $asTimePart[0] > 1 Then
$sTempTime = "hh:mm:ss"
EndIf
EndSwitch
If $sTempDate <> "" Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_SDATE)
If Not @error And Not ($sTempString = '') Then
$sTempDate = StringReplace($sTempDate, "/", $sTempString)
EndIf
Local $iWday = _DateToDayOfWeek($asDatePart[1], $asDatePart[2], $asDatePart[3])
$asDatePart[3] = StringRight("0" & $asDatePart[3], 2)
$asDatePart[2] = StringRight("0" & $asDatePart[2], 2)
$sTempDate = StringReplace($sTempDate, "d", "@")
$sTempDate = StringReplace($sTempDate, "m", "#")
$sTempDate = StringReplace($sTempDate, "y", "&")
$sTempDate = StringReplace($sTempDate, "@@@@", _DateDayOfWeek($iWday, 0))
$sTempDate = StringReplace($sTempDate, "@@@", _DateDayOfWeek($iWday, 1))
$sTempDate = StringReplace($sTempDate, "@@", $asDatePart[3])
$sTempDate = StringReplace($sTempDate, "@", StringReplace(StringLeft($asDatePart[3], 1), "0", "") & StringRight($asDatePart[3], 1))
$sTempDate = StringReplace($sTempDate, "####", _DateToMonth($asDatePart[2], 0))
$sTempDate = StringReplace($sTempDate, "###", _DateToMonth($asDatePart[2], 1))
$sTempDate = StringReplace($sTempDate, "##", $asDatePart[2])
$sTempDate = StringReplace($sTempDate, "#", StringReplace(StringLeft($asDatePart[2], 1), "0", "") & StringRight($asDatePart[2], 1))
$sTempDate = StringReplace($sTempDate, "&&&&", $asDatePart[1])
$sTempDate = StringReplace($sTempDate, "&&", StringRight($asDatePart[1], 2))
EndIf
If $sTempTime <> "" Then
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_S1159)
If Not @error And Not ($sTempString = '') Then
$sAM = $sTempString
Else
$sAM = "AM"
EndIf
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_S2359)
If Not @error And Not ($sTempString = '') Then
$sPM = $sTempString
Else
$sPM = "PM"
EndIf
$sTempString = _WinAPI_GetLocaleInfo($LOCALE_USER_DEFAULT, $LOCALE_STIME)
If Not @error And Not ($sTempString = '') Then
$sTempTime = StringReplace($sTempTime, ":", $sTempString)
EndIf
If StringInStr($sTempTime, "tt") Then
If $asTimePart[1] < 12 Then
$sTempTime = StringReplace($sTempTime, "tt", $sAM)
If $asTimePart[1] = 0 Then $asTimePart[1] = 12
Else
$sTempTime = StringReplace($sTempTime, "tt", $sPM)
If $asTimePart[1] > 12 Then $asTimePart[1] = $asTimePart[1] - 12
EndIf
EndIf
$asTimePart[1] = StringRight("0" & $asTimePart[1], 2)
$asTimePart[2] = StringRight("0" & $asTimePart[2], 2)
$asTimePart[3] = StringRight("0" & $asTimePart[3], 2)
$sTempTime = StringReplace($sTempTime, "hh", StringFormat("%02d", $asTimePart[1]))
$sTempTime = StringReplace($sTempTime, "h", StringReplace(StringLeft($asTimePart[1], 1), "0", "") & StringRight($asTimePart[1], 1))
$sTempTime = StringReplace($sTempTime, "mm", StringFormat("%02d", $asTimePart[2]))
$sTempTime = StringReplace($sTempTime, "ss", StringFormat("%02d", $asTimePart[3]))
$sTempDate = StringStripWS($sTempDate & " " & $sTempTime, $STR_STRIPLEADING + $STR_STRIPTRAILING)
EndIf
Return $sTempDate
EndFunc
Func _DateTimeSplit($sDate, ByRef $aDatePart, ByRef $iTimePart)
Local $sDateTime = StringSplit($sDate, " T")
If $sDateTime[0] > 0 Then $aDatePart = StringSplit($sDateTime[1], "/-.")
If $sDateTime[0] > 1 Then
$iTimePart = StringSplit($sDateTime[2], ":")
If UBound($iTimePart) < 4 Then ReDim $iTimePart[4]
Else
Dim $iTimePart[4]
EndIf
If UBound($aDatePart) < 4 Then ReDim $aDatePart[4]
For $x = 1 To 3
If StringIsInt($aDatePart[$x]) Then
$aDatePart[$x] = Int($aDatePart[$x])
Else
$aDatePart[$x] = -1
EndIf
If StringIsInt($iTimePart[$x]) Then
$iTimePart[$x] = Int($iTimePart[$x])
Else
$iTimePart[$x] = 0
EndIf
Next
Return 1
EndFunc
Func _DateToDayOfWeek($iYear, $iMonth, $iDay)
If Not _DateIsValid($iYear & "/" & $iMonth & "/" & $iDay) Then
Return SetError(1, 0, "")
EndIf
Local $i_FactorA = Int((14 - $iMonth) / 12)
Local $i_FactorY = $iYear - $i_FactorA
Local $i_FactorM = $iMonth + (12 * $i_FactorA) - 2
Local $i_FactorD = Mod($iDay + $i_FactorY + Int($i_FactorY / 4) - Int($i_FactorY / 100) + Int($i_FactorY / 400) + Int((31 * $i_FactorM) / 12), 7)
Return $i_FactorD + 1
EndFunc
Func _DateToDayOfWeekISO($iYear, $iMonth, $iDay)
Local $iDow = _DateToDayOfWeek($iYear, $iMonth, $iDay)
If @error Then
Return SetError(1, 0, "")
EndIf
If $iDow >= 2 Then Return $iDow - 1
Return 7
EndFunc
Func _DateToDayValue($iYear, $iMonth, $iDay)
If Not _DateIsValid(StringFormat("%04d/%02d/%02d", $iYear, $iMonth, $iDay)) Then
Return SetError(1, 0, "")
EndIf
If $iMonth < 3 Then
$iMonth = $iMonth + 12
$iYear = $iYear - 1
EndIf
Local $i_FactorA = Int($iYear / 100)
Local $i_FactorB = Int($i_FactorA / 4)
Local $i_FactorC = 2 - $i_FactorA + $i_FactorB
Local $i_FactorE = Int(1461 * ($iYear + 4716) / 4)
Local $i_FactorF = Int(153 * ($iMonth + 1) / 5)
Local $iJulianDate = $i_FactorC + $iDay + $i_FactorE + $i_FactorF - 1524.5
Return $iJulianDate
EndFunc
Func _DateToMonth($iMonNum, $iFormat = Default)
If $iFormat = Default Then $iFormat = 0
$iMonNum = Int($iMonNum)
If Not __DateIsMonth($iMonNum) Then Return SetError(1, 0, "")
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSYSTEMTIME, "Year", @YEAR)
DllStructSetData($tSYSTEMTIME, "Month", $iMonNum)
DllStructSetData($tSYSTEMTIME, "Day", 1)
Return _WinAPI_GetDateFormat(BitAND($iFormat, $DMW_LOCALE_LONGNAME) ? $LOCALE_USER_DEFAULT : $LOCALE_INVARIANT, $tSYSTEMTIME, 0, BitAND($iFormat, $DMW_SHORTNAME) ? "MMM" : "MMMM")
EndFunc
Func _DayValueToDate($iJulianDate, ByRef $iYear, ByRef $iMonth, ByRef $iDay)
If $iJulianDate < 0 Or Not IsNumber($iJulianDate) Then
Return SetError(1, 0, 0)
EndIf
Local $i_FactorZ = Int($iJulianDate + 0.5)
Local $i_FactorW = Int(($i_FactorZ - 1867216.25) / 36524.25)
Local $i_FactorX = Int($i_FactorW / 4)
Local $i_FactorA = $i_FactorZ + 1 + $i_FactorW - $i_FactorX
Local $i_FactorB = $i_FactorA + 1524
Local $i_FactorC = Int(($i_FactorB - 122.1) / 365.25)
Local $i_FactorD = Int(365.25 * $i_FactorC)
Local $i_FactorE = Int(($i_FactorB - $i_FactorD) / 30.6001)
Local $i_FactorF = Int(30.6001 * $i_FactorE)
$iDay = $i_FactorB - $i_FactorD - $i_FactorF
If $i_FactorE - 1 < 13 Then
$iMonth = $i_FactorE - 1
Else
$iMonth = $i_FactorE - 13
EndIf
If $iMonth < 3 Then
$iYear = $i_FactorC - 4715
Else
$iYear = $i_FactorC - 4716
EndIf
$iYear = StringFormat("%04d", $iYear)
$iMonth = StringFormat("%02d", $iMonth)
$iDay = StringFormat("%02d", $iDay)
Return $iYear & "/" & $iMonth & "/" & $iDay
EndFunc
Func _Date_JulianDayNo($iYear, $iMonth, $iDay)
Local $sFullDate = StringFormat("%04d/%02d/%02d", $iYear, $iMonth, $iDay)
If Not _DateIsValid($sFullDate) Then
Return SetError(1, 0, "")
EndIf
Local $iJDay = 0
Local $aiDaysInMonth = _DaysInMonth($iYear)
For $iCntr = 1 To $iMonth - 1
$iJDay = $iJDay + $aiDaysInMonth[$iCntr]
Next
$iJDay = ($iYear * 1000) + ($iJDay + $iDay)
Return $iJDay
EndFunc
Func _JulianToDate($iJDay, $sSep = "/")
Local $iYear = Int($iJDay / 1000)
Local $iDays = Mod($iJDay, 1000)
Local $iMaxDays = 365
If _DateIsLeapYear($iYear) Then $iMaxDays = 366
If $iDays > $iMaxDays Then
Return SetError(1, 0, "")
EndIf
Local $aiDaysInMonth = _DaysInMonth($iYear)
Local $iMonth = 1
While $iDays > $aiDaysInMonth[$iMonth]
$iDays = $iDays - $aiDaysInMonth[$iMonth]
$iMonth = $iMonth + 1
WEnd
Return StringFormat("%04d%s%02d%s%02d", $iYear, $sSep, $iMonth, $sSep, $iDays)
EndFunc
Func _Now()
Return _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC, 0)
EndFunc
Func _NowCalc()
Return @YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC
EndFunc
Func _NowCalcDate()
Return @YEAR & "/" & @MON & "/" & @MDAY
EndFunc
Func _NowDate()
Return _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY, 0)
EndFunc
Func _NowTime($sType = 3)
If $sType < 3 Or $sType > 5 Then $sType = 3
Return _DateTimeFormat(@YEAR & "/" & @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC, $sType)
EndFunc
Func _SetDate($iDay, $iMonth = 0, $iYear = 0)
If $iYear = 0 Then $iYear = @YEAR
If $iMonth = 0 Then $iMonth = @MON
If Not _DateIsValid($iYear & "/" & $iMonth & "/" & $iDay) Then Return 1
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllCall("kernel32.dll", "none", "GetLocalTime", "struct*", $tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, 0)
DllStructSetData($tSYSTEMTIME, "Day", $iDay)
If $iMonth > 0 Then DllStructSetData($tSYSTEMTIME, "Month", $iMonth)
If $iYear > 0 Then DllStructSetData($tSYSTEMTIME, "Year", $iYear)
Local $iReturn = _Date_Time_SetLocalTime($tSYSTEMTIME)
If @error Then Return SetError(@error + 10, @extended, 0)
Return Int($iReturn)
EndFunc
Func _SetTime($iHour, $iMinute, $iSecond = 0, $iMSeconds = 0)
If $iHour < 0 Or $iHour > 23 Then Return 1
If $iMinute < 0 Or $iMinute > 59 Then Return 1
If $iSecond < 0 Or $iSecond > 59 Then Return 1
If $iMSeconds < 0 Or $iMSeconds > 999 Then Return 1
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllCall("kernel32.dll", "none", "GetLocalTime", "struct*", $tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, 0)
DllStructSetData($tSYSTEMTIME, "Hour", $iHour)
DllStructSetData($tSYSTEMTIME, "Minute", $iMinute)
If $iSecond > 0 Then DllStructSetData($tSYSTEMTIME, "Second", $iSecond)
If $iMSeconds > 0 Then DllStructSetData($tSYSTEMTIME, "MSeconds", $iMSeconds)
Local $iReturn = _Date_Time_SetLocalTime($tSYSTEMTIME)
If @error Then Return SetError(@error + 10, @extended, 0)
Return Int($iReturn)
EndFunc
Func _TicksToTime($iTicks, ByRef $iHours, ByRef $iMins, ByRef $iSecs)
If Number($iTicks) > 0 Then
$iTicks = Int($iTicks / 1000)
$iHours = Int($iTicks / 3600)
$iTicks = Mod($iTicks, 3600)
$iMins = Int($iTicks / 60)
$iSecs = Mod($iTicks, 60)
Return 1
ElseIf Number($iTicks) = 0 Then
$iHours = 0
$iTicks = 0
$iMins = 0
$iSecs = 0
Return 1
Else
Return SetError(1, 0, 0)
EndIf
EndFunc
Func _TimeToTicks($iHours = @HOUR, $iMins = @MIN, $iSecs = @SEC)
If StringIsInt($iHours) And StringIsInt($iMins) And StringIsInt($iSecs) Then
Local $iTicks = 1000 * ((3600 * $iHours) + (60 * $iMins) + $iSecs)
Return $iTicks
Else
Return SetError(1, 0, 0)
EndIf
EndFunc
Func _WeekNumberISO($iYear = @YEAR, $iMonth = @MON, $iDay = @MDAY)
If $iDay > 31 Or $iDay < 1 Then
Return SetError(1, 0, -1)
ElseIf Not __DateIsMonth($iMonth) Then
Return SetError(2, 0, -1)
ElseIf $iYear < 1 Or $iYear > 2999 Then
Return SetError(3, 0, -1)
EndIf
Local $iDow = _DateToDayOfWeekISO($iYear, $iMonth, $iDay) - 1
Local $iDow0101 = _DateToDayOfWeekISO($iYear, 1, 1) - 1
If ($iMonth = 1 And 3 < $iDow0101 And $iDow0101 < 7 - ($iDay - 1)) Then
$iDow = $iDow0101 - 1
$iDow0101 = _DateToDayOfWeekISO($iYear - 1, 1, 1) - 1
$iMonth = 12
$iDay = 31
$iYear = $iYear - 1
ElseIf ($iMonth = 12 And 30 - ($iDay - 1) < _DateToDayOfWeekISO($iYear + 1, 1, 1) - 1 And _DateToDayOfWeekISO($iYear + 1, 1, 1) - 1 < 4) Then
Return 1
EndIf
Return Int((_DateToDayOfWeekISO($iYear, 1, 1) - 1 < 4) + 4 * ($iMonth - 1) + (2 * ($iMonth - 1) + ($iDay - 1) + $iDow0101 - $iDow + 6) * 36 / 256)
EndFunc
Func _WeekNumber($iYear = @YEAR, $iMonth = @MON, $iDay = @MDAY, $iWeekStart = 1)
If $iDay > 31 Or $iDay < 1 Then
Return SetError(1, 0, -1)
ElseIf Not __DateIsMonth($iMonth) Then
Return SetError(3, 0, -1)
ElseIf $iYear < 1 Or $iYear > 2999 Then
Return SetError(4, 0, -1)
ElseIf $iWeekStart < 1 Or $iWeekStart > 2 Then
Return SetError(2, 0, -1)
EndIf
Local $iStartWeek1, $iEndWeek1
Local $iDow0101 = _DateToDayOfWeekISO($iYear, 1, 1)
Local $iDate = $iYear & '/' & $iMonth & '/' & $iDay
If $iWeekStart = 1 Then
If $iDow0101 = 6 Then
$iStartWeek1 = 0
Else
$iStartWeek1 = -1 * $iDow0101 - 1
EndIf
$iEndWeek1 = $iStartWeek1 + 6
Else
$iStartWeek1 = $iDow0101 * -1
$iEndWeek1 = $iStartWeek1 + 6
EndIf
Local $iStartWeek1ny
Local $iEndWeek1Date = _DateAdd('d', $iEndWeek1, $iYear & '/01/01')
Local $iDow0101ny = _DateToDayOfWeekISO($iYear + 1, 1, 1)
If $iWeekStart = 1 Then
If $iDow0101ny = 6 Then
$iStartWeek1ny = 0
Else
$iStartWeek1ny = -1 * $iDow0101ny - 1
EndIf
Else
$iStartWeek1ny = $iDow0101ny * -1
EndIf
Local $iStartWeek1Dateny = _DateAdd('d', $iStartWeek1ny, $iYear + 1 & '/01/01')
Local $iCurrDateDiff = _DateDiff('d', $iEndWeek1Date, $iDate) - 1
Local $iCurrDateDiffny = _DateDiff('d', $iStartWeek1Dateny, $iDate)
If $iCurrDateDiff >= 0 And $iCurrDateDiffny < 0 Then Return 2 + Int($iCurrDateDiff / 7)
If $iCurrDateDiff < 0 Or $iCurrDateDiffny >= 0 Then Return 1
EndFunc
Func _DaysInMonth($iYear)
Local $aDays = [12, 31, (_DateIsLeapYear($iYear) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
Return $aDays
EndFunc
Func __Date_Time_CloneSystemTime($pSystemTime)
Local $tSystemTime1 = DllStructCreate($tagSYSTEMTIME, $pSystemTime)
Local $tSystemTime2 = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSystemTime2, "Month", DllStructGetData($tSystemTime1, "Month"))
DllStructSetData($tSystemTime2, "Day", DllStructGetData($tSystemTime1, "Day"))
DllStructSetData($tSystemTime2, "Year", DllStructGetData($tSystemTime1, "Year"))
DllStructSetData($tSystemTime2, "Hour", DllStructGetData($tSystemTime1, "Hour"))
DllStructSetData($tSystemTime2, "Minute", DllStructGetData($tSystemTime1, "Minute"))
DllStructSetData($tSystemTime2, "Second", DllStructGetData($tSystemTime1, "Second"))
DllStructSetData($tSystemTime2, "MSeconds", DllStructGetData($tSystemTime1, "MSeconds"))
DllStructSetData($tSystemTime2, "DOW", DllStructGetData($tSystemTime1, "DOW"))
Return $tSystemTime2
EndFunc
Func _Date_Time_CompareFileTime($tFileTime1, $tFileTime2)
Local $aResult = DllCall("kernel32.dll", "long", "CompareFileTime", "struct*", $tFileTime1, "struct*", $tFileTime2)
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _Date_Time_DOSDateTimeToFileTime($iFatDate, $iFatTime)
Local $tTime = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "DosDateTimeToFileTime", "word", $iFatDate, "word", $iFatTime, "struct*", $tTime)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tTime)
EndFunc
Func _Date_Time_DOSDateToArray($iDosDate)
Local $aDate[3]
$aDate[0] = BitAND($iDosDate, 0x1F)
$aDate[1] = BitAND(BitShift($iDosDate, 5), 0x0F)
$aDate[2] = BitAND(BitShift($iDosDate, 9), 0x3F) + 1980
Return $aDate
EndFunc
Func _Date_Time_DOSDateTimeToArray($iDosDate, $iDosTime)
Local $aDate[6]
$aDate[0] = BitAND($iDosDate, 0x1F)
$aDate[1] = BitAND(BitShift($iDosDate, 5), 0x0F)
$aDate[2] = BitAND(BitShift($iDosDate, 9), 0x3F) + 1980
$aDate[5] = BitAND($iDosTime, 0x1F) * 2
$aDate[4] = BitAND(BitShift($iDosTime, 5), 0x3F)
$aDate[3] = BitAND(BitShift($iDosTime, 11), 0x1F)
Return $aDate
EndFunc
Func _Date_Time_DOSDateTimeToStr($iDosDate, $iDosTime)
Local $aDate = _Date_Time_DOSDateTimeToArray($iDosDate, $iDosTime)
Return StringFormat("%02d/%02d/%04d %02d:%02d:%02d", $aDate[0], $aDate[1], $aDate[2], $aDate[3], $aDate[4], $aDate[5])
EndFunc
Func _Date_Time_DOSDateToStr($iDosDate)
Local $aDate = _Date_Time_DOSDateToArray($iDosDate)
Return StringFormat("%02d/%02d/%04d", $aDate[0], $aDate[1], $aDate[2])
EndFunc
Func _Date_Time_DOSTimeToArray($iDosTime)
Local $aTime[3]
$aTime[2] = BitAND($iDosTime, 0x1F) * 2
$aTime[1] = BitAND(BitShift($iDosTime, 5), 0x3F)
$aTime[0] = BitAND(BitShift($iDosTime, 11), 0x1F)
Return $aTime
EndFunc
Func _Date_Time_DOSTimeToStr($iDosTime)
Local $aTime = _Date_Time_DOSTimeToArray($iDosTime)
Return StringFormat("%02d:%02d:%02d", $aTime[0], $aTime[1], $aTime[2])
EndFunc
Func _Date_Time_EncodeFileTime($iMonth, $iDay, $iYear, $iHour = 0, $iMinute = 0, $iSecond = 0, $iMSeconds = 0)
Local $tSYSTEMTIME = _Date_Time_EncodeSystemTime($iMonth, $iDay, $iYear, $iHour, $iMinute, $iSecond, $iMSeconds)
Return _Date_Time_SystemTimeToFileTime($tSYSTEMTIME)
EndFunc
Func _Date_Time_EncodeSystemTime($iMonth, $iDay, $iYear, $iHour = 0, $iMinute = 0, $iSecond = 0, $iMSeconds = 0)
Local $tSYSTEMTIME = DllStructCreate($tagSYSTEMTIME)
DllStructSetData($tSYSTEMTIME, "Month", $iMonth)
DllStructSetData($tSYSTEMTIME, "Day", $iDay)
DllStructSetData($tSYSTEMTIME, "Year", $iYear)
DllStructSetData($tSYSTEMTIME, "Hour", $iHour)
DllStructSetData($tSYSTEMTIME, "Minute", $iMinute)
DllStructSetData($tSYSTEMTIME, "Second", $iSecond)
DllStructSetData($tSYSTEMTIME, "MSeconds", $iMSeconds)
Return $tSYSTEMTIME
EndFunc
Func _Date_Time_FileTimeToArray(ByRef $tFileTime)
If ((DllStructGetData($tFileTime, 1) + DllStructGetData($tFileTime, 2)) = 0) Then Return SetError(10, 0, 0)
Local $tSYSTEMTIME = _Date_Time_FileTimeToSystemTime($tFileTime)
If @error Then Return SetError(@error, @extended, 0)
Return _Date_Time_SystemTimeToArray($tSYSTEMTIME)
EndFunc
Func _Date_Time_FileTimeToStr(ByRef $tFileTime, $iFmt = 0)
Local $aDate = _Date_Time_FileTimeToArray($tFileTime)
If @error Then Return SetError(@error, @extended, "")
If $iFmt Then
Return StringFormat("%04d/%02d/%02d %02d:%02d:%02d", $aDate[2], $aDate[0], $aDate[1], $aDate[3], $aDate[4], $aDate[5])
Else
Return StringFormat("%02d/%02d/%04d %02d:%02d:%02d", $aDate[0], $aDate[1], $aDate[2], $aDate[3], $aDate[4], $aDate[5])
EndIf
EndFunc
Func _Date_Time_FileTimeToDOSDateTime($tFileTime)
Local $aDate[2]
Local $aResult = DllCall("kernel32.dll", "bool", "FileTimeToDosDateTime", "struct*", $tFileTime, "word*", 0, "word*", 0)
If @error Then Return SetError(@error, @extended, $aDate)
$aDate[0] = $aResult[2]
$aDate[1] = $aResult[3]
Return SetExtended($aResult[0], $aDate)
EndFunc
Func _Date_Time_FileTimeToLocalFileTime($tFileTime)
Local $tLocal = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "FileTimeToLocalFileTime", "struct*", $tFileTime, "struct*", $tLocal)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tLocal)
EndFunc
Func _Date_Time_FileTimeToSystemTime($tFileTime)
Local $tSystTime = DllStructCreate($tagSYSTEMTIME)
Local $aResult = DllCall("kernel32.dll", "bool", "FileTimeToSystemTime", "struct*", $tFileTime, "struct*", $tSystTime)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tSystTime)
EndFunc
Func _Date_Time_GetFileTime($hFile)
Local $aDate[3]
$aDate[0] = DllStructCreate($tagFILETIME)
$aDate[1] = DllStructCreate($tagFILETIME)
$aDate[2] = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "GetFileTime", "handle", $hFile, "struct*", $aDate[0], "struct*", $aDate[1], "struct*", $aDate[2])
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $aDate)
EndFunc
Func _Date_Time_GetLocalTime()
Local $tSystTime = DllStructCreate($tagSYSTEMTIME)
DllCall("kernel32.dll", "none", "GetLocalTime", "struct*", $tSystTime)
If @error Then Return SetError(@error, @extended, 0)
Return $tSystTime
EndFunc
Func _Date_Time_GetSystemTime()
Local $tSystTime = DllStructCreate($tagSYSTEMTIME)
DllCall("kernel32.dll", "none", "GetSystemTime", "struct*", $tSystTime)
If @error Then Return SetError(@error, @extended, 0)
Return $tSystTime
EndFunc
Func _Date_Time_GetSystemTimeAdjustment()
Local $aInfo[3]
Local $aResult = DllCall("kernel32.dll", "bool", "GetSystemTimeAdjustment", "dword*", 0, "dword*", 0, "bool*", 0)
If @error Then Return SetError(@error, @extended, 0)
$aInfo[0] = $aResult[1]
$aInfo[1] = $aResult[2]
$aInfo[2] = $aResult[3] <> 0
Return SetExtended($aResult[0], $aInfo)
EndFunc
Func _Date_Time_GetSystemTimeAsFileTime()
Local $tFileTime = DllStructCreate($tagFILETIME)
DllCall("kernel32.dll", "none", "GetSystemTimeAsFileTime", "struct*", $tFileTime)
If @error Then Return SetError(@error, @extended, 0)
Return $tFileTime
EndFunc
Func _Date_Time_GetSystemTimes()
Local $aInfo[3]
$aInfo[0] = DllStructCreate($tagFILETIME)
$aInfo[1] = DllStructCreate($tagFILETIME)
$aInfo[2] = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "GetSystemTimes", "struct*", $aInfo[0], "struct*", $aInfo[1], "struct*", $aInfo[2])
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $aInfo)
EndFunc
Func _Date_Time_GetTickCount()
Local $aResult = DllCall("kernel32.dll", "dword", "GetTickCount")
If @error Then Return SetError(@error, @extended, 0)
Return $aResult[0]
EndFunc
Func _Date_Time_GetTimeZoneInformation()
Local $tTimeZone = DllStructCreate($tagTIME_ZONE_INFORMATION)
Local $aResult = DllCall("kernel32.dll", "dword", "GetTimeZoneInformation", "struct*", $tTimeZone)
If @error Or $aResult[0] = -1 Then Return SetError(@error, @extended, 0)
Local $aInfo[8]
$aInfo[0] = $aResult[0]
$aInfo[1] = DllStructGetData($tTimeZone, "Bias")
$aInfo[2] = DllStructGetData($tTimeZone, "StdName")
$aInfo[3] = __Date_Time_CloneSystemTime(DllStructGetPtr($tTimeZone, "StdDate"))
$aInfo[4] = DllStructGetData($tTimeZone, "StdBias")
$aInfo[5] = DllStructGetData($tTimeZone, "DayName")
$aInfo[6] = __Date_Time_CloneSystemTime(DllStructGetPtr($tTimeZone, "DayDate"))
$aInfo[7] = DllStructGetData($tTimeZone, "DayBias")
Return $aInfo
EndFunc
Func _Date_Time_LocalFileTimeToFileTime($tLocalTime)
Local $tFileTime = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "LocalFileTimeToFileTime", "struct*", $tLocalTime, "struct*", $tFileTime)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tFileTime)
EndFunc
Func _Date_Time_SetFileTime($hFile, $tCreateTime, $tLastAccess, $tLastWrite)
Local $aResult = DllCall("kernel32.dll", "bool", "SetFileTime", "handle", $hFile, "struct*", $tCreateTime, "struct*", $tLastAccess, "struct*", $tLastWrite)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _Date_Time_SetLocalTime($tSYSTEMTIME)
Local $aResult = DllCall("kernel32.dll", "bool", "SetLocalTime", "struct*", $tSYSTEMTIME)
If @error Or Not $aResult[0] Then Return SetError(@error + 10, @extended, False)
$aResult = DllCall("kernel32.dll", "bool", "SetLocalTime", "struct*", $tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _Date_Time_SetSystemTime($tSYSTEMTIME)
Local $aResult = DllCall("kernel32.dll", "bool", "SetSystemTime", "struct*", $tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, False)
Return $aResult[0]
EndFunc
Func _Date_Time_SetSystemTimeAdjustment($iAdjustment, $bDisabled)
Local $hToken = _Security__OpenThreadTokenEx(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
If @error Then Return SetError(@error + 10, @extended, False)
_Security__SetPrivilege($hToken, "SeSystemtimePrivilege", True)
Local $iError = @error
Local $iLastError = @extended
Local $bRet = False
If Not @error Then
Local $aResult = DllCall("kernel32.dll", "bool", "SetSystemTimeAdjustment", "dword", $iAdjustment, "bool", $bDisabled)
If @error Then
$iError = @error
$iLastError = @extended
ElseIf $aResult[0] Then
$bRet = True
Else
$iError = 20
$iLastError = _WinAPI_GetLastError()
EndIf
_Security__SetPrivilege($hToken, "SeSystemtimePrivilege", False)
If Not $iError And @error Then $iError = 22
EndIf
_WinAPI_CloseHandle($hToken)
Return SetError($iError, $iLastError, $bRet)
EndFunc
Func _Date_Time_SetTimeZoneInformation($iBias, $sStdName, $tStdDate, $iStdBias, $sDayName, $tDayDate, $iDayBias)
Local $tZoneInfo = DllStructCreate($tagTIME_ZONE_INFORMATION)
DllStructSetData($tZoneInfo, "Bias", $iBias)
DllStructSetData($tZoneInfo, "StdName", $sStdName)
_MemMoveMemory($tStdDate, DllStructGetPtr($tZoneInfo, "StdDate"), DllStructGetSize($tStdDate))
DllStructSetData($tZoneInfo, "StdBias", $iStdBias)
DllStructSetData($tZoneInfo, "DayName", $sDayName)
_MemMoveMemory($tDayDate, DllStructGetPtr($tZoneInfo, "DayDate"), DllStructGetSize($tDayDate))
DllStructSetData($tZoneInfo, "DayBias", $iDayBias)
Local $hToken = _Security__OpenThreadTokenEx(BitOR($TOKEN_ADJUST_PRIVILEGES, $TOKEN_QUERY))
If @error Then Return SetError(@error + 10, @extended, False)
_Security__SetPrivilege($hToken, "SeTimeZonePrivilege", True)
Local $iError = @error
Local $iLastError = @extended
Local $bRet = False
If Not @error Then
Local $aResult = DllCall("kernel32.dll", "bool", "SetTimeZoneInformation", "struct*", $tZoneInfo)
If @error Then
$iError = @error
$iLastError = @extended
ElseIf $aResult[0] Then
$iLastError = 0
$bRet = True
Else
$iError = 20
$iLastError = _WinAPI_GetLastError()
EndIf
_Security__SetPrivilege($hToken, "SeTimeZonePrivilege", False)
If Not $iError And @error Then $iError = 22
EndIf
_WinAPI_CloseHandle($hToken)
Return SetError($iError, $iLastError, $bRet)
EndFunc
Func _Date_Time_SystemTimeToArray(ByRef $tSYSTEMTIME)
Local $aInfo[8]
$aInfo[0] = DllStructGetData($tSYSTEMTIME, "Month")
$aInfo[1] = DllStructGetData($tSYSTEMTIME, "Day")
$aInfo[2] = DllStructGetData($tSYSTEMTIME, "Year")
$aInfo[3] = DllStructGetData($tSYSTEMTIME, "Hour")
$aInfo[4] = DllStructGetData($tSYSTEMTIME, "Minute")
$aInfo[5] = DllStructGetData($tSYSTEMTIME, "Second")
$aInfo[6] = DllStructGetData($tSYSTEMTIME, "MSeconds")
$aInfo[7] = DllStructGetData($tSYSTEMTIME, "DOW")
Return $aInfo
EndFunc
Func _Date_Time_SystemTimeToDateStr(ByRef $tSYSTEMTIME, $iFmt = 0)
Local $aInfo = _Date_Time_SystemTimeToArray($tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, "")
If $iFmt Then
Return StringFormat("%04d/%02d/%02d", $aInfo[2], $aInfo[0], $aInfo[1])
Else
Return StringFormat("%02d/%02d/%04d", $aInfo[0], $aInfo[1], $aInfo[2])
EndIf
EndFunc
Func _Date_Time_SystemTimeToDateTimeStr(ByRef $tSYSTEMTIME, $iFmt = 0)
Local $aInfo = _Date_Time_SystemTimeToArray($tSYSTEMTIME)
If @error Then Return SetError(@error, @extended, "")
If $iFmt Then
Return StringFormat("%04d/%02d/%02d %02d:%02d:%02d", $aInfo[2], $aInfo[0], $aInfo[1], $aInfo[3], $aInfo[4], $aInfo[5])
Else
Return StringFormat("%02d/%02d/%04d %02d:%02d:%02d", $aInfo[0], $aInfo[1], $aInfo[2], $aInfo[3], $aInfo[4], $aInfo[5])
EndIf
EndFunc
Func _Date_Time_SystemTimeToFileTime($tSYSTEMTIME)
Local $tFileTime = DllStructCreate($tagFILETIME)
Local $aResult = DllCall("kernel32.dll", "bool", "SystemTimeToFileTime", "struct*", $tSYSTEMTIME, "struct*", $tFileTime)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tFileTime)
EndFunc
Func _Date_Time_SystemTimeToTimeStr(ByRef $tSYSTEMTIME)
Local $aInfo = _Date_Time_SystemTimeToArray($tSYSTEMTIME)
Return StringFormat("%02d:%02d:%02d", $aInfo[3], $aInfo[4], $aInfo[5])
EndFunc
Func _Date_Time_SystemTimeToTzSpecificLocalTime($tUTC, $tTimeZone = 0)
Local $tLocalTime = DllStructCreate($tagSYSTEMTIME)
Local $aResult = DllCall("kernel32.dll", "bool", "SystemTimeToTzSpecificLocalTime", "struct*", $tTimeZone, "struct*", $tUTC, "struct*", $tLocalTime)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tLocalTime)
EndFunc
Func _Date_Time_TzSpecificLocalTimeToSystemTime($tLocalTime, $tTimeZone = 0)
Local $tUTC = DllStructCreate($tagSYSTEMTIME)
Local $aResult = DllCall("kernel32.dll", "bool", "TzSpecificLocalTimeToSystemTime", "struct*", $tTimeZone, "struct*", $tLocalTime, "struct*", $tUTC)
If @error Then Return SetError(@error, @extended, 0)
Return SetExtended($aResult[0], $tUTC)
EndFunc
Func _ProcessGetName($iPID)
Local $aProcessList = ProcessList()
For $i = 1 To UBound($aProcessList) - 1
If $aProcessList[$i][1] = $iPID Then
Return $aProcessList[$i][0]
EndIf
Next
Return SetError(1, 0, "")
EndFunc
Func _ProcessGetPriority($vProcess)
Local $iError = 0, $iExtended = 0, $iReturn = -1
Local $iPID = ProcessExists($vProcess)
If Not $iPID Then Return SetError(1, 0, -1)
Local $hDLL = DllOpen('kernel32.dll')
Do
Local $aProcessHandle = DllCall($hDLL, 'handle', 'OpenProcess', 'dword', $PROCESS_QUERY_INFORMATION, 'bool', False, 'dword', $iPID)
If @error Then
$iError = @error + 10
$iExtended = @extended
ExitLoop
EndIf
If Not $aProcessHandle[0] Then ExitLoop
Local $aPriority = DllCall($hDLL, 'dword', 'GetPriorityClass', 'handle', $aProcessHandle[0])
If @error Then
$iError = @error
$iExtended = @extended
EndIf
DllCall($hDLL, 'bool', 'CloseHandle', 'handle', $aProcessHandle[0])
If $iError Then ExitLoop
Switch $aPriority[0]
Case 0x00000040
$iReturn = 0
Case 0x00004000
$iReturn = 1
Case 0x00000020
$iReturn = 2
Case 0x00008000
$iReturn = 3
Case 0x00000080
$iReturn = 4
Case 0x00000100
$iReturn = 5
Case Else
$iError = 1
$iExtended = $aPriority[0]
$iReturn = -1
EndSwitch
Until True
DllClose($hDLL)
Return SetError($iError, $iExtended, $iReturn)
EndFunc
Func _RunDos($sCommand)
Local $iResult = RunWait(@ComSpec & " /C " & $sCommand, "", @SW_HIDE)
Return SetError(@error, @extended, $iResult)
EndFunc
Func _HexToString($sHex)
If Not (StringLeft($sHex, 2) == "0x") Then $sHex = "0x" & $sHex
Return BinaryToString($sHex, $SB_UTF8)
EndFunc
Func _StringBetween($sString, $sStart, $sEnd, $iMode = $STR_ENDISSTART, $bCase = False)
$sStart = $sStart ? "\Q" & $sStart & "\E" : "\A"
If $iMode <> $STR_ENDNOTSTART Then $iMode = $STR_ENDISSTART
If $iMode = $STR_ENDISSTART Then
$sEnd = $sEnd ? "(?=\Q" & $sEnd & "\E)" : "\z"
Else
$sEnd = $sEnd ? "\Q" & $sEnd & "\E" : "\z"
EndIf
If $bCase = Default Then
$bCase = False
EndIf
Local $aReturn = StringRegExp($sString, "(?s" & (Not $bCase ? "i" : "") & ")" & $sStart & "(.*?)" & $sEnd, $STR_REGEXPARRAYGLOBALMATCH)
If @error Then Return SetError(1, 0, 0)
Return $aReturn
EndFunc
Func _StringExplode($sString, $sDelimiter, $iLimit = 0)
If $iLimit = Default Then $iLimit = 0
If $iLimit > 0 Then
Local Const $NULL = Chr(0)
$sString = StringReplace($sString, $sDelimiter, $NULL, $iLimit)
$sDelimiter = $NULL
ElseIf $iLimit < 0 Then
Local $iIndex = StringInStr($sString, $sDelimiter, $STR_NOCASESENSEBASIC, $iLimit)
If $iIndex Then
$sString = StringLeft($sString, $iIndex - 1)
EndIf
EndIf
Return StringSplit($sString, $sDelimiter, BItOR($STR_ENTIRESPLIT, $STR_NOCOUNT))
EndFunc
Func _StringInsert($sString, $sInsertion, $iPosition)
Local $iLength = StringLen($sString)
$iPosition = Int($iPosition)
If $iPosition < 0 Then $iPosition = $iLength + $iPosition
If $iLength < $iPosition Or $iPosition < 0 Then Return SetError(1, 0, $sString)
Return StringLeft($sString, $iPosition) & $sInsertion & StringRight($sString, $iLength - $iPosition)
EndFunc
Func _StringProper($sString)
Local $bCapNext = True, $sChr = "", $sReturn = ""
For $i = 1 To StringLen($sString)
$sChr = StringMid($sString, $i, 1)
Select
Case $bCapNext = True
If StringRegExp($sChr, '[a-zA-ZÀ-ÿšœžŸ]') Then
$sChr = StringUpper($sChr)
$bCapNext = False
EndIf
Case Not StringRegExp($sChr, '[a-zA-ZÀ-ÿšœžŸ]')
$bCapNext = True
Case Else
$sChr = StringLower($sChr)
EndSelect
$sReturn &= $sChr
Next
Return $sReturn
EndFunc
Func _StringRepeat($sString, $iRepeatCount)
$iRepeatCount = Int($iRepeatCount)
If $iRepeatCount = 0 Then Return ""
If StringLen($sString) < 1 Or $iRepeatCount < 0 Then Return SetError(1, 0, "")
Local $sResult = ""
While $iRepeatCount > 1
If BitAND($iRepeatCount, 1) Then $sResult &= $sString
$sString &= $sString
$iRepeatCount = BitShift($iRepeatCount, 1)
WEnd
Return $sString & $sResult
EndFunc
Func _StringTitleCase($sString)
Local $bCapNext = True, $sChr = "", $sReturn = ""
For $i = 1 To StringLen($sString)
$sChr = StringMid($sString, $i, 1)
Select
Case $bCapNext = True
If StringRegExp($sChr, "[a-zA-Z\xC0-\xFF0-9]") Then
$sChr = StringUpper($sChr)
$bCapNext = False
EndIf
Case Not StringRegExp($sChr, "[a-zA-Z\xC0-\xFF'0-9]")
$bCapNext = True
Case Else
$sChr = StringLower($sChr)
EndSelect
$sReturn &= $sChr
Next
Return $sReturn
EndFunc
Func _StringToHex($sString)
Return Hex(StringToBinary($sString, $SB_UTF8))
EndFunc
#Region Header
#EndRegion Header
#Region Global Variables
Global $__g_iIELoadWaitTimeout = 300000
Global $__g_bIEAU3Debug = False
Global $__g_bIEErrorNotify = True
Global $__g_oIEErrorHandler, $__g_sIEUserErrorHandler
#EndRegion Global Variables
#Region Global Constants
Global Const $__gaIEAU3VersionInfo[6] = ["T", 3, 0, 2, "20140819", "T3.0-2"]
Global Const $LSFW_LOCK = 1, $LSFW_UNLOCK = 2
Global Enum  $_IESTATUS_Success = 0,  $_IESTATUS_GeneralError,  $_IESTATUS_ComError,  $_IESTATUS_InvalidDataType,  $_IESTATUS_InvalidObjectType,  $_IESTATUS_InvalidValue,  $_IESTATUS_LoadWaitTimeout,  $_IESTATUS_NoMatch,  $_IESTATUS_AccessIsDenied,  $_IESTATUS_ClientDisconnected
#EndRegion Global Constants
#Region Core functions
Func _IECreate($sUrl = "about:blank", $iTryAttach = 0, $iVisible = 1, $iWait = 1, $iTakeFocus = 1)
If Not $iVisible Then $iTakeFocus = 0
If $iTryAttach Then
Local $oResult = _IEAttach($sUrl, "url")
If IsObj($oResult) Then
If $iTakeFocus Then WinActivate(HWnd($oResult.hWnd))
Return SetError($_IESTATUS_Success, 1, $oResult)
EndIf
EndIf
Local $iMustUnlock = 0
If Not $iVisible And __IELockSetForegroundWindow($LSFW_LOCK) Then $iMustUnlock = 1
Local $oObject = ObjCreate("InternetExplorer.Application")
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IECreate", "", "Browser Object Creation Failed")
If $iMustUnlock Then __IELockSetForegroundWindow($LSFW_UNLOCK)
Return SetError($_IESTATUS_GeneralError, 0, 0)
EndIf
$oObject.visible = $iVisible
If $iMustUnlock And Not __IELockSetForegroundWindow($LSFW_UNLOCK) Then __IEConsoleWriteError("Warning", "_IECreate", "", "Foreground Window Unlock Failed!")
_IENavigate($oObject, $sUrl, $iWait)
Local $iError = @error
If Not $iError And StringLeft($sUrl, 6) = "about:" Then
Local $oDocument = $oObject.document
_IEAction($oDocument, "focus")
EndIf
Return SetError($iError, 0, $oObject)
EndFunc
Func _IECreateEmbedded()
Local $oObject = ObjCreate("Shell.Explorer.2")
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IECreateEmbedded", "", "WebBrowser Object Creation Failed")
Return SetError($_IESTATUS_GeneralError, 0, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject)
EndFunc
Func _IENavigate(ByRef $oObject, $sUrl, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IENavigate", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IENavigate", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.navigate($sUrl)
If @error Then
__IEConsoleWriteError("Error", "_IENavigate", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
EndFunc
Func _IEAttach($sString, $sMode = "title", $iInstance = 1)
$sMode = StringLower($sMode)
$iInstance = Int($iInstance)
If $iInstance < 1 Then
__IEConsoleWriteError("Error", "_IEAttach", "$_IESTATUS_InvalidValue", "$iInstance < 1")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndIf
If $sMode = "embedded" Or $sMode = "dialogbox" Then
Local $iWinTitleMatchMode = Opt("WinTitleMatchMode", $OPT_MATCHANY)
If $sMode = "dialogbox" And $iInstance > 1 Then
If IsHWnd($sString) Then
$iInstance = 1
__IEConsoleWriteError("Warning", "_IEAttach", "$_IESTATUS_GeneralError", "$iInstance > 1 invalid with HWnd and DialogBox.  Setting to 1.")
Else
Local $aWinlist = WinList($sString, "")
If $iInstance <= $aWinlist[0][0] Then
$sString = $aWinlist[$iInstance][1]
$iInstance = 1
Else
__IEConsoleWriteError("Warning", "_IEAttach", "$_IESTATUS_NoMatch")
Opt("WinTitleMatchMode", $iWinTitleMatchMode)
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndIf
EndIf
EndIf
Local $hControl = ControlGetHandle($sString, "", "[CLASS:Internet Explorer_Server; INSTANCE:" & $iInstance & "]")
Local $oResult = __IEControlGetObjFromHWND($hControl)
Opt("WinTitleMatchMode", $iWinTitleMatchMode)
If IsObj($oResult) Then
Return SetError($_IESTATUS_Success, 0, $oResult)
Else
__IEConsoleWriteError("Warning", "_IEAttach", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndIf
EndIf
Local $oShell = ObjCreate("Shell.Application")
Local $oShellWindows = $oShell.Windows()
Local $iTmp = 1
Local $iNotifyStatus, $bIsBrowser, $sTmp
Local $bStatus
For $oWindow In $oShellWindows
$bIsBrowser = True
$bStatus = __IEInternalErrorHandlerRegister()
If Not $bStatus Then __IEConsoleWriteError("Warning", "_IEAttach",  "Cannot register internal error handler, cannot trap COM errors",  "Use _IEErrorHandlerRegister() to register a user error handler")
$iNotifyStatus = _IEErrorNotify()
_IEErrorNotify(False)
If $bIsBrowser Then
$sTmp = $oWindow.type
If @error Then $bIsBrowser = False
EndIf
If $bIsBrowser Then
$sTmp = $oWindow.document.title
If @error Then $bIsBrowser = False
EndIf
_IEErrorNotify($iNotifyStatus)
__IEInternalErrorHandlerDeRegister()
If $bIsBrowser Then
Switch $sMode
Case "title"
If StringInStr($oWindow.document.title, $sString) > 0 Then
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
EndIf
Case "instance"
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
Case "windowtitle"
Local $bFound = False
$sTmp = RegRead("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\", "Window Title")
If Not @error Then
If StringInStr($oWindow.document.title & " - " & $sTmp, $sString) Then $bFound = True
Else
If StringInStr($oWindow.document.title & " - Microsoft Internet Explorer", $sString) Then $bFound = True
If StringInStr($oWindow.document.title & " - Windows Internet Explorer", $sString) Then $bFound = True
EndIf
If $bFound Then
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
EndIf
Case "url"
If StringInStr($oWindow.LocationURL, $sString) > 0 Then
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
EndIf
Case "text"
If StringInStr($oWindow.document.body.innerText, $sString) > 0 Then
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
EndIf
Case "html"
If StringInStr($oWindow.document.body.innerHTML, $sString) > 0 Then
If $iInstance = $iTmp Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
Else
$iTmp += 1
EndIf
EndIf
Case "hwnd"
If $iInstance > 1 Then
$iInstance = 1
__IEConsoleWriteError("Warning", "_IEAttach", "$_IESTATUS_GeneralError", "$iInstance > 1 invalid with HWnd.  Setting to 1.")
EndIf
If _IEPropertyGet($oWindow, "hwnd") = $sString Then
Return SetError($_IESTATUS_Success, 0, $oWindow)
EndIf
Case Else
__IEConsoleWriteError("Error", "_IEAttach", "$_IESTATUS_InvalidValue", "Invalid Mode Specified")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
EndSwitch
EndIf
Next
__IEConsoleWriteError("Warning", "_IEAttach", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndFunc
Func _IELoadWait(ByRef $oObject, $iDelay = 0, $iTimeout = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IELoadWait", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IELoadWait", "$_IESTATUS_InvalidObjectType", ObjName($oObject))
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oTemp, $bAbort = False, $iErrorStatusCode = $_IESTATUS_Success
Local $bStatus = __IEInternalErrorHandlerRegister()
If Not $bStatus Then __IEConsoleWriteError("Warning", "_IELoadWait",  "Cannot register internal error handler, cannot trap COM errors",  "Use _IEErrorHandlerRegister() to register a user error handler")
Local $iNotifyStatus = _IEErrorNotify()
_IEErrorNotify(False)
Sleep($iDelay)
Local $iError
Local $hIELoadWaitTimer = TimerInit()
If $iTimeout = -1 Then $iTimeout = $__g_iIELoadWaitTimeout
Select
Case __IEIsObjType($oObject, "browser", False)
While Not (String($oObject.readyState) = "complete" Or $oObject.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
While Not (String($oObject.document.readyState) = "complete" Or $oObject.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
Case __IEIsObjType($oObject, "window", False)
While Not (String($oObject.document.readyState) = "complete" Or $oObject.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
While Not (String($oObject.top.document.readyState) = "complete" Or $oObject.top.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
Case __IEIsObjType($oObject, "document", False)
$oTemp = $oObject.parentWindow
While Not (String($oTemp.document.readyState) = "complete" Or $oTemp.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
While Not (String($oTemp.top.document.readyState) = "complete" Or $oTemp.top.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
Case Else
$oTemp = $oObject.document.parentWindow
While Not (String($oTemp.document.readyState) = "complete" Or $oTemp.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
While Not (String($oTemp.top.document.readyState) = "complete" Or $oObject.top.document.readyState = 4 Or $bAbort)
If @error Then
$iError = @error
If __IEComErrorUnrecoverable($iError) Then
$iErrorStatusCode = __IEComErrorUnrecoverable($iError)
$bAbort = True
EndIf
ElseIf (TimerDiff($hIELoadWaitTimer) > $iTimeout) Then
$iErrorStatusCode = $_IESTATUS_LoadWaitTimeout
$bAbort = True
EndIf
Sleep(100)
WEnd
EndSelect
_IEErrorNotify($iNotifyStatus)
__IEInternalErrorHandlerDeRegister()
Switch $iErrorStatusCode
Case $_IESTATUS_Success
Return SetError($_IESTATUS_Success, 0, 1)
Case $_IESTATUS_LoadWaitTimeout
__IEConsoleWriteError("Warning", "_IELoadWait", "$_IESTATUS_LoadWaitTimeout")
Return SetError($_IESTATUS_LoadWaitTimeout, 3, 0)
Case $_IESTATUS_AccessIsDenied
__IEConsoleWriteError("Warning", "_IELoadWait", "$_IESTATUS_AccessIsDenied",  "Cannot verify readyState.  Likely casue: cross-domain scripting security restriction. (" & $iError & ")")
Return SetError($_IESTATUS_AccessIsDenied, 0, 0)
Case $_IESTATUS_ClientDisconnected
__IEConsoleWriteError("Error", "_IELoadWait", "$_IESTATUS_ClientDisconnected",  $iError & ", Browser has been deleted prior to operation.")
Return SetError($_IESTATUS_ClientDisconnected, 0, 0)
Case Else
__IEConsoleWriteError("Error", "_IELoadWait", "$_IESTATUS_GeneralError", "Invalid Error Status - Notify IE.au3 developer")
Return SetError($_IESTATUS_GeneralError, 0, 0)
EndSwitch
EndFunc
Func _IELoadWaitTimeout($iTimeout = -1)
If $iTimeout = -1 Then
Return SetError($_IESTATUS_Success, 0, $__g_iIELoadWaitTimeout)
Else
$__g_iIELoadWaitTimeout = $iTimeout
Return SetError($_IESTATUS_Success, 0, 1)
EndIf
EndFunc
#EndRegion Core functions
#Region Frame Functions
Func _IEIsFrameSet(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEIsFrameSet", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If String($oObject.document.body.tagName) = "frameset" Then
Return SetError($_IESTATUS_Success, 0, 1)
Else
If @error Then
__IEConsoleWriteError("Error", "_IEIsFrameSet", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 0)
EndIf
EndFunc
Func _IEFrameGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFrameGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oObject.document.parentwindow.frames.length,  $oObject.document.parentwindow.frames)
Case $iIndex > -1 And $iIndex < $oObject.document.parentwindow.frames.length
Return SetError($_IESTATUS_Success, $oObject.document.parentwindow.frames.length,  $oObject.document.parentwindow.frames.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IEFrameGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Warning", "_IEFrameGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndSelect
EndFunc
Func _IEFrameGetObjByName(ByRef $oObject, $sName)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFrameGetObjByName", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oTemp, $oFrames
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEFrameGetObjByName", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.parentWindow
Else
$oTemp = $oObject.document.parentWindow
EndIf
If _IEIsFrameSet($oTemp) Then
$oFrames = _IETagNameGetCollection($oTemp, "frame")
Else
$oFrames = _IETagNameGetCollection($oTemp, "iframe")
EndIf
If $oFrames.length Then
For $oFrame In $oFrames
If String($oFrame.name) = $sName Then Return SetError($_IESTATUS_Success, 0, $oTemp.frames($sName))
Next
__IEConsoleWriteError("Warning", "_IEFrameGetObjByName", "$_IESTATUS_NoMatch", "No frames matching name")
Return SetError($_IESTATUS_NoMatch, 2, 0)
Else
__IEConsoleWriteError("Warning", "_IEFrameGetObjByName", "$_IESTATUS_NoMatch", "No Frames found")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndIf
EndFunc
#EndRegion Frame Functions
#Region Link functions
Func _IELinkClickByText(ByRef $oObject, $sLinkText, $iIndex = 0, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IELinkClickByText", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $iFound = 0, $sModeLinktext, $oLinks = $oObject.document.links
$iIndex = Number($iIndex)
For $oLink In $oLinks
$sModeLinktext = String($oLink.outerText)
If $sModeLinktext = $sLinkText Then
If ($iFound = $iIndex) Then
$oLink.click()
If @error Then
__IEConsoleWriteError("Error", "_IELinkClickByText", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
EndIf
$iFound = $iFound + 1
EndIf
Next
__IEConsoleWriteError("Warning", "_IELinkClickByText", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndFunc
Func _IELinkClickByIndex(ByRef $oObject, $iIndex, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IELinkClickByIndex", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oLinks = $oObject.document.links, $oLink
$iIndex = Number($iIndex)
If ($iIndex >= 0) And ($iIndex <= $oLinks.length - 1) Then
$oLink = $oLinks($iIndex)
$oLink.click()
If @error Then
__IEConsoleWriteError("Error", "_IELinkClickByIndex", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
Else
__IEConsoleWriteError("Warning", "_IELinkClickByIndex", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndIf
EndFunc
Func _IELinkGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IELinkGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oObject.document.links.length,  $oObject.document.links)
Case $iIndex > -1 And $iIndex < $oObject.document.links.length
Return SetError($_IESTATUS_Success, $oObject.document.links.length,  $oObject.document.links.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IELinkGetCollection", "$_IESTATUS_InvalidValue")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Warning", "_IELinkGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndSelect
EndFunc
#EndRegion Link functions
#Region Image functions
Func _IEImgClick(ByRef $oObject, $sLinkText, $sMode = "src", $iIndex = 0, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEImgClick", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $sModeLinktext, $iFound = 0, $oImgs = $oObject.document.images
$sMode = StringLower($sMode)
$iIndex = Number($iIndex)
For $oImg In $oImgs
Select
Case $sMode = "alt"
$sModeLinktext = $oImg.alt
Case $sMode = "name"
$sModeLinktext = $oImg.name
If Not IsString($sModeLinktext) Then $sModeLinktext = $oImg.id
Case $sMode = "id"
$sModeLinktext = $oImg.id
Case $sMode = "src"
$sModeLinktext = $oImg.src
Case Else
__IEConsoleWriteError("Error", "_IEImgClick", "$_IESTATUS_InvalidValue", "Invalid mode: " & $sMode)
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSelect
If StringInStr($sModeLinktext, $sLinkText) Then
If ($iFound = $iIndex) Then
$oImg.click()
If @error Then
__IEConsoleWriteError("Error", "_IEImgClick", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
EndIf
$iFound = $iFound + 1
EndIf
Next
__IEConsoleWriteError("Warning", "_IEImgClick", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndFunc
Func _IEImgGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEImgGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oTemp = _IEDocGetObj($oObject)
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oTemp.images.length, $oTemp.images)
Case $iIndex > -1 And $iIndex < $oTemp.images.length
Return SetError($_IESTATUS_Success, $oTemp.images.length, $oTemp.images.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IEImgGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Warning", "_IEImgGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndSelect
EndFunc
#EndRegion Image functions
#Region Form functions
Func _IEFormGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oTemp = _IEDocGetObj($oObject)
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oTemp.forms.length, $oTemp.forms)
Case $iIndex > -1 And $iIndex < $oTemp.forms.length
Return SetError($_IESTATUS_Success, $oTemp.forms.length, $oTemp.forms.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IEFormGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Warning", "_IEFormGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndSelect
EndFunc
Func _IEFormGetObjByName(ByRef $oObject, $sName, $iIndex = 0)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormGetObjByName", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $iLength = 0
Local $oCol = $oObject.document.forms.item($sName)
If IsObj($oCol) Then
If __IEIsObjType($oCol, "elementcollection") Then
$iLength = $oCol.length
Else
$iLength = 1
EndIf
EndIf
$iIndex = Number($iIndex)
If $iIndex = -1 Then
Return SetError($_IESTATUS_Success, $iLength, $oObject.document.forms.item($sName))
Else
If IsObj($oObject.document.forms.item($sName, $iIndex)) Then
Return SetError($_IESTATUS_Success, $iLength, $oObject.document.forms.item($sName, $iIndex))
Else
__IEConsoleWriteError("Warning", "_IEFormGetObjByName", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndIf
EndIf
EndFunc
Func _IEFormElementGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormElementGetCollection", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oObject.elements.length, $oObject.elements)
Case $iIndex > -1 And $iIndex < $oObject.elements.length
Return SetError($_IESTATUS_Success, $oObject.elements.length, $oObject.elements.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IEFormElementGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndSelect
EndFunc
Func _IEFormElementGetObjByName(ByRef $oObject, $sName, $iIndex = 0)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementGetObjByName", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormElementGetObjByName", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $iLength = 0
Local $oCol = $oObject.elements.item($sName)
If IsObj($oCol) Then
If __IEIsObjType($oCol, "elementcollection") Then
$iLength = $oCol.length
Else
$iLength = 1
EndIf
EndIf
$iIndex = Number($iIndex)
If $iIndex = -1 Then
Return SetError($_IESTATUS_Success, $iLength, $oObject.elements.item($sName))
Else
If IsObj($oObject.elements.item($sName, $iIndex)) Then
Return SetError($_IESTATUS_Success, $iLength, $oObject.elements.item($sName, $iIndex))
Else
__IEConsoleWriteError("Warning", "_IEFormElementGetObjByName", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndIf
EndIf
EndFunc
Func _IEFormElementGetValue(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementGetValue", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "forminputelement") Then
__IEConsoleWriteError("Error", "_IEFormElementGetValue", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $sReturn = String($oObject.value)
If @error Then
__IEConsoleWriteError("Error", "_IEFormElementGetValue", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
SetError($_IESTATUS_Success)
Return $sReturn
EndFunc
Func _IEFormElementSetValue(ByRef $oObject, $sNewValue, $iFireEvent = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementSetValue", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "forminputelement") Then
__IEConsoleWriteError("Error", "_IEFormElementSetValue", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If String($oObject.type) = "file" Then
__IEConsoleWriteError("Error", "_IEFormElementSetValue", "$_IESTATUS_InvalidObjectType", "Browser security prevents SetValue of TYPE=FILE")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.value = $sNewValue
If @error Then
__IEConsoleWriteError("Error", "_IEFormElementSetValue", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iFireEvent Then
$oObject.fireEvent("OnChange")
$oObject.fireEvent("OnClick")
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func _IEFormElementOptionSelect(ByRef $oObject, $sString, $iSelect = 1, $sMode = "byValue", $iFireEvent = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "formselectelement") Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oItem, $oItems = $oObject.options, $iNumItems = $oObject.options.length, $bIsMultiple = $oObject.multiple
Switch $sMode
Case "byValue"
For $oItem In $oItems
If $oItem.value = $sString Then
Switch $iSelect
Case -1
Return SetError($_IESTATUS_Success, 0, $oItem.selected)
Case 0
If Not $bIsMultiple Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue",  "$iSelect=0 only valid for type=select multiple")
Return SetError($_IESTATUS_InvalidValue, 3)
EndIf
If $oItem.selected Then
$oItem.selected = False
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case 1
If Not $oItem.selected Then
$oItem.selected = True
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue", "Invalid $iSelect value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSwitch
EndIf
Next
__IEConsoleWriteError("Warning", "_IEFormElementOptionSelect", "$_IESTATUS_NoMatch", "Value not matched")
Return SetError($_IESTATUS_NoMatch, 2, 0)
Case "byText"
For $oItem In $oItems
If String($oItem.text) = $sString Then
Switch $iSelect
Case -1
Return SetError($_IESTATUS_Success, 0, $oItem.selected)
Case 0
If Not $bIsMultiple Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue",  "$iSelect=0 only valid for type=select multiple")
Return SetError($_IESTATUS_InvalidValue, 3)
EndIf
If $oItem.selected Then
$oItem.selected = False
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case 1
If Not $oItem.selected Then
$oItem.selected = True
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue", "Invalid $iSelect value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSwitch
EndIf
Next
__IEConsoleWriteError("Warning", "_IEFormElementOptionSelect", "$_IESTATUS_NoMatch", "Text not matched")
Return SetError($_IESTATUS_NoMatch, 2, 0)
Case "byIndex"
Local $iIndex = Number($sString)
If $iIndex < 0 Or $iIndex >= $iNumItems Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue", "Invalid index value, " & $iIndex)
Return SetError($_IESTATUS_InvalidValue, 2, 0)
EndIf
$oItem = $oItems.item($iIndex)
Switch $iSelect
Case -1
Return SetError($_IESTATUS_Success, 0, $oItems.item($iIndex).selected)
Case 0
If Not $bIsMultiple Then
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue",  "$iSelect=0 only valid for type=select multiple")
Return SetError($_IESTATUS_InvalidValue, 3)
EndIf
If $oItem.selected Then
$oItems.item($iIndex).selected = False
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case 1
If Not $oItem.selected Then
$oItems.item($iIndex).selected = True
If $iFireEvent Then
$oObject.fireEvent("onChange")
$oObject.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue", "Invalid $iSelect value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSwitch
Case Else
__IEConsoleWriteError("Error", "_IEFormElementOptionSelect", "$_IESTATUS_InvalidValue", "Invalid Mode")
Return SetError($_IESTATUS_InvalidValue, 4, 0)
EndSwitch
EndFunc
Func _IEFormElementCheckBoxSelect(ByRef $oObject, $sString, $sName = "", $iSelect = 1, $sMode = "byValue", $iFireEvent = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementCheckBoxSelect", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormElementCheckBoxSelect", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$sString = String($sString)
$sName = String($sName)
Local $oItems
If $sName = "" Then
$oItems = _IETagNameGetCollection($oObject, "input")
Else
$oItems = Execute("$oObject.elements('" & $sName & "')")
EndIf
If Not IsObj($oItems) Then
__IEConsoleWriteError("Warning", "_IEFormElementCheckBoxSelect", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 3, 0)
EndIf
Local $oItem, $bFound = False
Switch $sMode
Case "byValue"
If __IEIsObjType($oItems, "forminputelement") Then
$oItem = $oItems
If String($oItem.type) = "checkbox" And String($oItem.value) = $sString Then $bFound = True
Else
For $oItem In $oItems
If String($oItem.type) = "checkbox" And String($oItem.value) = $sString Then
$bFound = True
ExitLoop
EndIf
Next
EndIf
Case "byIndex"
If __IEIsObjType($oItems, "forminputelement") Then
$oItem = $oItems
If String($oItem.type) = "checkbox" And Number($sString) = 0 Then $bFound = True
Else
Local $iCount = 0
For $oItem In $oItems
If String($oItem.type) = "checkbox" And Number($sString) = $iCount Then
$bFound = True
ExitLoop
Else
If String($oItem.type) = "checkbox" Then $iCount += 1
EndIf
Next
EndIf
Case Else
__IEConsoleWriteError("Error", "_IEFormElementCheckBoxSelect", "$_IESTATUS_InvalidValue", "Invalid Mode")
Return SetError($_IESTATUS_InvalidValue, 5, 0)
EndSwitch
If Not $bFound Then
__IEConsoleWriteError("Warning", "_IEFormElementCheckBoxSelect", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndIf
Switch $iSelect
Case -1
Return SetError($_IESTATUS_Success, 0, $oItem.checked)
Case 0
If $oItem.checked Then
$oItem.checked = False
If $iFireEvent Then
$oItem.fireEvent("onChange")
$oItem.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case 1
If Not $oItem.checked Then
$oItem.checked = True
If $iFireEvent Then
$oItem.fireEvent("onChange")
$oItem.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEFormElementCheckBoxSelect", "$_IESTATUS_InvalidValue", "Invalid $iSelect value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSwitch
EndFunc
Func _IEFormElementRadioSelect(ByRef $oObject, $sString, $sName, $iSelect = 1, $sMode = "byValue", $iFireEvent = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormElementRadioSelect", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormElementRadioSelect", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$sString = String($sString)
$sName = String($sName)
Local $oItems = Execute("$oObject.elements('" & $sName & "')")
If Not IsObj($oItems) Then
__IEConsoleWriteError("Warning", "_IEFormElementRadioSelect", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 3, 0)
EndIf
Local $oItem, $bFound = False
Switch $sMode
Case "byValue"
If __IEIsObjType($oItems, "forminputelement") Then
$oItem = $oItems
If String($oItem.type) = "radio" And String($oItem.value) = $sString Then $bFound = True
Else
For $oItem In $oItems
If String($oItem.type) = "radio" And String($oItem.value) = $sString Then
$bFound = True
ExitLoop
EndIf
Next
EndIf
Case "byIndex"
If __IEIsObjType($oItems, "forminputelement") Then
$oItem = $oItems
If String($oItem.type) = "radio" And Number($sString) = 0 Then $bFound = True
Else
Local $iCount = 0
For $oItem In $oItems
If String($oItem.type) = "radio" And Number($sString) = $iCount Then
$bFound = True
ExitLoop
Else
$iCount += 1
EndIf
Next
EndIf
Case Else
__IEConsoleWriteError("Error", "_IEFormElementRadioSelect", "$_IESTATUS_InvalidValue", "Invalid Mode")
Return SetError($_IESTATUS_InvalidValue, 5, 0)
EndSwitch
If Not $bFound Then
__IEConsoleWriteError("Warning", "_IEFormElementRadioSelect", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndIf
Switch $iSelect
Case -1
Return SetError($_IESTATUS_Success, 0, $oItem.checked)
Case 0
If $oItem.checked Then
$oItem.checked = False
If $iFireEvent Then
$oItem.fireEvent("onChange")
$oItem.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case 1
If Not $oItem.checked Then
$oItem.checked = True
If $iFireEvent Then
$oItem.fireEvent("onChange")
$oItem.fireEvent("OnClick")
EndIf
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEFormElementRadioSelect", "$_IESTATUS_InvalidValue", "$iSelect value invalid")
Return SetError($_IESTATUS_InvalidValue, 4, 0)
EndSwitch
EndFunc
Func _IEFormImageClick(ByRef $oObject, $sLinkText, $sMode = "src", $iIndex = 0, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormImageClick", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $sModeLinktext, $iFound = 0
Local $oTemp = _IEDocGetObj($oObject)
Local $oImgs = _IETagNameGetCollection($oTemp, "input")
$sMode = StringLower($sMode)
$iIndex = Number($iIndex)
For $oImg In $oImgs
If String($oImg.type) = "image" Then
Select
Case $sMode = "alt"
$sModeLinktext = $oImg.alt
Case $sMode = "name"
$sModeLinktext = $oImg.name
If Not IsString($sModeLinktext) Then $sModeLinktext = $oImg.id
Case $sMode = "id"
$sModeLinktext = $oImg.id
Case $sMode = "src"
$sModeLinktext = $oImg.src
Case Else
__IEConsoleWriteError("Error", "_IEFormImageClick", "$_IESTATUS_InvalidValue", "Invalid mode: " & $sMode)
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSelect
If StringInStr($sModeLinktext, $sLinkText) Then
If ($iFound = $iIndex) Then
$oImg.click()
If @error Then
__IEConsoleWriteError("Error", "_IEFormImageClick", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
EndIf
$iFound = $iFound + 1
EndIf
EndIf
Next
__IEConsoleWriteError("Warning", "_IEFormImageClick", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndFunc
Func _IEFormSubmit(ByRef $oObject, $iWait = 1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormSubmit", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormSubmit", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oWindow = $oObject.document.parentWindow
$oObject.submit()
If @error Then
__IEConsoleWriteError("Error", "_IEFormSubmit", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
If $iWait Then
_IELoadWait($oWindow)
Return SetError(@error, 0, -1)
EndIf
Return SetError($_IESTATUS_Success, 0, -1)
EndFunc
Func _IEFormReset(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEFormReset", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "form") Then
__IEConsoleWriteError("Error", "_IEFormReset", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.reset()
If @error Then
__IEConsoleWriteError("Error", "_IEFormReset", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
#EndRegion Form functions
#Region Table functions
Func _IETableGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IETableGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oObject.document.GetElementsByTagName("table").length,  $oObject.document.GetElementsByTagName("table"))
Case $iIndex > -1 And $iIndex < $oObject.document.GetElementsByTagName("table").length
Return SetError($_IESTATUS_Success, $oObject.document.GetElementsByTagName("table").length,  $oObject.document.GetElementsByTagName("table").item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IETableGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Warning", "_IETableGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndSelect
EndFunc
Func _IETableWriteToArray(ByRef $oObject, $bTranspose = False)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IETableWriteToArray", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "table") Then
__IEConsoleWriteError("Error", "_IETableWriteToArray", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $iCols = 0, $oTds, $iCol
Local $oTrs = $oObject.rows
For $oTr In $oTrs
$oTds = $oTr.cells
$iCol = 0
For $oTd In $oTds
$iCol = $iCol + $oTd.colSpan
Next
If $iCol > $iCols Then $iCols = $iCol
Next
Local $iRows = $oTrs.length
Local $aTableCells[$iCols][$iRows]
Local $iRow = 0
For $oTr In $oTrs
$oTds = $oTr.cells
$iCol = 0
For $oTd In $oTds
$aTableCells[$iCol][$iRow] = String($oTd.innerText)
If @error Then
__IEConsoleWriteError("Error", "_IETableWriteToArray", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
$iCol = $iCol + $oTd.colSpan
Next
$iRow = $iRow + 1
Next
If $bTranspose Then
Local $iD1 = UBound($aTableCells, $UBOUND_ROWS), $iD2 = UBound($aTableCells, $UBOUND_COLUMNS), $aTmp[$iD2][$iD1]
For $i = 0 To $iD2 - 1
For $j = 0 To $iD1 - 1
$aTmp[$i][$j] = $aTableCells[$j][$i]
Next
Next
$aTableCells = $aTmp
EndIf
Return SetError($_IESTATUS_Success, 0, $aTableCells)
EndFunc
#EndRegion Table functions
#Region Read/Write functions
Func _IEBodyReadHTML(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEBodyReadHTML", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.document.body.innerHTML)
EndFunc
Func _IEBodyReadText(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEBodyReadText", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEBodyReadText", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.document.body.innerText)
EndFunc
Func _IEBodyWriteHTML(ByRef $oObject, $sHTML)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEBodyWriteHTML", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEBodyWriteHTML", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.document.body.innerHTML = $sHTML
If @error Then
__IEConsoleWriteError("Error", "_IEBodyWriteHTML", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Local $oTemp = $oObject.document
_IELoadWait($oTemp)
Return SetError(@error, 0, -1)
EndFunc
Func _IEDocReadHTML(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEDocReadHTML", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEDocReadHTML", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.document.documentElement.outerHTML)
EndFunc
Func _IEDocWriteHTML(ByRef $oObject, $sHTML)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEDocWriteHTML", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEDocWriteHTML", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.document.Write($sHTML)
$oObject.document.close()
Local $oTemp = $oObject.document
If @error Then
__IEConsoleWriteError("Error", "_IEDocWriteHTML", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
_IELoadWait($oTemp)
Return SetError(@error, 0, -1)
EndFunc
Func _IEDocInsertText(ByRef $oObject, $sString, $sWhere = "beforeend")
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEDocInsertText", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Or __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEDocInsertText", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$sWhere = StringLower($sWhere)
Select
Case $sWhere = "beforebegin"
$oObject.insertAdjacentText($sWhere, $sString)
Case $sWhere = "afterbegin"
$oObject.insertAdjacentText($sWhere, $sString)
Case $sWhere = "beforeend"
$oObject.insertAdjacentText($sWhere, $sString)
Case $sWhere = "afterend"
$oObject.insertAdjacentText($sWhere, $sString)
Case Else
__IEConsoleWriteError("Error", "_IEDocInsertText", "$_IESTATUS_InvalidValue", "Invalid where value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSelect
If @error Then
__IEConsoleWriteError("Error", "_IEDocInsertText", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func _IEDocInsertHTML(ByRef $oObject, $sString, $sWhere = "beforeend")
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEDocInsertHTML", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Or __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEDocInsertHTML", "$_IESTATUS_InvalidObjectType", "Expected document element")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$sWhere = StringLower($sWhere)
Select
Case $sWhere = "beforebegin"
$oObject.insertAdjacentHTML($sWhere, $sString)
Case $sWhere = "afterbegin"
$oObject.insertAdjacentHTML($sWhere, $sString)
Case $sWhere = "beforeend"
$oObject.insertAdjacentHTML($sWhere, $sString)
Case $sWhere = "afterend"
$oObject.insertAdjacentHTML($sWhere, $sString)
Case Else
__IEConsoleWriteError("Error", "_IEDocInsertHTML", "$_IESTATUS_InvalidValue", "Invalid where value")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
EndSelect
If @error Then
__IEConsoleWriteError("Error", "_IEDocInsertHTML", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func _IEHeadInsertEventScript(ByRef $oObject, $sHTMLFor, $sEvent, $sScript)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEHeadInsertEventScript", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oHead = $oObject.document.all.tags("HEAD").Item(0)
Local $oScript = $oObject.document.createElement("script")
If @error Then
__IEConsoleWriteError("Error", "_IEHeadInsertEventScript(script)", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
With $oScript
.defer = True
.language = "jscript"
.type = "text/javascript"
.htmlFor = $sHTMLFor
.event = $sEvent
.text = $sScript
EndWith
$oHead.appendChild($oScript)
If @error Then
__IEConsoleWriteError("Error", "_IEHeadInsertEventScript", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
#EndRegion Read/Write functions
#Region Utility functions
Func _IEDocGetObj(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEDocGetObj", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If __IEIsObjType($oObject, "document") Then
Return SetError($_IESTATUS_Success, 0, $oObject)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.document)
EndFunc
Func _IETagNameGetCollection(ByRef $oObject, $sTagName, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IETagNameGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IETagNameGetCollection", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oTemp
If __IEIsObjType($oObject, "documentcontainer") Then
$oTemp = _IEDocGetObj($oObject)
Else
$oTemp = $oObject
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oTemp.GetElementsByTagName($sTagName).length,  $oTemp.GetElementsByTagName($sTagName))
Case $iIndex > -1 And $iIndex < $oTemp.GetElementsByTagName($sTagName).length
Return SetError($_IESTATUS_Success, $oTemp.GetElementsByTagName($sTagName).length,  $oTemp.GetElementsByTagName($sTagName).item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IETagNameGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 3, 0)
Case Else
__IEConsoleWriteError("Error", "_IETagNameGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndSelect
EndFunc
Func _IETagNameAllGetCollection(ByRef $oObject, $iIndex = -1)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IETagNameAllGetCollection", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IETagNameAllGetCollection", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oTemp
If __IEIsObjType($oObject, "documentcontainer") Then
$oTemp = _IEDocGetObj($oObject)
Else
$oTemp = $oObject
EndIf
$iIndex = Number($iIndex)
Select
Case $iIndex = -1
Return SetError($_IESTATUS_Success, $oTemp.all.length, $oTemp.all)
Case $iIndex > -1 And $iIndex < $oTemp.all.length
Return SetError($_IESTATUS_Success, $oTemp.all.length, $oTemp.all.item($iIndex))
Case $iIndex < -1
__IEConsoleWriteError("Error", "_IETagNameAllGetCollection", "$_IESTATUS_InvalidValue", "$iIndex < -1")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
Case Else
__IEConsoleWriteError("Error", "_IETagNameAllGetCollection", "$_IESTATUS_NoMatch")
Return SetError($_IESTATUS_NoMatch, 1, 0)
EndSelect
EndFunc
Func _IEGetObjByName(ByRef $oObject, $sName, $iIndex = 0)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEGetObjByName", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
$iIndex = Number($iIndex)
If $iIndex = -1 Then
Return SetError($_IESTATUS_Success, $oObject.document.GetElementsByName($sName).length,  $oObject.document.GetElementsByName($sName))
Else
If IsObj($oObject.document.GetElementsByName($sName).item($iIndex)) Then
Return SetError($_IESTATUS_Success, $oObject.document.GetElementsByName($sName).length,  $oObject.document.GetElementsByName($sName).item($iIndex))
Else
__IEConsoleWriteError("Warning", "_IEGetObjByName", "$_IESTATUS_NoMatch", "Name: " & $sName & ", Index: " & $iIndex)
Return SetError($_IESTATUS_NoMatch, 0, 0)
EndIf
EndIf
EndFunc
Func _IEGetObjById(ByRef $oObject, $sID)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEGetObjById", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEGetObById", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If IsObj($oObject.document.getElementById($sID)) Then
Return SetError($_IESTATUS_Success, 0, $oObject.document.getElementById($sID))
Else
__IEConsoleWriteError("Warning", "_IEGetObjById", "$_IESTATUS_NoMatch", $sID)
Return SetError($_IESTATUS_NoMatch, 2, 0)
EndIf
EndFunc
Func _IEAction(ByRef $oObject, $sAction)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEAction(" & $sAction & ")", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
$sAction = StringLower($sAction)
Select
Case $sAction = "click"
If __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(click)", " $_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Click()
Case $sAction = "disable"
If __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(disable)", " $_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.disabled = True
Case $sAction = "enable"
If __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(enable)", " $_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.disabled = False
Case $sAction = "focus"
If __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(focus)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Focus()
Case $sAction = "scrollintoview"
If __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(scrollintoview)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.scrollIntoView()
Case $sAction = "copy"
$oObject.document.execCommand("Copy")
Case $sAction = "cut"
$oObject.document.execCommand("Cut")
Case $sAction = "paste"
$oObject.document.execCommand("Paste")
Case $sAction = "delete"
$oObject.document.execCommand("Delete")
Case $sAction = "saveas"
$oObject.document.execCommand("SaveAs")
Case $sAction = "refresh"
$oObject.document.execCommand("Refresh")
If @error Then
__IEConsoleWriteError("Error", "_IEAction(refresh)", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
_IELoadWait($oObject)
Case $sAction = "selectall"
$oObject.document.execCommand("SelectAll")
Case $sAction = "unselect"
$oObject.document.execCommand("Unselect")
Case $sAction = "print"
$oObject.document.parentwindow.Print()
Case $sAction = "printdefault"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEAction(printdefault)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.execWB(6, 2)
Case $sAction = "back"
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(back)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.GoBack()
Case $sAction = "blur"
$oObject.Blur()
Case $sAction = "forward"
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(forward)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.GoForward()
Case $sAction = "home"
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(home)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.GoHome()
Case $sAction = "invisible"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEAction(invisible)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.visible = 0
Case $sAction = "visible"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEAction(visible)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.visible = 1
Case $sAction = "search"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEAction(search)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.GoSearch()
Case $sAction = "stop"
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "_IEAction(stop)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Stop()
Case $sAction = "quit"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEAction(quit)", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Quit()
If @error Then
__IEConsoleWriteError("Error", "_IEAction(" & $sAction & ")", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
$oObject = 0
Return SetError($_IESTATUS_Success, 0, 1)
Case Else
__IEConsoleWriteError("Error", "_IEAction(" & $sAction & ")", "$_IESTATUS_InvalidValue", "Invalid Action")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
EndSelect
If @error Then
__IEConsoleWriteError("Error", "_IEAction(" & $sAction & ")", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func _IEPropertyGet(ByRef $oObject, $sProperty)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browserdom") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Local $oTemp, $iTemp
$sProperty = StringLower($sProperty)
Select
Case $sProperty = "browserx"
If __IEIsObjType($oObject, "browsercontainer") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oTemp = $oObject
$iTemp = 0
While IsObj($oTemp)
$iTemp += $oTemp.offsetLeft
$oTemp = $oTemp.offsetParent
WEnd
Return SetError($_IESTATUS_Success, 0, $iTemp)
Case $sProperty = "browsery"
If __IEIsObjType($oObject, "browsercontainer") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oTemp = $oObject
$iTemp = 0
While IsObj($oTemp)
$iTemp += $oTemp.offsetTop
$oTemp = $oTemp.offsetParent
WEnd
Return SetError($_IESTATUS_Success, 0, $iTemp)
Case $sProperty = "screenx"
If __IEIsObjType($oObject, "window") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If __IEIsObjType($oObject, "browser") Then
Return SetError($_IESTATUS_Success, 0, $oObject.left())
Else
$oTemp = $oObject
$iTemp = 0
While IsObj($oTemp)
$iTemp += $oTemp.offsetLeft
$oTemp = $oTemp.offsetParent
WEnd
EndIf
Return SetError($_IESTATUS_Success, 0,  $iTemp + $oObject.document.parentWindow.screenLeft)
Case $sProperty = "screeny"
If __IEIsObjType($oObject, "window") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If __IEIsObjType($oObject, "browser") Then
Return SetError($_IESTATUS_Success, 0, $oObject.top())
Else
$oTemp = $oObject
$iTemp = 0
While IsObj($oTemp)
$iTemp += $oTemp.offsetTop
$oTemp = $oTemp.offsetParent
WEnd
EndIf
Return SetError($_IESTATUS_Success, 0,  $iTemp + $oObject.document.parentWindow.screenTop)
Case $sProperty = "height"
If __IEIsObjType($oObject, "window") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If __IEIsObjType($oObject, "browser") Then
Return SetError($_IESTATUS_Success, 0, $oObject.Height())
Else
Return SetError($_IESTATUS_Success, 0, $oObject.offsetHeight)
EndIf
Case $sProperty = "width"
If __IEIsObjType($oObject, "window") Or __IEIsObjType($oObject, "document") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If __IEIsObjType($oObject, "browser") Then
Return SetError($_IESTATUS_Success, 0, $oObject.Width())
Else
Return SetError($_IESTATUS_Success, 0, $oObject.offsetWidth)
EndIf
Case $sProperty = "isdisabled"
Return SetError($_IESTATUS_Success, 0, $oObject.isDisabled())
Case $sProperty = "addressbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.AddressBar())
Case $sProperty = "busy"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Busy())
Case $sProperty = "fullscreen"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.fullScreen())
Case $sProperty = "hwnd"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, HWnd($oObject.HWnd()))
Case $sProperty = "left"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Left())
Case $sProperty = "locationname"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.LocationName())
Case $sProperty = "locationurl"
If __IEIsObjType($oObject, "browser") Then
Return SetError($_IESTATUS_Success, 0, $oObject.locationURL())
EndIf
If __IEIsObjType($oObject, "window") Then
Return SetError($_IESTATUS_Success, 0, $oObject.location.href())
EndIf
If __IEIsObjType($oObject, "document") Then
Return SetError($_IESTATUS_Success, 0, $oObject.parentwindow.location.href())
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentwindow.location.href())
Case $sProperty = "menubar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.MenuBar())
Case $sProperty = "offline"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.OffLine())
Case $sProperty = "readystate"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.ReadyState())
Case $sProperty = "resizable"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Resizable())
Case $sProperty = "silent"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Silent())
Case $sProperty = "statusbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.StatusBar())
Case $sProperty = "statustext"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.StatusText())
Case $sProperty = "top"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Top())
Case $sProperty = "visible"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.Visible())
Case $sProperty = "appcodename"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.appCodeName())
Case $sProperty = "appminorversion"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.appMinorVersion())
Case $sProperty = "appname"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.appName())
Case $sProperty = "appversion"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.appVersion())
Case $sProperty = "browserlanguage"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.browserLanguage())
Case $sProperty = "cookieenabled"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.cookieEnabled())
Case $sProperty = "cpuclass"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.cpuClass())
Case $sProperty = "javaenabled"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.javaEnabled())
Case $sProperty = "online"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.onLine())
Case $sProperty = "platform"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.platform())
Case $sProperty = "systemlanguage"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.systemLanguage())
Case $sProperty = "useragent"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.userAgent())
Case $sProperty = "userlanguage"
Return SetError($_IESTATUS_Success, 0, $oObject.document.parentWindow.top.navigator.userLanguage())
Case $sProperty = "referrer"
Return SetError($_IESTATUS_Success, 0, $oObject.document.referrer)
Case $sProperty = "theatermode"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.TheaterMode)
Case $sProperty = "toolbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject.ToolBar)
Case $sProperty = "contenteditable"
If __IEIsObjType($oObject, "browser") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
Return SetError($_IESTATUS_Success, 0, $oTemp.isContentEditable)
Case $sProperty = "innertext"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
Return SetError($_IESTATUS_Success, 0, $oTemp.innerText)
Case $sProperty = "outertext"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
Return SetError($_IESTATUS_Success, 0, $oTemp.outerText)
Case $sProperty = "innerhtml"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
Return SetError($_IESTATUS_Success, 0, $oTemp.innerHTML)
Case $sProperty = "outerhtml"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
Return SetError($_IESTATUS_Success, 0, $oTemp.outerHTML)
Case $sProperty = "title"
Return SetError($_IESTATUS_Success, 0, $oObject.document.title)
Case $sProperty = "uniqueid"
If __IEIsObjType($oObject, "window") Then
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
Else
Return SetError($_IESTATUS_Success, 0, $oObject.uniqueID)
EndIf
Case Else
__IEConsoleWriteError("Error", "_IEPropertyGet", "$_IESTATUS_InvalidValue", "Invalid Property")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
EndSelect
EndFunc
Func _IEPropertySet(ByRef $oObject, $sProperty, $vValue)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $oTemp
#forceref $oTemp
$sProperty = StringLower($sProperty)
Select
Case $sProperty = "addressbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.AddressBar = $vValue
Case $sProperty = "height"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Height = $vValue
Case $sProperty = "left"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Left = $vValue
Case $sProperty = "menubar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.MenuBar = $vValue
Case $sProperty = "offline"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.OffLine = $vValue
Case $sProperty = "resizable"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Resizable = $vValue
Case $sProperty = "statusbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.StatusBar = $vValue
Case $sProperty = "statustext"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.StatusText = $vValue
Case $sProperty = "top"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Top = $vValue
Case $sProperty = "width"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.Width = $vValue
Case $sProperty = "theatermode"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If $vValue Then
$oObject.TheaterMode = True
Else
$oObject.TheaterMode = False
EndIf
Case $sProperty = "toolbar"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If $vValue Then
$oObject.ToolBar = True
Else
$oObject.ToolBar = False
EndIf
Case $sProperty = "contenteditable"
If __IEIsObjType($oObject, "browser") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
If $vValue Then
$oTemp.contentEditable = "true"
Else
$oTemp.contentEditable = "false"
EndIf
Case $sProperty = "innertext"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
$oTemp.innerText = $vValue
Case $sProperty = "outertext"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
$oTemp.outerText = $vValue
Case $sProperty = "innerhtml"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
$oTemp.innerHTML = $vValue
Case $sProperty = "outerhtml"
If __IEIsObjType($oObject, "documentcontainer") Or __IEIsObjType($oObject, "document") Then
$oTemp = $oObject.document.body
Else
$oTemp = $oObject
EndIf
$oTemp.outerHTML = $vValue
Case $sProperty = "title"
$oObject.document.title = $vValue
Case $sProperty = "silent"
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
If $vValue Then
$oObject.silent = True
Else
$oObject.silent = False
EndIf
Case Else
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_InvalidValue", "Invalid Property")
Return SetError($_IESTATUS_InvalidValue, 2, 0)
EndSelect
If @error Then
__IEConsoleWriteError("Error", "_IEPropertySet", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func _IEErrorNotify($vNotify = Default)
If $vNotify = Default Then Return $__g_bIEErrorNotify
If $vNotify Then
$__g_bIEErrorNotify = True
Else
$__g_bIEErrorNotify = False
EndIf
Return 1
EndFunc
Func _IEErrorHandlerRegister($sFunctionName = "__IEInternalErrorHandler")
$__g_oIEErrorHandler = ObjEvent("AutoIt.Error", $sFunctionName)
If IsObj($__g_oIEErrorHandler) Then
$__g_sIEUserErrorHandler = $sFunctionName
Return SetError($_IESTATUS_Success, 0, 1)
Else
$__g_oIEErrorHandler = ""
__IEConsoleWriteError("Error", "_IEErrorHandlerRegister", "$_IEStatus_GeneralError",  "Error Handler Not Registered - Check existance of error function")
Return SetError($_IEStatus_GeneralError, 1, 0)
EndIf
EndFunc
Func _IEErrorHandlerDeRegister()
$__g_sIEUserErrorHandler = ""
$__g_oIEErrorHandler = ""
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func __IEInternalErrorHandlerRegister()
Local $sCurrentErrorHandler = ObjEvent("AutoIt.Error")
If $sCurrentErrorHandler <> "" And Not IsObj($__g_oIEErrorHandler) Then
Return SetError($_IEStatus_GeneralError, 0, False)
EndIf
$__g_oIEErrorHandler = ObjEvent("AutoIt.Error", "__IEInternalErrorHandler")
If IsObj($__g_oIEErrorHandler) Then
Return SetError($_IESTATUS_Success, 0, True)
Else
$__g_oIEErrorHandler = ""
Return SetError($_IEStatus_GeneralError, 0, False)
EndIf
EndFunc
Func __IEInternalErrorHandlerDeRegister()
$__g_oIEErrorHandler = ""
If $__g_sIEUserErrorHandler <> "" Then
$__g_oIEErrorHandler = ObjEvent("AutoIt.Error", $__g_sIEUserErrorHandler)
EndIf
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
Func __IEInternalErrorHandler($oCOMError)
If $__g_bIEErrorNotify Or $__g_bIEAU3Debug Then ConsoleWrite("--> " & __COMErrorFormating($oCOMError, "----> $IEComError") & @CRLF)
SetError($_IEStatus_ComError)
Return
EndFunc
Func _IEQuit(ByRef $oObject)
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "_IEQuit", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "browser") Then
__IEConsoleWriteError("Error", "_IEQuit", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.quit()
If @error Then
__IEConsoleWriteError("Error", "_IEQuit", "$_IESTATUS_COMError", @error)
Return SetError($_IESTATUS_ComError, @error, 0)
EndIf
$oObject = 0
Return SetError($_IESTATUS_Success, 0, 1)
EndFunc
#EndRegion Utility functions
#Region General
Func _IE_Introduction($sModule = "basic")
Local $sHTML = ""
Switch $sModule
Case "basic"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Introduction ("basic")</title>' & @CR
$sHTML &= '<style>body {font-family: Arial}' & @CR
$sHTML &= 'td {padding:6px}</style>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR
$sHTML &= '<table border=1 id="table1" style="width:600px;border-spacing:6px;">' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<h1>Welcome to IE.au3</h1>' & @CR
$sHTML &= 'IE.au3 is a UDF (User Defined Function) library for the ' & @CR
$sHTML &= '<a href="http://www.autoitscript.com">AutoIt</a> scripting language.' & @CR
$sHTML &= '<br>  ' & @CR
$sHTML &= 'IE.au3 allows you to either create or attach to an Internet Explorer browser and do ' & @CR
$sHTML &= 'just about anything you could do with it interactively with the mouse and ' & @CR
$sHTML &= 'keyboard, but do it through script.' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= 'You can navigate to pages, click links, fill and submit forms etc. You can ' & @CR
$sHTML &= 'also do things you cannot do interactively like change or rewrite page ' & @CR
$sHTML &= 'content and JavaScripts, read, parse and save page content and monitor and act ' & @CR
$sHTML &= 'upon browser "events".<br>' & @CR
$sHTML &= 'IE.au3 uses the COM interface in AutoIt to interact with the Internet Explorer ' & @CR
$sHTML &= 'object model and the DOM (Document Object Model) supported by the browser.' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= 'Here are some links for more information and helpful tools:<br>' & @CR
$sHTML &= 'Reference Material: ' & @CR
$sHTML &= '<ul>' & @CR
$sHTML &= '<li><a href="http://msdn1.microsoft.com/">MSDN (Microsoft Developer Network)</a></li>' & @CR
$sHTML &= '<li><a href="http://msdn2.microsoft.com/en-us/library/aa752084.aspx" target="_blank">InternetExplorer Object</a></li>' & @CR
$sHTML &= '<li><a href="http://msdn2.microsoft.com/en-us/library/ms531073.aspx" target="_blank">Document Object</a></li>' & @CR
$sHTML &= '<li><a href="http://msdn2.microsoft.com/en-us/ie/aa740473.aspx" target="_blank">Overviews and Tutorials</a></li>' & @CR
$sHTML &= '<li><a href="http://msdn2.microsoft.com/en-us/library/ms533029.aspx" target="_blank">DHTML Objects</a></li>' & @CR
$sHTML &= '<li><a href="http://msdn2.microsoft.com/en-us/library/ms533051.aspx" target="_blank">DHTML Events</a></li>' & @CR
$sHTML &= '</ul><br>' & @CR
$sHTML &= 'Helpful Tools: ' & @CR
$sHTML &= '<ul>' & @CR
$sHTML &= '<li><a href="http://www.autoitscript.com/forum/index.php?showtopic=19368" target="_blank">AutoIt IE Builder</a> (build IE scripts interactively)</li>' & @CR
$sHTML &= '<li><a href="http://www.debugbar.com/" target="_blank">DebugBar</a> (DOM inspector, HTTP inspector, HTML validator and more - free for personal use) Recommended</li>' & @CR
$sHTML &= '<li><a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=e59c3964-672d-4511-bb3e-2d5e1db91038&amp;displaylang=en" target="_blank">IE Developer Toolbar</a> (comprehensive DOM analysis tool)</li>' & @CR
$sHTML &= '<li><a href="http://slayeroffice.com/tools/modi/v2.0/modi_help.html" target="_blank">MODIV2</a> (view the DOM of a web page by mousing around)</li>' & @CR
$sHTML &= '<li><a href="http://validator.w3.org/" target="_blank">HTML Validator</a> (verify HTML follows format rules)</li>' & @CR
$sHTML &= '<li><a href="http://www.fiddlertool.com/fiddler/" target="_blank">Fiddler</a> (examine HTTP traffic)</li>' & @CR
$sHTML &= '</ul>' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '</table>' & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
Case Else
__IEConsoleWriteError("Error", "_IE_Introduction", "$_IESTATUS_InvalidValue")
Return SetError($_IESTATUS_InvalidValue, 1, 0)
EndSwitch
Local $oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
Return SetError($_IESTATUS_Success, 0, $oObject)
EndFunc
Func _IE_Example($sModule = "basic")
Local $sHTML = "", $oObject
Switch $sModule
Case "basic"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Example("basic")</title>' & @CR
$sHTML &= '<style>body {font-family: Arial}</style>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR
$sHTML &= '<a href="http://www.autoitscript.com"><img src="http://www.autoitscript.com/images/logo_autoit_210x72.png" id="AutoItImage" alt="AutoIt Homepage Image" style="background: #204080;"></a>' & @CR
$sHTML &= '<p></p>' & @CR
$sHTML &= '<div id="line1">This is a simple HTML page with text, links and images.</div>' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= '<div id="line2"><a href="http://www.autoitscript.com">AutoIt</a> is a wonderful automation scripting language.</div>' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= '<div id="line3">It is supported by a very active and supporting <a href="http://www.autoitscript.com/forum/">user forum</a>.</div>' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= '<div id="IEAu3Data"></div>' & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
$oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
Case "table"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=utf-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Example("table")</title>' & @CR
$sHTML &= '<style>body {font-family: Arial}</style>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR
$sHTML &= '$oTableOne = _IETableGetObjByName($oIE, "tableOne")<br>' & @CR
$sHTML &= '&lt;table border=1 id="tableOne"&gt;<br>' & @CR
$sHTML &= '<table border=1 id="tableOne">' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>AutoIt</td>' & @CR
$sHTML &= '		<td>is</td>' & @CR
$sHTML &= '		<td>really</td>' & @CR
$sHTML &= '		<td>great</td>' & @CR
$sHTML &= '		<td>with</td>' & @CR
$sHTML &= '		<td>IE.au3</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>1</td>' & @CR
$sHTML &= '		<td>2</td>' & @CR
$sHTML &= '		<td>3</td>' & @CR
$sHTML &= '		<td>4</td>' & @CR
$sHTML &= '		<td>5</td>' & @CR
$sHTML &= '		<td>6</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>the</td>' & @CR
$sHTML &= '		<td>quick</td>' & @CR
$sHTML &= '		<td>red</td>' & @CR
$sHTML &= '		<td>fox</td>' & @CR
$sHTML &= '		<td>jumped</td>' & @CR
$sHTML &= '		<td>over</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>the</td>' & @CR
$sHTML &= '		<td>lazy</td>' & @CR
$sHTML &= '		<td>brown</td>' & @CR
$sHTML &= '		<td>dog</td>' & @CR
$sHTML &= '		<td>the</td>' & @CR
$sHTML &= '		<td>time</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>has</td>' & @CR
$sHTML &= '		<td>come</td>' & @CR
$sHTML &= '		<td>for</td>' & @CR
$sHTML &= '		<td>all</td>' & @CR
$sHTML &= '		<td>good</td>' & @CR
$sHTML &= '		<td>men</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>to</td>' & @CR
$sHTML &= '		<td>come</td>' & @CR
$sHTML &= '		<td>to</td>' & @CR
$sHTML &= '		<td>the</td>' & @CR
$sHTML &= '		<td>aid</td>' & @CR
$sHTML &= '		<td>of</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '</table>' & @CR
$sHTML &= '<br>' & @CR
$sHTML &= '$oTableTwo = _IETableGetObjByName($oIE, "tableTwo")<br>' & @CR
$sHTML &= '&lt;table border="1" id="tableTwo"&gt;<br>' & @CR
$sHTML &= '<table border=1 id="tableTwo">' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td colspan="4">Table Top</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>One</td>' & @CR
$sHTML &= '		<td colspan="3">Two</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>Three</td>' & @CR
$sHTML &= '		<td>Four</td>' & @CR
$sHTML &= '		<td colspan="2">Five</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>Six</td>' & @CR
$sHTML &= '		<td colspan="3">Seven</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '	<tr>' & @CR
$sHTML &= '		<td>Eight</td>' & @CR
$sHTML &= '		<td>Nine</td>' & @CR
$sHTML &= '		<td>Ten</td>' & @CR
$sHTML &= '		<td>Eleven</td>' & @CR
$sHTML &= '	</tr>' & @CR
$sHTML &= '</table>' & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
$oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
Case "form"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Example("form")</title>' & @CR
$sHTML &= '<style>body {font-family: Arial}' & @CR
$sHTML &= 'td {padding:6px}</style>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR
$sHTML &= '<form name="ExampleForm" onSubmit="javascript:alert(''ExampleFormSubmitted'');" method="post">' & @CR
$sHTML &= '<table style="border-spacing:6px 6px;" border=1>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>ExampleForm</td>' & @CR
$sHTML &= '<td>&lt;form name="ExampleForm" onSubmit="javascript:alert(''ExampleFormSubmitted'');" method="post"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>Hidden Input Element<input type="hidden" name="hiddenExample" value="secret value"></td>' & @CR
$sHTML &= '<td>&lt;input type="hidden" name="hiddenExample" value="secret value"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="text" name="textExample" value="http://" size="20" maxlength="30">' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input type="text" name="textExample" value="http://" size="20" maxlength="30"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="password" name="passwordExample" size="10">' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input type="password" name="passwordExample" size="10"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="file" name="fileExample">' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input type="file" name="fileExample"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="image" name="imageExample" alt="AutoIt Homepage" src="http://www.autoitscript.com/images/logo_autoit_210x72.png" style="background: #204080;>' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input type="image" name="imageExample" alt="AutoIt Homepage" src="http://www.autoitscript.com/images/logo_autoit_210x72.png"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<textarea name="textareaExample" rows="5" cols="15">Hello!</textarea>' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;textarea name="textareaExample" rows="5" cols="15"&gt;Hello!&lt;/textarea&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="checkbox" name="checkboxG1Example" value="gameBasketball">Basketball<br>' & @CR
$sHTML &= '<input type="checkbox" name="checkboxG1Example" value="gameFootball">Football<br>' & @CR
$sHTML &= '<input type="checkbox" name="checkboxG2Example" value="gameTennis" checked>Tennis<br>' & @CR
$sHTML &= '<input type="checkbox" name="checkboxG2Example" value="gameBaseball">Baseball' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input type="checkbox" name="checkboxG1Example" value="gameBasketball"&gt;Basketball&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="checkbox" name="checkboxG1Example" value="gameFootball"&gt;Football&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="checkbox" name="checkboxG2Example" value="gameTennis" checked&gt;Tennis&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="checkbox" name="checkboxG2Example" value="gameBaseball"&gt;Baseball</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input type="radio" name="radioExample" value="vehicleAirplane">Airplane<br>' & @CR
$sHTML &= '<input type="radio" name="radioExample" value="vehicleTrain" checked>Train<br>' & @CR
$sHTML &= '<input type="radio" name="radioExample" value="vehicleBoat">Boat<br>' & @CR
$sHTML &= '<input type="radio" name="radioExample" value="vehicleCar">Car</td>' & @CR
$sHTML &= '<td>&lt;input type="radio" name="radioExample" value="vehicleAirplane"&gt;Airplane&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="radio" name="radioExample" value="vehicleTrain" checked&gt;Train&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="radio" name="radioExample" value="vehicleBoat"&gt;Boat&lt;br&gt;<br>' & @CR
$sHTML &= '&lt;input type="radio" name="radioExample" value="vehicleCar"&gt;Car&lt;br&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<select name="selectExample">' & @CR
$sHTML &= '<option value="homepage.html">Homepage' & @CR
$sHTML &= '<option value="midipage.html">Midipage' & @CR
$sHTML &= '<option value="freepage.html">Freepage' & @CR
$sHTML &= '</select>' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;select name="selectExample"&gt;<br>' & @CR
$sHTML &= '&lt;option value="homepage.html"&gt;Homepage<br>' & @CR
$sHTML &= '&lt;option value="midipage.html"&gt;Midipage<br>' & @CR
$sHTML &= '&lt;option value="freepage.html"&gt;Freepage<br>' & @CR
$sHTML &= '&lt;/select&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<select name="multipleSelectExample" size="6" multiple>' & @CR
$sHTML &= '<option value="Name1">Aaron' & @CR
$sHTML &= '<option value="Name2">Bruce' & @CR
$sHTML &= '<option value="Name3">Carlos' & @CR
$sHTML &= '<option value="Name4">Denis' & @CR
$sHTML &= '<option value="Name5">Ed' & @CR
$sHTML &= '<option value="Name6">Freddy' & @CR
$sHTML &= '</select>' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;select name="multipleSelectExample" size="6" multiple&gt;<br>' & @CR
$sHTML &= '&lt;option value="Name1"&gt;Aaron<br>' & @CR
$sHTML &= '&lt;option value="Name2"&gt;Bruce<br>' & @CR
$sHTML &= '&lt;option value="Name3"&gt;Carlos<br>' & @CR
$sHTML &= '&lt;option value="Name4"&gt;Denis<br>' & @CR
$sHTML &= '&lt;option value="Name5"&gt;Ed<br>' & @CR
$sHTML &= '&lt;option value="Name6"&gt;Freddy<br>' & @CR
$sHTML &= '&lt;/select&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td>' & @CR
$sHTML &= '<input name="submitExample" type="submit" value="Submit">' & @CR
$sHTML &= '<input name="resetExample" type="reset" value="Reset">' & @CR
$sHTML &= '</td>' & @CR
$sHTML &= '<td>&lt;input name="submitExample" type="submit" value="Submit"&gt;<br>' & @CR
$sHTML &= '&lt;input name="resetExample" type="reset" value="Reset"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '</table>' & @CR
$sHTML &= '<input type="hidden" name="hiddenExample" value="secret value">' & @CR
$sHTML &= '</form>' & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
$oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
Case "frameset"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Example("frameset")</title>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<frameset rows="25,200">' & @CR
$sHTML &= '	<frame name=Top SRC=about:blank>' & @CR
$sHTML &= '	<frameset cols="100,500">' & @CR
$sHTML &= '		<frame name=Menu SRC=about:blank>' & @CR
$sHTML &= '		<frame name=Main SRC=about:blank>' & @CR
$sHTML &= '	</frameset>' & @CR
$sHTML &= '</frameset>' & @CR
$sHTML &= '</html>'
$oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
_IEAction($oObject, "refresh")
Local $oFrameTop = _IEFrameGetObjByName($oObject, "Top")
Local $oFrameMenu = _IEFrameGetObjByName($oObject, "Menu")
Local $oFrameMain = _IEFrameGetObjByName($oObject, "Main")
_IEBodyWriteHTML($oFrameTop, '$oFrameTop = _IEFrameGetObjByName($oIE, "Top")')
_IEBodyWriteHTML($oFrameMenu, '$oFrameMenu = _IEFrameGetObjByName($oIE, "Menu")')
_IEBodyWriteHTML($oFrameMain, '$oFrameMain = _IEFrameGetObjByName($oIE, "Main")')
Case "iframe"
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>_IE_Example("iframe")</title>' & @CR
$sHTML &= '<style>td {padding:6px}</style>' & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR
$sHTML &= '<table style="border-spacing:6px" border=1>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td><iframe name="iFrameOne" src="about:blank" title="iFrameOne"></iframe></td>' & @CR
$sHTML &= '<td>&lt;iframe name="iFrameOne" src="about:blank" title="iFrameOne"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '<tr>' & @CR
$sHTML &= '<td><iframe name="iFrameTwo" src="about:blank" title="iFrameTwo"></iframe></td>' & @CR
$sHTML &= '<td>&lt;iframe name="iFrameTwo" src="about:blank" title="iFrameTwo"&gt;</td>' & @CR
$sHTML &= '</tr>' & @CR
$sHTML &= '</table>' & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
$oObject = _IECreate()
_IEDocWriteHTML($oObject, $sHTML)
_IEAction($oObject, "refresh")
Local $oIFrameOne = _IEFrameGetObjByName($oObject, "iFrameOne")
Local $oIFrameTwo = _IEFrameGetObjByName($oObject, "iFrameTwo")
_IEBodyWriteHTML($oIFrameOne, '$oIFrameOne = _IEFrameGetObjByName($oIE, "iFrameOne")')
_IEBodyWriteHTML($oIFrameTwo, '$oIFrameTwo = _IEFrameGetObjByName($oIE, "iFrameTwo")')
Case Else
__IEConsoleWriteError("Error", "_IE_Example", "$_IESTATUS_InvalidValue")
Return SetError($_IESTATUS_InvalidValue, 1, 0)
EndSwitch
Sleep(500)
Return SetError($_IESTATUS_Success, 0, $oObject)
EndFunc
Func _IE_VersionInfo()
__IEConsoleWriteError("Information", "_IE_VersionInfo", "version " &  $__gaIEAU3VersionInfo[0] &  $__gaIEAU3VersionInfo[1] & "." &  $__gaIEAU3VersionInfo[2] & "-" &  $__gaIEAU3VersionInfo[3], "Release date: " & $__gaIEAU3VersionInfo[4])
Return SetError($_IESTATUS_Success, 0, $__gaIEAU3VersionInfo)
EndFunc
#EndRegion General
#Region Internal functions
Func __IELockSetForegroundWindow($iLockCode)
Local $aRet = DllCall("user32.dll", "bool", "LockSetForegroundWindow", "uint", $iLockCode)
If @error Or Not $aRet[0] Then Return SetError(1, _WinAPI_GetLastError(), 0)
Return $aRet[0]
EndFunc
Func __IEControlGetObjFromHWND(ByRef $hWin)
DllCall("ole32.dll", "long", "CoInitialize", "ptr", 0)
If @error Then Return SetError(2, @error, 0)
Local Const $WM_HTML_GETOBJECT = __IERegisterWindowMessage("WM_HTML_GETOBJECT")
Local Const $SMTO_ABORTIFHUNG = 0x0002
Local $iResult
__IESendMessageTimeout($hWin, $WM_HTML_GETOBJECT, 0, 0, $SMTO_ABORTIFHUNG, 1000, $iResult)
Local $tUUID = DllStructCreate("int;short;short;byte[8]")
DllStructSetData($tUUID, 1, 0x626FC520)
DllStructSetData($tUUID, 2, 0xA41E)
DllStructSetData($tUUID, 3, 0x11CF)
DllStructSetData($tUUID, 4, 0xA7, 1)
DllStructSetData($tUUID, 4, 0x31, 2)
DllStructSetData($tUUID, 4, 0x0, 3)
DllStructSetData($tUUID, 4, 0xA0, 4)
DllStructSetData($tUUID, 4, 0xC9, 5)
DllStructSetData($tUUID, 4, 0x8, 6)
DllStructSetData($tUUID, 4, 0x26, 7)
DllStructSetData($tUUID, 4, 0x37, 8)
Local $aRet = DllCall("oleacc.dll", "long", "ObjectFromLresult", "lresult", $iResult, "struct*", $tUUID,  "wparam", 0, "idispatch*", 0)
If @error Then Return SetError(3, @error, 0)
If IsObj($aRet[4]) Then
Local $oIE = $aRet[4].Script()
Return $oIE.Document.parentwindow
Else
Return SetError(1, $aRet[0], 0)
EndIf
EndFunc
Func __IERegisterWindowMessage($sMsg)
Local $aRet = DllCall("user32.dll", "uint", "RegisterWindowMessageW", "wstr", $sMsg)
If @error Then Return SetError(@error, @extended, 0)
If $aRet[0] = 0 Then Return SetError(10, _WinAPI_GetLastError(), 0)
Return $aRet[0]
EndFunc
Func __IESendMessageTimeout($hWnd, $iMsg, $wParam, $lParam, $iFlags, $iTimeout, ByRef $vOut, $r = 0, $sT1 = "int", $sT2 = "int")
Local $aRet = DllCall("user32.dll", "lresult", "SendMessageTimeout", "hwnd", $hWnd, "uint", $iMsg, $sT1, $wParam,  $sT2, $lParam, "uint", $iFlags, "uint", $iTimeout, "dword_ptr*", "")
If @error Or $aRet[0] = 0 Then
$vOut = 0
Return SetError(1, _WinAPI_GetLastError(), 0)
EndIf
$vOut = $aRet[7]
If $r >= 0 And $r <= 4 Then Return $aRet[$r]
Return $aRet
EndFunc
Func __IEIsObjType(ByRef $oObject, $sType, $bRegister = True)
If Not IsObj($oObject) Then
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
Local $bStatus = $bRegister
If $bRegister Then
$bStatus = __IEInternalErrorHandlerRegister()
If Not $bStatus Then __IEConsoleWriteError("Warning", "internal function __IEIsObjType",  "Cannot register internal error handler, cannot trap COM errors",  "Use _IEErrorHandlerRegister() to register a user error handler")
EndIf
Local $iNotifyStatus = _IEErrorNotify()
_IEErrorNotify(False)
Local $sName = String(ObjName($oObject)), $iErrorStatus = $_IESTATUS_InvalidObjectType
Switch $sType
Case "browserdom"
If __IEIsObjType($oObject, "documentcontainer", False) Then
$iErrorStatus = $_IESTATUS_Success
ElseIf __IEIsObjType($oObject, "document", False) Then
$iErrorStatus = $_IESTATUS_Success
Else
Local $oTemp = $oObject.document
If __IEIsObjType($oTemp, "document", False) Then
$iErrorStatus = $_IESTATUS_Success
EndIf
EndIf
Case "browser"
If ($sName = "IWebBrowser2") Or ($sName = "IWebBrowser") Or ($sName = "WebBrowser") Then $iErrorStatus = $_IESTATUS_Success
Case "window"
If $sName = "HTMLWindow2" Then $iErrorStatus = $_IESTATUS_Success
Case "documentContainer"
If __IEIsObjType($oObject, "window", False) Or __IEIsObjType($oObject, "browser", False) Then $iErrorStatus = $_IESTATUS_Success
Case "document"
If $sName = "HTMLDocument" Then $iErrorStatus = $_IESTATUS_Success
Case "table"
If $sName = "HTMLTable" Then $iErrorStatus = $_IESTATUS_Success
Case "form"
If $sName = "HTMLFormElement" Then $iErrorStatus = $_IESTATUS_Success
Case "forminputelement"
If ($sName = "HTMLInputElement") Or ($sName = "HTMLSelectElement") Or ($sName = "HTMLTextAreaElement") Then $iErrorStatus = $_IESTATUS_Success
Case "elementcollection"
If ($sName = "HTMLElementCollection") Then $iErrorStatus = $_IESTATUS_Success
Case "formselectelement"
If $sName = "HTMLSelectElement" Then $iErrorStatus = $_IESTATUS_Success
Case Else
$iErrorStatus = $_IESTATUS_InvalidValue
EndSwitch
_IEErrorNotify($iNotifyStatus)
If $bRegister Then
__IEInternalErrorHandlerDeRegister()
EndIf
If $iErrorStatus = $_IESTATUS_Success Then
Return SetError($_IESTATUS_Success, 0, 1)
Else
Return SetError($iErrorStatus, 1, 0)
EndIf
EndFunc
Func __IEConsoleWriteError($sSeverity, $sFunc, $sMessage = Default, $sStatus = Default)
If $__g_bIEErrorNotify Or $__g_bIEAU3Debug Then
Local $sStr = "--> IE.au3 " & $__gaIEAU3VersionInfo[5] & " " & $sSeverity & " from function " & $sFunc
If Not ($sMessage = Default) Then $sStr &= ", " & $sMessage
If Not ($sStatus = Default) Then $sStr &= " (" & $sStatus & ")"
ConsoleWrite($sStr & @CRLF)
EndIf
Return SetError($sStatus, 0, 1)
EndFunc
Func __IEComErrorUnrecoverable($iError)
Switch $iError
Case -2147352567
Return $_IESTATUS_AccessIsDenied
Case -2147024891
Return $_IESTATUS_AccessIsDenied
Case -2147417848
Return $_IESTATUS_ClientDisconnected
Case -2147023174
Return $_IESTATUS_ClientDisconnected
Case -2147023179
Return $_IESTATUS_ClientDisconnected
Case Else
Return $_IESTATUS_Success
EndSwitch
EndFunc
#EndRegion Internal functions
#Region ProtoType Functions
Func __IENavigate(ByRef $oObject, $sUrl, $iWait = 1, $iFags = 0, $sTarget = "", $sPostdata = "", $sHeaders = "")
__IEConsoleWriteError("Warning", "__IENavigate", "Unsupported function called. Not fully tested.")
If Not IsObj($oObject) Then
__IEConsoleWriteError("Error", "__IENavigate", "$_IESTATUS_InvalidDataType")
Return SetError($_IESTATUS_InvalidDataType, 1, 0)
EndIf
If Not __IEIsObjType($oObject, "documentContainer") Then
__IEConsoleWriteError("Error", "__IENavigate", "$_IESTATUS_InvalidObjectType")
Return SetError($_IESTATUS_InvalidObjectType, 1, 0)
EndIf
$oObject.navigate($sUrl, $iFags, $sTarget, $sPostdata, $sHeaders)
If $iWait Then
_IELoadWait($oObject)
Return SetError(@error, 0, $oObject)
EndIf
Return SetError($_IESTATUS_Success, 0, $oObject)
EndFunc
Func __IEStringToBstr($sString, $sCharSet = "us-ascii")
Local Const $iTypeBinary = 1, $iTypeText = 2
Local $oStream = ObjCreate("ADODB.Stream")
$oStream.type = $iTypeText
$oStream.CharSet = $sCharSet
$oStream.Open
$oStream.WriteText($sString)
$oStream.Position = 0
$oStream.type = $iTypeBinary
$oStream.Position = 0
Return $oStream.Read()
EndFunc
Func __IEBstrToString($oBstr, $sCharSet = "us-ascii")
Local Const $iTypeBinary = 1, $iTypeText = 2
Local $oStream = ObjCreate("ADODB.Stream")
$oStream.type = $iTypeBinary
$oStream.Open
$oStream.Write($oBstr)
$oStream.Position = 0
$oStream.type = $iTypeText
$oStream.CharSet = $sCharSet
$oStream.Position = 0
Return $oStream.ReadText()
EndFunc
Func __IECreateNewIE($sTitle, $sHead = "", $sBody = "")
Local $sTemp = __IETempFile("", "~IE~", ".htm")
If @error Then
__IEConsoleWriteError("Error", "_IECreateHTA", "", "Error creating temporary file in @TempDir or @ScriptDir")
Return SetError($_IESTATUS_GeneralError, 1, 0)
EndIf
Local $sHTML = ''
$sHTML &= '<!DOCTYPE html>' & @CR
$sHTML &= '<html>' & @CR
$sHTML &= '<head>' & @CR
$sHTML &= '<meta content="text/html; charset=UTF-8" http-equiv="content-type">' & @CR
$sHTML &= '<title>' & $sTemp & '</title>' & @CR & $sHead & @CR
$sHTML &= '</head>' & @CR
$sHTML &= '<body>' & @CR & $sBody & @CR
$sHTML &= '</body>' & @CR
$sHTML &= '</html>'
Local $hFile = FileOpen($sTemp, $FO_OVERWRITE)
FileWrite($hFile, $sHTML)
FileClose($hFile)
If @error Then
__IEConsoleWriteError("Error", "_IECreateNewIE", "", "Error creating temporary file in @TempDir or @ScriptDir")
Return SetError($_IESTATUS_GeneralError, 2, 0)
EndIf
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe " & $sTemp)
Local $iPID
If WinWait($sTemp, "", 60) Then
$iPID = WinGetProcess($sTemp)
Else
__IEConsoleWriteError("Error", "_IECreateNewIE", "", "Timeout waiting for new IE window creation")
Return SetError($_IESTATUS_GeneralError, 3, 0)
EndIf
If Not FileDelete($sTemp) Then
__IEConsoleWriteError("Warning", "_IECreateNewIE", "", "Could not delete temporary file " & FileGetLongName($sTemp))
EndIf
Local $oObject = _IEAttach($sTemp)
_IELoadWait($oObject)
_IEPropertySet($oObject, "title", $sTitle)
Return SetError($_IESTATUS_Success, $iPID, $oObject)
EndFunc
Func __IETempFile($sDirectoryName = @TempDir, $sFilePrefix = "~", $sFileExtension = ".tmp", $iRandomLength = 7)
Local $sTempName, $iTmp = 0
If Not FileExists($sDirectoryName) Then $sDirectoryName = @TempDir
If Not FileExists($sDirectoryName) Then $sDirectoryName = @ScriptDir
If StringRight($sDirectoryName, 1) <> "\" Then $sDirectoryName = $sDirectoryName & "\"
Do
$sTempName = ""
While StringLen($sTempName) < $iRandomLength
$sTempName = $sTempName & Chr(Random(97, 122, 1))
WEnd
$sTempName = $sDirectoryName & $sFilePrefix & $sTempName & $sFileExtension
$iTmp += 1
If $iTmp > 200 Then
Return SetError($_IESTATUS_GeneralError, 1, 0)
EndIf
Until Not FileExists($sTempName)
Return $sTempName
EndFunc
#EndRegion ProtoType Functions
#Region Global Variables and Constants
Global Const $_ARRAYCONSTANT_SORTINFOSIZE = 11
Global $__g_aArrayDisplay_SortInfo[$_ARRAYCONSTANT_SORTINFOSIZE]
Global Const $ARRAYDISPLAY_COLALIGNLEFT = 0
Global Const $ARRAYDISPLAY_TRANSPOSE = 1
Global Const $ARRAYDISPLAY_COLALIGNRIGHT = 2
Global Const $ARRAYDISPLAY_COLALIGNCENTER = 4
Global Const $ARRAYDISPLAY_VERBOSE = 8
Global Const $ARRAYDISPLAY_NOROW = 64
Global Const $_ARRAYCONSTANT_tagHDITEM = "uint Mask;int XY;ptr Text;handle hBMP;int TextMax;int Fmt;lparam Param;int Image;int Order;uint Type;ptr pFilter;uint State"
Global Const $_ARRAYCONSTANT_tagLVITEM = "struct;uint Mask;int Item;int SubItem;uint State;uint StateMask;ptr Text;int TextMax;int Image;lparam Param;" &  "int Indent;int GroupID;uint Columns;ptr pColumns;ptr piColFmt;int iGroup;endstruct"
#EndRegion Global Variables and Constants
#Region Functions list
#EndRegion Functions list
Func __ArrayDisplay_Share(Const ByRef $aArray, $sTitle = Default, $sArrayRange = Default, $iFlags = Default, $vUser_Separator = Default, $sHeader = Default, $iMax_ColWidth = Default, $hUser_Function = Default, $bDebug = True)
Local $vTmp, $sMsgBoxTitle = (($bDebug) ? ("DebugArray") : ("ArrayDisplay"))
If $sTitle = Default Then $sTitle = $sMsgBoxTitle
If $sArrayRange = Default Then $sArrayRange = ""
If $iFlags = Default Then $iFlags = 0
If $vUser_Separator = Default Then $vUser_Separator = ""
If $sHeader = Default Then $sHeader = ""
If $iMax_ColWidth = Default Then $iMax_ColWidth = 350
If $hUser_Function = Default Then $hUser_Function = 0
Local $iTranspose = BitAND($iFlags, $ARRAYDISPLAY_TRANSPOSE)
Local $iColAlign = BitAND($iFlags, 6)
Local $iVerbose = BitAND($iFlags, $ARRAYDISPLAY_VERBOSE)
Local $iNoRow = BitAND($iFlags, $ARRAYDISPLAY_NOROW)
Local $iButtonBorder = (($bDebug) ? (40) : (20))
Local $sMsg = "", $iRet = 1
If IsArray($aArray) Then
Local $iDimension = UBound($aArray, $UBOUND_DIMENSIONS), $iRowCount = UBound($aArray, $UBOUND_ROWS), $iColCount = UBound($aArray, $UBOUND_COLUMNS)
If $iDimension > 2 Then
$sMsg = "Larger than 2D array passed to function"
$iRet = 2
EndIf
If $iDimension = 1 Then
$iTranspose = 0
EndIf
Else
$sMsg = "No array variable passed to function"
EndIf
If $sMsg Then
If $iVerbose And MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR + $MB_YESNO,  $sMsgBoxTitle & " Error: " & $sTitle, $sMsg & @CRLF & @CRLF & "Exit the script?") = $IDYES Then
Exit
Else
Return SetError($iRet, 0, 0)
EndIf
EndIf
Local $iCW_ColWidth = Number($vUser_Separator)
Local $sCurr_Separator = Opt("GUIDataSeparatorChar")
If $vUser_Separator = "" Then $vUser_Separator = $sCurr_Separator
Local $iItem_Start = 0, $iItem_End = $iRowCount - 1, $iSubItem_Start = 0, $iSubItem_End = (($iDimension = 2) ? ($iColCount - 1) : (0))
Local $bRange_Flag = False, $avRangeSplit
If $sArrayRange Then
Local $aArray_Range = StringRegExp($sArrayRange & "||", "(?U)(.*)\|", 3)
If $aArray_Range[0] Then
$avRangeSplit = StringSplit($aArray_Range[0], ":")
If @error Then
$iItem_End = Number($avRangeSplit[1])
Else
$iItem_Start = Number($avRangeSplit[1])
If $avRangeSplit[2] <> "" Then
$iItem_End = Number($avRangeSplit[2])
EndIf
EndIf
EndIf
If $iItem_Start < 0 Then $iItem_Start = 0
If $iItem_End > $iRowCount - 1 Then $iItem_End = $iRowCount - 1
If $iItem_Start > $iItem_End Then
$vTmp = $iItem_Start
$iItem_Start = $iItem_End
$iItem_End = $vTmp
EndIf
If $iItem_Start <> 0 Or $iItem_End <> $iRowCount - 1 Then $bRange_Flag = True
If $iDimension = 2 And $aArray_Range[1] Then
$avRangeSplit = StringSplit($aArray_Range[1], ":")
If @error Then
$iSubItem_End = Number($avRangeSplit[1])
Else
$iSubItem_Start = Number($avRangeSplit[1])
If $avRangeSplit[2] <> "" Then
$iSubItem_End = Number($avRangeSplit[2])
EndIf
EndIf
If $iSubItem_Start > $iSubItem_End Then
$vTmp = $iSubItem_Start
$iSubItem_Start = $iSubItem_End
$iSubItem_End = $vTmp
EndIf
If $iSubItem_Start < 0 Then $iSubItem_Start = 0
If $iSubItem_End > $iColCount - 1 Then $iSubItem_End = $iColCount - 1
If $iSubItem_Start <> 0 Or $iSubItem_End <> $iColCount - 1 Then $bRange_Flag = True
EndIf
EndIf
Local $sDisplayData = "[" & $iRowCount & "]"
If $iDimension = 2 Then
$sDisplayData &= " [" & $iColCount & "]"
EndIf
Local $sTipData = ""
If $bRange_Flag Then
If $sTipData Then $sTipData &= " - "
$sTipData &= "Range set"
EndIf
If $iTranspose Then
If $sTipData Then $sTipData &= " - "
$sTipData &= "Transposed"
EndIf
Local $asHeader = StringSplit($sHeader, $sCurr_Separator, $STR_NOCOUNT)
If UBound($asHeader) = 0 Then Local $asHeader[1] = [""]
$sHeader = "Row"
Local $iIndex = $iSubItem_Start
If $iTranspose Then
$sHeader = "Col"
For $j = $iItem_Start To $iItem_End
$sHeader &= $sCurr_Separator & "Row " & $j
Next
Else
If $asHeader[0] Then
For $iIndex = $iSubItem_Start To $iSubItem_End
If $iIndex >= UBound($asHeader) Then ExitLoop
$sHeader &= $sCurr_Separator & $asHeader[$iIndex]
Next
EndIf
For $j = $iIndex To $iSubItem_End
$sHeader &= $sCurr_Separator & "Col " & $j
Next
EndIf
If $iNoRow Then $sHeader = StringTrimLeft($sHeader, 4)
If $iVerbose And ($iItem_End - $iItem_Start + 1) * ($iSubItem_End - $iSubItem_Start + 1) > 10000 Then
SplashTextOn($sMsgBoxTitle, "Preparing display" & @CRLF & @CRLF & "Please be patient", 300, 100)
EndIf
Local Const $_ARRAYCONSTANT_GUI_DOCKBOTTOM = 64
Local Const $_ARRAYCONSTANT_GUI_DOCKBORDERS = 102
Local Const $_ARRAYCONSTANT_GUI_DOCKHEIGHT = 512
Local Const $_ARRAYCONSTANT_GUI_DOCKLEFT = 2
Local Const $_ARRAYCONSTANT_GUI_DOCKRIGHT = 4
Local Const $_ARRAYCONSTANT_GUI_DOCKHCENTER = 8
Local Const $_ARRAYCONSTANT_GUI_EVENT_CLOSE = -3
Local Const $_ARRAYCONSTANT_GUI_FOCUS = 256
Local Const $_ARRAYCONSTANT_SS_CENTER = 0x1
Local Const $_ARRAYCONSTANT_SS_CENTERIMAGE = 0x0200
Local Const $_ARRAYCONSTANT_LVM_GETITEMCOUNT = (0x1000 + 4)
Local Const $_ARRAYCONSTANT_LVM_GETITEMRECT = (0x1000 + 14)
Local Const $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH = (0x1000 + 29)
Local Const $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH = (0x1000 + 30)
Local Const $_ARRAYCONSTANT_LVM_GETITEMSTATE = (0x1000 + 44)
Local Const $_ARRAYCONSTANT_LVM_GETSELECTEDCOUNT = (0x1000 + 50)
Local Const $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE = (0x1000 + 54)
Local Const $_ARRAYCONSTANT_LVS_EX_GRIDLINES = 0x1
Local Const $_ARRAYCONSTANT_LVIS_SELECTED = 0x0002
Local Const $_ARRAYCONSTANT_LVS_SHOWSELALWAYS = 0x8
Local Const $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT = 0x20
Local Const $_ARRAYCONSTANT_WS_EX_CLIENTEDGE = 0x0200
Local Const $_ARRAYCONSTANT_WS_MAXIMIZEBOX = 0x00010000
Local Const $_ARRAYCONSTANT_WS_MINIMIZEBOX = 0x00020000
Local Const $_ARRAYCONSTANT_WS_SIZEBOX = 0x00040000
Local Const $_ARRAYCONSTANT_WM_SETREDRAW = 11
Local Const $_ARRAYCONSTANT_LVSCW_AUTOSIZE = -1
Local Const $_ARRAYCONSTANT_LVSCW_AUTOSIZE_USEHEADER = -2
Local $iCoordMode = Opt("GUICoordMode", 1)
Local $iOrgWidth = 210, $iHeight = 200, $iMinSize = 250
Local $hGUI = GUICreate($sTitle, $iOrgWidth, $iHeight, Default, Default, BitOR($_ARRAYCONSTANT_WS_SIZEBOX, $_ARRAYCONSTANT_WS_MINIMIZEBOX, $_ARRAYCONSTANT_WS_MAXIMIZEBOX))
Local $aiGUISize = WinGetClientSize($hGUI)
Local $iButtonWidth_1 = $aiGUISize[0] / 2
Local $iButtonWidth_2 = $aiGUISize[0] / 3
Local $idListView = GUICtrlCreateListView($sHeader, 0, 0, $aiGUISize[0], $aiGUISize[1] - $iButtonBorder, $_ARRAYCONSTANT_LVS_SHOWSELALWAYS)
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_GRIDLINES, $_ARRAYCONSTANT_LVS_EX_GRIDLINES)
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT, $_ARRAYCONSTANT_LVS_EX_FULLROWSELECT)
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETEXTENDEDLISTVIEWSTYLE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE, $_ARRAYCONSTANT_WS_EX_CLIENTEDGE)
Local $idCopy_ID = 9999, $idCopy_Data = 99999, $idData_Label = 99999, $idUser_Func = 99999, $idExit_Script = 99999
If $bDebug Then
$idCopy_ID = GUICtrlCreateButton("Copy Data && Hdr/Row", 0, $aiGUISize[1] - $iButtonBorder, $iButtonWidth_1, 20)
$idCopy_Data = GUICtrlCreateButton("Copy Data Only", $iButtonWidth_1, $aiGUISize[1] - $iButtonBorder, $iButtonWidth_1, 20)
Local $iButtonWidth_Var = $iButtonWidth_1
Local $iOffset = $iButtonWidth_1
If IsFunc($hUser_Function) Then
$idUser_Func = GUICtrlCreateButton("Run User Func", $iButtonWidth_2, $aiGUISize[1] - 20, $iButtonWidth_2, 20)
$iButtonWidth_Var = $iButtonWidth_2
$iOffset = $iButtonWidth_2 * 2
EndIf
$idExit_Script = GUICtrlCreateButton("Exit Script", $iOffset, $aiGUISize[1] - 20, $iButtonWidth_Var, 20)
$idData_Label = GUICtrlCreateLabel($sDisplayData, 0, $aiGUISize[1] - 20, $iButtonWidth_Var, 18, BitOR($_ARRAYCONSTANT_SS_CENTER, $_ARRAYCONSTANT_SS_CENTERIMAGE))
Else
$idData_Label = GUICtrlCreateLabel($sDisplayData, 0, $aiGUISize[1] - 20, $aiGUISize[0], 18, BitOR($_ARRAYCONSTANT_SS_CENTER, $_ARRAYCONSTANT_SS_CENTERIMAGE))
EndIf
Select
Case $iTranspose Or $bRange_Flag
GUICtrlSetColor($idData_Label, 0xFF0000)
GUICtrlSetTip($idData_Label, $sTipData)
EndSelect
GUICtrlSetResizing($idListView, $_ARRAYCONSTANT_GUI_DOCKBORDERS)
GUICtrlSetResizing($idCopy_ID, $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
GUICtrlSetResizing($idCopy_Data, $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
GUICtrlSetResizing($idData_Label, $_ARRAYCONSTANT_GUI_DOCKLEFT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
GUICtrlSetResizing($idUser_Func, $_ARRAYCONSTANT_GUI_DOCKHCENTER + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
GUICtrlSetResizing($idExit_Script, $_ARRAYCONSTANT_GUI_DOCKRIGHT + $_ARRAYCONSTANT_GUI_DOCKBOTTOM + $_ARRAYCONSTANT_GUI_DOCKHEIGHT)
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_WM_SETREDRAW, 0, 0)
Local $iRowIndex, $iColFill
If $iTranspose Then
For $i = $iSubItem_Start To $iSubItem_End
$iRowIndex = __ArrayDisplay_AddItem($idListView, "NULL")
If $iNoRow Then
$iColFill = 0
Else
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, "Col " & $i, 0)
$iColFill = 1
EndIf
For $j = $iItem_Start To $iItem_End
If $iDimension = 2 Then
$vTmp = $aArray[$j][$i]
Else
$vTmp = $aArray[$j]
EndIf
Switch VarGetType($vTmp)
Case "Array"
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, "{Array}", $iColFill)
Case Else
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, $vTmp, $iColFill)
EndSwitch
$iColFill += 1
Next
Next
Else
For $i = $iItem_Start To $iItem_End
$iRowIndex = __ArrayDisplay_AddItem($idListView, "NULL")
If $iNoRow Then
$iColFill = 0
Else
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, "Row " & $i, 0)
$iColFill = 1
EndIf
For $j = $iSubItem_Start To $iSubItem_End
If $iDimension = 2 Then
$vTmp = $aArray[$i][$j]
Else
$vTmp = $aArray[$i]
EndIf
Switch VarGetType($vTmp)
Case "Array"
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, "{Array}", $iColFill)
Case Else
__ArrayDisplay_AddSubItem($idListView, $iRowIndex, $vTmp, $iColFill)
EndSwitch
$iColFill += 1
Next
Next
EndIf
If $iColAlign Then
For $i = 0 To $iColFill - 1
__ArrayDisplay_JustifyColumn($idListView, $i, $iColAlign / 2)
Next
EndIf
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_WM_SETREDRAW, 1, 0)
Local $iBorder = (($iRowIndex > 19) ? (65) : (45))
Local $iWidth = $iBorder, $iColWidth = 0, $aiColWidth[$iColFill], $iMin_ColWidth = 55
For $i = 0 To UBound($aiColWidth) - 1
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $_ARRAYCONSTANT_LVSCW_AUTOSIZE)
$iColWidth = GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH, $i, 0)
If $sHeader <> "" Then
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $_ARRAYCONSTANT_LVSCW_AUTOSIZE_USEHEADER)
Local $iColWidthHeader = GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETCOLUMNWIDTH, $i, 0)
If $iColWidth < $iMin_ColWidth And $iColWidthHeader < $iMin_ColWidth Then
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $iMin_ColWidth)
$iColWidth = $iMin_ColWidth
ElseIf $iColWidthHeader < $iColWidth Then
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $iColWidth)
Else
$iColWidth = $iColWidthHeader
EndIf
Else
If $iColWidth < $iMin_ColWidth Then
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $iMin_ColWidth)
$iColWidth = $iMin_ColWidth
EndIf
EndIf
$iWidth += $iColWidth
$aiColWidth[$i] = $iColWidth
Next
If $iWidth > @DesktopWidth - 100 Then
$iWidth = $iBorder
For $i = 0 To UBound($aiColWidth) - 1
If $aiColWidth[$i] > $iMax_ColWidth Then
GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_SETCOLUMNWIDTH, $i, $iMax_ColWidth)
$iWidth += $iMax_ColWidth
Else
$iWidth += $aiColWidth[$i]
EndIf
Next
EndIf
If $iWidth > @DesktopWidth - 100 Then
$iWidth = @DesktopWidth - 100
ElseIf $iWidth < $iMinSize Then
$iWidth = $iMinSize
EndIf
Local $tRECT = DllStructCreate("struct; long Left;long Top;long Right;long Bottom; endstruct")
DllCall("user32.dll", "struct*", "SendMessageW", "hwnd", GUICtrlGetHandle($idListView), "uint", $_ARRAYCONSTANT_LVM_GETITEMRECT, "wparam", 0, "struct*", $tRECT)
Local $aiWin_Pos = WinGetPos($hGUI)
Local $aiLV_Pos = ControlGetPos($hGUI, "", $idListView)
$iHeight = (($iRowIndex + 4) * (DllStructGetData($tRECT, "Bottom") - DllStructGetData($tRECT, "Top"))) + $aiWin_Pos[3] - $aiLV_Pos[3]
If $iHeight > @DesktopHeight - 100 Then
$iHeight = @DesktopHeight - 100
ElseIf $iHeight < $iMinSize Then
$iHeight = $iMinSize
EndIf
If $iVerbose Then SplashOff()
GUISetState(@SW_HIDE, $hGUI)
WinMove($hGUI, "", (@DesktopWidth - $iWidth) / 2, (@DesktopHeight - $iHeight) / 2, $iWidth, $iHeight)
GUISetState(@SW_SHOW, $hGUI)
Local $iOnEventMode = Opt("GUIOnEventMode", 0), $iMsg
__ArrayDisplay_RegisterSortCallBack($idListView, 2, True, "__ArrayDisplay_SortCallBack")
While 1
$iMsg = GUIGetMsg()
Switch $iMsg
Case $_ARRAYCONSTANT_GUI_EVENT_CLOSE
ExitLoop
Case $idCopy_ID, $idCopy_Data
Local $iSel_Count = GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETSELECTEDCOUNT, 0, 0)
If $iVerbose And (Not $iSel_Count) And ($iItem_End - $iItem_Start) * ($iSubItem_End - $iSubItem_Start) > 10000 Then
SplashTextOn($sMsgBoxTitle, "Copying data" & @CRLF & @CRLF & "Please be patient", 300, 100)
EndIf
Local $sClip = "", $sItem, $aSplit
For $i = 0 To GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETITEMCOUNT, 0, 0) - 1
If $iSel_Count And Not (GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETITEMSTATE, $i, $_ARRAYCONSTANT_LVIS_SELECTED) <> 0) Then
ContinueLoop
EndIf
$sItem = __ArrayDisplay_GetItemTextString($idListView, $i)
If $iMsg = $idCopy_ID And $iNoRow Then
$sItem = "Row " & ($i + (($iTranspose) ? ($iSubItem_Start) : ($iItem_Start))) & $sCurr_Separator & $sItem
EndIf
If $iMsg = $idCopy_Data And Not $iNoRow Then
$sItem = StringRegExpReplace($sItem, "^Row\s\d+\|(.*)$", "$1")
EndIf
If $iCW_ColWidth Then
$aSplit = StringSplit($sItem, $sCurr_Separator)
$sItem = ""
For $j = 1 To $aSplit[0]
$sItem &= StringFormat("%-" & $iCW_ColWidth + 1 & "s", StringLeft($aSplit[$j], $iCW_ColWidth))
Next
Else
$sItem = StringReplace($sItem, $sCurr_Separator, $vUser_Separator)
EndIf
$sClip &= $sItem & @CRLF
Next
$sItem = $sHeader
If $iMsg = $idCopy_ID Then
$sItem = $sHeader
If $iNoRow Then
$sItem = "Row|" & $sItem
EndIf
If $iCW_ColWidth Then
$aSplit = StringSplit($sItem, $sCurr_Separator)
$sItem = ""
For $j = 1 To $aSplit[0]
$sItem &= StringFormat("%-" & $iCW_ColWidth + 1 & "s", StringLeft($aSplit[$j], $iCW_ColWidth))
Next
Else
$sItem = StringReplace($sItem, $sCurr_Separator, $vUser_Separator)
EndIf
$sClip = $sItem & @CRLF & $sClip
EndIf
ClipPut($sClip)
SplashOff()
GUICtrlSetState($idListView, $_ARRAYCONSTANT_GUI_FOCUS)
Case $idListView
__ArrayDisplay_SortItems($idListView, GUICtrlGetState($idListView))
Case $idUser_Func
Local $aiSelItems[1] = [0]
For $i = 0 To GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETITEMCOUNT, 0, 0) - 1
If (GUICtrlSendMsg($idListView, $_ARRAYCONSTANT_LVM_GETITEMSTATE, $i, $_ARRAYCONSTANT_LVIS_SELECTED) <> 0) Then
$aiSelItems[0] += 1
ReDim $aiSelItems[$aiSelItems[0] + 1]
$aiSelItems[$aiSelItems[0]] = $i + $iItem_Start
EndIf
Next
$hUser_Function($aArray, $aiSelItems)
GUICtrlSetState($idListView, $_ARRAYCONSTANT_GUI_FOCUS)
Case $idExit_Script
GUIDelete($hGUI)
Exit
EndSwitch
WEnd
GUIDelete($hGUI)
Opt("GUICoordMode", $iCoordMode)
Opt("GUIOnEventMode", $iOnEventMode)
Return 1
EndFunc
Func __ArrayDisplay_RegisterSortCallBack($hWnd, $vCompareType = 2, $bArrows = True, $sSort_Callback = "__ArrayDisplay_SortCallBack")
#Au3Stripper_Ignore_Funcs=$sSort_Callback
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $hHeader =  HWnd(GUICtrlSendMsg($hWnd, 0x101F, 0, 0))
$__g_aArrayDisplay_SortInfo[1] = $hWnd
$__g_aArrayDisplay_SortInfo[2] = DllCallbackRegister($sSort_Callback, "int", "int;int;hwnd")
$__g_aArrayDisplay_SortInfo[3] = -1
$__g_aArrayDisplay_SortInfo[4] = -1
$__g_aArrayDisplay_SortInfo[5] = 1
$__g_aArrayDisplay_SortInfo[6] = -1
$__g_aArrayDisplay_SortInfo[7] = 0
$__g_aArrayDisplay_SortInfo[8] = $vCompareType
$__g_aArrayDisplay_SortInfo[9] = $bArrows
$__g_aArrayDisplay_SortInfo[10] = $hHeader
Return $__g_aArrayDisplay_SortInfo[2] <> 0
EndFunc
#Au3Stripper_Ignore_Funcs=__ArrayDisplay_SortCallBack
Func __ArrayDisplay_SortCallBack($nItem1, $nItem2, $hWnd)
If $__g_aArrayDisplay_SortInfo[3] = $__g_aArrayDisplay_SortInfo[4] Then
If Not $__g_aArrayDisplay_SortInfo[7] Then
$__g_aArrayDisplay_SortInfo[5] *= -1
$__g_aArrayDisplay_SortInfo[7] = 1
EndIf
Else
$__g_aArrayDisplay_SortInfo[7] = 1
EndIf
$__g_aArrayDisplay_SortInfo[6] = $__g_aArrayDisplay_SortInfo[3]
Local $sVal1 = __ArrayDisplay_GetItemText($hWnd, $nItem1, $__g_aArrayDisplay_SortInfo[3])
Local $sVal2 = __ArrayDisplay_GetItemText($hWnd, $nItem2, $__g_aArrayDisplay_SortInfo[3])
If $__g_aArrayDisplay_SortInfo[8] = 1 Then
If (StringIsFloat($sVal1) Or StringIsInt($sVal1)) Then $sVal1 = Number($sVal1)
If (StringIsFloat($sVal2) Or StringIsInt($sVal2)) Then $sVal2 = Number($sVal2)
EndIf
Local $nResult
If $__g_aArrayDisplay_SortInfo[8] < 2 Then
$nResult = 0
If $sVal1 < $sVal2 Then
$nResult = -1
ElseIf $sVal1 > $sVal2 Then
$nResult = 1
EndIf
Else
$nResult = DllCall('shlwapi.dll', 'int', 'StrCmpLogicalW', 'wstr', $sVal1, 'wstr', $sVal2)[0]
EndIf
$nResult = $nResult * $__g_aArrayDisplay_SortInfo[5]
Return $nResult
EndFunc
Func __ArrayDisplay_SortItems($hWnd, $iCol)
If Not IsHWnd($hWnd) Then $hWnd = GUICtrlGetHandle($hWnd)
Local $pFunction = DllCallbackGetPtr($__g_aArrayDisplay_SortInfo[2])
$__g_aArrayDisplay_SortInfo[3] = $iCol
$__g_aArrayDisplay_SortInfo[7] = 0
$__g_aArrayDisplay_SortInfo[4] = $__g_aArrayDisplay_SortInfo[6]
Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", 0x1051, "hwnd", $hWnd, "ptr", $pFunction)
If $aResult[0] <> 0 Then
If $__g_aArrayDisplay_SortInfo[9] Then
Local $hHeader = $__g_aArrayDisplay_SortInfo[10], $iFormat
For $x = 0 To __ArrayDisplay_GetItemCount($hHeader) - 1
$iFormat = __ArrayDisplay_GetItemFormat($hHeader, $x)
If BitAND($iFormat, 0x00000200) Then
__ArrayDisplay_SetItemFormat($hHeader, $x, BitXOR($iFormat, 0x00000200))
ElseIf BitAND($iFormat, 0x00000400) Then
__ArrayDisplay_SetItemFormat($hHeader, $x, BitXOR($iFormat, 0x00000400))
EndIf
Next
$iFormat = __ArrayDisplay_GetItemFormat($hHeader, $iCol)
If $__g_aArrayDisplay_SortInfo[5] = 1 Then
__ArrayDisplay_SetItemFormat($hHeader, $iCol, BitOR($iFormat, 0x00000400))
Else
__ArrayDisplay_SetItemFormat($hHeader, $iCol, BitOR($iFormat, 0x00000200))
EndIf
EndIf
Return True
EndIf
Return False
EndFunc
Func __ArrayDisplay_AddItem($hWnd, $sText)
Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagLVITEM)
DllStructSetData($tItem, "Param", 0)
Local $iBuffer = StringLen($sText) + 1
Local $tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
$iBuffer *= 2
DllStructSetData($tBuffer, "Text", $sText)
DllStructSetData($tItem, "Text", DllStructGetPtr($tBuffer))
DllStructSetData($tItem, "TextMax", $iBuffer)
Local $iMask = 0x00000005
DllStructSetData($tItem, "Mask", $iMask)
DllStructSetData($tItem, "Item", 999999999)
DllStructSetData($tItem, "Image", -1)
Local $pItem = DllStructGetPtr($tItem)
Local $iRet = GUICtrlSendMsg($hWnd, 0x104D, 0, $pItem)
Return $iRet
EndFunc
Func __ArrayDisplay_AddSubItem($hWnd, $iIndex, $sText, $iSubItem)
Local $iBuffer = StringLen($sText) + 1
Local $tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
$iBuffer *= 2
Local $pBuffer = DllStructGetPtr($tBuffer)
Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagLVITEM)
Local $iMask = 0x00000001
DllStructSetData($tBuffer, "Text", $sText)
DllStructSetData($tItem, "Mask", $iMask)
DllStructSetData($tItem, "Item", $iIndex)
DllStructSetData($tItem, "SubItem", $iSubItem)
DllStructSetData($tItem, "Image", -1)
Local $pItem = DllStructGetPtr($tItem)
DllStructSetData($tItem, "Text", $pBuffer)
Local $iRet = GUICtrlSendMsg($hWnd, 0x104C, 0, $pItem)
Return $iRet <> 0
EndFunc
Func __ArrayDisplay_GetColumnCount($hWnd)
Local $hHeader = HWnd(GUICtrlSendMsg($hWnd, 0x101F, 0, 0))
Return __ArrayDisplay_GetItemCount($hHeader)
EndFunc
Func __ArrayDisplay_GetHeader($hWnd)
Return HWnd(GUICtrlSendMsg($hWnd, 0x101F, 0, 0))
EndFunc
Func __ArrayDisplay_GetItem($hWnd, $iIndex, ByRef $tItem)
Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", 0x120B, "wparam", $iIndex, "struct*", $tItem)
Return $aResult[0] <> 0
EndFunc
Func __ArrayDisplay_GetItemCount($hWnd)
Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", 0x1200, "wparam", 0, "lparam", 0)
Return $aResult[0]
EndFunc
Func __ArrayDisplay_GetItemFormat($hWnd, $iIndex)
Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagHDITEM)
DllStructSetData($tItem, "Mask", 0x00000004)
__ArrayDisplay_GetItem($hWnd, $iIndex, $tItem)
Return DllStructGetData($tItem, "Fmt")
EndFunc
Func __ArrayDisplay_GetItemText($hWnd, $iIndex, $iSubItem = 0)
Local $tBuffer = DllStructCreate("wchar Text[4096]")
Local $pBuffer = DllStructGetPtr($tBuffer)
Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagLVITEM)
DllStructSetData($tItem, "SubItem", $iSubItem)
DllStructSetData($tItem, "TextMax", 4096)
DllStructSetData($tItem, "Text", $pBuffer)
If IsHWnd($hWnd) Then
DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", 0x1073, "wparam", $iIndex, "struct*", $tItem)
Else
Local $pItem = DllStructGetPtr($tItem)
GUICtrlSendMsg($hWnd, 0x1073, $iIndex, $pItem)
EndIf
Return DllStructGetData($tBuffer, "Text")
EndFunc
Func __ArrayDisplay_GetItemTextString($hWnd, $iItem)
Local $sRow = "", $sSeparatorChar = Opt('GUIDataSeparatorChar')
Local $iSelected = $iItem
For $x = 0 To __ArrayDisplay_GetColumnCount($hWnd) - 1
$sRow &= __ArrayDisplay_GetItemText($hWnd, $iSelected, $x) & $sSeparatorChar
Next
Return StringTrimRight($sRow, 1)
EndFunc
Func __ArrayDisplay_JustifyColumn($idListView, $iIndex, $iAlign = -1)
Local $tColumn = DllStructCreate("uint Mask;int Fmt;int CX;ptr Text;int TextMax;int SubItem;int Image;int Order;int cxMin;int cxDefault;int cxIdeal")
If $iAlign < 0 Or $iAlign > 2 Then $iAlign = 0
DllStructSetData($tColumn, "Mask", 0x01)
DllStructSetData($tColumn, "Fmt", $iAlign)
Local $pColumn = DllStructGetPtr($tColumn)
Local $iRet = GUICtrlSendMsg($idListView, 0x1060 , $iIndex, $pColumn)
Return $iRet <> 0
EndFunc
Func __ArrayDisplay_SetItemFormat($hWnd, $iIndex, $iFormat)
Local $tItem = DllStructCreate($_ARRAYCONSTANT_tagHDITEM)
DllStructSetData($tItem, "Mask", 0x00000004)
DllStructSetData($tItem, "Fmt", $iFormat)
Local $aResult = DllCall("user32.dll", "lresult", "SendMessageW", "hwnd", $hWnd, "uint", 0x120C, "wparam", $iIndex, "struct*", $tItem)
Return $aResult[0] <> 0
EndFunc
Global Enum $ARRAYFILL_FORCE_DEFAULT, $ARRAYFILL_FORCE_SINGLEITEM, $ARRAYFILL_FORCE_INT, $ARRAYFILL_FORCE_NUMBER,  $ARRAYFILL_FORCE_PTR, $ARRAYFILL_FORCE_HWND, $ARRAYFILL_FORCE_STRING, $ARRAYFILL_FORCE_BOOLEAN
Global Enum $ARRAYUNIQUE_NOCOUNT, $ARRAYUNIQUE_COUNT
Global Enum $ARRAYUNIQUE_AUTO, $ARRAYUNIQUE_FORCE32, $ARRAYUNIQUE_FORCE64, $ARRAYUNIQUE_MATCH, $ARRAYUNIQUE_DISTINCT
Func _ArrayAdd(ByRef $aArray, $vValue, $iStart = 0, $sDelim_Item = "|", $sDelim_Row = @CRLF, $iForce = $ARRAYFILL_FORCE_DEFAULT)
If $iStart = Default Then $iStart = 0
If $sDelim_Item = Default Then $sDelim_Item = "|"
If $sDelim_Row = Default Then $sDelim_Row = @CRLF
If $iForce = Default Then $iForce = $ARRAYFILL_FORCE_DEFAULT
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
Local $hDataType = 0
Switch $iForce
Case $ARRAYFILL_FORCE_INT
$hDataType = Int
Case $ARRAYFILL_FORCE_NUMBER
$hDataType = Number
Case $ARRAYFILL_FORCE_PTR
$hDataType = Ptr
Case $ARRAYFILL_FORCE_HWND
$hDataType = Hwnd
Case $ARRAYFILL_FORCE_STRING
$hDataType = String
Case $ARRAYFILL_FORCE_BOOLEAN
$hDataType = "Boolean"
EndSwitch
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $iForce = $ARRAYFILL_FORCE_SINGLEITEM Then
ReDim $aArray[$iDim_1 + 1]
$aArray[$iDim_1] = $vValue
Return $iDim_1
EndIf
If IsArray($vValue) Then
If UBound($vValue, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(5, 0, -1)
$hDataType = 0
Else
Local $aTmp = StringSplit($vValue, $sDelim_Item, $STR_NOCOUNT + $STR_ENTIRESPLIT)
If UBound($aTmp, $UBOUND_ROWS) = 1 Then
$aTmp[0] = $vValue
EndIf
$vValue = $aTmp
EndIf
Local $iAdd = UBound($vValue, $UBOUND_ROWS)
ReDim $aArray[$iDim_1 + $iAdd]
For $i = 0 To $iAdd - 1
If String($hDataType) = "Boolean" Then
Switch $vValue[$i]
Case "True", "1"
$aArray[$iDim_1 + $i] = True
Case "False", "0", ""
$aArray[$iDim_1 + $i] = False
EndSwitch
ElseIf IsFunc($hDataType) Then
$aArray[$iDim_1 + $i] = $hDataType($vValue[$i])
Else
$aArray[$iDim_1 + $i] = $vValue[$i]
EndIf
Next
Return $iDim_1 + $iAdd - 1
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS)
If $iStart < 0 Or $iStart > $iDim_2 - 1 Then Return SetError(4, 0, -1)
Local $iValDim_1, $iValDim_2 = 0, $iColCount
If IsArray($vValue) Then
If UBound($vValue, $UBOUND_DIMENSIONS) <> 2 Then Return SetError(5, 0, -1)
$iValDim_1 = UBound($vValue, $UBOUND_ROWS)
$iValDim_2 = UBound($vValue, $UBOUND_COLUMNS)
$hDataType = 0
Else
Local $aSplit_1 = StringSplit($vValue, $sDelim_Row, $STR_NOCOUNT + $STR_ENTIRESPLIT)
$iValDim_1 = UBound($aSplit_1, $UBOUND_ROWS)
Local $aTmp[$iValDim_1][0], $aSplit_2
For $i = 0 To $iValDim_1 - 1
$aSplit_2 = StringSplit($aSplit_1[$i], $sDelim_Item, $STR_NOCOUNT + $STR_ENTIRESPLIT)
$iColCount = UBound($aSplit_2)
If $iColCount > $iValDim_2 Then
$iValDim_2 = $iColCount
ReDim $aTmp[$iValDim_1][$iValDim_2]
EndIf
For $j = 0 To $iColCount - 1
$aTmp[$i][$j] = $aSplit_2[$j]
Next
Next
$vValue = $aTmp
EndIf
If UBound($vValue, $UBOUND_COLUMNS) + $iStart > UBound($aArray, $UBOUND_COLUMNS) Then Return SetError(3, 0, -1)
ReDim $aArray[$iDim_1 + $iValDim_1][$iDim_2]
For $iWriteTo_Index = 0 To $iValDim_1 - 1
For $j = 0 To $iDim_2 - 1
If $j < $iStart Then
$aArray[$iWriteTo_Index + $iDim_1][$j] = ""
ElseIf $j - $iStart > $iValDim_2 - 1 Then
$aArray[$iWriteTo_Index + $iDim_1][$j] = ""
Else
If String($hDataType) = "Boolean" Then
Switch $vValue[$iWriteTo_Index][$j - $iStart]
Case "True", "1"
$aArray[$iWriteTo_Index + $iDim_1][$j] = True
Case "False", "0", ""
$aArray[$iWriteTo_Index + $iDim_1][$j] = False
EndSwitch
ElseIf IsFunc($hDataType) Then
$aArray[$iWriteTo_Index + $iDim_1][$j] = $hDataType($vValue[$iWriteTo_Index][$j - $iStart])
Else
$aArray[$iWriteTo_Index + $iDim_1][$j] = $vValue[$iWriteTo_Index][$j - $iStart]
EndIf
EndIf
Next
Next
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return UBound($aArray, $UBOUND_ROWS) - 1
EndFunc
Func _ArrayBinarySearch(Const ByRef $aArray, $vValue, $iStart = 0, $iEnd = 0, $iColumn = 0)
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iColumn = Default Then $iColumn = 0
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
If $iDim_1 = 0 Then Return SetError(6, 0, -1)
If $iEnd < 1 Or $iEnd > $iDim_1 - 1 Then $iEnd = $iDim_1 - 1
If $iStart < 0 Then $iStart = 0
If $iStart > $iEnd Then Return SetError(4, 0, -1)
Local $iMid = Int(($iEnd + $iStart) / 2)
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $aArray[$iStart] > $vValue Or $aArray[$iEnd] < $vValue Then Return SetError(2, 0, -1)
While $iStart <= $iMid And $vValue <> $aArray[$iMid]
If $vValue < $aArray[$iMid] Then
$iEnd = $iMid - 1
Else
$iStart = $iMid + 1
EndIf
$iMid = Int(($iEnd + $iStart) / 2)
WEnd
If $iStart > $iEnd Then Return SetError(3, 0, -1)
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iColumn < 0 Or $iColumn > $iDim_2 Then Return SetError(7, 0, -1)
If $aArray[$iStart][$iColumn] > $vValue Or $aArray[$iEnd][$iColumn] < $vValue Then Return SetError(2, 0, -1)
While $iStart <= $iMid And $vValue <> $aArray[$iMid][$iColumn]
If $vValue < $aArray[$iMid][$iColumn] Then
$iEnd = $iMid - 1
Else
$iStart = $iMid + 1
EndIf
$iMid = Int(($iEnd + $iStart) / 2)
WEnd
If $iStart > $iEnd Then Return SetError(3, 0, -1)
Case Else
Return SetError(5, 0, -1)
EndSwitch
Return $iMid
EndFunc
Func _ArrayColDelete(ByRef $aArray, $iColumn, $bConvert = False)
If $bConvert = Default Then $bConvert = False
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
If UBound($aArray, $UBOUND_DIMENSIONS) <> 2 Then Return SetError(2, 0, -1)
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS)
Switch $iDim_2
Case 2
If $iColumn < 0 Or $iColumn > 1 Then Return SetError(3, 0, -1)
If $bConvert Then
Local $aTempArray[$iDim_1]
For $i = 0 To $iDim_1 - 1
$aTempArray[$i] = $aArray[$i][(Not $iColumn)]
Next
$aArray = $aTempArray
Else
ContinueCase
EndIf
Case Else
If $iColumn < 0 Or $iColumn > $iDim_2 - 1 Then Return SetError(3, 0, -1)
For $i = 0 To $iDim_1 - 1
For $j = $iColumn To $iDim_2 - 2
$aArray[$i][$j] = $aArray[$i][$j + 1]
Next
Next
ReDim $aArray[$iDim_1][$iDim_2 - 1]
EndSwitch
Return UBound($aArray, $UBOUND_COLUMNS)
EndFunc
Func _ArrayColInsert(ByRef $aArray, $iColumn)
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
Local $aTempArray[$iDim_1][2]
Switch $iColumn
Case 0, 1
For $i = 0 To $iDim_1 - 1
$aTempArray[$i][(Not $iColumn)] = $aArray[$i]
Next
Case Else
Return SetError(3, 0, -1)
EndSwitch
$aArray = $aTempArray
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS)
If $iColumn < 0 Or $iColumn > $iDim_2 Then Return SetError(3, 0, -1)
ReDim $aArray[$iDim_1][$iDim_2 + 1]
For $i = 0 To $iDim_1 - 1
For $j = $iDim_2 To $iColumn + 1 Step -1
$aArray[$i][$j] = $aArray[$i][$j - 1]
Next
$aArray[$i][$iColumn] = ""
Next
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return UBound($aArray, $UBOUND_COLUMNS)
EndFunc
Func _ArrayCombinations(Const ByRef $aArray, $iSet, $sDelimiter = "")
If $sDelimiter = Default Then $sDelimiter = ""
If Not IsArray($aArray) Then Return SetError(1, 0, 0)
If UBound($aArray, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(2, 0, 0)
Local $iN = UBound($aArray)
Local $iR = $iSet
Local $aIdx[$iR]
For $i = 0 To $iR - 1
$aIdx[$i] = $i
Next
Local $iTotal = __Array_Combinations($iN, $iR)
Local $iLeft = $iTotal
Local $aResult[$iTotal + 1]
$aResult[0] = $iTotal
Local $iCount = 1
While $iLeft > 0
__Array_GetNext($iN, $iR, $iLeft, $iTotal, $aIdx)
For $i = 0 To $iSet - 1
$aResult[$iCount] &= $aArray[$aIdx[$i]] & $sDelimiter
Next
If $sDelimiter <> "" Then $aResult[$iCount] = StringTrimRight($aResult[$iCount], 1)
$iCount += 1
WEnd
Return $aResult
EndFunc
Func _ArrayConcatenate(ByRef $aArrayTarget, Const ByRef $aArraySource, $iStart = 0)
If $iStart = Default Then $iStart = 0
If Not IsArray($aArrayTarget) Then Return SetError(1, 0, -1)
If Not IsArray($aArraySource) Then Return SetError(2, 0, -1)
Local $iDim_Total_Tgt = UBound($aArrayTarget, $UBOUND_DIMENSIONS)
Local $iDim_Total_Src = UBound($aArraySource, $UBOUND_DIMENSIONS)
Local $iDim_1_Tgt = UBound($aArrayTarget, $UBOUND_ROWS)
Local $iDim_1_Src = UBound($aArraySource, $UBOUND_ROWS)
If $iStart < 0 Or $iStart > $iDim_1_Src - 1 Then Return SetError(6, 0, -1)
Switch $iDim_Total_Tgt
Case 1
If $iDim_Total_Src <> 1 Then Return SetError(4, 0, -1)
ReDim $aArrayTarget[$iDim_1_Tgt + $iDim_1_Src - $iStart]
For $i = $iStart To $iDim_1_Src - 1
$aArrayTarget[$iDim_1_Tgt + $i - $iStart] = $aArraySource[$i]
Next
Case 2
If $iDim_Total_Src <> 2 Then Return SetError(4, 0, -1)
Local $iDim_2_Tgt = UBound($aArrayTarget, $UBOUND_COLUMNS)
If UBound($aArraySource, $UBOUND_COLUMNS) <> $iDim_2_Tgt Then Return SetError(5, 0, -1)
ReDim $aArrayTarget[$iDim_1_Tgt + $iDim_1_Src - $iStart][$iDim_2_Tgt]
For $i = $iStart To $iDim_1_Src - 1
For $j = 0 To $iDim_2_Tgt - 1
$aArrayTarget[$iDim_1_Tgt + $i - $iStart][$j] = $aArraySource[$i][$j]
Next
Next
Case Else
Return SetError(3, 0, -1)
EndSwitch
Return UBound($aArrayTarget, $UBOUND_ROWS)
EndFunc
Func _ArrayDelete(ByRef $aArray, $vRange)
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If IsArray($vRange) Then
If UBound($vRange, $UBOUND_DIMENSIONS) <> 1 Or UBound($vRange, $UBOUND_ROWS) < 2 Then Return SetError(4, 0, -1)
Else
Local $iNumber, $aSplit_1, $aSplit_2
$vRange = StringStripWS($vRange, 8)
$aSplit_1 = StringSplit($vRange, ";")
$vRange = ""
For $i = 1 To $aSplit_1[0]
If Not StringRegExp($aSplit_1[$i], "^\d+(-\d+)?$") Then Return SetError(3, 0, -1)
$aSplit_2 = StringSplit($aSplit_1[$i], "-")
Switch $aSplit_2[0]
Case 1
$vRange &= $aSplit_2[1] & ";"
Case 2
If Number($aSplit_2[2]) >= Number($aSplit_2[1]) Then
$iNumber = $aSplit_2[1] - 1
Do
$iNumber += 1
$vRange &= $iNumber & ";"
Until $iNumber = $aSplit_2[2]
EndIf
EndSwitch
Next
$vRange = StringSplit(StringTrimRight($vRange, 1), ";")
EndIf
If $vRange[1] < 0 Or $vRange[$vRange[0]] > $iDim_1 Then Return SetError(5, 0, -1)
Local $iCopyTo_Index = 0
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
For $i = 1 To $vRange[0]
$aArray[$vRange[$i]] = ChrW(0xFAB1)
Next
For $iReadFrom_Index = 0 To $iDim_1
If $aArray[$iReadFrom_Index] == ChrW(0xFAB1) Then
ContinueLoop
Else
If $iReadFrom_Index <> $iCopyTo_Index Then
$aArray[$iCopyTo_Index] = $aArray[$iReadFrom_Index]
EndIf
$iCopyTo_Index += 1
EndIf
Next
ReDim $aArray[$iDim_1 - $vRange[0] + 1]
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
For $i = 1 To $vRange[0]
$aArray[$vRange[$i]][0] = ChrW(0xFAB1)
Next
For $iReadFrom_Index = 0 To $iDim_1
If $aArray[$iReadFrom_Index][0] == ChrW(0xFAB1) Then
ContinueLoop
Else
If $iReadFrom_Index <> $iCopyTo_Index Then
For $j = 0 To $iDim_2
$aArray[$iCopyTo_Index][$j] = $aArray[$iReadFrom_Index][$j]
Next
EndIf
$iCopyTo_Index += 1
EndIf
Next
ReDim $aArray[$iDim_1 - $vRange[0] + 1][$iDim_2 + 1]
Case Else
Return SetError(2, 0, False)
EndSwitch
Return UBound($aArray, $UBOUND_ROWS)
EndFunc
Func _ArrayDisplay(Const ByRef $aArray, $sTitle = Default, $sArrayRange = Default, $iFlags = Default, $vUser_Separator = Default, $sHeader = Default, $iMax_ColWidth = Default)
#forceref $vUser_Separator
Local $iRet = __ArrayDisplay_Share($aArray, $sTitle, $sArrayRange, $iFlags, Default, $sHeader, $iMax_ColWidth, 0, False)
Return SetError(@error, @extended, $iRet)
EndFunc
Func _ArrayExtract(Const ByRef $aArray, $iStart_Row = -1, $iEnd_Row = -1, $iStart_Col = -1, $iEnd_Col = -1)
If $iStart_Row = Default Then $iStart_Row = -1
If $iEnd_Row = Default Then $iEnd_Row = -1
If $iStart_Col = Default Then $iStart_Col = -1
If $iEnd_Col = Default Then $iEnd_Col = -1
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If $iEnd_Row = -1 Then $iEnd_Row = $iDim_1
If $iStart_Row = -1 Then $iStart_Row = 0
If $iStart_Row < -1 Or $iEnd_Row < -1 Then Return SetError(3, 0, -1)
If $iStart_Row > $iDim_1 Or $iEnd_Row > $iDim_1 Then Return SetError(3, 0, -1)
If $iStart_Row > $iEnd_Row Then Return SetError(4, 0, -1)
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
Local $aRetArray[$iEnd_Row - $iStart_Row + 1]
For $i = 0 To $iEnd_Row - $iStart_Row
$aRetArray[$i] = $aArray[$i + $iStart_Row]
Next
Return $aRetArray
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iEnd_Col = -1 Then $iEnd_Col = $iDim_2
If $iStart_Col = -1 Then $iStart_Col = 0
If $iStart_Col < -1 Or $iEnd_Col < -1 Then Return SetError(5, 0, -1)
If $iStart_Col > $iDim_2 Or $iEnd_Col > $iDim_2 Then Return SetError(5, 0, -1)
If $iStart_Col > $iEnd_Col Then Return SetError(6, 0, -1)
If $iStart_Col = $iEnd_Col Then
Local $aRetArray[$iEnd_Row - $iStart_Row + 1]
Else
Local $aRetArray[$iEnd_Row - $iStart_Row + 1][$iEnd_Col - $iStart_Col + 1]
EndIf
For $i = 0 To $iEnd_Row - $iStart_Row
For $j = 0 To $iEnd_Col - $iStart_Col
If $iStart_Col = $iEnd_Col Then
$aRetArray[$i] = $aArray[$i + $iStart_Row][$j + $iStart_Col]
Else
$aRetArray[$i][$j] = $aArray[$i + $iStart_Row][$j + $iStart_Col]
EndIf
Next
Next
Return $aRetArray
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return 1
EndFunc
Func _ArrayFindAll(Const ByRef $aArray, $vValue, $iStart = 0, $iEnd = 0, $iCase = 0, $iCompare = 0, $iSubItem = 0, $bRow = False)
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iCase = Default Then $iCase = 0
If $iCompare = Default Then $iCompare = 0
If $iSubItem = Default Then $iSubItem = 0
If $bRow = Default Then $bRow = False
$iStart = _ArraySearch($aArray, $vValue, $iStart, $iEnd, $iCase, $iCompare, 1, $iSubItem, $bRow)
If @error Then Return SetError(@error, 0, -1)
Local $iIndex = 0, $avResult[UBound($aArray, ($bRow ? $UBOUND_COLUMNS : $UBOUND_ROWS))]
Do
$avResult[$iIndex] = $iStart
$iIndex += 1
$iStart = _ArraySearch($aArray, $vValue, $iStart + 1, $iEnd, $iCase, $iCompare, 1, $iSubItem, $bRow)
Until @error
ReDim $avResult[$iIndex]
Return $avResult
EndFunc
Func _ArrayInsert(ByRef $aArray, $vRange, $vValue = "", $iStart = 0, $sDelim_Item = "|", $sDelim_Row = @CRLF, $iForce = $ARRAYFILL_FORCE_DEFAULT)
If $vValue = Default Then $vValue = ""
If $iStart = Default Then $iStart = 0
If $sDelim_Item = Default Then $sDelim_Item = "|"
If $sDelim_Row = Default Then $sDelim_Row = @CRLF
If $iForce = Default Then $iForce = $ARRAYFILL_FORCE_DEFAULT
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
Local $hDataType = 0
Switch $iForce
Case $ARRAYFILL_FORCE_INT
$hDataType = Int
Case $ARRAYFILL_FORCE_NUMBER
$hDataType = Number
Case $ARRAYFILL_FORCE_PTR
$hDataType = Ptr
Case $ARRAYFILL_FORCE_HWND
$hDataType = Hwnd
Case $ARRAYFILL_FORCE_STRING
$hDataType = String
EndSwitch
Local $aSplit_1, $aSplit_2
If IsArray($vRange) Then
If UBound($vRange, $UBOUND_DIMENSIONS) <> 1 Or UBound($vRange, $UBOUND_ROWS) < 2 Then Return SetError(4, 0, -1)
Else
Local $iNumber
$vRange = StringStripWS($vRange, 8)
$aSplit_1 = StringSplit($vRange, ";")
$vRange = ""
For $i = 1 To $aSplit_1[0]
If Not StringRegExp($aSplit_1[$i], "^\d+(-\d+)?$") Then Return SetError(3, 0, -1)
$aSplit_2 = StringSplit($aSplit_1[$i], "-")
Switch $aSplit_2[0]
Case 1
$vRange &= $aSplit_2[1] & ";"
Case 2
If Number($aSplit_2[2]) >= Number($aSplit_2[1]) Then
$iNumber = $aSplit_2[1] - 1
Do
$iNumber += 1
$vRange &= $iNumber & ";"
Until $iNumber = $aSplit_2[2]
EndIf
EndSwitch
Next
$vRange = StringSplit(StringTrimRight($vRange, 1), ";")
EndIf
If $vRange[1] < 0 Or $vRange[$vRange[0]] > $iDim_1 Then Return SetError(5, 0, -1)
For $i = 2 To $vRange[0]
If $vRange[$i] < $vRange[$i - 1] Then Return SetError(3, 0, -1)
Next
Local $iCopyTo_Index = $iDim_1 + $vRange[0]
Local $iInsertPoint_Index = $vRange[0]
Local $iInsert_Index = $vRange[$iInsertPoint_Index]
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $iForce = $ARRAYFILL_FORCE_SINGLEITEM Then
ReDim $aArray[$iDim_1 + $vRange[0] + 1]
For $iReadFromIndex = $iDim_1 To 0 Step -1
$aArray[$iCopyTo_Index] = $aArray[$iReadFromIndex]
$iCopyTo_Index -= 1
$iInsert_Index = $vRange[$iInsertPoint_Index]
While $iReadFromIndex = $iInsert_Index
$aArray[$iCopyTo_Index] = $vValue
$iCopyTo_Index -= 1
$iInsertPoint_Index -= 1
If $iInsertPoint_Index < 1 Then ExitLoop 2
$iInsert_Index = $vRange[$iInsertPoint_Index]
WEnd
Next
Return $iDim_1 + $vRange[0] + 1
EndIf
ReDim $aArray[$iDim_1 + $vRange[0] + 1]
If IsArray($vValue) Then
If UBound($vValue, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(5, 0, -1)
$hDataType = 0
Else
Local $aTmp = StringSplit($vValue, $sDelim_Item, $STR_NOCOUNT + $STR_ENTIRESPLIT)
If UBound($aTmp, $UBOUND_ROWS) = 1 Then
$aTmp[0] = $vValue
$hDataType = 0
EndIf
$vValue = $aTmp
EndIf
For $iReadFromIndex = $iDim_1 To 0 Step -1
$aArray[$iCopyTo_Index] = $aArray[$iReadFromIndex]
$iCopyTo_Index -= 1
$iInsert_Index = $vRange[$iInsertPoint_Index]
While $iReadFromIndex = $iInsert_Index
If $iInsertPoint_Index <= UBound($vValue, $UBOUND_ROWS) Then
If IsFunc($hDataType) Then
$aArray[$iCopyTo_Index] = $hDataType($vValue[$iInsertPoint_Index - 1])
Else
$aArray[$iCopyTo_Index] = $vValue[$iInsertPoint_Index - 1]
EndIf
Else
$aArray[$iCopyTo_Index] = ""
EndIf
$iCopyTo_Index -= 1
$iInsertPoint_Index -= 1
If $iInsertPoint_Index = 0 Then ExitLoop 2
$iInsert_Index = $vRange[$iInsertPoint_Index]
WEnd
Next
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS)
If $iStart < 0 Or $iStart > $iDim_2 - 1 Then Return SetError(6, 0, -1)
Local $iValDim_1, $iValDim_2
If IsArray($vValue) Then
If UBound($vValue, $UBOUND_DIMENSIONS) <> 2 Then Return SetError(7, 0, -1)
$iValDim_1 = UBound($vValue, $UBOUND_ROWS)
$iValDim_2 = UBound($vValue, $UBOUND_COLUMNS)
$hDataType = 0
Else
$aSplit_1 = StringSplit($vValue, $sDelim_Row, $STR_NOCOUNT + $STR_ENTIRESPLIT)
$iValDim_1 = UBound($aSplit_1, $UBOUND_ROWS)
StringReplace($aSplit_1[0], $sDelim_Item, "")
$iValDim_2 = @extended + 1
Local $aTmp[$iValDim_1][$iValDim_2]
For $i = 0 To $iValDim_1 - 1
$aSplit_2 = StringSplit($aSplit_1[$i], $sDelim_Item, $STR_NOCOUNT + $STR_ENTIRESPLIT)
For $j = 0 To $iValDim_2 - 1
$aTmp[$i][$j] = $aSplit_2[$j]
Next
Next
$vValue = $aTmp
EndIf
If UBound($vValue, $UBOUND_COLUMNS) + $iStart > UBound($aArray, $UBOUND_COLUMNS) Then Return SetError(8, 0, -1)
ReDim $aArray[$iDim_1 + $vRange[0] + 1][$iDim_2]
For $iReadFromIndex = $iDim_1 To 0 Step -1
For $j = 0 To $iDim_2 - 1
$aArray[$iCopyTo_Index][$j] = $aArray[$iReadFromIndex][$j]
Next
$iCopyTo_Index -= 1
$iInsert_Index = $vRange[$iInsertPoint_Index]
While $iReadFromIndex = $iInsert_Index
For $j = 0 To $iDim_2 - 1
If $j < $iStart Then
$aArray[$iCopyTo_Index][$j] = ""
ElseIf $j - $iStart > $iValDim_2 - 1 Then
$aArray[$iCopyTo_Index][$j] = ""
Else
If $iInsertPoint_Index - 1 < $iValDim_1 Then
If IsFunc($hDataType) Then
$aArray[$iCopyTo_Index][$j] = $hDataType($vValue[$iInsertPoint_Index - 1][$j - $iStart])
Else
$aArray[$iCopyTo_Index][$j] = $vValue[$iInsertPoint_Index - 1][$j - $iStart]
EndIf
Else
$aArray[$iCopyTo_Index][$j] = ""
EndIf
EndIf
Next
$iCopyTo_Index -= 1
$iInsertPoint_Index -= 1
If $iInsertPoint_Index = 0 Then ExitLoop 2
$iInsert_Index = $vRange[$iInsertPoint_Index]
WEnd
Next
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return UBound($aArray, $UBOUND_ROWS)
EndFunc
Func _ArrayMax(Const ByRef $aArray, $iCompNumeric = 0, $iStart = -1, $iEnd = -1, $iSubItem = 0)
Local $iResult = _ArrayMaxIndex($aArray, $iCompNumeric, $iStart, $iEnd, $iSubItem)
If @error Then Return SetError(@error, 0, "")
If UBound($aArray, $UBOUND_DIMENSIONS) = 1 Then
Return $aArray[$iResult]
Else
Return $aArray[$iResult][$iSubItem]
EndIf
EndFunc
Func _ArrayMaxIndex(Const ByRef $aArray, $iCompNumeric = 0, $iStart = -1, $iEnd = -1, $iSubItem = 0)
If $iCompNumeric = Default Then $iCompNumeric = 0
If $iStart = Default Then $iStart = -1
If $iEnd = Default Then $iEnd = -1
If $iSubItem = Default Then $iSubItem = 0
Local $iRet = __Array_MinMaxIndex($aArray, $iCompNumeric, $iStart, $iEnd, $iSubItem, __Array_GreaterThan)
Return SetError(@error, 0, $iRet)
EndFunc
Func _ArrayMin(Const ByRef $aArray, $iCompNumeric = 0, $iStart = -1, $iEnd = -1, $iSubItem = 0)
Local $iResult = _ArrayMinIndex($aArray, $iCompNumeric, $iStart, $iEnd, $iSubItem)
If @error Then Return SetError(@error, 0, "")
If UBound($aArray, $UBOUND_DIMENSIONS) = 1 Then
Return $aArray[$iResult]
Else
Return $aArray[$iResult][$iSubItem]
EndIf
EndFunc
Func _ArrayMinIndex(Const ByRef $aArray, $iCompNumeric = 0, $iStart = -1, $iEnd = -1, $iSubItem = 0)
If $iCompNumeric = Default Then $iCompNumeric = 0
If $iStart = Default Then $iStart = -1
If $iEnd = Default Then $iEnd = -1
If $iSubItem = Default Then $iSubItem = 0
Local $iRet = __Array_MinMaxIndex($aArray, $iCompNumeric, $iStart, $iEnd, $iSubItem, __Array_LessThan)
Return SetError(@error, 0, $iRet)
EndFunc
Func _ArrayPermute(ByRef $aArray, $sDelimiter = "")
If $sDelimiter = Default Then $sDelimiter = ""
If Not IsArray($aArray) Then Return SetError(1, 0, 0)
If UBound($aArray, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(2, 0, 0)
Local $iSize = UBound($aArray), $iFactorial = 1, $aIdx[$iSize], $aResult[1], $iCount = 1
If UBound($aArray) Then
For $i = 0 To $iSize - 1
$aIdx[$i] = $i
Next
For $i = $iSize To 1 Step -1
$iFactorial *= $i
Next
ReDim $aResult[$iFactorial + 1]
$aResult[0] = $iFactorial
__Array_ExeterInternal($aArray, 0, $iSize, $sDelimiter, $aIdx, $aResult, $iCount)
Else
$aResult[0] = 0
EndIf
Return $aResult
EndFunc
Func _ArrayPop(ByRef $aArray)
If (Not IsArray($aArray)) Then Return SetError(1, 0, "")
If UBound($aArray, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(2, 0, "")
Local $iUBound = UBound($aArray) - 1
If $iUBound = -1 Then Return SetError(3, 0, "")
Local $sLastVal = $aArray[$iUBound]
If $iUBound > -1 Then
ReDim $aArray[$iUBound]
EndIf
Return $sLastVal
EndFunc
Func _ArrayPush(ByRef $aArray, $vValue, $iDirection = 0)
If $iDirection = Default Then $iDirection = 0
If (Not IsArray($aArray)) Then Return SetError(1, 0, 0)
If UBound($aArray, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(3, 0, 0)
Local $iUBound = UBound($aArray) - 1
If IsArray($vValue) Then
Local $iUBoundS = UBound($vValue)
If ($iUBoundS - 1) > $iUBound Then Return SetError(2, 0, 0)
If $iDirection Then
For $i = $iUBound To $iUBoundS Step -1
$aArray[$i] = $aArray[$i - $iUBoundS]
Next
For $i = 0 To $iUBoundS - 1
$aArray[$i] = $vValue[$i]
Next
Else
For $i = 0 To $iUBound - $iUBoundS
$aArray[$i] = $aArray[$i + $iUBoundS]
Next
For $i = 0 To $iUBoundS - 1
$aArray[$i + $iUBound - $iUBoundS + 1] = $vValue[$i]
Next
EndIf
Else
If $iUBound > -1 Then
If $iDirection Then
For $i = $iUBound To 1 Step -1
$aArray[$i] = $aArray[$i - 1]
Next
$aArray[0] = $vValue
Else
For $i = 0 To $iUBound - 1
$aArray[$i] = $aArray[$i + 1]
Next
$aArray[$iUBound] = $vValue
EndIf
EndIf
EndIf
Return 1
EndFunc
Func _ArrayReverse(ByRef $aArray, $iStart = 0, $iEnd = 0)
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If Not IsArray($aArray) Then Return SetError(1, 0, 0)
If UBound($aArray, $UBOUND_DIMENSIONS) <> 1 Then Return SetError(3, 0, 0)
If Not UBound($aArray) Then Return SetError(4, 0, 0)
Local $vTmp, $iUBound = UBound($aArray) - 1
If $iEnd < 1 Or $iEnd > $iUBound Then $iEnd = $iUBound
If $iStart < 0 Then $iStart = 0
If $iStart > $iEnd Then Return SetError(2, 0, 0)
For $i = $iStart To Int(($iStart + $iEnd - 1) / 2)
$vTmp = $aArray[$i]
$aArray[$i] = $aArray[$iEnd]
$aArray[$iEnd] = $vTmp
$iEnd -= 1
Next
Return 1
EndFunc
Func _ArraySearch(Const ByRef $aArray, $vValue, $iStart = 0, $iEnd = 0, $iCase = 0, $iCompare = 0, $iForward = 1, $iSubItem = -1, $bRow = False)
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iCase = Default Then $iCase = 0
If $iCompare = Default Then $iCompare = 0
If $iForward = Default Then $iForward = 1
If $iSubItem = Default Then $iSubItem = -1
If $bRow = Default Then $bRow = False
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray) - 1
If $iDim_1 = -1 Then Return SetError(3, 0, -1)
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
Local $bCompType = False
If $iCompare = 2 Then
$iCompare = 0
$bCompType = True
EndIf
If $bRow Then
If UBound($aArray, $UBOUND_DIMENSIONS) = 1 Then Return SetError(5, 0, -1)
If $iEnd < 1 Or $iEnd > $iDim_2 Then $iEnd = $iDim_2
If $iStart < 0 Then $iStart = 0
If $iStart > $iEnd Then Return SetError(4, 0, -1)
Else
If $iEnd < 1 Or $iEnd > $iDim_1 Then $iEnd = $iDim_1
If $iStart < 0 Then $iStart = 0
If $iStart > $iEnd Then Return SetError(4, 0, -1)
EndIf
Local $iStep = 1
If Not $iForward Then
Local $iTmp = $iStart
$iStart = $iEnd
$iEnd = $iTmp
$iStep = -1
EndIf
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If Not $iCompare Then
If Not $iCase Then
For $i = $iStart To $iEnd Step $iStep
If $bCompType And VarGetType($aArray[$i]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$i] = $vValue Then Return $i
Next
Else
For $i = $iStart To $iEnd Step $iStep
If $bCompType And VarGetType($aArray[$i]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$i] == $vValue Then Return $i
Next
EndIf
Else
For $i = $iStart To $iEnd Step $iStep
If $iCompare = 3 Then
If StringRegExp($aArray[$i], $vValue) Then Return $i
Else
If StringInStr($aArray[$i], $vValue, $iCase) > 0 Then Return $i
EndIf
Next
EndIf
Case 2
Local $iDim_Sub
If $bRow Then
$iDim_Sub = $iDim_1
If $iSubItem > $iDim_Sub Then $iSubItem = $iDim_Sub
If $iSubItem < 0 Then
$iSubItem = 0
Else
$iDim_Sub = $iSubItem
EndIf
Else
$iDim_Sub = $iDim_2
If $iSubItem > $iDim_Sub Then $iSubItem = $iDim_Sub
If $iSubItem < 0 Then
$iSubItem = 0
Else
$iDim_Sub = $iSubItem
EndIf
EndIf
For $j = $iSubItem To $iDim_Sub
If Not $iCompare Then
If Not $iCase Then
For $i = $iStart To $iEnd Step $iStep
If $bRow Then
If $bCompType And VarGetType($aArray[$j][$i]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$j][$i] = $vValue Then Return $i
Else
If $bCompType And VarGetType($aArray[$i][$j]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$i][$j] = $vValue Then Return $i
EndIf
Next
Else
For $i = $iStart To $iEnd Step $iStep
If $bRow Then
If $bCompType And VarGetType($aArray[$j][$i]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$j][$i] == $vValue Then Return $i
Else
If $bCompType And VarGetType($aArray[$i][$j]) <> VarGetType($vValue) Then ContinueLoop
If $aArray[$i][$j] == $vValue Then Return $i
EndIf
Next
EndIf
Else
For $i = $iStart To $iEnd Step $iStep
If $iCompare = 3 Then
If $bRow Then
If StringRegExp($aArray[$j][$i], $vValue) Then Return $i
Else
If StringRegExp($aArray[$i][$j], $vValue) Then Return $i
EndIf
Else
If $bRow Then
If StringInStr($aArray[$j][$i], $vValue, $iCase) > 0 Then Return $i
Else
If StringInStr($aArray[$i][$j], $vValue, $iCase) > 0 Then Return $i
EndIf
EndIf
Next
EndIf
Next
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return SetError(6, 0, -1)
EndFunc
Func _ArrayShuffle(ByRef $aArray, $iStart_Row = 0, $iEnd_Row = 0, $iCol = -1)
If $iStart_Row = Default Then $iStart_Row = 0
If $iEnd_Row = Default Then $iEnd_Row = 0
If $iCol = Default Then $iCol = -1
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS)
If $iEnd_Row = 0 Then $iEnd_Row = $iDim_1 - 1
If $iStart_Row < 0 Or $iStart_Row > $iDim_1 - 1 Then Return SetError(3, 0, -1)
If $iEnd_Row < 1 Or $iEnd_Row > $iDim_1 - 1 Then Return SetError(3, 0, -1)
If $iStart_Row > $iEnd_Row Then Return SetError(4, 0, -1)
Local $vTmp, $iRand
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
For $i = $iEnd_Row To $iStart_Row + 1 Step -1
$iRand = Random($iStart_Row, $i, 1)
$vTmp = $aArray[$i]
$aArray[$i] = $aArray[$iRand]
$aArray[$iRand] = $vTmp
Next
Return 1
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS)
If $iCol < -1 Or $iCol > $iDim_2 - 1 Then Return SetError(5, 0, -1)
Local $iCol_Start, $iCol_End
If $iCol = -1 Then
$iCol_Start = 0
$iCol_End = $iDim_2 - 1
Else
$iCol_Start = $iCol
$iCol_End = $iCol
EndIf
For $i = $iEnd_Row To $iStart_Row + 1 Step -1
$iRand = Random($iStart_Row, $i, 1)
For $j = $iCol_Start To $iCol_End
$vTmp = $aArray[$i][$j]
$aArray[$i][$j] = $aArray[$iRand][$j]
$aArray[$iRand][$j] = $vTmp
Next
Next
Return 1
Case Else
Return SetError(2, 0, -1)
EndSwitch
EndFunc
Func _ArraySort(ByRef $aArray, $iDescending = 0, $iStart = 0, $iEnd = 0, $iSubItem = 0, $iPivot = 0)
If $iDescending = Default Then $iDescending = 0
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iSubItem = Default Then $iSubItem = 0
If $iPivot = Default Then $iPivot = 0
If Not IsArray($aArray) Then Return SetError(1, 0, 0)
Local $iUBound = UBound($aArray) - 1
If $iUBound = -1 Then Return SetError(5, 0, 0)
If $iEnd = Default Then $iEnd = 0
If $iEnd < 1 Or $iEnd > $iUBound Or $iEnd = Default Then $iEnd = $iUBound
If $iStart < 0 Or $iStart = Default Then $iStart = 0
If $iStart > $iEnd Then Return SetError(2, 0, 0)
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $iPivot Then
__ArrayDualPivotSort($aArray, $iStart, $iEnd)
Else
__ArrayQuickSort1D($aArray, $iStart, $iEnd)
EndIf
If $iDescending Then _ArrayReverse($aArray, $iStart, $iEnd)
Case 2
If $iPivot Then Return SetError(6, 0, 0)
Local $iSubMax = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iSubItem > $iSubMax Then Return SetError(3, 0, 0)
If $iDescending Then
$iDescending = -1
Else
$iDescending = 1
EndIf
__ArrayQuickSort2D($aArray, $iDescending, $iStart, $iEnd, $iSubItem, $iSubMax)
Case Else
Return SetError(4, 0, 0)
EndSwitch
Return 1
EndFunc
Func __ArrayQuickSort1D(ByRef $aArray, Const ByRef $iStart, Const ByRef $iEnd)
If $iEnd <= $iStart Then Return
Local $vTmp
If ($iEnd - $iStart) < 15 Then
Local $vCur
For $i = $iStart + 1 To $iEnd
$vTmp = $aArray[$i]
If IsNumber($vTmp) Then
For $j = $i - 1 To $iStart Step -1
$vCur = $aArray[$j]
If ($vTmp >= $vCur And IsNumber($vCur)) Or (Not IsNumber($vCur) And StringCompare($vTmp, $vCur) >= 0) Then ExitLoop
$aArray[$j + 1] = $vCur
Next
Else
For $j = $i - 1 To $iStart Step -1
If (StringCompare($vTmp, $aArray[$j]) >= 0) Then ExitLoop
$aArray[$j + 1] = $aArray[$j]
Next
EndIf
$aArray[$j + 1] = $vTmp
Next
Return
EndIf
Local $L = $iStart, $R = $iEnd, $vPivot = $aArray[Int(($iStart + $iEnd) / 2)], $bNum = IsNumber($vPivot)
Do
If $bNum Then
While ($aArray[$L] < $vPivot And IsNumber($aArray[$L])) Or (Not IsNumber($aArray[$L]) And StringCompare($aArray[$L], $vPivot) < 0)
$L += 1
WEnd
While ($aArray[$R] > $vPivot And IsNumber($aArray[$R])) Or (Not IsNumber($aArray[$R]) And StringCompare($aArray[$R], $vPivot) > 0)
$R -= 1
WEnd
Else
While (StringCompare($aArray[$L], $vPivot) < 0)
$L += 1
WEnd
While (StringCompare($aArray[$R], $vPivot) > 0)
$R -= 1
WEnd
EndIf
If $L <= $R Then
$vTmp = $aArray[$L]
$aArray[$L] = $aArray[$R]
$aArray[$R] = $vTmp
$L += 1
$R -= 1
EndIf
Until $L > $R
__ArrayQuickSort1D($aArray, $iStart, $R)
__ArrayQuickSort1D($aArray, $L, $iEnd)
EndFunc
Func __ArrayQuickSort2D(ByRef $aArray, Const ByRef $iStep, Const ByRef $iStart, Const ByRef $iEnd, Const ByRef $iSubItem, Const ByRef $iSubMax)
If $iEnd <= $iStart Then Return
Local $vTmp, $L = $iStart, $R = $iEnd, $vPivot = $aArray[Int(($iStart + $iEnd) / 2)][$iSubItem], $bNum = IsNumber($vPivot)
Do
If $bNum Then
While ($iStep * ($aArray[$L][$iSubItem] - $vPivot) < 0 And IsNumber($aArray[$L][$iSubItem])) Or (Not IsNumber($aArray[$L][$iSubItem]) And $iStep * StringCompare($aArray[$L][$iSubItem], $vPivot) < 0)
$L += 1
WEnd
While ($iStep * ($aArray[$R][$iSubItem] - $vPivot) > 0 And IsNumber($aArray[$R][$iSubItem])) Or (Not IsNumber($aArray[$R][$iSubItem]) And $iStep * StringCompare($aArray[$R][$iSubItem], $vPivot) > 0)
$R -= 1
WEnd
Else
While ($iStep * StringCompare($aArray[$L][$iSubItem], $vPivot) < 0)
$L += 1
WEnd
While ($iStep * StringCompare($aArray[$R][$iSubItem], $vPivot) > 0)
$R -= 1
WEnd
EndIf
If $L <= $R Then
For $i = 0 To $iSubMax
$vTmp = $aArray[$L][$i]
$aArray[$L][$i] = $aArray[$R][$i]
$aArray[$R][$i] = $vTmp
Next
$L += 1
$R -= 1
EndIf
Until $L > $R
__ArrayQuickSort2D($aArray, $iStep, $iStart, $R, $iSubItem, $iSubMax)
__ArrayQuickSort2D($aArray, $iStep, $L, $iEnd, $iSubItem, $iSubMax)
EndFunc
Func __ArrayDualPivotSort(ByRef $aArray, $iPivot_Left, $iPivot_Right, $bLeftMost = True)
If $iPivot_Left > $iPivot_Right Then Return
Local $iLength = $iPivot_Right - $iPivot_Left + 1
Local $i, $j, $k, $iAi, $iAk, $iA1, $iA2, $iLast
If $iLength < 45 Then
If $bLeftMost Then
$i = $iPivot_Left
While $i < $iPivot_Right
$j = $i
$iAi = $aArray[$i + 1]
While $iAi < $aArray[$j]
$aArray[$j + 1] = $aArray[$j]
$j -= 1
If $j + 1 = $iPivot_Left Then ExitLoop
WEnd
$aArray[$j + 1] = $iAi
$i += 1
WEnd
Else
While 1
If $iPivot_Left >= $iPivot_Right Then Return 1
$iPivot_Left += 1
If $aArray[$iPivot_Left] < $aArray[$iPivot_Left - 1] Then ExitLoop
WEnd
While 1
$k = $iPivot_Left
$iPivot_Left += 1
If $iPivot_Left > $iPivot_Right Then ExitLoop
$iA1 = $aArray[$k]
$iA2 = $aArray[$iPivot_Left]
If $iA1 < $iA2 Then
$iA2 = $iA1
$iA1 = $aArray[$iPivot_Left]
EndIf
$k -= 1
While $iA1 < $aArray[$k]
$aArray[$k + 2] = $aArray[$k]
$k -= 1
WEnd
$aArray[$k + 2] = $iA1
While $iA2 < $aArray[$k]
$aArray[$k + 1] = $aArray[$k]
$k -= 1
WEnd
$aArray[$k + 1] = $iA2
$iPivot_Left += 1
WEnd
$iLast = $aArray[$iPivot_Right]
$iPivot_Right -= 1
While $iLast < $aArray[$iPivot_Right]
$aArray[$iPivot_Right + 1] = $aArray[$iPivot_Right]
$iPivot_Right -= 1
WEnd
$aArray[$iPivot_Right + 1] = $iLast
EndIf
Return 1
EndIf
Local $iSeventh = BitShift($iLength, 3) + BitShift($iLength, 6) + 1
Local $iE1, $iE2, $iE3, $iE4, $iE5, $t
$iE3 = Ceiling(($iPivot_Left + $iPivot_Right) / 2)
$iE2 = $iE3 - $iSeventh
$iE1 = $iE2 - $iSeventh
$iE4 = $iE3 + $iSeventh
$iE5 = $iE4 + $iSeventh
If $aArray[$iE2] < $aArray[$iE1] Then
$t = $aArray[$iE2]
$aArray[$iE2] = $aArray[$iE1]
$aArray[$iE1] = $t
EndIf
If $aArray[$iE3] < $aArray[$iE2] Then
$t = $aArray[$iE3]
$aArray[$iE3] = $aArray[$iE2]
$aArray[$iE2] = $t
If $t < $aArray[$iE1] Then
$aArray[$iE2] = $aArray[$iE1]
$aArray[$iE1] = $t
EndIf
EndIf
If $aArray[$iE4] < $aArray[$iE3] Then
$t = $aArray[$iE4]
$aArray[$iE4] = $aArray[$iE3]
$aArray[$iE3] = $t
If $t < $aArray[$iE2] Then
$aArray[$iE3] = $aArray[$iE2]
$aArray[$iE2] = $t
If $t < $aArray[$iE1] Then
$aArray[$iE2] = $aArray[$iE1]
$aArray[$iE1] = $t
EndIf
EndIf
EndIf
If $aArray[$iE5] < $aArray[$iE4] Then
$t = $aArray[$iE5]
$aArray[$iE5] = $aArray[$iE4]
$aArray[$iE4] = $t
If $t < $aArray[$iE3] Then
$aArray[$iE4] = $aArray[$iE3]
$aArray[$iE3] = $t
If $t < $aArray[$iE2] Then
$aArray[$iE3] = $aArray[$iE2]
$aArray[$iE2] = $t
If $t < $aArray[$iE1] Then
$aArray[$iE2] = $aArray[$iE1]
$aArray[$iE1] = $t
EndIf
EndIf
EndIf
EndIf
Local $iLess = $iPivot_Left
Local $iGreater = $iPivot_Right
If (($aArray[$iE1] <> $aArray[$iE2]) And ($aArray[$iE2] <> $aArray[$iE3]) And ($aArray[$iE3] <> $aArray[$iE4]) And ($aArray[$iE4] <> $aArray[$iE5])) Then
Local $iPivot_1 = $aArray[$iE2]
Local $iPivot_2 = $aArray[$iE4]
$aArray[$iE2] = $aArray[$iPivot_Left]
$aArray[$iE4] = $aArray[$iPivot_Right]
Do
$iLess += 1
Until $aArray[$iLess] >= $iPivot_1
Do
$iGreater -= 1
Until $aArray[$iGreater] <= $iPivot_2
$k = $iLess
While $k <= $iGreater
$iAk = $aArray[$k]
If $iAk < $iPivot_1 Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $iAk
$iLess += 1
ElseIf $iAk > $iPivot_2 Then
While $aArray[$iGreater] > $iPivot_2
$iGreater -= 1
If $iGreater + 1 = $k Then ExitLoop 2
WEnd
If $aArray[$iGreater] < $iPivot_1 Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $aArray[$iGreater]
$iLess += 1
Else
$aArray[$k] = $aArray[$iGreater]
EndIf
$aArray[$iGreater] = $iAk
$iGreater -= 1
EndIf
$k += 1
WEnd
$aArray[$iPivot_Left] = $aArray[$iLess - 1]
$aArray[$iLess - 1] = $iPivot_1
$aArray[$iPivot_Right] = $aArray[$iGreater + 1]
$aArray[$iGreater + 1] = $iPivot_2
__ArrayDualPivotSort($aArray, $iPivot_Left, $iLess - 2, True)
__ArrayDualPivotSort($aArray, $iGreater + 2, $iPivot_Right, False)
If ($iLess < $iE1) And ($iE5 < $iGreater) Then
While $aArray[$iLess] = $iPivot_1
$iLess += 1
WEnd
While $aArray[$iGreater] = $iPivot_2
$iGreater -= 1
WEnd
$k = $iLess
While $k <= $iGreater
$iAk = $aArray[$k]
If $iAk = $iPivot_1 Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $iAk
$iLess += 1
ElseIf $iAk = $iPivot_2 Then
While $aArray[$iGreater] = $iPivot_2
$iGreater -= 1
If $iGreater + 1 = $k Then ExitLoop 2
WEnd
If $aArray[$iGreater] = $iPivot_1 Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $iPivot_1
$iLess += 1
Else
$aArray[$k] = $aArray[$iGreater]
EndIf
$aArray[$iGreater] = $iAk
$iGreater -= 1
EndIf
$k += 1
WEnd
EndIf
__ArrayDualPivotSort($aArray, $iLess, $iGreater, False)
Else
Local $iPivot = $aArray[$iE3]
$k = $iLess
While $k <= $iGreater
If $aArray[$k] = $iPivot Then
$k += 1
ContinueLoop
EndIf
$iAk = $aArray[$k]
If $iAk < $iPivot Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $iAk
$iLess += 1
Else
While $aArray[$iGreater] > $iPivot
$iGreater -= 1
WEnd
If $aArray[$iGreater] < $iPivot Then
$aArray[$k] = $aArray[$iLess]
$aArray[$iLess] = $aArray[$iGreater]
$iLess += 1
Else
$aArray[$k] = $iPivot
EndIf
$aArray[$iGreater] = $iAk
$iGreater -= 1
EndIf
$k += 1
WEnd
__ArrayDualPivotSort($aArray, $iPivot_Left, $iLess - 1, True)
__ArrayDualPivotSort($aArray, $iGreater + 1, $iPivot_Right, False)
EndIf
EndFunc
Func _ArraySwap(ByRef $aArray, $iIndex_1, $iIndex_2, $bCol = False, $iStart = -1, $iEnd = -1)
If $bCol = Default Then $bCol = False
If $iStart = Default Then $iStart = -1
If $iEnd = Default Then $iEnd = -1
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iDim_2 = -1 Then
$bCol = False
$iStart = -1
$iEnd = -1
EndIf
If $iStart > $iEnd Then Return SetError(5, 0, -1)
If $bCol Then
If $iIndex_1 < 0 Or $iIndex_2 > $iDim_2 Then Return SetError(3, 0, -1)
If $iStart = -1 Then $iStart = 0
If $iEnd = -1 Then $iEnd = $iDim_1
Else
If $iIndex_1 < 0 Or $iIndex_2 > $iDim_1 Then Return SetError(3, 0, -1)
If $iStart = -1 Then $iStart = 0
If $iEnd = -1 Then $iEnd = $iDim_2
EndIf
Local $vTmp
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
$vTmp = $aArray[$iIndex_1]
$aArray[$iIndex_1] = $aArray[$iIndex_2]
$aArray[$iIndex_2] = $vTmp
Case 2
If $iStart < -1 Or $iEnd < -1 Then Return SetError(4, 0, -1)
If $bCol Then
If $iStart > $iDim_1 Or $iEnd > $iDim_1 Then Return SetError(4, 0, -1)
For $j = $iStart To $iEnd
$vTmp = $aArray[$j][$iIndex_1]
$aArray[$j][$iIndex_1] = $aArray[$j][$iIndex_2]
$aArray[$j][$iIndex_2] = $vTmp
Next
Else
If $iStart > $iDim_2 Or $iEnd > $iDim_2 Then Return SetError(4, 0, -1)
For $j = $iStart To $iEnd
$vTmp = $aArray[$iIndex_1][$j]
$aArray[$iIndex_1][$j] = $aArray[$iIndex_2][$j]
$aArray[$iIndex_2][$j] = $vTmp
Next
EndIf
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return 1
EndFunc
Func _ArrayToClip(Const ByRef $aArray, $sDelim_Col = "|", $iStart_Row = -1, $iEnd_Row = -1, $sDelim_Row = @CRLF, $iStart_Col = -1, $iEnd_Col = -1)
Local $sResult = _ArrayToString($aArray, $sDelim_Col, $iStart_Row, $iEnd_Row, $sDelim_Row, $iStart_Col, $iEnd_Col)
If @error Then Return SetError(@error, 0, 0)
If ClipPut($sResult) Then Return 1
Return SetError(-1, 0, 0)
EndFunc
Func _ArrayToString(Const ByRef $aArray, $sDelim_Col = "|", $iStart_Row = -1, $iEnd_Row = -1, $sDelim_Row = @CRLF, $iStart_Col = -1, $iEnd_Col = -1)
If $sDelim_Col = Default Then $sDelim_Col = "|"
If $sDelim_Row = Default Then $sDelim_Row = @CRLF
If $iStart_Row = Default Then $iStart_Row = -1
If $iEnd_Row = Default Then $iEnd_Row = -1
If $iStart_Col = Default Then $iStart_Col = -1
If $iEnd_Col = Default Then $iEnd_Col = -1
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If $iStart_Row = -1 Then $iStart_Row = 0
If $iEnd_Row = -1 Then $iEnd_Row = $iDim_1
If $iStart_Row < -1 Or $iEnd_Row < -1 Then Return SetError(3, 0, -1)
If $iStart_Row > $iDim_1 Or $iEnd_Row > $iDim_1 Then Return SetError(3, 0, "")
If $iStart_Row > $iEnd_Row Then Return SetError(4, 0, -1)
Local $sRet = ""
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
For $i = $iStart_Row To $iEnd_Row
$sRet &= $aArray[$i] & $sDelim_Col
Next
Return StringTrimRight($sRet, StringLen($sDelim_Col))
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iStart_Col = -1 Then $iStart_Col = 0
If $iEnd_Col = -1 Then $iEnd_Col = $iDim_2
If $iStart_Col < -1 Or $iEnd_Col < -1 Then Return SetError(5, 0, -1)
If $iStart_Col > $iDim_2 Or $iEnd_Col > $iDim_2 Then Return SetError(5, 0, -1)
If $iStart_Col > $iEnd_Col Then Return SetError(6, 0, -1)
For $i = $iStart_Row To $iEnd_Row
For $j = $iStart_Col To $iEnd_Col
$sRet &= $aArray[$i][$j] & $sDelim_Col
Next
$sRet = StringTrimRight($sRet, StringLen($sDelim_Col)) & $sDelim_Row
Next
Return StringTrimRight($sRet, StringLen($sDelim_Row))
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return 1
EndFunc
Func _ArrayTranspose(ByRef $aArray)
Switch UBound($aArray, 0)
Case 0
Return SetError(2, 0, 0)
Case 1
Local $aTemp[1][UBound($aArray)]
For $i = 0 To UBound($aArray) - 1
$aTemp[0][$i] = $aArray[$i]
Next
$aArray = $aTemp
Case 2
Local $iDim_1 = UBound($aArray, 1), $iDim_2 = UBound($aArray, 2)
If $iDim_1 <> $iDim_2 Then
Local $aTemp[$iDim_2][$iDim_1]
For $i = 0 To $iDim_1 - 1
For $j = 0 To $iDim_2 - 1
$aTemp[$j][$i] = $aArray[$i][$j]
Next
Next
$aArray = $aTemp
Else
Local $vElement
For $i = 0 To $iDim_1 - 1
For $j = $i + 1 To $iDim_2 - 1
$vElement = $aArray[$i][$j]
$aArray[$i][$j] = $aArray[$j][$i]
$aArray[$j][$i] = $vElement
Next
Next
EndIf
Case Else
Return SetError(1, 0, 0)
EndSwitch
Return 1
EndFunc
Func _ArrayTrim(ByRef $aArray, $iTrimNum, $iDirection = 0, $iStart = 0, $iEnd = 0, $iSubItem = 0)
If $iDirection = Default Then $iDirection = 0
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iSubItem = Default Then $iSubItem = 0
If Not IsArray($aArray) Then Return SetError(1, 0, 0)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If $iEnd = 0 Then $iEnd = $iDim_1
If $iStart > $iEnd Then Return SetError(3, 0, -1)
If $iStart < 0 Or $iEnd < 0 Then Return SetError(3, 0, -1)
If $iStart > $iDim_1 Or $iEnd > $iDim_1 Then Return SetError(3, 0, -1)
If $iStart > $iEnd Then Return SetError(4, 0, -1)
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $iDirection Then
For $i = $iStart To $iEnd
$aArray[$i] = StringTrimRight($aArray[$i], $iTrimNum)
Next
Else
For $i = $iStart To $iEnd
$aArray[$i] = StringTrimLeft($aArray[$i], $iTrimNum)
Next
EndIf
Case 2
Local $iDim_2 = UBound($aArray, $UBOUND_COLUMNS) - 1
If $iSubItem < 0 Or $iSubItem > $iDim_2 Then Return SetError(5, 0, -1)
If $iDirection Then
For $i = $iStart To $iEnd
$aArray[$i][$iSubItem] = StringTrimRight($aArray[$i][$iSubItem], $iTrimNum)
Next
Else
For $i = $iStart To $iEnd
$aArray[$i][$iSubItem] = StringTrimLeft($aArray[$i][$iSubItem], $iTrimNum)
Next
EndIf
Case Else
Return SetError(2, 0, 0)
EndSwitch
Return 1
EndFunc
Func _ArrayUnique(Const ByRef $aArray, $iColumn = 0, $iBase = 0, $iCase = 0, $iCount = $ARRAYUNIQUE_COUNT, $iIntType = $ARRAYUNIQUE_AUTO)
If $iColumn = Default Then $iColumn = 0
If $iBase = Default Then $iBase = 0
If $iCase = Default Then $iCase = 0
If $iCount = Default Then $iCount = $ARRAYUNIQUE_COUNT
If UBound($aArray, $UBOUND_ROWS) = 0 Then Return SetError(1, 0, 0)
Local $iDims = UBound($aArray, $UBOUND_DIMENSIONS), $iNumColumns = UBound($aArray, $UBOUND_COLUMNS)
If $iDims > 2 Then Return SetError(2, 0, 0)
If $iBase < 0 Or $iBase > 1 Or (Not IsInt($iBase)) Then Return SetError(3, 0, 0)
If $iCase < 0 Or $iCase > 1 Or (Not IsInt($iCase)) Then Return SetError(3, 0, 0)
If $iCount < 0 Or $iCount > 1 Or (Not IsInt($iCount)) Then Return SetError(4, 0, 0)
If $iIntType < 0 Or $iIntType > 4 Or (Not IsInt($iIntType)) Then Return SetError(5, 0, 0)
If $iColumn < 0 Or ($iNumColumns = 0 And $iColumn > 0) Or ($iNumColumns > 0 And $iColumn >= $iNumColumns) Then Return SetError(6, 0, 0)
If $iIntType = $ARRAYUNIQUE_AUTO Then
Local $bInt, $sVarType
If $iDims = 1 Then
$bInt = IsInt($aArray[$iBase])
$sVarType = VarGetType($aArray[$iBase])
Else
$bInt = IsInt($aArray[$iBase][$iColumn])
$sVarType = VarGetType($aArray[$iBase][$iColumn])
EndIf
If $bInt And $sVarType = "Int64" Then
$iIntType = $ARRAYUNIQUE_FORCE64
Else
$iIntType = $ARRAYUNIQUE_FORCE32
EndIf
EndIf
ObjEvent("AutoIt.Error", __ArrayUnique_AutoErrFunc)
Local $oDictionary = ObjCreate("Scripting.Dictionary")
$oDictionary.CompareMode = Number(Not $iCase)
Local $vElem, $sType, $vKey, $bCOMError = False
For $i = $iBase To UBound($aArray) - 1
If $iDims = 1 Then
$vElem = $aArray[$i]
Else
$vElem = $aArray[$i][$iColumn]
EndIf
Switch $iIntType
Case $ARRAYUNIQUE_FORCE32
$oDictionary.Item($vElem)
If @error Then
$bCOMError = True
ExitLoop
EndIf
Case $ARRAYUNIQUE_FORCE64
$sType = VarGetType($vElem)
If $sType = "Int32" Then
$bCOMError = True
ExitLoop
EndIf
$vKey = "#" & $sType & "#" & String($vElem)
If Not $oDictionary.Item($vKey) Then
$oDictionary($vKey) = $vElem
EndIf
Case $ARRAYUNIQUE_MATCH
$sType = VarGetType($vElem)
If StringLeft($sType, 3) = "Int" Then
$vKey = "#Int#" & String($vElem)
Else
$vKey = "#" & $sType & "#" & String($vElem)
EndIf
If Not $oDictionary.Item($vKey) Then
$oDictionary($vKey) = $vElem
EndIf
Case $ARRAYUNIQUE_DISTINCT
$vKey = "#" & VarGetType($vElem) & "#" & String($vElem)
If Not $oDictionary.Item($vKey) Then
$oDictionary($vKey) = $vElem
EndIf
EndSwitch
Next
Local $aValues, $j = 0
If $bCOMError Then
Return SetError(7, 0, 0)
ElseIf $iIntType <> $ARRAYUNIQUE_FORCE32 Then
Local $aValues[$oDictionary.Count]
For $vKey In $oDictionary.Keys()
$aValues[$j] = $oDictionary($vKey)
If StringLeft($vKey, 5) = "#Ptr#" Then
$aValues[$j] = Ptr($aValues[$j])
EndIf
$j += 1
Next
Else
$aValues = $oDictionary.Keys()
EndIf
If $iCount Then
_ArrayInsert($aValues, 0, $oDictionary.Count)
EndIf
Return $aValues
EndFunc
Func _Array1DToHistogram($aArray, $iSizing = 100)
If UBound($aArray, 0) > 1 Then Return SetError(1, 0, "")
$iSizing = $iSizing * 8
Local $t, $n, $iMin = 0, $iMax = 0, $iOffset = 0
For $i = 0 To UBound($aArray) - 1
$t = $aArray[$i]
$t = IsNumber($t) ? Round($t) : 0
If $t < $iMin Then $iMin = $t
If $t > $iMax Then $iMax = $t
Next
Local $iRange = Int(Round(($iMax - $iMin) / 8)) * 8
Local $iSpaceRatio = 4
For $i = 0 To UBound($aArray) - 1
$t = $aArray[$i]
If $t Then
$n = Abs(Round(($iSizing * $t) / $iRange) / 8)
$aArray[$i] = ""
If $t > 0 Then
If $iMin Then
$iOffset = Int(Abs(Round(($iSizing * $iMin) / $iRange) / 8) / 8 * $iSpaceRatio)
$aArray[$i] = __Array_StringRepeat(ChrW(0x20), $iOffset)
EndIf
Else
If $iMin <> $t Then
$iOffset = Int(Abs(Round(($iSizing * ($t - $iMin)) / $iRange) / 8) / 8 * $iSpaceRatio)
$aArray[$i] = __Array_StringRepeat(ChrW(0x20), $iOffset)
EndIf
EndIf
$aArray[$i] &= __Array_StringRepeat(ChrW(0x2588), Int($n / 8))
$n = Mod($n, 8)
If $n > 0 Then $aArray[$i] &= ChrW(0x2588 + 8 - $n)
$aArray[$i] &= ' ' & $t
Else
$aArray[$i] = ""
EndIf
Next
Return $aArray
EndFunc
Func __Array_StringRepeat($sString, $iRepeatCount)
$iRepeatCount = Int($iRepeatCount)
If StringLen($sString) < 1 Or $iRepeatCount <= 0 Then Return SetError(1, 0, "")
Local $sResult = ""
While $iRepeatCount > 1
If BitAND($iRepeatCount, 1) Then $sResult &= $sString
$sString &= $sString
$iRepeatCount = BitShift($iRepeatCount, 1)
WEnd
Return $sString & $sResult
EndFunc
Func __Array_ExeterInternal(ByRef $aArray, $iStart, $iSize, $sDelimiter, ByRef $aIdx, ByRef $aResult, ByRef $iCount)
If $iStart == $iSize - 1 Then
For $i = 0 To $iSize - 1
$aResult[$iCount] &= $aArray[$aIdx[$i]] & $sDelimiter
Next
If $sDelimiter <> "" Then $aResult[$iCount] = StringTrimRight($aResult[$iCount], StringLen($sDelimiter))
$iCount += 1
Else
Local $iTemp
For $i = $iStart To $iSize - 1
$iTemp = $aIdx[$i]
$aIdx[$i] = $aIdx[$iStart]
$aIdx[$iStart] = $iTemp
__Array_ExeterInternal($aArray, $iStart + 1, $iSize, $sDelimiter, $aIdx, $aResult, $iCount)
$aIdx[$iStart] = $aIdx[$i]
$aIdx[$i] = $iTemp
Next
EndIf
EndFunc
Func __Array_Combinations($iN, $iR)
Local $i_Total = 1
For $i = $iR To 1 Step -1
$i_Total *= ($iN / $i)
$iN -= 1
Next
Return Round($i_Total)
EndFunc
Func __Array_GetNext($iN, $iR, ByRef $iLeft, $iTotal, ByRef $aIdx)
If $iLeft == $iTotal Then
$iLeft -= 1
Return
EndIf
Local $i = $iR - 1
While $aIdx[$i] == $iN - $iR + $i
$i -= 1
WEnd
$aIdx[$i] += 1
For $j = $i + 1 To $iR - 1
$aIdx[$j] = $aIdx[$i] + $j - $i
Next
$iLeft -= 1
EndFunc
Func __Array_MinMaxIndex(Const ByRef $aArray, $iCompNumeric, $iStart, $iEnd, $iSubItem, $fuComparison)
If $iCompNumeric = Default Then $iCompNumeric = 0
If $iCompNumeric <> 1 Then $iCompNumeric = 0
If $iStart = Default Then $iStart = 0
If $iEnd = Default Then $iEnd = 0
If $iSubItem = Default Then $iSubItem = 0
If Not IsArray($aArray) Then Return SetError(1, 0, -1)
Local $iDim_1 = UBound($aArray, $UBOUND_ROWS) - 1
If $iDim_1 < 0 Then Return SetError(1, 0, -1)
If $iEnd = -1 Then $iEnd = $iDim_1
If $iStart = -1 Then $iStart = 0
If $iStart < -1 Or $iEnd < -1 Then Return SetError(3, 0, -1)
If $iStart > $iDim_1 Or $iEnd > $iDim_1 Then Return SetError(3, 0, -1)
If $iStart > $iEnd Then Return SetError(4, 0, -1)
If $iDim_1 < 0 Then Return SetError(5, 0, -1)
Local $iMaxMinIndex = $iStart
Switch UBound($aArray, $UBOUND_DIMENSIONS)
Case 1
If $iCompNumeric Then
For $i = $iStart To $iEnd
If $fuComparison(Number($aArray[$i]), Number($aArray[$iMaxMinIndex])) Then $iMaxMinIndex = $i
Next
Else
For $i = $iStart To $iEnd
If $fuComparison($aArray[$i], $aArray[$iMaxMinIndex]) Then $iMaxMinIndex = $i
Next
EndIf
Case 2
If $iSubItem < 0 Or $iSubItem > UBound($aArray, $UBOUND_COLUMNS) - 1 Then Return SetError(6, 0, -1)
If $iCompNumeric Then
For $i = $iStart To $iEnd
If $fuComparison(Number($aArray[$i][$iSubItem]), Number($aArray[$iMaxMinIndex][$iSubItem])) Then $iMaxMinIndex = $i
Next
Else
For $i = $iStart To $iEnd
If $fuComparison($aArray[$i][$iSubItem], $aArray[$iMaxMinIndex][$iSubItem]) Then $iMaxMinIndex = $i
Next
EndIf
Case Else
Return SetError(2, 0, -1)
EndSwitch
Return $iMaxMinIndex
EndFunc
Func __Array_GreaterThan($vValue1, $vValue2)
Return $vValue1 > $vValue2
EndFunc
Func __Array_LessThan($vValue1, $vValue2)
Return $vValue1 < $vValue2
EndFunc
Func __ArrayUnique_AutoErrFunc()
EndFunc
Func _FileCountLines($sFilePath)
FileReadToArray($sFilePath)
If @error Then Return SetError(@error, @extended, 0)
Return @extended
EndFunc
Func _FileCreate($sFilePath)
Local $hFileOpen = FileOpen($sFilePath, BitOR($FO_OVERWRITE, $FO_CREATEPATH))
If $hFileOpen = -1 Then Return SetError(1, 0, 0)
Local $iFileWrite = FileWrite($hFileOpen, "")
FileClose($hFileOpen)
If Not $iFileWrite Then Return SetError(2, 0, 0)
Return 1
EndFunc
Func _FileListToArray($sFilePath, $sFilter = "*", $iFlag = $FLTA_FILESFOLDERS, $bReturnPath = False)
Local $sDelimiter = "|", $sFileList = "", $sFileName = "", $sFullPath = ""
$sFilePath = StringRegExpReplace($sFilePath, "[\\/]+$", "") & "\"
If $iFlag = Default Then $iFlag = $FLTA_FILESFOLDERS
If $bReturnPath Then $sFullPath = $sFilePath
If $sFilter = Default Then $sFilter = "*"
If Not FileExists($sFilePath) Then Return SetError(1, 0, 0)
If StringRegExp($sFilter, "[\\/:><\|]|(?s)^\s*$") Then Return SetError(2, 0, 0)
If Not ($iFlag = 0 Or $iFlag = 1 Or $iFlag = 2) Then Return SetError(3, 0, 0)
Local $hSearch = FileFindFirstFile($sFilePath & $sFilter)
If @error Then Return SetError(4, 0, 0)
While 1
$sFileName = FileFindNextFile($hSearch)
If @error Then ExitLoop
If ($iFlag + @extended = 2) Then ContinueLoop
$sFileList &= $sDelimiter & $sFullPath & $sFileName
WEnd
FileClose($hSearch)
If $sFileList = "" Then Return SetError(4, 0, 0)
Return StringSplit(StringTrimLeft($sFileList, 1), $sDelimiter)
EndFunc
Func _FileListToArrayRec($sFilePath, $sMask = "*", $iReturn = $FLTAR_FILESFOLDERS, $iRecur = $FLTAR_NORECUR, $iSort = $FLTAR_NOSORT, $iReturnPath = $FLTAR_RELPATH)
If Not FileExists($sFilePath) Then Return SetError(1, 1, "")
If $sMask = Default Then $sMask = "*"
If $iReturn = Default Then $iReturn = $FLTAR_FILESFOLDERS
If $iRecur = Default Then $iRecur = $FLTAR_NORECUR
If $iSort = Default Then $iSort = $FLTAR_NOSORT
If $iReturnPath = Default Then $iReturnPath = $FLTAR_RELPATH
If $iRecur > 1 Or Not IsInt($iRecur) Then Return SetError(1, 6, "")
Local $bLongPath = False
If StringLeft($sFilePath, 4) == "\\?\" Then
$bLongPath = True
EndIf
Local $sFolderSlash = ""
If StringRight($sFilePath, 1) = "\" Then
$sFolderSlash = "\"
Else
$sFilePath = $sFilePath & "\"
EndIf
Local $asFolderSearchList[100] = [1]
$asFolderSearchList[1] = $sFilePath
Local $iHide_HS = 0,  $sHide_HS = ""
If BitAND($iReturn, $FLTAR_NOHIDDEN) Then
$iHide_HS += 2
$sHide_HS &= "H"
$iReturn -= $FLTAR_NOHIDDEN
EndIf
If BitAND($iReturn, $FLTAR_NOSYSTEM) Then
$iHide_HS += 4
$sHide_HS &= "S"
$iReturn -= $FLTAR_NOSYSTEM
EndIf
Local $iHide_Link = 0
If BitAND($iReturn, $FLTAR_NOLINK) Then
$iHide_Link = 0x400
$iReturn -= $FLTAR_NOLINK
EndIf
Local $iMaxLevel = 0
If $iRecur < 0 Then
StringReplace($sFilePath, "\", "", 0, $STR_NOCASESENSEBASIC)
$iMaxLevel = @extended - $iRecur
EndIf
Local $sExclude_List = "", $sExclude_List_Folder = "", $sInclude_List = "*"
Local $aMaskSplit = StringSplit($sMask, "|")
Switch $aMaskSplit[0]
Case 3
$sExclude_List_Folder = $aMaskSplit[3]
ContinueCase
Case 2
$sExclude_List = $aMaskSplit[2]
ContinueCase
Case 1
$sInclude_List = $aMaskSplit[1]
EndSwitch
Local $sInclude_File_Mask = ".+"
If $sInclude_List <> "*" Then
If Not __FLTAR_ListToMask($sInclude_File_Mask, $sInclude_List) Then Return SetError(1, 2, "")
EndIf
Local $sInclude_Folder_Mask = ".+"
Switch $iReturn
Case 0
Switch $iRecur
Case 0
$sInclude_Folder_Mask = $sInclude_File_Mask
EndSwitch
Case 2
$sInclude_Folder_Mask = $sInclude_File_Mask
EndSwitch
Local $sExclude_File_Mask = ":"
If $sExclude_List <> "" Then
If Not __FLTAR_ListToMask($sExclude_File_Mask, $sExclude_List) Then Return SetError(1, 3, "")
EndIf
Local $sExclude_Folder_Mask = ":"
If $iRecur Then
If $sExclude_List_Folder Then
If Not __FLTAR_ListToMask($sExclude_Folder_Mask, $sExclude_List_Folder) Then Return SetError(1, 4, "")
EndIf
If $iReturn = 2 Then
$sExclude_Folder_Mask = $sExclude_File_Mask
EndIf
Else
$sExclude_Folder_Mask = $sExclude_File_Mask
EndIf
If Not ($iReturn = 0 Or $iReturn = 1 Or $iReturn = 2) Then Return SetError(1, 5, "")
If Not ($iSort = 0 Or $iSort = 1 Or $iSort = 2) Then Return SetError(1, 7, "")
If Not ($iReturnPath = 0 Or $iReturnPath = 1 Or $iReturnPath = 2) Then Return SetError(1, 8, "")
If $iHide_Link Then
Local $tFile_Data = DllStructCreate("struct;align 4;dword FileAttributes;uint64 CreationTime;uint64 LastAccessTime;uint64 LastWriteTime;" &  "dword FileSizeHigh;dword FileSizeLow;dword Reserved0;dword Reserved1;wchar FileName[260];wchar AlternateFileName[14];endstruct")
Local $hDLL = DllOpen('kernel32.dll'), $aDLL_Ret
EndIf
Local $asReturnList[100] = [0]
Local $asFileMatchList = $asReturnList, $asRootFileMatchList = $asReturnList, $asFolderMatchList = $asReturnList
Local $bFolder = False,  $hSearch = 0,  $sCurrentPath = "", $sName = "", $sRetPath = ""
Local $iAttribs = 0,  $sAttribs = ''
Local $asFolderFileSectionList[100][2] = [[0, 0]]
While $asFolderSearchList[0] > 0
$sCurrentPath = $asFolderSearchList[$asFolderSearchList[0]]
$asFolderSearchList[0] -= 1
Switch $iReturnPath
Case 1
$sRetPath = StringReplace($sCurrentPath, $sFilePath, "")
Case 2
If $bLongPath Then
$sRetPath = StringTrimLeft($sCurrentPath, 4)
Else
$sRetPath = $sCurrentPath
EndIf
EndSwitch
If $iHide_Link Then
$aDLL_Ret = DllCall($hDLL, 'handle', 'FindFirstFileW', 'wstr', $sCurrentPath & "*", 'struct*', $tFile_Data)
If @error Or Not $aDLL_Ret[0] Then
ContinueLoop
EndIf
$hSearch = $aDLL_Ret[0]
Else
$hSearch = FileFindFirstFile($sCurrentPath & "*")
If $hSearch = -1 Then
ContinueLoop
EndIf
EndIf
If $iReturn = 0 And $iSort And $iReturnPath Then
__FLTAR_AddToList($asFolderFileSectionList, $sRetPath, $asFileMatchList[0] + 1)
EndIf
$sAttribs = ''
While 1
If $iHide_Link Then
$aDLL_Ret = DllCall($hDLL, 'int', 'FindNextFileW', 'handle', $hSearch, 'struct*', $tFile_Data)
If @error Or Not $aDLL_Ret[0] Then
ExitLoop
EndIf
$sName = DllStructGetData($tFile_Data, "FileName")
If $sName = ".." Then
ContinueLoop
EndIf
$iAttribs = DllStructGetData($tFile_Data, "FileAttributes")
If $iHide_HS And BitAND($iAttribs, $iHide_HS) Then
ContinueLoop
EndIf
If BitAND($iAttribs, $iHide_Link) Then
ContinueLoop
EndIf
$bFolder = False
If BitAND($iAttribs, 16) Then
$bFolder = True
EndIf
Else
$bFolder = False
$sName = FileFindNextFile($hSearch, 1)
If @error Then
ExitLoop
EndIf
$sAttribs = @extended
If StringInStr($sAttribs, "D") Then
$bFolder = True
EndIf
If StringRegExp($sAttribs, "[" & $sHide_HS & "]") Then
ContinueLoop
EndIf
EndIf
If $bFolder Then
Select
Case $iRecur < 0
StringReplace($sCurrentPath, "\", "", 0, $STR_NOCASESENSEBASIC)
If @extended < $iMaxLevel Then
ContinueCase
EndIf
Case $iRecur = 1
If Not StringRegExp($sName, $sExclude_Folder_Mask) Then
__FLTAR_AddToList($asFolderSearchList, $sCurrentPath & $sName & "\")
EndIf
EndSelect
EndIf
If $iSort Then
If $bFolder Then
If StringRegExp($sName, $sInclude_Folder_Mask) And Not StringRegExp($sName, $sExclude_Folder_Mask) Then
__FLTAR_AddToList($asFolderMatchList, $sRetPath & $sName & $sFolderSlash)
EndIf
Else
If StringRegExp($sName, $sInclude_File_Mask) And Not StringRegExp($sName, $sExclude_File_Mask) Then
If $sCurrentPath = $sFilePath Then
__FLTAR_AddToList($asRootFileMatchList, $sRetPath & $sName)
Else
__FLTAR_AddToList($asFileMatchList, $sRetPath & $sName)
EndIf
EndIf
EndIf
Else
If $bFolder Then
If $iReturn <> 1 And StringRegExp($sName, $sInclude_Folder_Mask) And Not StringRegExp($sName, $sExclude_Folder_Mask) Then
__FLTAR_AddToList($asReturnList, $sRetPath & $sName & $sFolderSlash)
EndIf
Else
If $iReturn <> 2 And StringRegExp($sName, $sInclude_File_Mask) And Not StringRegExp($sName, $sExclude_File_Mask) Then
__FLTAR_AddToList($asReturnList, $sRetPath & $sName)
EndIf
EndIf
EndIf
WEnd
If $iHide_Link Then
DllCall($hDLL, 'int', 'FindClose', 'ptr', $hSearch)
Else
FileClose($hSearch)
EndIf
WEnd
If $iHide_Link Then
DllClose($hDLL)
EndIf
If $iSort Then
Switch $iReturn
Case 2
If $asFolderMatchList[0] = 0 Then Return SetError(1, 9, "")
ReDim $asFolderMatchList[$asFolderMatchList[0] + 1]
$asReturnList = $asFolderMatchList
__ArrayDualPivotSort($asReturnList, 1, $asReturnList[0])
Case 1
If $asRootFileMatchList[0] = 0 And $asFileMatchList[0] = 0 Then Return SetError(1, 9, "")
If $iReturnPath = 0 Then
__FLTAR_AddFileLists($asReturnList, $asRootFileMatchList, $asFileMatchList)
__ArrayDualPivotSort($asReturnList, 1, $asReturnList[0])
Else
__FLTAR_AddFileLists($asReturnList, $asRootFileMatchList, $asFileMatchList, 1)
EndIf
Case 0
If $asRootFileMatchList[0] = 0 And $asFolderMatchList[0] = 0 Then Return SetError(1, 9, "")
If $iReturnPath = 0 Then
__FLTAR_AddFileLists($asReturnList, $asRootFileMatchList, $asFileMatchList)
$asReturnList[0] += $asFolderMatchList[0]
ReDim $asFolderMatchList[$asFolderMatchList[0] + 1]
_ArrayConcatenate($asReturnList, $asFolderMatchList, 1)
__ArrayDualPivotSort($asReturnList, 1, $asReturnList[0])
Else
Local $asReturnList[$asFileMatchList[0] + $asRootFileMatchList[0] + $asFolderMatchList[0] + 1]
$asReturnList[0] = $asFileMatchList[0] + $asRootFileMatchList[0] + $asFolderMatchList[0]
__ArrayDualPivotSort($asRootFileMatchList, 1, $asRootFileMatchList[0])
For $i = 1 To $asRootFileMatchList[0]
$asReturnList[$i] = $asRootFileMatchList[$i]
Next
Local $iNextInsertionIndex = $asRootFileMatchList[0] + 1
__ArrayDualPivotSort($asFolderMatchList, 1, $asFolderMatchList[0])
Local $sFolderToFind = ""
For $i = 1 To $asFolderMatchList[0]
$asReturnList[$iNextInsertionIndex] = $asFolderMatchList[$i]
$iNextInsertionIndex += 1
If $sFolderSlash Then
$sFolderToFind = $asFolderMatchList[$i]
Else
$sFolderToFind = $asFolderMatchList[$i] & "\"
EndIf
Local $iFileSectionEndIndex = 0, $iFileSectionStartIndex = 0
For $j = 1 To $asFolderFileSectionList[0][0]
If $sFolderToFind = $asFolderFileSectionList[$j][0] Then
$iFileSectionStartIndex = $asFolderFileSectionList[$j][1]
If $j = $asFolderFileSectionList[0][0] Then
$iFileSectionEndIndex = $asFileMatchList[0]
Else
$iFileSectionEndIndex = $asFolderFileSectionList[$j + 1][1] - 1
EndIf
If $iSort = 1 Then
__ArrayDualPivotSort($asFileMatchList, $iFileSectionStartIndex, $iFileSectionEndIndex)
EndIf
For $k = $iFileSectionStartIndex To $iFileSectionEndIndex
$asReturnList[$iNextInsertionIndex] = $asFileMatchList[$k]
$iNextInsertionIndex += 1
Next
ExitLoop
EndIf
Next
Next
EndIf
EndSwitch
Else
If $asReturnList[0] = 0 Then Return SetError(1, 9, "")
ReDim $asReturnList[$asReturnList[0] + 1]
EndIf
Return $asReturnList
EndFunc
Func __FLTAR_AddFileLists(ByRef $asTarget, $asSource_1, $asSource_2, $iSort = 0)
ReDim $asSource_1[$asSource_1[0] + 1]
If $iSort = 1 Then __ArrayDualPivotSort($asSource_1, 1, $asSource_1[0])
$asTarget = $asSource_1
$asTarget[0] += $asSource_2[0]
ReDim $asSource_2[$asSource_2[0] + 1]
If $iSort = 1 Then __ArrayDualPivotSort($asSource_2, 1, $asSource_2[0])
_ArrayConcatenate($asTarget, $asSource_2, 1)
EndFunc
Func __FLTAR_AddToList(ByRef $aList, $vValue_0, $vValue_1 = -1)
If $vValue_1 = -1 Then
$aList[0] += 1
If UBound($aList) <= $aList[0] Then ReDim $aList[UBound($aList) * 2]
$aList[$aList[0]] = $vValue_0
Else
$aList[0][0] += 1
If UBound($aList) <= $aList[0][0] Then ReDim $aList[UBound($aList) * 2][2]
$aList[$aList[0][0]][0] = $vValue_0
$aList[$aList[0][0]][1] = $vValue_1
EndIf
EndFunc
Func __FLTAR_ListToMask(ByRef $sMask, $sList)
If StringRegExp($sList, "\\|/|:|\<|\>|\|") Then Return 0
$sList = StringReplace(StringStripWS(StringRegExpReplace($sList, "\s*;\s*", ";"), BitOR($STR_STRIPLEADING, $STR_STRIPTRAILING)), ";", "|")
$sList = StringReplace(StringReplace(StringRegExpReplace($sList, "[][$^.{}()+\-]", "\\$0"), "?", "."), "*", ".*?")
$sMask = "(?i)^(" & $sList & ")\z"
Return 1
EndFunc
Func _FilePrint($sFilePath, $iShow = @SW_HIDE)
Return ShellExecute($sFilePath, "", @WorkingDir, "print", $iShow = Default ? @SW_HIDE : $iShow)
EndFunc
Func _FileReadToArray($sFilePath, ByRef $vReturn, $iFlags = $FRTA_COUNT, $sDelimiter = "")
$vReturn = 0
If $iFlags = Default Then $iFlags = $FRTA_COUNT
If $sDelimiter = Default Then $sDelimiter = ""
Local $bExpand = True
If BitAND($iFlags, $FRTA_INTARRAYS) Then
$bExpand = False
$iFlags -= $FRTA_INTARRAYS
EndIf
Local $iEntire = $STR_CHRSPLIT
If BitAND($iFlags, $FRTA_ENTIRESPLIT) Then
$iEntire = $STR_ENTIRESPLIT
$iFlags -= $FRTA_ENTIRESPLIT
EndIf
Local $iNoCount = 0
If $iFlags <> $FRTA_COUNT Then
$iFlags = $FRTA_NOCOUNT
$iNoCount = $STR_NOCOUNT
EndIf
If $sDelimiter Then
Local $aLines = FileReadToArray($sFilePath)
If @error Then Return SetError(@error, 0, 0)
Local $iDim_1 = UBound($aLines) + $iFlags
If $bExpand Then
Local $iDim_2 = UBound(StringSplit($aLines[0], $sDelimiter, $iEntire + $STR_NOCOUNT))
Local $aTemp_Array[$iDim_1][$iDim_2]
Local $iFields,  $aSplit
For $i = 0 To $iDim_1 - $iFlags - 1
$aSplit = StringSplit($aLines[$i], $sDelimiter, $iEntire + $STR_NOCOUNT)
$iFields = UBound($aSplit)
If $iFields <> $iDim_2 Then
Return SetError(3, 0, 0)
EndIf
For $j = 0 To $iFields - 1
$aTemp_Array[$i + $iFlags][$j] = $aSplit[$j]
Next
Next
If $iDim_2 < 2 Then Return SetError(4, 0, 0)
If $iFlags Then
$aTemp_Array[0][0] = $iDim_1 - $iFlags
$aTemp_Array[0][1] = $iDim_2
EndIf
Else
Local $aTemp_Array[$iDim_1]
For $i = 0 To $iDim_1 - $iFlags - 1
$aTemp_Array[$i + $iFlags] = StringSplit($aLines[$i], $sDelimiter, $iEntire + $iNoCount)
Next
If $iFlags Then
$aTemp_Array[0] = $iDim_1 - $iFlags
EndIf
EndIf
$vReturn = $aTemp_Array
Else
If $iFlags Then
Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
If $hFileOpen = -1 Then Return SetError(1, 0, 0)
Local $sFileRead = FileRead($hFileOpen)
FileClose($hFileOpen)
If StringLen($sFileRead) Then
$vReturn = StringRegExp(@LF & $sFileRead, "(?|(\N+)\z|(\N*)(?:\R))", $STR_REGEXPARRAYGLOBALMATCH)
$vReturn[0] = UBound($vReturn) - 1
Else
Return SetError(2, 0, 0)
EndIf
Else
$vReturn = FileReadToArray($sFilePath)
If @error Then
$vReturn = 0
Return SetError(@error, 0, 0)
EndIf
EndIf
EndIf
Return 1
EndFunc
Func _FileWriteFromArray($sFilePath, Const ByRef $aArray, $iBase = Default, $iUBound = Default, $sDelimiter = "|")
Local $iReturn = 0
If Not IsArray($aArray) Then Return SetError(2, 0, $iReturn)
Local $iDims = UBound($aArray, $UBOUND_DIMENSIONS)
If $iDims > 2 Then Return SetError(4, 0, 0)
Local $iLast = UBound($aArray) - 1
If $iUBound = Default Or $iUBound > $iLast Then $iUBound = $iLast
If $iBase < 0 Or $iBase = Default Then $iBase = 0
If $iBase > $iUBound Then Return SetError(5, 0, $iReturn)
If $sDelimiter = Default Then $sDelimiter = "|"
Local $hFileOpen = $sFilePath
If IsString($sFilePath) Then
$hFileOpen = FileOpen($sFilePath, $FO_OVERWRITE)
If $hFileOpen = -1 Then Return SetError(1, 0, $iReturn)
EndIf
Local $iError = 0
$iReturn = 1
Switch $iDims
Case 1
For $i = $iBase To $iUBound
If Not FileWrite($hFileOpen, $aArray[$i] & @CRLF) Then
$iError = 3
$iReturn = 0
ExitLoop
EndIf
Next
Case 2
Local $sTemp = ""
For $i = $iBase To $iUBound
$sTemp = $aArray[$i][0]
For $j = 1 To UBound($aArray, $UBOUND_COLUMNS) - 1
$sTemp &= $sDelimiter & $aArray[$i][$j]
Next
If Not FileWrite($hFileOpen, $sTemp & @CRLF) Then
$iError = 3
$iReturn = 0
ExitLoop
EndIf
Next
EndSwitch
If IsString($sFilePath) Then FileClose($hFileOpen)
Return SetError($iError, 0, $iReturn)
EndFunc
Func _FileWriteLog($sLogPath, $sLogMsg, $iFlag = -1)
Local $iOpenMode = $FO_APPEND
Local $sMsg = @YEAR & "-" & @MON & "-" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC & " : " & $sLogMsg
If $iFlag = Default Then $iFlag = -1
If $iFlag <> -1 Then
$iOpenMode = $FO_OVERWRITE
$sMsg &= @CRLF & FileRead($sLogPath)
EndIf
Local $hFileOpen = $sLogPath
If IsString($sLogPath) Then $hFileOpen = FileOpen($sLogPath, $iOpenMode)
If $hFileOpen = -1 Then Return SetError(1, 0, 0)
Local $iReturn = FileWriteLine($hFileOpen, $sMsg)
If IsString($sLogPath) Then $iReturn = FileClose($hFileOpen)
If $iReturn <= 0 Then Return SetError(2, $iReturn, 0)
Return $iReturn
EndFunc
Func _FileWriteToLine($sFilePath, $iLine, $sText, $bOverWrite = False, $bFill = False)
If $bOverWrite = Default Then $bOverWrite = False
If $bFill = Default Then $bFill = False
If Not FileExists($sFilePath) Then Return SetError(2, 0, 0)
If $iLine <= 0 Then Return SetError(4, 0, 0)
If Not (IsBool($bOverWrite) Or $bOverWrite = 0 Or $bOverWrite = 1) Then Return SetError(5, 0, 0)
If Not IsString($sText) Then
$sText = String($sText)
If $sText = "" Then Return SetError(6, 0, 0)
EndIf
If Not IsBool($bFill) Then Return SetError(7, 0, 0)
Local $aArray = FileReadToArray($sFilePath)
If @error Then Local $aArray[0]
Local $iUBound = UBound($aArray) - 1
If $bFill Then
If $iUBound < $iLine Then
ReDim $aArray[$iLine]
$iUBound = $iLine - 1
EndIf
Else
If ($iUBound + 1) < $iLine Then Return SetError(1, 0, 0)
EndIf
$aArray[$iLine - 1] = ($bOverWrite ? $sText : $sText & @CRLF & $aArray[$iLine - 1])
Local $sData = ""
For $i = 0 To $iUBound
$sData &= $aArray[$i] & @CRLF
Next
$sData = StringTrimRight($sData, StringLen(@CRLF))
Local $hFileOpen = FileOpen($sFilePath, FileGetEncoding($sFilePath) + $FO_OVERWRITE)
If $hFileOpen = -1 Then Return SetError(3, 0, 0)
FileWrite($hFileOpen, $sData)
FileClose($hFileOpen)
Return 1
EndFunc
Func _PathFull($sRelativePath, $sBasePath = @WorkingDir)
If Not $sRelativePath Or $sRelativePath = "." Then Return $sBasePath
Local $sFullPath = StringReplace($sRelativePath, "/", "\")
Local Const $sFullPathConst = $sFullPath
Local $sPath
Local $bRootOnly = StringLeft($sFullPath, 1) = "\" And StringMid($sFullPath, 2, 1) <> "\"
If $sBasePath = Default Then $sBasePath = @WorkingDir
For $i = 1 To 2
$sPath = StringLeft($sFullPath, 2)
If $sPath = "\\" Then
$sFullPath = StringTrimLeft($sFullPath, 2)
Local $nServerLen = StringInStr($sFullPath, "\") - 1
$sPath = "\\" & StringLeft($sFullPath, $nServerLen)
$sFullPath = StringTrimLeft($sFullPath, $nServerLen)
ExitLoop
ElseIf StringRight($sPath, 1) = ":" Then
$sFullPath = StringTrimLeft($sFullPath, 2)
ExitLoop
Else
$sFullPath = $sBasePath & "\" & $sFullPath
EndIf
Next
If StringLeft($sFullPath, 1) <> "\" Then
If StringLeft($sFullPathConst, 2) = StringLeft($sBasePath, 2) Then
$sFullPath = $sBasePath & "\" & $sFullPath
Else
$sFullPath = "\" & $sFullPath
EndIf
EndIf
Local $aTemp = StringSplit($sFullPath, "\")
Local $aPathParts[$aTemp[0]], $j = 0
For $i = 2 To $aTemp[0]
If $aTemp[$i] = ".." Then
If $j Then $j -= 1
ElseIf Not ($aTemp[$i] = "" And $i <> $aTemp[0]) And $aTemp[$i] <> "." Then
$aPathParts[$j] = $aTemp[$i]
$j += 1
EndIf
Next
$sFullPath = $sPath
If Not $bRootOnly Then
For $i = 0 To $j - 1
$sFullPath &= "\" & $aPathParts[$i]
Next
Else
$sFullPath &= $sFullPathConst
If StringInStr($sFullPath, "..") Then $sFullPath = _PathFull($sFullPath)
EndIf
Do
$sFullPath = StringReplace($sFullPath, ".\", "\")
Until @extended = 0
Return $sFullPath
EndFunc
Func _PathGetRelative($sFrom, $sTo)
If StringRight($sFrom, 1) <> "\" Then $sFrom &= "\"
If StringRight($sTo, 1) <> "\" Then $sTo &= "\"
If $sFrom = $sTo Then Return SetError(1, 0, StringTrimRight($sTo, 1))
Local $asFrom = StringSplit($sFrom, "\")
Local $asTo = StringSplit($sTo, "\")
If $asFrom[1] <> $asTo[1] Then Return SetError(2, 0, StringTrimRight($sTo, 1))
Local $i = 2
Local $iDiff = 1
While 1
If $asFrom[$i] <> $asTo[$i] Then
$iDiff = $i
ExitLoop
EndIf
$i += 1
WEnd
$i = 1
Local $sRelPath = ""
For $j = 1 To $asTo[0]
If $i >= $iDiff Then
$sRelPath &= "\" & $asTo[$i]
EndIf
$i += 1
Next
$sRelPath = StringTrimLeft($sRelPath, 1)
$i = 1
For $j = 1 To $asFrom[0]
If $i > $iDiff Then
$sRelPath = "..\" & $sRelPath
EndIf
$i += 1
Next
If StringRight($sRelPath, 1) == "\" Then $sRelPath = StringTrimRight($sRelPath, 1)
Return $sRelPath
EndFunc
Func _PathMake($sDrive, $sDir, $sFileName, $sExtension)
If StringLen($sDrive) Then
If Not (StringLeft($sDrive, 2) = "\\") Then $sDrive = StringLeft($sDrive, 1) & ":"
EndIf
If StringLen($sDir) Then
If Not (StringRight($sDir, 1) = "\") And Not (StringRight($sDir, 1) = "/") Then $sDir = $sDir & "\"
Else
$sDir = "\"
EndIf
If StringLen($sDir) Then
If Not (StringLeft($sDir, 1) = "\") And Not (StringLeft($sDir, 1) = "/") Then $sDir = "\" & $sDir
EndIf
If StringLen($sExtension) Then
If Not (StringLeft($sExtension, 1) = ".") Then $sExtension = "." & $sExtension
EndIf
Return $sDrive & $sDir & $sFileName & $sExtension
EndFunc
Func _PathSplit($sFilePath, ByRef $sDrive, ByRef $sDir, ByRef $sFileName, ByRef $sExtension)
Local $aArray = StringRegExp($sFilePath, "^\h*((?:\\\\\?\\)*(\\\\[^\?\/\\]+|[A-Za-z]:)?(.*[\/\\]\h*)?((?:[^\.\/\\]|(?(?=\.[^\/\\]*\.)\.))*)?([^\/\\]*))$", $STR_REGEXPARRAYMATCH)
If @error Then
ReDim $aArray[5]
$aArray[$PATH_ORIGINAL] = $sFilePath
EndIf
$sDrive = $aArray[$PATH_DRIVE]
If StringLeft($aArray[$PATH_DIRECTORY], 1) == "/" Then
$sDir = StringRegExpReplace($aArray[$PATH_DIRECTORY], "\h*[\/\\]+\h*", "\/")
Else
$sDir = StringRegExpReplace($aArray[$PATH_DIRECTORY], "\h*[\/\\]+\h*", "\\")
EndIf
$aArray[$PATH_DIRECTORY] = $sDir
$sFileName = $aArray[$PATH_FILENAME]
$sExtension = $aArray[$PATH_EXTENSION]
Return $aArray
EndFunc
Func _ReplaceStringInFile($sFilePath, $sSearchString, $sReplaceString, $iCaseSensitive = 0, $iOccurance = 1)
If StringInStr(FileGetAttrib($sFilePath), "R") Then Return SetError(1, 0, -1)
Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
If $hFileOpen = -1 Then Return SetError(2, 0, -1)
Local $sFileRead = FileRead($hFileOpen)
FileClose($hFileOpen)
If $iCaseSensitive = Default Then $iCaseSensitive = 0
If $iOccurance = Default Then $iOccurance = 1
$sFileRead = StringReplace($sFileRead, $sSearchString, $sReplaceString, 1 - $iOccurance, $iCaseSensitive)
Local $iReturn = @extended
If $iReturn Then
Local $iFileEncoding = FileGetEncoding($sFilePath)
$hFileOpen = FileOpen($sFilePath, $iFileEncoding + $FO_OVERWRITE)
If $hFileOpen = -1 Then Return SetError(3, 0, -1)
FileWrite($hFileOpen, $sFileRead)
FileClose($hFileOpen)
EndIf
Return $iReturn
EndFunc
Func _TempFile($sDirectoryName = @TempDir, $sFilePrefix = "~", $sFileExtension = ".tmp", $iRandomLength = 7)
If $iRandomLength = Default Or $iRandomLength <= 0 Then $iRandomLength = 7
If $sDirectoryName = Default Or (Not FileExists($sDirectoryName)) Then $sDirectoryName = @TempDir
If $sFileExtension = Default Then $sFileExtension = ".tmp"
If $sFilePrefix = Default Then $sFilePrefix = "~"
If Not FileExists($sDirectoryName) Then $sDirectoryName = @ScriptDir
$sDirectoryName = StringRegExpReplace($sDirectoryName, "[\\/]+$", "")
$sFileExtension = StringRegExpReplace($sFileExtension, "^\.+", "")
$sFilePrefix = StringRegExpReplace($sFilePrefix, '[\\/:*?"<>|]', "")
Local $sTempName = ""
Do
$sTempName = ""
While StringLen($sTempName) < $iRandomLength
$sTempName &= Chr(Random(97, 122, 1))
WEnd
$sTempName = $sDirectoryName & "\" & $sFilePrefix & $sTempName & "." & $sFileExtension
Until Not FileExists($sTempName)
Return $sTempName
EndFunc
Global Const $INET_LOCALCACHE = 0
Global Const $INET_FORCERELOAD = 1
Global Const $INET_IGNORESSL = 2
Global Const $INET_ASCIITRANSFER = 4
Global Const $INET_BINARYTRANSFER = 8
Global Const $INET_FORCEBYPASS = 16
Global Const $INET_DOWNLOADWAIT = 0
Global Const $INET_DOWNLOADBACKGROUND = 1
Global Const $INET_DOWNLOADREAD = 0
Global Const $INET_DOWNLOADSIZE = 1
Global Const $INET_DOWNLOADCOMPLETE = 2
Global Const $INET_DOWNLOADSUCCESS = 3
Global Const $INET_DOWNLOADERROR = 4
Global Const $INET_DOWNLOADEXTENDED = 5
Func _GetIP()
Local Const $GETIP_TIMER = 300000
Local Static $hTimer = 0
Local Static $sLastIP = 0
If TimerDiff($hTimer) < $GETIP_TIMER And Not $sLastIP Then
Return SetExtended(1, $sLastIP)
EndIf
Local $aGetIPURL = ["https://api.ipify.org", "http://checkip.dyndns.org", "http://www.myexternalip.com/raw", "http://bot.whatismyipaddress.com"],  $aReturn = 0,  $sReturn = ""
For $i = 0 To UBound($aGetIPURL) - 1
$sReturn = InetRead($aGetIPURL[$i])
If @error Or $sReturn == "" Then ContinueLoop
$aReturn = StringRegExp(BinaryToString($sReturn), "((?:\d{1,3}\.){3}\d{1,3})", $STR_REGEXPARRAYGLOBALMATCH)
If Not @error Then
$sReturn = $aReturn[0]
ExitLoop
EndIf
$sReturn = ""
Next
$hTimer = TimerInit()
$sLastIP = $sReturn
If $sReturn == "" Then Return SetError(1, 0, -1)
Return $sReturn
EndFunc
Func _INetExplorerCapable($sIEString)
If StringLen($sIEString) <= 0 Then Return SetError(1, 0, '')
Local $s_IEReturn
Local $n_IEChar
For $i_IECount = 1 To StringLen($sIEString)
$n_IEChar = '0x' & Hex(Asc(StringMid($sIEString, $i_IECount, 1)), 2)
If $n_IEChar < 0x21 Or $n_IEChar = 0x25 Or $n_IEChar = 0x2f Or $n_IEChar > 0x7f Then
$s_IEReturn = $s_IEReturn & '%' & StringRight($n_IEChar, 2)
Else
$s_IEReturn = $s_IEReturn & Chr($n_IEChar)
EndIf
Next
Return $s_IEReturn
EndFunc
Func _INetGetSource($sURL, $bString = True)
Local $sString = InetRead($sURL, $INET_FORCERELOAD)
Local $iError = @error, $iExtended = @extended
If $bString = Default Or $bString Then $sString = BinaryToString($sString)
Return SetError($iError, $iExtended, $sString)
EndFunc
Func _INetMail($sMailTo, $sMailSubject, $sMailBody)
Local $iPrev = Opt("ExpandEnvStrings", 1)
Local $sVar, $sDflt = RegRead('HKCU\Software\Clients\Mail', "")
If $sDflt = "Windows Live Mail" Then
$sVar = RegRead('HKCR\WLMail.Url.Mailto\Shell\open\command', "")
Else
$sVar = RegRead('HKCR\mailto\shell\open\command', "")
EndIf
Local $iRet = Run(StringReplace($sVar, '%1', _INetExplorerCapable('mailto:' & $sMailTo & '?subject=' & $sMailSubject & '&body=' & $sMailBody)))
Local $iError = @error, $iExtended = @extended
Opt("ExpandEnvStrings", $iPrev)
Return SetError($iError, $iExtended, $iRet)
EndFunc
Func _INetSmtpMail($sSMTPServer, $sFromName, $sFromAddress, $sToAddress, $sSubject = "", $aBody = "", $sEHLO = "", $sFirst = "", $bTrace = 0)
If $sSMTPServer = "" Or $sFromAddress = "" Or $sToAddress = "" Or $sFromName = "" Or StringLen($sFromName) > 256 Then Return SetError(1, 0, 0)
If $sEHLO = "" Then $sEHLO = @ComputerName
If TCPStartup() = 0 Then Return SetError(2, 0, 0)
Local $s_IPAddress, $i_Count
If StringRegExp($sSMTPServer, "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$") Then
$s_IPAddress = $sSMTPServer
Else
$s_IPAddress = TCPNameToIP($sSMTPServer)
EndIf
If $s_IPAddress = "" Then
TCPShutdown()
Return SetError(3, 0, 0)
EndIf
Local $vSocket = TCPConnect($s_IPAddress, 25)
If $vSocket = -1 Then
TCPShutdown()
Return SetError(4, 0, 0)
EndIf
Local $aSend[6], $aReplyCode[6]
$aSend[0] = "HELO " & $sEHLO & @CRLF
If StringLeft($sEHLO, 5) = "EHLO " Then $aSend[0] = $sEHLO & @CRLF
$aReplyCode[0] = "250"
$aSend[1] = "MAIL FROM: <" & $sFromAddress & ">" & @CRLF
$aReplyCode[1] = "250"
$aSend[2] = "RCPT TO: <" & $sToAddress & ">" & @CRLF
$aReplyCode[2] = "250"
$aSend[3] = "DATA" & @CRLF
$aReplyCode[3] = "354"
Local $aResult = _Date_Time_GetTimeZoneInformation()
Local $iBias = -$aResult[1] / 60
Local $iBiasH = Int($iBias)
Local $iBiasM = 0
If $iBiasH <> $iBias Then $iBiasM = Abs($iBias - $iBiasH) * 60
$iBias = StringFormat(" (%+.2d%.2d)", $iBiasH, $iBiasM)
$aSend[4] = "From:" & $sFromName & "<" & $sFromAddress & ">" & @CRLF &  "To:" & "<" & $sToAddress & ">" & @CRLF &  "Subject:" & $sSubject & @CRLF &  "Mime-Version: 1.0" & @CRLF &  "Date: " & _DateDayOfWeek(@WDAY, 1) & ", " & @MDAY & " " & _DateToMonth(@MON, 1) & " " & @YEAR & " " & @HOUR & ":" & @MIN & ":" & @SEC & $iBias & @CRLF &  "Content-Type: text/plain; charset=US-ASCII" & @CRLF &  @CRLF
$aReplyCode[4] = ""
$aSend[5] = @CRLF & "." & @CRLF
$aReplyCode[5] = "250"
If __SmtpSend($vSocket, $aSend[0], $aReplyCode[0], $bTrace, "220", $sFirst) Then Return SetError(50, 0, 0)
For $i_Count = 1 To UBound($aSend) - 2
If __SmtpSend($vSocket, $aSend[$i_Count], $aReplyCode[$i_Count], $bTrace) Then Return SetError(50 + $i_Count, 0, 0)
Next
For $i_Count = 0 To UBound($aBody) - 1
If StringLeft($aBody[$i_Count], 1) = "." Then $aBody[$i_Count] = "." & $aBody[$i_Count]
If __SmtpSend($vSocket, $aBody[$i_Count] & @CRLF, "", $bTrace) Then Return SetError(500 + $i_Count, 0, 0)
Next
$i_Count = UBound($aSend) - 1
If __SmtpSend($vSocket, $aSend[$i_Count], $aReplyCode[$i_Count], $bTrace) Then Return SetError(5000, 0, 0)
TCPCloseSocket($vSocket)
TCPShutdown()
Return 1
EndFunc
Func __SmtpTrace($sStr, $iTimeout = 0)
Local $sW_TITLE = "SMTP trace"
Local $sSmtpTrace = ControlGetText($sW_TITLE, "", "Static1")
$sStr = StringLeft(StringReplace($sStr, @CRLF, ""), 70)
$sSmtpTrace &= @HOUR & ":" & @MIN & ":" & @SEC & " " & $sStr & @LF
If WinExists($sW_TITLE) Then
ControlSetText($sW_TITLE, "", "Static1", $sSmtpTrace)
Else
SplashTextOn($sW_TITLE, $sSmtpTrace, 400, 500, 500, 100, 4 + 16, "", 8)
EndIf
If $iTimeout Then Sleep($iTimeout * 1000)
EndFunc
Func __SmtpSend($vSocket, $sSend, $sReplyCode, $bTrace, $sIntReply = "", $sFirst = "")
Local $sReceive, $i, $hTimer
If $bTrace Then __SmtpTrace($sSend)
If $sIntReply <> "" Then
If $sFirst <> -1 Then
If TCPSend($vSocket, $sFirst) = 0 Then
TCPCloseSocket($vSocket)
TCPShutdown()
Return 1
EndIf
EndIf
$sReceive = ""
$hTimer = TimerInit()
While StringLeft($sReceive, StringLen($sIntReply)) <> $sIntReply And TimerDiff($hTimer) < 45000
$sReceive = TCPRecv($vSocket, 1000)
If $bTrace And $sReceive <> "" Then __SmtpTrace("intermediate->" & $sReceive)
WEnd
EndIf
If TCPSend($vSocket, $sSend) = 0 Then
TCPCloseSocket($vSocket)
TCPShutdown()
Return 1
EndIf
$hTimer = TimerInit()
$sReceive = ""
While $sReceive = "" And TimerDiff($hTimer) < 45000
$i += 1
$sReceive = TCPRecv($vSocket, 1000)
If $sReplyCode = "" Then ExitLoop
WEnd
If $sReplyCode <> "" Then
If $bTrace Then __SmtpTrace($i & " <- " & $sReceive)
If StringLeft($sReceive, StringLen($sReplyCode)) <> $sReplyCode Then
TCPCloseSocket($vSocket)
TCPShutdown()
If $bTrace Then __SmtpTrace("<-> " & $sReplyCode, 5)
Return 2
EndIf
EndIf
Return 0
EndFunc
Func _TCPIpToName($sIp, $iOption = Default, $hDll = Default)
Local $iINADDR_NONE = 0xffffffff, $iAF_INET = 2, $sSeparator = @CR
If $iOption = Default Then $iOption = 0
If $hDll = Default Then $hDll = "ws2_32.dll"
Local $avDllCall = DllCall($hDll, "ulong", "inet_addr", "STR", $sIp)
If @error Then Return SetError(1, 0, "")
Local $vBinIP = $avDllCall[0]
If $vBinIP = $iINADDR_NONE Then Return SetError(2, 0, "")
$avDllCall = DllCall($hDll, "ptr", "gethostbyaddr", "ptr*", $vBinIP, "int", 4, "int", $iAF_INET)
If @error Then Return SetError(3, 0, "")
Local $pvHostent = $avDllCall[0]
If $pvHostent = 0 Then
$avDllCall = DllCall($hDll, "int", "WSAGetLastError")
If @error Then Return SetError(5, 0, "")
Return SetError(4, $avDllCall[0], "")
EndIf
Local $tHostent = DllStructCreate("ptr;ptr;short;short;ptr", $pvHostent)
Local $sHostnames = __TCPIpToName_szStringRead(DllStructGetData($tHostent, 1))
If @error Then Return SetError(6, 0, $sHostnames)
If $iOption = 1 Then
Local $tAliases
$sHostnames &= $sSeparator
For $i = 0 To 63
$tAliases = DllStructCreate("ptr", DllStructGetData($tHostent, 2) + ($i * 4))
If DllStructGetData($tAliases, 1) = 0 Then ExitLoop
$sHostnames &= __TCPIpToName_szStringRead(DllStructGetData($tAliases, 1))
If @error Then
SetError(7)
ExitLoop
EndIf
Next
Return StringSplit(StringStripWS($sHostnames, $STR_STRIPTRAILING), @CR)
Else
Return $sHostnames
EndIf
EndFunc
Func __TCPIpToName_szStringRead($pStr, $iLen = -1)
Local $tString
If $pStr < 1 Then Return ""
If $iLen < 0 Then $iLen = _WinAPI_StrLen($pStr, False)
$tString = DllStructCreate("char[" & $iLen & "]", $pStr)
If @error Then Return SetError(2, 0, "")
Return SetExtended($iLen, DllStructGetData($tString, 1))
EndFunc
Global Const $TRAY_ITEM_EXIT = 3
Global Const $TRAY_ITEM_PAUSE = 4
Global Const $TRAY_ITEM_FIRST = 7
Global Const $TRAY_CHECKED = 1
Global Const $TRAY_UNCHECKED = 4
Global Const $TRAY_ENABLE = 64
Global Const $TRAY_DISABLE = 128
Global Const $TRAY_FOCUS = 256
Global Const $TRAY_DEFAULT = 512
Global Const $TRAY_EVENT_NONE = 0
Global Const $TRAY_EVENT_SHOWICON = -3
Global Const $TRAY_EVENT_HIDEICON = -4
Global Const $TRAY_EVENT_FLASHICON = -5
Global Const $TRAY_EVENT_NOFLASHICON = -6
Global Const $TRAY_EVENT_PRIMARYDOWN = -7
Global Const $TRAY_EVENT_PRIMARYUP = -8
Global Const $TRAY_EVENT_SECONDARYDOWN = -9
Global Const $TRAY_EVENT_SECONDARYUP = -10
Global Const $TRAY_EVENT_MOUSEOVER = -11
Global Const $TRAY_EVENT_MOUSEOUT = -12
Global Const $TRAY_EVENT_PRIMARYDOUBLE = -13
Global Const $TRAY_EVENT_SECONDARYDOUBLE = -14
Global Const $TIP_ICONNONE = 0
Global Const $TIP_ICONASTERISK = 1
Global Const $TIP_ICONEXCLAMATION = 2
Global Const $TIP_ICONHAND = 3
Global Const $TIP_NOSOUND = 16
Global Const $TRAY_ITEM_NORMAL = 0
Global Const $TRAY_ITEM_RADIO = 1
Global Const $TRAY_CLICK_SHOW = 0
Global Const $TRAY_CLICK_PRIMARYDOWN = 1
Global Const $TRAY_CLICK_PRIMARYUP = 2
Global Const $TRAY_DBLCLICK_PRIMARY= 4
Global Const $TRAY_CLICK_SECONDARYDOWN = 8
Global Const $TRAY_CLICK_SECONDARYUP = 16
Global Const $TRAY_DBLCLICK_SECONDARY= 32
Global Const $TRAY_CLICK_HOVERING= 64
Global Const $TRAY_ICONSTATE_SHOW = 1
Global Const $TRAY_ICONSTATE_HIDE = 2
Global Const $TRAY_ICONSTATE_FLASH = 4
Global Const $TRAY_ICONSTATE_STOPFLASH = 8
Global Const $TRAY_ICONSTATE_RESET = 16
Global Const $ACS_CENTER = 1
Global Const $ACS_TRANSPARENT = 2
Global Const $ACS_AUTOPLAY = 4
Global Const $ACS_TIMER = 8
Global Const $ACS_NONTRANSPARENT = 16
Global Const $GUI_SS_DEFAULT_AVI = $ACS_TRANSPARENT
Global Const $__AVICONSTANT_WM_USER = 0x400
Global Const $ACM_OPENA = $__AVICONSTANT_WM_USER + 100
Global Const $ACM_PLAY = $__AVICONSTANT_WM_USER + 101
Global Const $ACM_STOP = $__AVICONSTANT_WM_USER + 102
Global Const $ACM_ISPLAYING = $__AVICONSTANT_WM_USER + 104
Global Const $ACM_OPENW = $__AVICONSTANT_WM_USER + 103
Global Const $ACN_START = 0x00000001
Global Const $ACN_STOP = 0x00000002
Global Const $BS_GROUPBOX = 0x0007
Global Const $BS_BOTTOM = 0x0800
Global Const $BS_CENTER = 0x0300
Global Const $BS_DEFPUSHBUTTON = 0x0001
Global Const $BS_LEFT = 0x0100
Global Const $BS_MULTILINE = 0x2000
Global Const $BS_PUSHBOX = 0x000A
Global Const $BS_PUSHLIKE = 0x1000
Global Const $BS_RIGHT = 0x0200
Global Const $BS_RIGHTBUTTON = 0x0020
Global Const $BS_TOP = 0x0400
Global Const $BS_VCENTER = 0x0C00
Global Const $BS_FLAT = 0x8000
Global Const $BS_ICON = 0x0040
Global Const $BS_BITMAP = 0x0080
Global Const $BS_NOTIFY = 0x4000
Global Const $BS_SPLITBUTTON = 0x0000000C
Global Const $BS_DEFSPLITBUTTON = 0x0000000D
Global Const $BS_COMMANDLINK = 0x0000000E
Global Const $BS_DEFCOMMANDLINK = 0x0000000F
Global Const $BCSIF_GLYPH = 0x0001
Global Const $BCSIF_IMAGE = 0x0002
Global Const $BCSIF_STYLE = 0x0004
Global Const $BCSIF_SIZE = 0x0008
Global Const $BCSS_NOSPLIT = 0x0001
Global Const $BCSS_STRETCH = 0x0002
Global Const $BCSS_ALIGNLEFT = 0x0004
Global Const $BCSS_IMAGE = 0x0008
Global Const $BUTTON_IMAGELIST_ALIGN_LEFT = 0
Global Const $BUTTON_IMAGELIST_ALIGN_RIGHT = 1
Global Const $BUTTON_IMAGELIST_ALIGN_TOP = 2
Global Const $BUTTON_IMAGELIST_ALIGN_BOTTOM = 3
Global Const $BUTTON_IMAGELIST_ALIGN_CENTER = 4
Global Const $BS_3STATE = 0x0005
Global Const $BS_AUTO3STATE = 0x0006
Global Const $BS_AUTOCHECKBOX = 0x0003
Global Const $BS_CHECKBOX = 0x0002
Global Const $BS_RADIOBUTTON = 0x4
Global Const $BS_AUTORADIOBUTTON = 0x0009
Global Const $BS_OWNERDRAW = 0xB
Global Const $GUI_SS_DEFAULT_BUTTON = 0
Global Const $GUI_SS_DEFAULT_CHECKBOX = 0
Global Const $GUI_SS_DEFAULT_GROUP = 0
Global Const $GUI_SS_DEFAULT_RADIO = 0
Global Const $BCM_FIRST = 0x1600
Global Const $BCM_GETIDEALSIZE = ($BCM_FIRST + 0x0001)
Global Const $BCM_GETIMAGELIST = ($BCM_FIRST + 0x0003)
Global Const $BCM_GETNOTE = ($BCM_FIRST + 0x000A)
Global Const $BCM_GETNOTELENGTH = ($BCM_FIRST + 0x000B)
Global Const $BCM_GETSPLITINFO = ($BCM_FIRST + 0x0008)
Global Const $BCM_GETTEXTMARGIN = ($BCM_FIRST + 0x0005)
Global Const $BCM_SETDROPDOWNSTATE = ($BCM_FIRST + 0x0006)
Global Const $BCM_SETIMAGELIST = ($BCM_FIRST + 0x0002)
Global Const $BCM_SETNOTE = ($BCM_FIRST + 0x0009)
Global Const $BCM_SETSHIELD = ($BCM_FIRST + 0x000C)
Global Const $BCM_SETSPLITINFO = ($BCM_FIRST + 0x0007)
Global Const $BCM_SETTEXTMARGIN = ($BCM_FIRST + 0x0004)
Global Const $BM_CLICK = 0xF5
Global Const $BM_GETCHECK = 0xF0
Global Const $BM_GETIMAGE = 0xF6
Global Const $BM_GETSTATE = 0xF2
Global Const $BM_SETCHECK = 0xF1
Global Const $BM_SETDONTCLICK = 0xF8
Global Const $BM_SETIMAGE = 0xF7
Global Const $BM_SETSTATE = 0xF3
Global Const $BM_SETSTYLE = 0xF4
Global Const $BCN_FIRST = -1250
Global Const $BCN_DROPDOWN = ($BCN_FIRST + 0x0002)
Global Const $BCN_HOTITEMCHANGE = ($BCN_FIRST + 0x0001)
Global Const $BN_CLICKED = 0
Global Const $BN_PAINT = 1
Global Const $BN_HILITE = 2
Global Const $BN_UNHILITE = 3
Global Const $BN_DISABLE = 4
Global Const $BN_DOUBLECLICKED = 5
Global Const $BN_SETFOCUS = 6
Global Const $BN_KILLFOCUS = 7
Global Const $BN_PUSHED = $BN_HILITE
Global Const $BN_UNPUSHED = $BN_UNHILITE
Global Const $BN_DBLCLK = $BN_DOUBLECLICKED
Global Const $BST_CHECKED = 0x1
Global Const $BST_INDETERMINATE = 0x2
Global Const $BST_UNCHECKED = 0x0
Global Const $BST_FOCUS = 0x8
Global Const $BST_PUSHED = 0x4
Global Const $BST_DONTCLICK = 0x000080
Global Const $CB_ERR = -1
Global Const $CB_ERRATTRIBUTE = -3
Global Const $CB_ERRREQUIRED = -4
Global Const $CB_ERRSPACE = -2
Global Const $CB_OKAY = 0
Global Const $STATE_SYSTEM_INVISIBLE = 0x8000
Global Const $STATE_SYSTEM_PRESSED = 0x8
Global Const $CBS_AUTOHSCROLL = 0x40
Global Const $CBS_DISABLENOSCROLL = 0x800
Global Const $CBS_DROPDOWN = 0x2
Global Const $CBS_DROPDOWNLIST = 0x3
Global Const $CBS_HASSTRINGS = 0x200
Global Const $CBS_LOWERCASE = 0x4000
Global Const $CBS_NOINTEGRALHEIGHT = 0x400
Global Const $CBS_OEMCONVERT = 0x80
Global Const $CBS_OWNERDRAWFIXED = 0x10
Global Const $CBS_OWNERDRAWVARIABLE = 0x20
Global Const $CBS_SIMPLE = 0x1
Global Const $CBS_SORT = 0x100
Global Const $CBS_UPPERCASE = 0x2000
Global Const $CBM_FIRST = 0x1700
Global Const $CB_ADDSTRING = 0x143
Global Const $CB_DELETESTRING = 0x144
Global Const $CB_DIR = 0x145
Global Const $CB_FINDSTRING = 0x14C
Global Const $CB_FINDSTRINGEXACT = 0x158
Global Const $CB_GETCOMBOBOXINFO = 0x164
Global Const $CB_GETCOUNT = 0x146
Global Const $CB_GETCUEBANNER = ($CBM_FIRST + 4)
Global Const $CB_GETCURSEL = 0x147
Global Const $CB_GETDROPPEDCONTROLRECT = 0x152
Global Const $CB_GETDROPPEDSTATE = 0x157
Global Const $CB_GETDROPPEDWIDTH = 0X15f
Global Const $CB_GETEDITSEL = 0x140
Global Const $CB_GETEXTENDEDUI = 0x156
Global Const $CB_GETHORIZONTALEXTENT = 0x15d
Global Const $CB_GETITEMDATA = 0x150
Global Const $CB_GETITEMHEIGHT = 0x154
Global Const $CB_GETLBTEXT = 0x148
Global Const $CB_GETLBTEXTLEN = 0x149
Global Const $CB_GETLOCALE = 0x15A
Global Const $CB_GETMINVISIBLE = 0x1702
Global Const $CB_GETTOPINDEX = 0x15b
Global Const $CB_INITSTORAGE = 0x161
Global Const $CB_LIMITTEXT = 0x141
Global Const $CB_RESETCONTENT = 0x14B
Global Const $CB_INSERTSTRING = 0x14A
Global Const $CB_SELECTSTRING = 0x14D
Global Const $CB_SETCUEBANNER = ($CBM_FIRST + 3)
Global Const $CB_SETCURSEL = 0x14E
Global Const $CB_SETDROPPEDWIDTH = 0x160
Global Const $CB_SETEDITSEL = 0x142
Global Const $CB_SETEXTENDEDUI = 0x155
Global Const $CB_SETHORIZONTALEXTENT = 0x15e
Global Const $CB_SETITEMDATA = 0x151
Global Const $CB_SETITEMHEIGHT = 0x153
Global Const $CB_SETLOCALE = 0x159
Global Const $CB_SETMINVISIBLE = 0x1701
Global Const $CB_SETTOPINDEX = 0x15c
Global Const $CB_SHOWDROPDOWN = 0x14F
Global Const $CBN_CLOSEUP = 8
Global Const $CBN_DBLCLK = 2
Global Const $CBN_DROPDOWN = 7
Global Const $CBN_EDITCHANGE = 5
Global Const $CBN_EDITUPDATE = 6
Global Const $CBN_ERRSPACE = (-1)
Global Const $CBN_KILLFOCUS = 4
Global Const $CBN_SELCHANGE = 1
Global Const $CBN_SELENDCANCEL = 10
Global Const $CBN_SELENDOK = 9
Global Const $CBN_SETFOCUS = 3
Global Const $CBES_EX_CASESENSITIVE = 0x10
Global Const $CBES_EX_NOEDITIMAGE = 0x1
Global Const $CBES_EX_NOEDITIMAGEINDENT = 0x2
Global Const $CBES_EX_NOSIZELIMIT = 0x8
Global Const $__COMBOBOXCONSTANT_WM_USER = 0X400
Global Const $CBEM_DELETEITEM = $CB_DELETESTRING
Global Const $CBEM_GETCOMBOCONTROL = ($__COMBOBOXCONSTANT_WM_USER + 6)
Global Const $CBEM_GETEDITCONTROL = ($__COMBOBOXCONSTANT_WM_USER + 7)
Global Const $CBEM_GETEXSTYLE = ($__COMBOBOXCONSTANT_WM_USER + 9)
Global Const $CBEM_GETEXTENDEDSTYLE = ($__COMBOBOXCONSTANT_WM_USER + 9)
Global Const $CBEM_GETIMAGELIST = ($__COMBOBOXCONSTANT_WM_USER + 3)
Global Const $CBEM_GETITEMA = ($__COMBOBOXCONSTANT_WM_USER + 4)
Global Const $CBEM_GETITEMW = ($__COMBOBOXCONSTANT_WM_USER + 13)
Global Const $CBEM_GETUNICODEFORMAT = 0x2000 + 6
Global Const $CBEM_HASEDITCHANGED = ($__COMBOBOXCONSTANT_WM_USER + 10)
Global Const $CBEM_INSERTITEMA = ($__COMBOBOXCONSTANT_WM_USER + 1)
Global Const $CBEM_INSERTITEMW = ($__COMBOBOXCONSTANT_WM_USER + 11)
Global Const $CBEM_SETEXSTYLE = ($__COMBOBOXCONSTANT_WM_USER + 8)
Global Const $CBEM_SETEXTENDEDSTYLE = ($__COMBOBOXCONSTANT_WM_USER + 14)
Global Const $CBEM_SETIMAGELIST = ($__COMBOBOXCONSTANT_WM_USER + 2)
Global Const $CBEM_SETITEMA = ($__COMBOBOXCONSTANT_WM_USER + 5)
Global Const $CBEM_SETITEMW = ($__COMBOBOXCONSTANT_WM_USER + 12)
Global Const $CBEM_SETUNICODEFORMAT = 0x2000 + 5
Global Const $CBEM_SETWINDOWTHEME = 0x2000 + 11
Global Const $CBEN_FIRST = (-800)
Global Const $CBEN_LAST = (-830)
Global Const $CBEN_BEGINEDIT = ($CBEN_FIRST - 4)
Global Const $CBEN_DELETEITEM = ($CBEN_FIRST - 2)
Global Const $CBEN_DRAGBEGINA = ($CBEN_FIRST - 8)
Global Const $CBEN_DRAGBEGINW = ($CBEN_FIRST - 9)
Global Const $CBEN_ENDEDITA = ($CBEN_FIRST - 5)
Global Const $CBEN_ENDEDITW = ($CBEN_FIRST - 6)
Global Const $CBEN_GETDISPINFO = ($CBEN_FIRST - 0)
Global Const $CBEN_GETDISPINFOA = ($CBEN_FIRST - 0)
Global Const $CBEN_GETDISPINFOW = ($CBEN_FIRST - 7)
Global Const $CBEN_INSERTITEM = ($CBEN_FIRST - 1)
Global Const $CBEIF_DI_SETITEM = 0x10000000
Global Const $CBEIF_IMAGE = 0x2
Global Const $CBEIF_INDENT = 0x10
Global Const $CBEIF_LPARAM = 0x20
Global Const $CBEIF_OVERLAY = 0x8
Global Const $CBEIF_SELECTEDIMAGE = 0x4
Global Const $CBEIF_TEXT = 0x1
Global Const $GUI_SS_DEFAULT_COMBO = 0x00200042
Global Const $ES_LEFT = 0
Global Const $ES_CENTER = 1
Global Const $ES_RIGHT = 2
Global Const $ES_MULTILINE = 4
Global Const $ES_UPPERCASE = 8
Global Const $ES_LOWERCASE = 16
Global Const $ES_PASSWORD = 32
Global Const $ES_AUTOVSCROLL = 64
Global Const $ES_AUTOHSCROLL = 128
Global Const $ES_NOHIDESEL = 256
Global Const $ES_OEMCONVERT = 1024
Global Const $ES_READONLY = 2048
Global Const $ES_WANTRETURN = 4096
Global Const $ES_NUMBER = 8192
Global Const $EC_ERR = -1
Global Const $ECM_FIRST = 0X1500
Global Const $EM_CANUNDO = 0xC6
Global Const $EM_CHARFROMPOS = 0xD7
Global Const $EM_EMPTYUNDOBUFFER = 0xCD
Global Const $EM_FMTLINES = 0xC8
Global Const $EM_GETCUEBANNER = ($ECM_FIRST + 2)
Global Const $EM_GETFIRSTVISIBLELINE = 0xCE
Global Const $EM_GETHANDLE = 0xBD
Global Const $EM_GETIMESTATUS = 0xD9
Global Const $EM_GETLIMITTEXT = 0xD5
Global Const $EM_GETLINE = 0xC4
Global Const $EM_GETLINECOUNT = 0xBA
Global Const $EM_GETMARGINS = 0xD4
Global Const $EM_GETMODIFY = 0xB8
Global Const $EM_GETPASSWORDCHAR = 0xD2
Global Const $EM_GETRECT = 0xB2
Global Const $EM_GETSEL = 0xB0
Global Const $EM_GETTHUMB = 0xBE
Global Const $EM_GETWORDBREAKPROC = 0xD1
Global Const $EM_HIDEBALLOONTIP = ($ECM_FIRST + 4)
Global Const $EM_LIMITTEXT = 0xC5
Global Const $EM_LINEFROMCHAR = 0xC9
Global Const $EM_LINEINDEX = 0xBB
Global Const $EM_LINELENGTH = 0xC1
Global Const $EM_LINESCROLL = 0xB6
Global Const $EM_POSFROMCHAR = 0xD6
Global Const $EM_REPLACESEL = 0xC2
Global Const $EM_SCROLL = 0xB5
Global Const $EM_SCROLLCARET = 0x00B7
Global Const $EM_SETCUEBANNER = ($ECM_FIRST + 1)
Global Const $EM_SETHANDLE = 0xBC
Global Const $EM_SETIMESTATUS = 0xD8
Global Const $EM_SETLIMITTEXT = $EM_LIMITTEXT
Global Const $EM_SETMARGINS = 0xD3
Global Const $EM_SETMODIFY = 0xB9
Global Const $EM_SETPASSWORDCHAR = 0xCC
Global Const $EM_SETREADONLY = 0xCF
Global Const $EM_SETRECT = 0xB3
Global Const $EM_SETRECTNP = 0xB4
Global Const $EM_SETSEL = 0xB1
Global Const $EM_SETTABSTOPS = 0xCB
Global Const $EM_SETWORDBREAKPROC = 0xD0
Global Const $EM_SHOWBALLOONTIP = ($ECM_FIRST + 3)
Global Const $EM_UNDO = 0xC7
Global Const $EC_LEFTMARGIN = 0x1
Global Const $EC_RIGHTMARGIN = 0x2
Global Const $EC_USEFONTINFO = 0xFFFF
Global Const $EMSIS_COMPOSITIONSTRING = 0x1
Global Const $EIMES_GETCOMPSTRATONCE = 0x1
Global Const $EIMES_CANCELCOMPSTRINFOCUS = 0x2
Global Const $EIMES_COMPLETECOMPSTRKILLFOCUS = 0x4
Global Const $EN_ALIGN_LTR_EC = 0x700
Global Const $EN_ALIGN_RTL_EC = 0x701
Global Const $EN_CHANGE = 0x300
Global Const $EN_ERRSPACE = 0x500
Global Const $EN_HSCROLL = 0X601
Global Const $EN_KILLFOCUS = 0x200
Global Const $EN_MAXTEXT = 0x501
Global Const $EN_SETFOCUS = 0x100
Global Const $EN_UPDATE = 0x400
Global Const $EN_VSCROLL = 0x602
Global Const $GUI_SS_DEFAULT_EDIT = 0x003010c0
Global Const $GUI_SS_DEFAULT_INPUT = 0x00000080
Global Const $GUI_EVENT_SINGLE = 0
Global Const $GUI_EVENT_ARRAY = 1
Global Const $GUI_EVENT_NONE = 0
Global Const $GUI_EVENT_CLOSE = -3
Global Const $GUI_EVENT_MINIMIZE = -4
Global Const $GUI_EVENT_RESTORE = -5
Global Const $GUI_EVENT_MAXIMIZE = -6
Global Const $GUI_EVENT_PRIMARYDOWN = -7
Global Const $GUI_EVENT_PRIMARYUP = -8
Global Const $GUI_EVENT_SECONDARYDOWN = -9
Global Const $GUI_EVENT_SECONDARYUP = -10
Global Const $GUI_EVENT_MOUSEMOVE = -11
Global Const $GUI_EVENT_RESIZED = -12
Global Const $GUI_EVENT_DROPPED = -13
Global Const $GUI_RUNDEFMSG = 'GUI_RUNDEFMSG'
Global Const $GUI_AVISTOP = 0
Global Const $GUI_AVISTART = 1
Global Const $GUI_AVICLOSE = 2
Global Const $GUI_CHECKED = 1
Global Const $GUI_INDETERMINATE = 2
Global Const $GUI_UNCHECKED = 4
Global Const $GUI_DROPACCEPTED = 8
Global Const $GUI_NODROPACCEPTED = 4096
Global Const $GUI_ACCEPTFILES = $GUI_DROPACCEPTED
Global Const $GUI_SHOW = 16
Global Const $GUI_HIDE = 32
Global Const $GUI_ENABLE = 64
Global Const $GUI_DISABLE = 128
Global Const $GUI_FOCUS = 256
Global Const $GUI_NOFOCUS = 8192
Global Const $GUI_DEFBUTTON = 512
Global Const $GUI_EXPAND = 1024
Global Const $GUI_ONTOP = 2048
Global Const $GUI_FONTNORMAL = 0
Global Const $GUI_FONTITALIC = 2
Global Const $GUI_FONTUNDER = 4
Global Const $GUI_FONTSTRIKE = 8
Global Const $GUI_DOCKAUTO = 0x0001
Global Const $GUI_DOCKLEFT = 0x0002
Global Const $GUI_DOCKRIGHT = 0x0004
Global Const $GUI_DOCKHCENTER = 0x0008
Global Const $GUI_DOCKTOP = 0x0020
Global Const $GUI_DOCKBOTTOM = 0x0040
Global Const $GUI_DOCKVCENTER = 0x0080
Global Const $GUI_DOCKWIDTH = 0x0100
Global Const $GUI_DOCKHEIGHT = 0x0200
Global Const $GUI_DOCKSIZE = 0x0300
Global Const $GUI_DOCKMENUBAR = 0x0220
Global Const $GUI_DOCKSTATEBAR = 0x0240
Global Const $GUI_DOCKALL = 0x0322
Global Const $GUI_DOCKBORDERS = 0x0066
Global Const $GUI_GR_CLOSE = 1
Global Const $GUI_GR_LINE = 2
Global Const $GUI_GR_BEZIER = 4
Global Const $GUI_GR_MOVE = 6
Global Const $GUI_GR_COLOR = 8
Global Const $GUI_GR_RECT = 10
Global Const $GUI_GR_ELLIPSE = 12
Global Const $GUI_GR_PIE = 14
Global Const $GUI_GR_DOT = 16
Global Const $GUI_GR_PIXEL = 18
Global Const $GUI_GR_HINT = 20
Global Const $GUI_GR_REFRESH = 22
Global Const $GUI_GR_PENSIZE = 24
Global Const $GUI_GR_NOBKCOLOR = -2
Global Const $GUI_BKCOLOR_DEFAULT = -1
Global Const $GUI_BKCOLOR_TRANSPARENT = -2
Global Const $GUI_BKCOLOR_LV_ALTERNATE = 0xFE000000
Global Const $GUI_READ_DEFAULT = 0
Global Const $GUI_READ_EXTENDED = 1
Global Const $GUI_CURSOR_NOOVERRIDE = 0
Global Const $GUI_CURSOR_OVERRIDE = 1
Global Const $GUI_WS_EX_PARENTDRAG = 0x00100000
Global Const $LBS_NOTIFY = 0x00000001
Global Const $LBS_SORT = 0x00000002
Global Const $LBS_NOREDRAW = 0x00000004
Global Const $LBS_MULTIPLESEL = 0x00000008
Global Const $LBS_OWNERDRAWFIXED = 0x00000010
Global Const $LBS_OWNERDRAWVARIABLE = 0x00000020
Global Const $LBS_HASSTRINGS = 0x00000040
Global Const $LBS_USETABSTOPS = 0x00000080
Global Const $LBS_NOINTEGRALHEIGHT = 0x00000100
Global Const $LBS_MULTICOLUMN = 0x00000200
Global Const $LBS_WANTKEYBOARDINPUT = 0x00000400
Global Const $LBS_EXTENDEDSEL = 0x00000800
Global Const $LBS_DISABLENOSCROLL = 0x00001000
Global Const $LBS_NODATA = 0x00002000
Global Const $LBS_NOSEL = 0x00004000
Global Const $LBS_COMBOBOX = 0x00008000
Global Const $LBS_STANDARD = 0x00000003
Global Const $GUI_SS_DEFAULT_LIST = 0x00a00003
Global Const $LB_ERR = -1
Global Const $LB_ERRATTRIBUTE = -3
Global Const $LB_ERRREQUIRED = -4
Global Const $LB_ERRSPACE = -2
Global Const $LB_ADDSTRING = 0x0180
Global Const $LB_INSERTSTRING = 0x0181
Global Const $LB_DELETESTRING = 0x0182
Global Const $LB_SELITEMRANGEEX = 0x0183
Global Const $LB_RESETCONTENT = 0x0184
Global Const $LB_SETSEL = 0x0185
Global Const $LB_SETCURSEL = 0x0186
Global Const $LB_GETSEL = 0x0187
Global Const $LB_GETCURSEL = 0x0188
Global Const $LB_GETTEXT = 0x0189
Global Const $LB_GETTEXTLEN = 0x018A
Global Const $LB_GETCOUNT = 0x018B
Global Const $LB_SELECTSTRING = 0x018C
Global Const $LB_DIR = 0x018D
Global Const $LB_GETTOPINDEX = 0x018E
Global Const $LB_FINDSTRING = 0x018F
Global Const $LB_GETSELCOUNT = 0x0190
Global Const $LB_GETSELITEMS = 0x0191
Global Const $LB_SETTABSTOPS = 0x0192
Global Const $LB_GETHORIZONTALEXTENT = 0x0193
Global Const $LB_SETHORIZONTALEXTENT = 0x0194
Global Const $LB_SETCOLUMNWIDTH = 0x0195
Global Const $LB_ADDFILE = 0x0196
Global Const $LB_SETTOPINDEX = 0x0197
Global Const $LB_GETITEMRECT = 0x0198
Global Const $LB_GETITEMDATA = 0x0199
Global Const $LB_SETITEMDATA = 0x019A
Global Const $LB_SELITEMRANGE = 0x019B
Global Const $LB_SETANCHORINDEX = 0x019C
Global Const $LB_GETANCHORINDEX = 0x019D
Global Const $LB_SETCARETINDEX = 0x019E
Global Const $LB_GETCARETINDEX = 0x019F
Global Const $LB_SETITEMHEIGHT = 0x01A0
Global Const $LB_GETITEMHEIGHT = 0x01A1
Global Const $LB_FINDSTRINGEXACT = 0x01A2
Global Const $LB_SETLOCALE = 0x01A5
Global Const $LB_GETLOCALE = 0x01A6
Global Const $LB_SETCOUNT = 0x01A7
Global Const $LB_INITSTORAGE = 0x01A8
Global Const $LB_ITEMFROMPOINT = 0x01A9
Global Const $LB_MULTIPLEADDSTRING = 0x01B1
Global Const $LB_GETLISTBOXINFO = 0x01B2
Global Const $LBN_ERRSPACE = 0xFFFFFFFE
Global Const $LBN_SELCHANGE = 0x00000001
Global Const $LBN_DBLCLK = 0x00000002
Global Const $LBN_SELCANCEL = 0x00000003
Global Const $LBN_SETFOCUS = 0x00000004
Global Const $LBN_KILLFOCUS = 0x00000005
Global Const $LVGS_NORMAL = 0x00000000
Global Const $LVGS_COLLAPSED = 0x00000001
Global Const $LVGS_HIDDEN = 0x00000002
Global Const $LVGS_NOHEADER = 0x00000004
Global Const $LVGS_COLLAPSIBLE = 0x00000008
Global Const $LVGS_FOCUSED = 0x00000010
Global Const $LVGS_SELECTED = 0x00000020
Global Const $LVGS_SUBSETED = 0x00000040
Global Const $LVGS_SUBSETLINKFOCUSED = 0x00000080
Global Const $LVGGR_GROUP = 0
Global Const $LVGGR_HEADER = 1
Global Const $LVGGR_LABEL = 2
Global Const $LVGGR_SUBSETLINK = 3
Global Const $LV_ERR = -1
Global Const $LVBKIF_SOURCE_NONE = 0x00000000
Global Const $LVBKIF_SOURCE_HBITMAP = 0x00000001
Global Const $LVBKIF_SOURCE_URL = 0x00000002
Global Const $LVBKIF_SOURCE_MASK = 0x00000003
Global Const $LVBKIF_STYLE_NORMAL = 0x00000000
Global Const $LVBKIF_STYLE_TILE = 0x00000010
Global Const $LVBKIF_STYLE_MASK = 0x00000010
Global Const $LVBKIF_FLAG_TILEOFFSET = 0x00000100
Global Const $LVBKIF_TYPE_WATERMARK = 0x10000000
Global Const $LV_VIEW_DETAILS = 0x0001
Global Const $LV_VIEW_ICON = 0x0000
Global Const $LV_VIEW_LIST = 0x0003
Global Const $LV_VIEW_SMALLICON = 0x0002
Global Const $LV_VIEW_TILE = 0x0004
Global Const $LVA_ALIGNLEFT = 0x0001
Global Const $LVA_ALIGNTOP = 0x0002
Global Const $LVA_DEFAULT = 0x0000
Global Const $LVA_SNAPTOGRID = 0x0005
Global Const $LVCDI_ITEM = 0x00000000
Global Const $LVCDI_GROUP = 0x00000001
Global Const $LVCF_ALLDATA = 0X0000003F
Global Const $LVCF_FMT = 0x0001
Global Const $LVCF_IMAGE = 0x0010
Global Const $LVCFMT_JUSTIFYMASK = 0x0003
Global Const $LVCF_TEXT = 0x0004
Global Const $LVCF_WIDTH = 0x0002
Global Const $LVCFMT_BITMAP_ON_RIGHT = 0x1000
Global Const $LVCFMT_CENTER = 0x0002
Global Const $LVCFMT_COL_HAS_IMAGES = 0x8000
Global Const $LVCFMT_IMAGE = 0x0800
Global Const $LVCFMT_LEFT = 0x0000
Global Const $LVCFMT_RIGHT = 0x0001
Global Const $LVCFMT_LINE_BREAK = 0x100000
Global Const $LVCFMT_FILL = 0x200000
Global Const $LVCFMT_WRAP = 0x400000
Global Const $LVCFMT_NO_TITLE = 0x800000
Global Const $LVCFMT_TILE_PLACEMENTMASK = BitOR($LVCFMT_LINE_BREAK, $LVCFMT_FILL)
Global Const $LVFI_NEARESTXY = 0x0040
Global Const $LVFI_PARAM = 0x0001
Global Const $LVFI_PARTIAL = 0x0008
Global Const $LVFI_STRING = 0x0002
Global Const $LVFI_SUBSTRING = 0x0004
Global Const $LVFI_WRAP = 0x0020
Global Const $LVGA_FOOTER_LEFT = 0x00000008
Global Const $LVGA_FOOTER_CENTER = 0x00000010
Global Const $LVGA_FOOTER_RIGHT = 0x00000020
Global Const $LVGA_HEADER_LEFT = 0x00000001
Global Const $LVGA_HEADER_CENTER = 0x00000002
Global Const $LVGA_HEADER_RIGHT = 0x00000004
Global Const $LVGF_ALIGN = 0x00000008
Global Const $LVGF_DESCRIPTIONTOP = 0x00000400
Global Const $LVGF_DESCRIPTIONBOTTOM = 0x00000800
Global Const $LVGF_EXTENDEDIMAGE = 0x00002000
Global Const $LVGF_FOOTER = 0x00000002
Global Const $LVGF_GROUPID = 0x00000010
Global Const $LVGF_HEADER = 0x00000001
Global Const $LVGF_ITEMS = 0x00004000
Global Const $LVGF_NONE = 0x00000000
Global Const $LVGF_STATE = 0x00000004
Global Const $LVGF_SUBSET = 0x00008000
Global Const $LVGF_SUBSETITEMS = 0x00010000
Global Const $LVGF_SUBTITLE = 0x00000100
Global Const $LVGF_TASK = 0x00000200
Global Const $LVGF_TITLEIMAGE = 0x00001000
Global Const $LVHT_ABOVE = 0x00000008
Global Const $LVHT_BELOW = 0x00000010
Global Const $LVHT_NOWHERE = 0x00000001
Global Const $LVHT_ONITEMICON = 0x00000002
Global Const $LVHT_ONITEMLABEL = 0x00000004
Global Const $LVHT_ONITEMSTATEICON = 0x00000008
Global Const $LVHT_TOLEFT = 0x00000040
Global Const $LVHT_TORIGHT = 0x00000020
Global Const $LVHT_ONITEM = BitOR($LVHT_ONITEMICON, $LVHT_ONITEMLABEL, $LVHT_ONITEMSTATEICON)
Global Const $LVHT_EX_GROUP_HEADER = 0x10000000
Global Const $LVHT_EX_GROUP_FOOTER = 0x20000000
Global Const $LVHT_EX_GROUP_COLLAPSE = 0x40000000
Global Const $LVHT_EX_GROUP_BACKGROUND = 0x80000000
Global Const $LVHT_EX_GROUP_STATEICON = 0x01000000
Global Const $LVHT_EX_GROUP_SUBSETLINK = 0x02000000
Global Const $LVHT_EX_GROUP = BitOR($LVHT_EX_GROUP_BACKGROUND, $LVHT_EX_GROUP_COLLAPSE, $LVHT_EX_GROUP_FOOTER, $LVHT_EX_GROUP_HEADER, $LVHT_EX_GROUP_STATEICON, $LVHT_EX_GROUP_SUBSETLINK)
Global Const $LVHT_EX_ONCONTENTS = 0x04000000
Global Const $LVHT_EX_FOOTER = 0x08000000
Global Const $LVIF_COLFMT = 0x00010000
Global Const $LVIF_COLUMNS = 0x00000200
Global Const $LVIF_GROUPID = 0x00000100
Global Const $LVIF_IMAGE = 0x00000002
Global Const $LVIF_INDENT = 0x00000010
Global Const $LVIF_NORECOMPUTE = 0x00000800
Global Const $LVIF_PARAM = 0x00000004
Global Const $LVIF_STATE = 0x00000008
Global Const $LVIF_TEXT = 0x00000001
Global Const $LVIM_AFTER = 0x00000001
Global Const $LVIR_BOUNDS = 0
Global Const $LVIR_ICON = 1
Global Const $LVIR_LABEL = 2
Global Const $LVIR_SELECTBOUNDS = 3
Global Const $LVIS_CUT = 0x0004
Global Const $LVIS_DROPHILITED = 0x0008
Global Const $LVIS_FOCUSED = 0x0001
Global Const $LVIS_OVERLAYMASK = 0x0F00
Global Const $LVIS_SELECTED = 0x0002
Global Const $LVIS_STATEIMAGEMASK = 0xF000
Global Const $LVS_ALIGNLEFT = 0x0800
Global Const $LVS_ALIGNMASK = 0x0c00
Global Const $LVS_ALIGNTOP = 0x0000
Global Const $LVS_AUTOARRANGE = 0x0100
Global Const $LVS_DEFAULT = 0x0000000D
Global Const $LVS_EDITLABELS = 0x0200
Global Const $LVS_ICON = 0x0000
Global Const $LVS_LIST = 0x0003
Global Const $LVS_NOCOLUMNHEADER = 0x4000
Global Const $LVS_NOLABELWRAP = 0x0080
Global Const $LVS_NOSCROLL = 0x2000
Global Const $LVS_NOSORTHEADER = 0x8000
Global Const $LVS_OWNERDATA = 0x1000
Global Const $LVS_OWNERDRAWFIXED = 0x0400
Global Const $LVS_REPORT = 0x0001
Global Const $LVS_SHAREIMAGELISTS = 0x0040
Global Const $LVS_SHOWSELALWAYS = 0x0008
Global Const $LVS_SINGLESEL = 0x0004
Global Const $LVS_SMALLICON = 0x0002
Global Const $LVS_SORTASCENDING = 0x0010
Global Const $LVS_SORTDESCENDING = 0x0020
Global Const $LVS_TYPEMASK = 0x0003
Global Const $LVS_TYPESTYLEMASK = 0xfc00
Global Const $LVS_EX_AUTOAUTOARRANGE = 0x01000000
Global Const $LVS_EX_AUTOCHECKSELECT = 0x08000000
Global Const $LVS_EX_AUTOSIZECOLUMNS = 0x10000000
Global Const $LVS_EX_BORDERSELECT = 0x00008000
Global Const $LVS_EX_CHECKBOXES = 0x00000004
Global Const $LVS_EX_COLUMNOVERFLOW = 0x80000000
Global Const $LVS_EX_COLUMNSNAPPOINTS = 0x40000000
Global Const $LVS_EX_DOUBLEBUFFER = 0x00010000
Global Const $LVS_EX_FLATSB = 0x00000100
Global Const $LVS_EX_FULLROWSELECT = 0x00000020
Global Const $LVS_EX_GRIDLINES = 0x00000001
Global Const $LVS_EX_HEADERDRAGDROP = 0x00000010
Global Const $LVS_EX_HEADERINALLVIEWS = 0x02000000
Global Const $LVS_EX_HIDELABELS = 0x20000
Global Const $LVS_EX_INFOTIP = 0x00000400
Global Const $LVS_EX_JUSTIFYCOLUMNS = 0x00200000
Global Const $LVS_EX_LABELTIP = 0x00004000
Global Const $LVS_EX_MULTIWORKAREAS = 0x00002000
Global Const $LVS_EX_ONECLICKACTIVATE = 0x00000040
Global Const $LVS_EX_REGIONAL = 0x00000200
Global Const $LVS_EX_SIMPLESELECT = 0x00100000
Global Const $LVS_EX_SNAPTOGRID = 0x00080000
Global Const $LVS_EX_SUBITEMIMAGES = 0x00000002
Global Const $LVS_EX_TRACKSELECT = 0x00000008
Global Const $LVS_EX_TRANSPARENTBKGND = 0x00400000
Global Const $LVS_EX_TRANSPARENTSHADOWTEXT = 0x00800000
Global Const $LVS_EX_TWOCLICKACTIVATE = 0x00000080
Global Const $LVS_EX_UNDERLINECOLD = 0x00001000
Global Const $LVS_EX_UNDERLINEHOT = 0x00000800
Global Const $GUI_SS_DEFAULT_LISTVIEW = BitOR($LVS_SHOWSELALWAYS, $LVS_SINGLESEL)
Global Const $LVM_FIRST = 0x1000
Global Const $LVM_APPROXIMATEVIEWRECT = ($LVM_FIRST + 64)
Global Const $LVM_ARRANGE = ($LVM_FIRST + 22)
Global Const $LVM_CANCELEDITLABEL = ($LVM_FIRST + 179)
Global Const $LVM_CREATEDRAGIMAGE = ($LVM_FIRST + 33)
Global Const $LVM_DELETEALLITEMS = ($LVM_FIRST + 9)
Global Const $LVM_DELETECOLUMN = ($LVM_FIRST + 28)
Global Const $LVM_DELETEITEM = ($LVM_FIRST + 8)
Global Const $LVM_EDITLABELA = ($LVM_FIRST + 23)
Global Const $LVM_EDITLABELW = ($LVM_FIRST + 118)
Global Const $LVM_EDITLABEL = $LVM_EDITLABELA
Global Const $LVM_ENABLEGROUPVIEW = ($LVM_FIRST + 157)
Global Const $LVM_ENSUREVISIBLE = ($LVM_FIRST + 19)
Global Const $LVM_FINDITEM = ($LVM_FIRST + 13)
Global Const $LVM_GETBKCOLOR = ($LVM_FIRST + 0)
Global Const $LVM_GETBKIMAGEA = ($LVM_FIRST + 69)
Global Const $LVM_GETBKIMAGEW = ($LVM_FIRST + 139)
Global Const $LVM_GETCALLBACKMASK = ($LVM_FIRST + 10)
Global Const $LVM_GETCOLUMNA = ($LVM_FIRST + 25)
Global Const $LVM_GETCOLUMNW = ($LVM_FIRST + 95)
Global Const $LVM_GETCOLUMNORDERARRAY = ($LVM_FIRST + 59)
Global Const $LVM_GETCOLUMNWIDTH = ($LVM_FIRST + 29)
Global Const $LVM_GETCOUNTPERPAGE = ($LVM_FIRST + 40)
Global Const $LVM_GETEDITCONTROL = ($LVM_FIRST + 24)
Global Const $LVM_GETEMPTYTEXT = ($LVM_FIRST + 204)
Global Const $LVM_GETEXTENDEDLISTVIEWSTYLE = ($LVM_FIRST + 55)
Global Const $LVM_GETFOCUSEDGROUP = ($LVM_FIRST + 93)
Global Const $LVM_GETFOOTERINFO = ($LVM_FIRST + 206)
Global Const $LVM_GETFOOTERITEM = ($LVM_FIRST + 208)
Global Const $LVM_GETFOOTERITEMRECT = ($LVM_FIRST + 207)
Global Const $LVM_GETFOOTERRECT = ($LVM_FIRST + 205)
Global Const $LVM_GETGROUPCOUNT = ($LVM_FIRST + 152)
Global Const $LVM_GETGROUPINFO = ($LVM_FIRST + 149)
Global Const $LVM_GETGROUPINFOBYINDEX = ($LVM_FIRST + 153)
Global Const $LVM_GETGROUPMETRICS = ($LVM_FIRST + 156)
Global Const $LVM_GETGROUPRECT = ($LVM_FIRST + 98)
Global Const $LVM_GETGROUPSTATE = ($LVM_FIRST + 92)
Global Const $LVM_GETHEADER = ($LVM_FIRST + 31)
Global Const $LVM_GETHOTCURSOR = ($LVM_FIRST + 63)
Global Const $LVM_GETHOTITEM = ($LVM_FIRST + 61)
Global Const $LVM_GETHOVERTIME = ($LVM_FIRST + 72)
Global Const $LVM_GETIMAGELIST = ($LVM_FIRST + 2)
Global Const $LVM_GETINSERTMARK = ($LVM_FIRST + 167)
Global Const $LVM_GETINSERTMARKCOLOR = ($LVM_FIRST + 171)
Global Const $LVM_GETINSERTMARKRECT = ($LVM_FIRST + 169)
Global Const $LVM_GETISEARCHSTRINGA = ($LVM_FIRST + 52)
Global Const $LVM_GETISEARCHSTRINGW = ($LVM_FIRST + 117)
Global Const $LVM_GETITEMA = ($LVM_FIRST + 5)
Global Const $LVM_GETITEMW = ($LVM_FIRST + 75)
Global Const $LVM_GETITEMCOUNT = ($LVM_FIRST + 4)
Global Const $LVM_GETITEMINDEXRECT = ($LVM_FIRST + 209)
Global Const $LVM_GETITEMPOSITION = ($LVM_FIRST + 16)
Global Const $LVM_GETITEMRECT = ($LVM_FIRST + 14)
Global Const $LVM_GETITEMSPACING = ($LVM_FIRST + 51)
Global Const $LVM_GETITEMSTATE = ($LVM_FIRST + 44)
Global Const $LVM_GETITEMTEXTA = ($LVM_FIRST + 45)
Global Const $LVM_GETITEMTEXTW = ($LVM_FIRST + 115)
Global Const $LVM_GETNEXTITEM = ($LVM_FIRST + 12)
Global Const $LVM_GETNEXTITEMINDEX = ($LVM_FIRST + 211)
Global Const $LVM_GETNUMBEROFWORKAREAS = ($LVM_FIRST + 73)
Global Const $LVM_GETORIGIN = ($LVM_FIRST + 41)
Global Const $LVM_GETOUTLINECOLOR = ($LVM_FIRST + 176)
Global Const $LVM_GETSELECTEDCOLUMN = ($LVM_FIRST + 174)
Global Const $LVM_GETSELECTEDCOUNT = ($LVM_FIRST + 50)
Global Const $LVM_GETSELECTIONMARK = ($LVM_FIRST + 66)
Global Const $LVM_GETSTRINGWIDTHA = ($LVM_FIRST + 17)
Global Const $LVM_GETSTRINGWIDTHW = ($LVM_FIRST + 87)
Global Const $LVM_GETSUBITEMRECT = ($LVM_FIRST + 56)
Global Const $LVM_GETTEXTBKCOLOR = ($LVM_FIRST + 37)
Global Const $LVM_GETTEXTCOLOR = ($LVM_FIRST + 35)
Global Const $LVM_GETTILEINFO = ($LVM_FIRST + 165)
Global Const $LVM_GETTILEVIEWINFO = ($LVM_FIRST + 163)
Global Const $LVM_GETTOOLTIPS = ($LVM_FIRST + 78)
Global Const $LVM_GETTOPINDEX = ($LVM_FIRST + 39)
Global Const $LVM_GETUNICODEFORMAT = 0x2000 + 6
Global Const $LVM_GETVIEW = ($LVM_FIRST + 143)
Global Const $LVM_GETVIEWRECT = ($LVM_FIRST + 34)
Global Const $LVM_GETWORKAREAS = ($LVM_FIRST + 70)
Global Const $LVM_HASGROUP = ($LVM_FIRST + 161)
Global Const $LVM_HITTEST = ($LVM_FIRST + 18)
Global Const $LVM_INSERTCOLUMNA = ($LVM_FIRST + 27)
Global Const $LVM_INSERTCOLUMNW = ($LVM_FIRST + 97)
Global Const $LVM_INSERTGROUP = ($LVM_FIRST + 145)
Global Const $LVM_INSERTGROUPSORTED = ($LVM_FIRST + 159)
Global Const $LVM_INSERTITEMA = ($LVM_FIRST + 7)
Global Const $LVM_INSERTITEMW = ($LVM_FIRST + 77)
Global Const $LVM_INSERTMARKHITTEST = ($LVM_FIRST + 168)
Global Const $LVM_ISGROUPVIEWENABLED = ($LVM_FIRST + 175)
Global Const $LVM_ISITEMVISIBLE = ($LVM_FIRST + 182)
Global Const $LVM_MAPIDTOINDEX = ($LVM_FIRST + 181)
Global Const $LVM_MAPINDEXTOID = ($LVM_FIRST + 180)
Global Const $LVM_MOVEGROUP = ($LVM_FIRST + 151)
Global Const $LVM_REDRAWITEMS = ($LVM_FIRST + 21)
Global Const $LVM_REMOVEALLGROUPS = ($LVM_FIRST + 160)
Global Const $LVM_REMOVEGROUP = ($LVM_FIRST + 150)
Global Const $LVM_SCROLL = ($LVM_FIRST + 20)
Global Const $LVM_SETBKCOLOR = ($LVM_FIRST + 1)
Global Const $LVM_SETBKIMAGEA = ($LVM_FIRST + 68)
Global Const $LVM_SETBKIMAGEW = ($LVM_FIRST + 138)
Global Const $LVM_SETCALLBACKMASK = ($LVM_FIRST + 11)
Global Const $LVM_SETCOLUMNA = ($LVM_FIRST + 26)
Global Const $LVM_SETCOLUMNW = ($LVM_FIRST + 96)
Global Const $LVM_SETCOLUMNORDERARRAY = ($LVM_FIRST + 58)
Global Const $LVM_SETCOLUMNWIDTH = ($LVM_FIRST + 30)
Global Const $LVM_SETEXTENDEDLISTVIEWSTYLE = ($LVM_FIRST + 54)
Global Const $LVM_SETGROUPINFO = ($LVM_FIRST + 147)
Global Const $LVM_SETGROUPMETRICS = ($LVM_FIRST + 155)
Global Const $LVM_SETHOTCURSOR = ($LVM_FIRST + 62)
Global Const $LVM_SETHOTITEM = ($LVM_FIRST + 60)
Global Const $LVM_SETHOVERTIME = ($LVM_FIRST + 71)
Global Const $LVM_SETICONSPACING = ($LVM_FIRST + 53)
Global Const $LVM_SETIMAGELIST = ($LVM_FIRST + 3)
Global Const $LVM_SETINFOTIP = ($LVM_FIRST + 173)
Global Const $LVM_SETINSERTMARK = ($LVM_FIRST + 166)
Global Const $LVM_SETINSERTMARKCOLOR = ($LVM_FIRST + 170)
Global Const $LVM_SETITEMA = ($LVM_FIRST + 6)
Global Const $LVM_SETITEMW = ($LVM_FIRST + 76)
Global Const $LVM_SETITEMCOUNT = ($LVM_FIRST + 47)
Global Const $LVM_SETITEMINDEXSTATE = ($LVM_FIRST + 210)
Global Const $LVM_SETITEMPOSITION = ($LVM_FIRST + 15)
Global Const $LVM_SETITEMPOSITION32 = ($LVM_FIRST + 49)
Global Const $LVM_SETITEMSTATE = ($LVM_FIRST + 43)
Global Const $LVM_SETITEMTEXTA = ($LVM_FIRST + 46)
Global Const $LVM_SETITEMTEXTW = ($LVM_FIRST + 116)
Global Const $LVM_SETOUTLINECOLOR = ($LVM_FIRST + 177)
Global Const $LVM_SETSELECTEDCOLUMN = ($LVM_FIRST + 140)
Global Const $LVM_SETSELECTIONMARK = ($LVM_FIRST + 67)
Global Const $LVM_SETTEXTBKCOLOR = ($LVM_FIRST + 38)
Global Const $LVM_SETTEXTCOLOR = ($LVM_FIRST + 36)
Global Const $LVM_SETTILEINFO = ($LVM_FIRST + 164)
Global Const $LVM_SETTILEVIEWINFO = ($LVM_FIRST + 162)
Global Const $LVM_SETTILEWIDTH = ($LVM_FIRST + 141)
Global Const $LVM_SETTOOLTIPS = ($LVM_FIRST + 74)
Global Const $LVM_SETUNICODEFORMAT = 0x2000 + 5
Global Const $LVM_SETVIEW = ($LVM_FIRST + 142)
Global Const $LVM_SETWORKAREAS = ($LVM_FIRST + 65)
Global Const $LVM_SORTGROUPS = ($LVM_FIRST + 158)
Global Const $LVM_SORTITEMS = ($LVM_FIRST + 48)
Global Const $LVM_SORTITEMSEX = ($LVM_FIRST + 81)
Global Const $LVM_SUBITEMHITTEST = ($LVM_FIRST + 57)
Global Const $LVM_UPDATE = ($LVM_FIRST + 42)
Global Const $LVN_FIRST = -100
Global Const $LVN_LAST = -199
Global Const $LVN_BEGINDRAG = ($LVN_FIRST - 9)
Global Const $LVN_BEGINLABELEDITA = ($LVN_FIRST - 5)
Global Const $LVN_BEGINLABELEDITW = ($LVN_FIRST - 75)
Global Const $LVN_BEGINRDRAG = ($LVN_FIRST - 11)
Global Const $LVN_BEGINSCROLL = ($LVN_FIRST - 80)
Global Const $LVN_COLUMNCLICK = ($LVN_FIRST - 8)
Global Const $LVN_COLUMNDROPDOWN = ($LVN_FIRST - 64)
Global Const $LVN_COLUMNOVERFLOWCLICK = ($LVN_FIRST - 66)
Global Const $LVN_DELETEALLITEMS = ($LVN_FIRST - 4)
Global Const $LVN_DELETEITEM = ($LVN_FIRST - 3)
Global Const $LVN_ENDLABELEDITA = ($LVN_FIRST - 6)
Global Const $LVN_ENDLABELEDITW = ($LVN_FIRST - 76)
Global Const $LVN_ENDSCROLL = ($LVN_FIRST - 81)
Global Const $LVN_GETDISPINFOA = ($LVN_FIRST - 50)
Global Const $LVN_GETDISPINFOW = ($LVN_FIRST - 77)
Global Const $LVN_GETDISPINFO = $LVN_GETDISPINFOA
Global Const $LVN_GETEMPTYMARKUP = ($LVN_FIRST - 87)
Global Const $LVN_GETINFOTIPA = ($LVN_FIRST - 57)
Global Const $LVN_GETINFOTIPW = ($LVN_FIRST - 58)
Global Const $LVN_HOTTRACK = ($LVN_FIRST - 21)
Global Const $LVN_INCREMENTALSEARCHA = ($LVN_FIRST - 62)
Global Const $LVN_INCREMENTALSEARCHW = ($LVN_FIRST - 63)
Global Const $LVN_INSERTITEM = ($LVN_FIRST - 2)
Global Const $LVN_ITEMACTIVATE = ($LVN_FIRST - 14)
Global Const $LVN_ITEMCHANGED = ($LVN_FIRST - 1)
Global Const $LVN_ITEMCHANGING = ($LVN_FIRST - 0)
Global Const $LVN_KEYDOWN = ($LVN_FIRST - 55)
Global Const $LVN_LINKCLICK = ($LVN_FIRST - 84)
Global Const $LVN_MARQUEEBEGIN = ($LVN_FIRST - 56)
Global Const $LVN_ODCACHEHINT = ($LVN_FIRST - 13)
Global Const $LVN_ODFINDITEMA = ($LVN_FIRST - 52)
Global Const $LVN_ODFINDITEMW = ($LVN_FIRST - 79)
Global Const $LVN_ODFINDITEM = $LVN_ODFINDITEMA
Global Const $LVN_ODSTATECHANGED = ($LVN_FIRST - 15)
Global Const $LVN_SETDISPINFOA = ($LVN_FIRST - 51)
Global Const $LVN_SETDISPINFOW = ($LVN_FIRST - 78)
Global Const $LVNI_ABOVE = 0x0100
Global Const $LVNI_BELOW = 0x0200
Global Const $LVNI_TOLEFT = 0x0400
Global Const $LVNI_TORIGHT = 0x0800
Global Const $LVNI_ALL = 0x0000
Global Const $LVNI_CUT = 0x0004
Global Const $LVNI_DROPHILITED = 0x0008
Global Const $LVNI_FOCUSED = 0x0001
Global Const $LVNI_SELECTED = 0x0002
Global Const $LVSCW_AUTOSIZE = -1
Global Const $LVSCW_AUTOSIZE_USEHEADER = -2
Global Const $LVSICF_NOINVALIDATEALL = 0x00000001
Global Const $LVSICF_NOSCROLL = 0x00000002
Global Const $LVSIL_NORMAL = 0
Global Const $LVSIL_SMALL = 1
Global Const $LVSIL_STATE = 2
Global Const $LVFN_DIR_LEFT = 0
Global Const $LVFN_DIR_RIGHT = 1
Global Const $LVFN_DIR_UP = 2
Global Const $LVFN_DIR_DOWN = 3
Global Const $LVFN_DIR_START = 4
Global Const $LVFN_DIR_MEND = 5
Global Const $LVFN_DIR_PRIOR = 6
Global Const $LVFN_DIR_NEXT = 7
Global Const $PBS_MARQUEE = 0x00000008
Global Const $PBS_SMOOTH = 1
Global Const $PBS_SMOOTHREVERSE = 0x10
Global Const $PBS_VERTICAL = 4
Global Const $GUI_SS_DEFAULT_PROGRESS = 0
Global Const $__PROGRESSBARCONSTANT_WM_USER = 0X400
Global Const $PBM_DELTAPOS = $__PROGRESSBARCONSTANT_WM_USER + 3
Global Const $PBM_GETBARCOLOR = 0x040F
Global Const $PBM_GETBKCOLOR = 0x040E
Global Const $PBM_GETPOS = $__PROGRESSBARCONSTANT_WM_USER + 8
Global Const $PBM_GETRANGE = $__PROGRESSBARCONSTANT_WM_USER + 7
Global Const $PBM_GETSTATE = 0x0411
Global Const $PBM_GETSTEP = 0x040D
Global Const $PBM_SETBARCOLOR = $__PROGRESSBARCONSTANT_WM_USER + 9
Global Const $PBM_SETBKCOLOR = 0x2000 + 1
Global Const $PBM_SETMARQUEE = $__PROGRESSBARCONSTANT_WM_USER + 10
Global Const $PBM_SETPOS = $__PROGRESSBARCONSTANT_WM_USER + 2
Global Const $PBM_SETRANGE = $__PROGRESSBARCONSTANT_WM_USER + 1
Global Const $PBM_SETRANGE32 = $__PROGRESSBARCONSTANT_WM_USER + 6
Global Const $PBM_SETSTATE = 0x0410
Global Const $PBM_SETSTEP = $__PROGRESSBARCONSTANT_WM_USER + 4
Global Const $PBM_STEPIT = $__PROGRESSBARCONSTANT_WM_USER + 5
Global Const $__RICHEDITCONSTANT_WM_USER = 0x400
Global Const $EM_AUTOURLDETECT = $__RICHEDITCONSTANT_WM_USER + 91
Global Const $EM_CANPASTE = $__RICHEDITCONSTANT_WM_USER + 50
Global Const $EM_CANREDO = $__RICHEDITCONSTANT_WM_USER + 85
Global Const $EM_DISPLAYBAND = $__RICHEDITCONSTANT_WM_USER + 51
Global Const $EM_EXGETSEL = $__RICHEDITCONSTANT_WM_USER + 52
Global Const $EM_EXLIMITTEXT = $__RICHEDITCONSTANT_WM_USER + 53
Global Const $EM_EXLINEFROMCHAR = $__RICHEDITCONSTANT_WM_USER + 54
Global Const $EM_EXSETSEL = $__RICHEDITCONSTANT_WM_USER + 55
Global Const $EM_FINDTEXT = $__RICHEDITCONSTANT_WM_USER + 56
Global Const $EM_FINDTEXTEX = $__RICHEDITCONSTANT_WM_USER + 79
Global Const $EM_FINDTEXTEXW = $__RICHEDITCONSTANT_WM_USER + 124
Global Const $EM_FINDTEXTW = $__RICHEDITCONSTANT_WM_USER + 123
Global Const $EM_FINDWORDBREAK = $__RICHEDITCONSTANT_WM_USER + 76
Global Const $EM_FORMATRANGE = $__RICHEDITCONSTANT_WM_USER + 57
Global Const $EM_GETAUTOURLDETECT = $__RICHEDITCONSTANT_WM_USER + 92
Global Const $EM_GETBIDIOPTIONS = $__RICHEDITCONSTANT_WM_USER + 201
Global Const $EM_GETCHARFORMAT = $__RICHEDITCONSTANT_WM_USER + 58
Global Const $EM_GETEDITSTYLE = $__RICHEDITCONSTANT_WM_USER + 205
Global Const $EM_GETEVENTMASK = $__RICHEDITCONSTANT_WM_USER + 59
Global Const $EM_GETIMECOLOR = $__RICHEDITCONSTANT_WM_USER + 105
Global Const $EM_GETIMECOMPMODE = $__RICHEDITCONSTANT_WM_USER + 122
Global Const $EM_GETIMEMODEBIAS = $__RICHEDITCONSTANT_WM_USER + 127
Global Const $EM_GETIMEOPTIONS = $__RICHEDITCONSTANT_WM_USER + 107
Global Const $EM_GETLANGOPTIONS = $__RICHEDITCONSTANT_WM_USER + 121
Global Const $EM_GETOPTIONS = $__RICHEDITCONSTANT_WM_USER + 78
Global Const $EM_GETPARAFORMAT = $__RICHEDITCONSTANT_WM_USER + 61
Global Const $EM_GETPUNCTUATION = $__RICHEDITCONSTANT_WM_USER + 101
Global Const $EM_GETREDONAME = $__RICHEDITCONSTANT_WM_USER + 87
Global Const $EM_GETSCROLLPOS = $__RICHEDITCONSTANT_WM_USER + 221
Global Const $EM_GETTABLEPARMS = $__RICHEDITCONSTANT_WM_USER + 265
Global Const $EM_GETSELTEXT = $__RICHEDITCONSTANT_WM_USER + 62
Global Const $EM_GETTEXTEX = $__RICHEDITCONSTANT_WM_USER + 94
Global Const $EM_GETTEXTLENGTHEX = $__RICHEDITCONSTANT_WM_USER + 95
Global Const $EM_GETTEXTMODE = $__RICHEDITCONSTANT_WM_USER + 90
Global Const $EM_GETTEXTRANGE = $__RICHEDITCONSTANT_WM_USER + 75
Global Const $EM_GETTYPOGRAPHYOPTIONS = $__RICHEDITCONSTANT_WM_USER + 203
Global Const $EM_GETUNDONAME = $__RICHEDITCONSTANT_WM_USER + 86
Global Const $EM_GETWORDBREAKPROCEX = $__RICHEDITCONSTANT_WM_USER + 80
Global Const $EM_GETWORDWRAPMODE = $__RICHEDITCONSTANT_WM_USER + 103
Global Const $EM_GETZOOM = $__RICHEDITCONSTANT_WM_USER + 224
Global Const $EM_HIDESELECTION = $__RICHEDITCONSTANT_WM_USER + 63
Global Const $EM_INSERTTABLE = $__RICHEDITCONSTANT_WM_USER + 232
Global Const $EM_PASTESPECIAL = $__RICHEDITCONSTANT_WM_USER + 64
Global Const $EM_RECONVERSION = $__RICHEDITCONSTANT_WM_USER + 125
Global Const $EM_REDO = $__RICHEDITCONSTANT_WM_USER + 84
Global Const $EM_REQUESTRESIZE = $__RICHEDITCONSTANT_WM_USER + 65
Global Const $EM_SELECTIONTYPE = $__RICHEDITCONSTANT_WM_USER + 66
Global Const $EM_SETBIDIOPTIONS = $__RICHEDITCONSTANT_WM_USER + 200
Global Const $EM_SETBKGNDCOLOR = $__RICHEDITCONSTANT_WM_USER + 67
Global Const $EM_SETCHARFORMAT = $__RICHEDITCONSTANT_WM_USER + 68
Global Const $EM_SETEDITSTYLE = $__RICHEDITCONSTANT_WM_USER + 204
Global Const $EM_SETEVENTMASK = $__RICHEDITCONSTANT_WM_USER + 69
Global Const $EM_SETFONTSIZE = $__RICHEDITCONSTANT_WM_USER + 223
Global Const $EM_SETIMECOLOR = $__RICHEDITCONSTANT_WM_USER + 104
Global Const $EM_SETIMEMODEBIAS = $__RICHEDITCONSTANT_WM_USER + 126
Global Const $EM_SETIMEOPTIONS = $__RICHEDITCONSTANT_WM_USER + 106
Global Const $EM_SETLANGOPTIONS = $__RICHEDITCONSTANT_WM_USER + 120
Global Const $EM_SETOLECALLBACK = $__RICHEDITCONSTANT_WM_USER + 70
Global Const $EM_SETOPTIONS = $__RICHEDITCONSTANT_WM_USER + 77
Global Const $EM_SETPALETTE = $__RICHEDITCONSTANT_WM_USER + 93
Global Const $EM_SETPARAFORMAT = $__RICHEDITCONSTANT_WM_USER + 71
Global Const $EM_SETPUNCTUATION = $__RICHEDITCONSTANT_WM_USER + 100
Global Const $EM_SETSCROLLPOS = $__RICHEDITCONSTANT_WM_USER + 222
Global Const $EM_SETTABLEPARMS = $__RICHEDITCONSTANT_WM_USER + 307
Global Const $EM_SETTARGETDEVICE = $__RICHEDITCONSTANT_WM_USER + 72
Global Const $EM_SETTEXTEX = $__RICHEDITCONSTANT_WM_USER + 97
Global Const $EM_SETTEXTMODE = $__RICHEDITCONSTANT_WM_USER + 89
Global Const $EM_SETTYPOGRAPHYOPTIONS = $__RICHEDITCONSTANT_WM_USER + 202
Global Const $EM_SETUNDOLIMIT = $__RICHEDITCONSTANT_WM_USER + 82
Global Const $EM_SETWORDBREAKPROCEX = $__RICHEDITCONSTANT_WM_USER + 81
Global Const $EM_SETWORDWRAPMODE = $__RICHEDITCONSTANT_WM_USER + 102
Global Const $EM_SETZOOM = $__RICHEDITCONSTANT_WM_USER + 225
Global Const $EM_SHOWSCROLLBAR = $__RICHEDITCONSTANT_WM_USER + 96
Global Const $EM_STOPGROUPTYPING = $__RICHEDITCONSTANT_WM_USER + 88
Global Const $EM_STREAMIN = $__RICHEDITCONSTANT_WM_USER + 73
Global Const $EM_STREAMOUT = $__RICHEDITCONSTANT_WM_USER + 74
Global Const $EN_ALIGNLTR = 0X710
Global Const $EN_ALIGNRTL = 0X711
Global Const $EN_CORRECTTEXT = 0X705
Global Const $EN_DRAGDROPDONE = 0X70c
Global Const $EN_DROPFILES = 0X703
Global Const $EN_IMECHANGE = 0X707
Global Const $EN_LINK = 0X70b
Global Const $EN_MSGFILTER = 0X700
Global Const $EN_OBJECTPOSITIONS = 0X70a
Global Const $EN_OLEOPFAILED = 0X709
Global Const $EN_PROTECTED = 0X704
Global Const $EN_REQUESTRESIZE = 0X701
Global Const $EN_SAVECLIPBOARD = 0X708
Global Const $EN_SELCHANGE = 0X702
Global Const $EN_STOPNOUNDO = 0X706
Global Const $ENM_CHANGE = 0x1
Global Const $ENM_CORRECTTEXT = 0x400000
Global Const $ENM_DRAGDROPDONE = 0x10
Global Const $ENM_DROPFILES = 0x100000
Global Const $ENM_IMECHANGE = 0x800000
Global Const $ENM_KEYEVENTS = 0x10000
Global Const $ENM_LINK = 0x4000000
Global Const $ENM_MOUSEEVENTS = 0x20000
Global Const $ENM_OBJECTPOSITIONS = 0x2000000
Global Const $ENM_PROTECTED = 0x200000
Global Const $ENM_REQUESTRESIZE = 0x40000
Global Const $ENM_SCROLL = 0x4
Global Const $ENM_SCROLLEVENTS = 0x8
Global Const $ENM_SELCHANGE = 0x80000
Global Const $ENM_UPDATE = 0x2
Global Const $BOM_DEFPARADIR = 0x1
Global Const $BOM_PLAINTEXT = 0x2
Global Const $BOM_NEUTRALOVERRIDE = 0x4
Global Const $BOM_CONTEXTREADING = 0x8
Global Const $BOM_CONTEXTALIGNMENT = 0x10
Global Const $BOM_LEGACYBIDICLASS = 0x0040
Global Const $BOE_RTLDIR = 0x1
Global Const $BOE_PLAINTEXT = 0x2
Global Const $BOE_NEUTRALOVERRIDE = 0x4
Global Const $BOE_CONTEXTREADING = 0x8
Global Const $BOE_CONTEXTALIGNMENT = 0x10
Global Const $BOE_LEGACYBIDICLASS = 0x0040
Global Const $ST_DEFAULT = 0
Global Const $ST_KEEPUNDO = 1
Global Const $ST_SELECTION = 2
Global Const $GT_DEFAULT = 0
Global Const $GT_SELECTION = 2
Global Const $GT_USECRLF = 1
Global Const $GTL_CLOSE = 4
Global Const $GTL_DEFAULT = 0
Global Const $GTL_NUMBYTES = 16
Global Const $GTL_NUMCHARS = 8
Global Const $GTL_PRECISE = 2
Global Const $GTL_USECRLF = 1
Global Const $CFU_UNDERLINENONE = 0
Global Const $CFU_UNDERLINE = 1
Global Const $CFU_UNDERLINEWORD = 2
Global Const $CFU_UNDERLINEDOUBLE = 3
Global Const $CFU_UNDERLINEDOTTED = 4
Global Const $CP_ACP = 0
Global Const $CP_UNICODE = 1200
Global Const $CFE_SUBSCRIPT = 0x00010000
Global Const $CFE_SUPERSCRIPT = 0x00020000
Global Const $CFM_ALLCAPS = 0x80
Global Const $CFM_ANIMATION = 0x40000
Global Const $CFM_BACKCOLOR = 0x4000000
Global Const $CFM_BOLD = 0x1
Global Const $CFM_CHARSET = 0x8000000
Global Const $CFM_COLOR = 0x40000000
Global Const $CFM_DISABLED = 0x2000
Global Const $CFM_EMBOSS = 0x800
Global Const $CFM_FACE = 0x20000000
Global Const $CFM_HIDDEN = 0x100
Global Const $CFM_IMPRINT = 0x1000
Global Const $CFM_ITALIC = 0x2
Global Const $CFM_KERNING = 0x100000
Global Const $CFM_LCID = 0x2000000
Global Const $CFM_LINK = 0x20
Global Const $CFM_OFFSET = 0x10000000
Global Const $CFM_OUTLINE = 0x200
Global Const $CFM_PROTECTED = 0x10
Global Const $CFM_REVAUTHOR = 0x8000
Global Const $CFM_REVISED = 0x4000
Global Const $CFM_SHADOW = 0x400
Global Const $CFM_SIZE = 0x80000000
Global Const $CFM_SMALLCAPS = 0x40
Global Const $CFM_SPACING = 0x200000
Global Const $CFM_STRIKEOUT = 0x8
Global Const $CFM_STYLE = 0x80000
Global Const $CFM_SUBSCRIPT = BitOR($CFE_SUBSCRIPT, $CFE_SUPERSCRIPT)
Global Const $CFM_SUPERSCRIPT = $CFM_SUBSCRIPT
Global Const $CFM_UNDERLINE = 0x4
Global Const $CFM_UNDERLINETYPE = 0x800000
Global Const $CFM_WEIGHT = 0x400000
Global Const $CFE_ALLCAPS = $CFM_ALLCAPS
Global Const $CFE_AUTOBACKCOLOR = $CFM_BACKCOLOR
Global Const $CFE_AUTOCOLOR = $CFM_COLOR
Global Const $CFE_BOLD = $CFM_BOLD
Global Const $CFE_DISABLED = $CFM_DISABLED
Global Const $CFE_EMBOSS = $CFM_EMBOSS
Global Const $CFE_HIDDEN = $CFM_HIDDEN
Global Const $CFE_IMPRINT = $CFM_IMPRINT
Global Const $CFE_ITALIC = $CFM_ITALIC
Global Const $CFE_LINK = $CFM_LINK
Global Const $CFE_OUTLINE = $CFM_OUTLINE
Global Const $CFE_PROTECTED = $CFM_PROTECTED
Global Const $CFE_REVISED = $CFM_REVISED
Global Const $CFE_SHADOW = $CFM_SHADOW
Global Const $CFE_SMALLCAPS = $CFM_SMALLCAPS
Global Const $CFE_STRIKEOUT = $CFM_STRIKEOUT
Global Const $CFE_UNDERLINE = $CFM_UNDERLINE
Global Const $FR_MATCHALEFHAMZA = 0x80000000
Global Const $FR_MATCHDIAC = 0x20000000
Global Const $FR_MATCHKASHIDA = 0x40000000
Global Const $SCF_DEFAULT = 0x0
Global Const $SCF_SELECTION = 0x1
Global Const $SCF_WORD = 0x2
Global Const $SCF_ALL = 0x4
Global Const $SCF_USEUIRULES = 0x8
Global Const $SCF_ASSOCIATEFONT = 0x10
Global Const $SCF_NOKBUPDATE = 0x20
Global Const $LF_FACESIZE = 32
Global Const $MAX_TAB_STOPS = 32
Global Const $PFA_LEFT = 0x1
Global Const $PFA_RIGHT = 0x2
Global Const $PFA_CENTER = 0x3
Global Const $PFA_JUSTIFY = 4
Global Const $PFA_FULL_INTERWORD = 4
Global Const $PFE_TABLE = 0x4000
Global Const $PFM_NUMBERING = 0x20
Global Const $PFM_ALIGNMENT = 0x8
Global Const $PFM_SPACEBEFORE = 0x40
Global Const $PFM_NUMBERINGSTYLE = 0x2000
Global Const $PFM_NUMBERINGSTART = 0x8000
Global Const $PFM_BORDER = 0x800
Global Const $PFM_RIGHTINDENT = 0x2
Global Const $PFM_STARTINDENT = 0x1
Global Const $PFM_OFFSET = 0x4
Global Const $PFM_LINESPACING = 0x100
Global Const $PFM_SPACEAFTER = 0x80
Global Const $PFM_NUMBERINGTAB = 0x4000
Global Const $PFM_TABLE = 0x40000000
Global Const $PFM_TABSTOPS = 0x10
Global Const $PFN_BULLET = 0x1
Global Const $PFM_RTLPARA = 0x10000
Global Const $PFM_KEEP = 0x20000
Global Const $PFM_KEEPNEXT = 0x40000
Global Const $PFM_PAGEBREAKBEFORE = 0x80000
Global Const $PFM_NOLINENUMBER = 0x100000
Global Const $PFM_NOWIDOWCONTROL = 0x200000
Global Const $PFM_DONOTHYPHEN = 0x400000
Global Const $PFM_SIDEBYSIDE = 0x800000
Global Const $PFE_RTLPARA = 0x00000001
Global Const $PFE_KEEP = 0x00000002
Global Const $PFE_KEEPNEXT = 0x00000004
Global Const $PFE_PAGEBREAKBEFORE = 0x00000008
Global Const $PFE_NOLINENUMBER = 0x00000010
Global Const $PFE_NOWIDOWCONTROL = 0x00000020
Global Const $PFE_DONOTHYPHEN = 0x00000040
Global Const $PFE_SIDEBYSIDE = 0x00000080
Global Const $PFM_SHADING = 0x1000
Global Const $WB_CLASSIFY = 3
Global Const $WB_ISDELIMITER = 2
Global Const $WB_LEFT = 0
Global Const $WB_LEFTBREAK = 6
Global Const $WB_MOVEWORDLEFT = 4
Global Const $WB_MOVEWORDNEXT = 5
Global Const $WB_MOVEWORDPREV = 4
Global Const $WB_MOVEWORDRIGHT = 5
Global Const $WB_NEXTBREAK = 7
Global Const $WB_PREVBREAK = 6
Global Const $WB_RIGHT = 1
Global Const $WB_RIGHTBREAK = 7
Global Const $WBF_ISWHITE = 0x10
Global Const $WBF_BREAKLINE = 0x20
Global Const $WBF_BREAKAFTER = 0x40
Global Const $SF_TEXT = 0x1
Global Const $SF_RTF = 0x2
Global Const $SF_RTFNOOBJS = 0x3
Global Const $SF_TEXTIZED = 0x4
Global Const $SF_UNICODE = 0x0010
Global Const $SF_USECODEPAGE = 0x20
Global Const $SFF_PLAINRTF = 0x4000
Global Const $SFF_SELECTION = 0x8000
Global Const $TBCD_CHANNEL = 0x3
Global Const $TBCD_THUMB = 0x2
Global Const $TBCD_TICS = 0x1
Global Const $__SLIDERCONSTANT_WM_USER = 0x400
Global Const $TBM_CLEARSEL = $__SLIDERCONSTANT_WM_USER + 19
Global Const $TBM_CLEARTICS = $__SLIDERCONSTANT_WM_USER + 9
Global Const $TBM_GETBUDDY = $__SLIDERCONSTANT_WM_USER + 33
Global Const $TBM_GETCHANNELRECT = $__SLIDERCONSTANT_WM_USER + 26
Global Const $TBM_GETLINESIZE = $__SLIDERCONSTANT_WM_USER + 24
Global Const $TBM_GETNUMTICS = $__SLIDERCONSTANT_WM_USER + 16
Global Const $TBM_GETPAGESIZE = $__SLIDERCONSTANT_WM_USER + 22
Global Const $TBM_GETPOS = $__SLIDERCONSTANT_WM_USER
Global Const $TBM_GETPTICS = $__SLIDERCONSTANT_WM_USER + 14
Global Const $TBM_GETSELEND = $__SLIDERCONSTANT_WM_USER + 18
Global Const $TBM_GETSELSTART = $__SLIDERCONSTANT_WM_USER + 17
Global Const $TBM_GETRANGEMAX = $__SLIDERCONSTANT_WM_USER + 2
Global Const $TBM_GETRANGEMIN = $__SLIDERCONSTANT_WM_USER + 1
Global Const $TBM_GETTHUMBLENGTH = $__SLIDERCONSTANT_WM_USER + 28
Global Const $TBM_GETTHUMBRECT = $__SLIDERCONSTANT_WM_USER + 25
Global Const $TBM_GETTIC = $__SLIDERCONSTANT_WM_USER + 3
Global Const $TBM_GETTICPOS = $__SLIDERCONSTANT_WM_USER + 15
Global Const $TBM_GETTOOLTIPS = $__SLIDERCONSTANT_WM_USER + 30
Global Const $TBM_GETUNICODEFORMAT = 0x2000 + 6
Global Const $TBM_SETBUDDY = $__SLIDERCONSTANT_WM_USER + 32
Global Const $TBM_SETLINESIZE = $__SLIDERCONSTANT_WM_USER + 23
Global Const $TBM_SETPAGESIZE = $__SLIDERCONSTANT_WM_USER + 21
Global Const $TBM_SETPOS = $__SLIDERCONSTANT_WM_USER + 5
Global Const $TBM_SETRANGE = $__SLIDERCONSTANT_WM_USER + 6
Global Const $TBM_SETRANGEMAX = $__SLIDERCONSTANT_WM_USER + 8
Global Const $TBM_SETRANGEMIN = $__SLIDERCONSTANT_WM_USER + 7
Global Const $TBM_SETSEL = $__SLIDERCONSTANT_WM_USER + 10
Global Const $TBM_SETSELEND = $__SLIDERCONSTANT_WM_USER + 12
Global Const $TBM_SETSELSTART = $__SLIDERCONSTANT_WM_USER + 11
Global Const $TBM_SETTHUMBLENGTH = $__SLIDERCONSTANT_WM_USER + 27
Global Const $TBM_SETTIC = $__SLIDERCONSTANT_WM_USER + 4
Global Const $TBM_SETTICFREQ = $__SLIDERCONSTANT_WM_USER + 20
Global Const $TBM_SETTIPSIDE = $__SLIDERCONSTANT_WM_USER + 31
Global Const $TBM_SETTOOLTIPS = $__SLIDERCONSTANT_WM_USER + 29
Global Const $TBM_SETUNICODEFORMAT = 0x2000 + 5
Global Const $TBTS_BOTTOM = 2
Global Const $TBTS_LEFT = 1
Global Const $TBTS_RIGHT = 3
Global Const $TBTS_TOP = 0
Global Const $TBS_AUTOTICKS = 0x0001
Global Const $TBS_BOTH = 0x0008
Global Const $TBS_BOTTOM = 0x0000
Global Const $TBS_DOWNISLEFT = 0x0400
Global Const $TBS_ENABLESELRANGE = 0x20
Global Const $TBS_FIXEDLENGTH = 0x40
Global Const $TBS_HORZ = 0x0000
Global Const $TBS_LEFT = 0x0004
Global Const $TBS_NOTHUMB = 0x0080
Global Const $TBS_NOTICKS = 0x0010
Global Const $TBS_REVERSED = 0x200
Global Const $TBS_RIGHT = 0x0000
Global Const $TBS_TOP = 0x0004
Global Const $TBS_TOOLTIPS = 0x100
Global Const $TBS_VERT = 0x0002
Global Const $GUI_SS_DEFAULT_SLIDER = $TBS_AUTOTICKS
Global Const $SS_LEFT = 0x0
Global Const $SS_CENTER = 0x1
Global Const $SS_RIGHT = 0x2
Global Const $SS_ICON = 0x3
Global Const $SS_BLACKRECT = 0x4
Global Const $SS_GRAYRECT = 0x5
Global Const $SS_WHITERECT = 0x6
Global Const $SS_BLACKFRAME = 0x7
Global Const $SS_GRAYFRAME = 0x8
Global Const $SS_WHITEFRAME = 0x9
Global Const $SS_SIMPLE = 0xB
Global Const $SS_LEFTNOWORDWRAP = 0xC
Global Const $SS_BITMAP = 0xE
Global Const $SS_ENHMETAFILE = 0xF
Global Const $SS_ETCHEDHORZ = 0x10
Global Const $SS_ETCHEDVERT = 0x11
Global Const $SS_ETCHEDFRAME = 0x12
Global Const $SS_REALSIZECONTROL = 0x40
Global Const $SS_NOPREFIX = 0x0080
Global Const $SS_NOTIFY = 0x0100
Global Const $SS_CENTERIMAGE = 0x0200
Global Const $SS_RIGHTJUST = 0x0400
Global Const $SS_SUNKEN = 0x1000
Global Const $GUI_SS_DEFAULT_LABEL = 0
Global Const $GUI_SS_DEFAULT_GRAPHIC = 0
Global Const $GUI_SS_DEFAULT_ICON = $SS_NOTIFY
Global Const $GUI_SS_DEFAULT_PIC = $SS_NOTIFY
Global Const $STM_SETICON = 0x0170
Global Const $STM_GETICON = 0x0171
Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173
Global Const $TCS_EX_FLATSEPARATORS = 0x00000001
Global Const $TCS_EX_REGISTERDROP = 0x00000002
Global Const $TCHT_NOWHERE = 0x00000001
Global Const $TCHT_ONITEMICON = 0x00000002
Global Const $TCHT_ONITEMLABEL = 0x00000004
Global Const $TCHT_ONITEM = 0x00000006
Global Const $TCIF_TEXT = 0x00000001
Global Const $TCIF_IMAGE = 0x00000002
Global Const $TCIF_RTLREADING = 0x00000004
Global Const $TCIF_PARAM = 0x00000008
Global Const $TCIF_STATE = 0x00000010
Global Const $TCIF_ALLDATA = 0x0000001B
Global Const $TCIS_BUTTONPRESSED = 0x00000001
Global Const $TCIS_HIGHLIGHTED = 0x00000002
Global Const $TC_ERR = -1
Global Const $TCS_BOTTOM = 0x00000002
Global Const $TCS_BUTTONS = 0x00000100
Global Const $TCS_FIXEDWIDTH = 0x00000400
Global Const $TCS_FLATBUTTONS = 0x00000008
Global Const $TCS_FOCUSNEVER = 0x00008000
Global Const $TCS_FOCUSONBUTTONDOWN = 0x00001000
Global Const $TCS_FORCEICONLEFT = 0x00000010
Global Const $TCS_FORCELABELLEFT = 0x00000020
Global Const $TCS_HOTTRACK = 0x00000040
Global Const $TCS_MULTILINE = 0x00000200
Global Const $TCS_MULTISELECT = 0x00000004
Global Const $TCS_OWNERDRAWFIXED = 0x00002000
Global Const $TCS_RAGGEDRIGHT = 0x00000800
Global Const $TCS_RIGHT = 0x00000002
Global Const $TCS_RIGHTJUSTIFY = 0x00000000
Global Const $TCS_SCROLLOPPOSITE = 0x00000001
Global Const $TCS_SINGLELINE = 0x00000000
Global Const $TCS_TABS = 0x00000000
Global Const $TCS_TOOLTIPS = 0x00004000
Global Const $TCS_VERTICAL = 0x00000080
Global Const $GUI_SS_DEFAULT_TAB = 0
Global Const $TCM_FIRST = 0x1300
Global Const $TCCM_FIRST = 0X2000
Global Const $TCM_ADJUSTRECT = ($TCM_FIRST + 40)
Global Const $TCM_DELETEALLITEMS = ($TCM_FIRST + 9)
Global Const $TCM_DELETEITEM = ($TCM_FIRST + 8)
Global Const $TCM_DESELECTALL = ($TCM_FIRST + 50)
Global Const $TCM_GETCURFOCUS = ($TCM_FIRST + 47)
Global Const $TCM_GETCURSEL = ($TCM_FIRST + 11)
Global Const $TCM_GETEXTENDEDSTYLE = ($TCM_FIRST + 53)
Global Const $TCM_GETIMAGELIST = ($TCM_FIRST + 2)
Global Const $TCM_GETITEMA = ($TCM_FIRST + 5)
Global Const $TCM_GETITEMW = ($TCM_FIRST + 60)
Global Const $TCM_GETITEMCOUNT = ($TCM_FIRST + 4)
Global Const $TCM_GETITEMRECT = ($TCM_FIRST + 10)
Global Const $TCM_GETROWCOUNT = ($TCM_FIRST + 44)
Global Const $TCM_GETTOOLTIPS = ($TCM_FIRST + 45)
Global Const $TCCM_GETUNICODEFORMAT = ($TCCM_FIRST + 6)
Global Const $TCM_GETUNICODEFORMAT = $TCCM_GETUNICODEFORMAT
Global Const $TCM_HIGHLIGHTITEM = ($TCM_FIRST + 51)
Global Const $TCM_HITTEST = ($TCM_FIRST + 13)
Global Const $TCM_INSERTITEMA = ($TCM_FIRST + 7)
Global Const $TCM_INSERTITEMW = ($TCM_FIRST + 62)
Global Const $TCM_REMOVEIMAGE = ($TCM_FIRST + 42)
Global Const $TCM_SETITEMA = ($TCM_FIRST + 6)
Global Const $TCM_SETITEMW = ($TCM_FIRST + 61)
Global Const $TCM_SETITEMEXTRA = ($TCM_FIRST + 14)
Global Const $TCM_SETITEMSIZE = $TCM_FIRST + 41
Global Const $TCM_SETCURFOCUS = ($TCM_FIRST + 48)
Global Const $TCM_SETCURSEL = ($TCM_FIRST + 12)
Global Const $TCM_SETEXTENDEDSTYLE = ($TCM_FIRST + 52)
Global Const $TCM_SETIMAGELIST = $TCM_FIRST + 3
Global Const $TCM_SETMINTABWIDTH = ($TCM_FIRST + 49)
Global Const $TCM_SETPADDING = ($TCM_FIRST + 43)
Global Const $TCM_SETTOOLTIPS = ($TCM_FIRST + 46)
Global Const $TCCM_SETUNICODEFORMAT = ($TCCM_FIRST + 5)
Global Const $TCM_SETUNICODEFORMAT = $TCCM_SETUNICODEFORMAT
Global Const $TCN_FIRST = -550
Global Const $TCN_FOCUSCHANGE = ($TCN_FIRST - 4)
Global Const $TCN_GETOBJECT = ($TCN_FIRST - 3)
Global Const $TCN_KEYDOWN = ($TCN_FIRST - 0)
Global Const $TCN_SELCHANGE = ($TCN_FIRST - 1)
Global Const $TCN_SELCHANGING = ($TCN_FIRST - 2)
Global Const $TVS_HASBUTTONS = 0x00000001
Global Const $TVS_HASLINES = 0x00000002
Global Const $TVS_LINESATROOT = 0x00000004
Global Const $TVS_EDITLABELS = 0x00000008
Global Const $TVS_DISABLEDRAGDROP = 0x00000010
Global Const $TVS_SHOWSELALWAYS = 0x00000020
Global Const $TVS_RTLREADING = 0x00000040
Global Const $TVS_NOTOOLTIPS = 0x00000080
Global Const $TVS_CHECKBOXES = 0x00000100
Global Const $TVS_TRACKSELECT = 0x00000200
Global Const $TVS_SINGLEEXPAND = 0x00000400
Global Const $TVS_INFOTIP = 0x00000800
Global Const $TVS_FULLROWSELECT = 0x00001000
Global Const $TVS_NOSCROLL = 0x00002000
Global Const $TVS_NONEVENHEIGHT = 0x00004000
Global Const $TVS_NOHSCROLL = 0x00008000
Global Const $TVS_DEFAULT = 0x00000037
Global Const $GUI_SS_DEFAULT_TREEVIEW = BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS)
Global Const $TVE_COLLAPSE = 0x0001
Global Const $TVE_EXPAND = 0x0002
Global Const $TVE_TOGGLE = 0x0003
Global Const $TVE_EXPANDPARTIAL = 0x4000
Global Const $TVE_COLLAPSERESET = 0x8000
Global Const $TVGN_ROOT = 0x00000000
Global Const $TVGN_NEXT = 0x00000001
Global Const $TVGN_PREVIOUS = 0x00000002
Global Const $TVGN_PARENT = 0x00000003
Global Const $TVGN_CHILD = 0x00000004
Global Const $TVGN_FIRSTVISIBLE = 0x00000005
Global Const $TVGN_NEXTVISIBLE = 0x00000006
Global Const $TVGN_PREVIOUSVISIBLE = 0x00000007
Global Const $TVGN_DROPHILITE = 0x00000008
Global Const $TVGN_CARET = 0x00000009
Global Const $TVGN_LASTVISIBLE = 0x0000000A
Global Const $TVHT_NOWHERE = 0x00000001
Global Const $TVHT_ONITEMICON = 0x00000002
Global Const $TVHT_ONITEMLABEL = 0x00000004
Global Const $TVHT_ONITEMINDENT = 0x00000008
Global Const $TVHT_ONITEMBUTTON = 0x00000010
Global Const $TVHT_ONITEMRIGHT = 0x00000020
Global Const $TVHT_ONITEMSTATEICON = 0x00000040
Global Const $TVHT_ONITEM = 0x00000046
Global Const $TVHT_ABOVE = 0x00000100
Global Const $TVHT_BELOW = 0x00000200
Global Const $TVHT_TORIGHT = 0x00000400
Global Const $TVHT_TOLEFT = 0x00000800
Global Const $TVI_ROOT = 0xFFFF0000
Global Const $TVI_FIRST = 0xFFFF0001
Global Const $TVI_LAST = 0xFFFF0002
Global Const $TVI_SORT = 0xFFFF0003
Global Const $TVIF_TEXT = 0x00000001
Global Const $TVIF_IMAGE = 0x00000002
Global Const $TVIF_PARAM = 0x00000004
Global Const $TVIF_STATE = 0x00000008
Global Const $TVIF_HANDLE = 0x00000010
Global Const $TVIF_SELECTEDIMAGE = 0x00000020
Global Const $TVIF_CHILDREN = 0x00000040
Global Const $TVIF_INTEGRAL = 0x00000080
Global Const $TVIF_EXPANDEDIMAGE = 0x00000100
Global Const $TVIF_STATEEX = 0x00000200
Global Const $TVIF_DI_SETITEM = 0x00001000
Global Const $TVSIL_NORMAL = 0
Global Const $TVSIL_STATE = 2
Global Const $TVC_BYKEYBOARD = 0x2
Global Const $TVC_BYMOUSE = 0x1
Global Const $TVC_UNKNOWN = 0x0
Global Const $TVIS_FOCUSED = 0x00000001
Global Const $TVIS_SELECTED = 0x00000002
Global Const $TVIS_CUT = 0x00000004
Global Const $TVIS_DROPHILITED = 0x00000008
Global Const $TVIS_BOLD = 0x00000010
Global Const $TVIS_EXPANDED = 0x00000020
Global Const $TVIS_EXPANDEDONCE = 0x00000040
Global Const $TVIS_EXPANDPARTIAL = 0x00000080
Global Const $TVIS_OVERLAYMASK = 0x00000F00
Global Const $TVIS_STATEIMAGEMASK = 0x0000F000
Global Const $TVIS_USERMASK = 0x0000F000
Global Const $TVIS_UNCHECKED = 4096
Global Const $TVIS_CHECKED = 8192
Global Const $TVNA_ADD = 1
Global Const $TVNA_ADDFIRST = 2
Global Const $TVNA_ADDCHILD = 3
Global Const $TVNA_ADDCHILDFIRST = 4
Global Const $TVNA_INSERT = 5
Global Const $TVTA_ADDFIRST = 1
Global Const $TVTA_ADD = 2
Global Const $TVTA_INSERT = 3
Global Const $TV_FIRST = 0x1100
Global Const $TVM_INSERTITEMA = $TV_FIRST + 0
Global Const $TVM_DELETEITEM = $TV_FIRST + 1
Global Const $TVM_EXPAND = $TV_FIRST + 2
Global Const $TVM_GETITEMRECT = $TV_FIRST + 4
Global Const $TVM_GETCOUNT = $TV_FIRST + 5
Global Const $TVM_GETINDENT = $TV_FIRST + 6
Global Const $TVM_SETINDENT = $TV_FIRST + 7
Global Const $TVM_GETIMAGELIST = $TV_FIRST + 8
Global Const $TVM_SETIMAGELIST = $TV_FIRST + 9
Global Const $TVM_GETNEXTITEM = $TV_FIRST + 10
Global Const $TVM_SELECTITEM = $TV_FIRST + 11
Global Const $TVM_GETITEMA = $TV_FIRST + 12
Global Const $TVM_SETITEMA = $TV_FIRST + 13
Global Const $TVM_EDITLABELA = $TV_FIRST + 14
Global Const $TVM_GETEDITCONTROL = $TV_FIRST + 15
Global Const $TVM_GETVISIBLECOUNT = $TV_FIRST + 16
Global Const $TVM_HITTEST = $TV_FIRST + 17
Global Const $TVM_CREATEDRAGIMAGE = $TV_FIRST + 18
Global Const $TVM_SORTCHILDREN = $TV_FIRST + 19
Global Const $TVM_ENSUREVISIBLE = $TV_FIRST + 20
Global Const $TVM_SORTCHILDRENCB = $TV_FIRST + 21
Global Const $TVM_ENDEDITLABELNOW = $TV_FIRST + 22
Global Const $TVM_GETISEARCHSTRINGA = $TV_FIRST + 23
Global Const $TVM_SETTOOLTIPS = $TV_FIRST + 24
Global Const $TVM_GETTOOLTIPS = $TV_FIRST + 25
Global Const $TVM_SETINSERTMARK = $TV_FIRST + 26
Global Const $TVM_SETITEMHEIGHT = $TV_FIRST + 27
Global Const $TVM_GETITEMHEIGHT = $TV_FIRST + 28
Global Const $TVM_SETBKCOLOR = $TV_FIRST + 29
Global Const $TVM_SETTEXTCOLOR = $TV_FIRST + 30
Global Const $TVM_GETBKCOLOR = $TV_FIRST + 31
Global Const $TVM_GETTEXTCOLOR = $TV_FIRST + 32
Global Const $TVM_SETSCROLLTIME = $TV_FIRST + 33
Global Const $TVM_GETSCROLLTIME = $TV_FIRST + 34
Global Const $TVM_SETINSERTMARKCOLOR = $TV_FIRST + 37
Global Const $TVM_GETINSERTMARKCOLOR = $TV_FIRST + 38
Global Const $TVM_GETITEMSTATE = $TV_FIRST + 39
Global Const $TVM_SETLINECOLOR = $TV_FIRST + 40
Global Const $TVM_GETLINECOLOR = $TV_FIRST + 41
Global Const $TVM_MAPACCIDTOHTREEITEM = $TV_FIRST + 42
Global Const $TVM_MAPHTREEITEMTOACCID = $TV_FIRST + 43
Global Const $TVM_INSERTITEMW = $TV_FIRST + 50
Global Const $TVM_GETITEMW = $TV_FIRST + 62
Global Const $TVM_SETITEMW = $TV_FIRST + 63
Global Const $TVM_GETISEARCHSTRINGW = $TV_FIRST + 64
Global Const $TVM_EDITLABELW = $TV_FIRST + 65
Global Const $TVM_GETUNICODEFORMAT = 0x2000 + 6
Global Const $TVM_SETUNICODEFORMAT = 0x2000 + 5
Global Const $TVN_FIRST = -400
Global Const $TVN_SELCHANGINGA = $TVN_FIRST - 1
Global Const $TVN_SELCHANGEDA = $TVN_FIRST - 2
Global Const $TVN_GETDISPINFOA = $TVN_FIRST - 3
Global Const $TVN_SETDISPINFOA = $TVN_FIRST - 4
Global Const $TVN_ITEMEXPANDINGA = $TVN_FIRST - 5
Global Const $TVN_ITEMEXPANDEDA = $TVN_FIRST - 6
Global Const $TVN_BEGINDRAGA = $TVN_FIRST - 7
Global Const $TVN_BEGINRDRAGA = $TVN_FIRST - 8
Global Const $TVN_DELETEITEMA = $TVN_FIRST - 9
Global Const $TVN_BEGINLABELEDITA = $TVN_FIRST - 10
Global Const $TVN_ENDLABELEDITA = $TVN_FIRST - 11
Global Const $TVN_KEYDOWN = $TVN_FIRST - 12
Global Const $TVN_GETINFOTIPA = $TVN_FIRST - 13
Global Const $TVN_GETINFOTIPW = $TVN_FIRST - 14
Global Const $TVN_SINGLEEXPAND = $TVN_FIRST - 15
Global Const $TVN_ITEMCHANGINGA = $TVN_FIRST - 16
Global Const $TVN_ITEMCHANGINGW = $TVN_FIRST - 17
Global Const $TVN_ITEMCHANGEDA = $TVN_FIRST - 18
Global Const $TVN_ITEMCHANGEDW = $TVN_FIRST - 19
Global Const $TVN_SELCHANGINGW = $TVN_FIRST - 50
Global Const $TVN_SELCHANGEDW = $TVN_FIRST - 51
Global Const $TVN_GETDISPINFOW = $TVN_FIRST - 52
Global Const $TVN_SETDISPINFOW = $TVN_FIRST - 53
Global Const $TVN_ITEMEXPANDINGW = $TVN_FIRST - 54
Global Const $TVN_ITEMEXPANDEDW = $TVN_FIRST - 55
Global Const $TVN_BEGINDRAGW = $TVN_FIRST - 56
Global Const $TVN_BEGINRDRAGW = $TVN_FIRST - 57
Global Const $TVN_DELETEITEMW = $TVN_FIRST - 58
Global Const $TVN_BEGINLABELEDITW = $TVN_FIRST - 59
Global Const $TVN_ENDLABELEDITW = $TVN_FIRST - 60
Global Const $UDS_WRAP = 0x0001
Global Const $UDS_SETBUDDYINT = 0x0002
Global Const $UDS_ALIGNRIGHT = 0x0004
Global Const $UDS_ALIGNLEFT = 0x0008
Global Const $UDS_ARROWKEYS = 0x0020
Global Const $UDS_HORZ = 0x0040
Global Const $UDS_NOTHOUSANDS = 0x0080
Global Const $GUI_SS_DEFAULT_UPDOWN = $UDS_ALIGNLEFT
Global Const $WC_ANIMATE = 'SysAnimate32'
Global Const $WC_BUTTON = 'Button'
Global Const $WC_COMBOBOX = 'ComboBox'
Global Const $WC_COMBOBOXEX = 'ComboBoxEx32'
Global Const $WC_DATETIMEPICK = 'SysDateTimePick32'
Global Const $WC_EDIT = 'Edit'
Global Const $WC_HEADER = 'SysHeader32'
Global Const $WC_HOTKEY = 'msctls_hotkey32'
Global Const $WC_IPADDRESS = 'SysIPAddress32'
Global Const $WC_LINK = 'SysLink'
Global Const $WC_LISTBOX = 'ListBox'
Global Const $WC_LISTVIEW = 'SysListView32'
Global Const $WC_MONTHCAL = 'SysMonthCal32'
Global Const $WC_NATIVEFONTCTL = 'NativeFontCtl'
Global Const $WC_PAGESCROLLER = 'SysPager'
Global Const $WC_PROGRESS = 'msctls_progress32'
Global Const $WC_REBAR = 'ReBarWindow32'
Global Const $WC_SCROLLBAR = 'ScrollBar'
Global Const $WC_STATIC = 'Static'
Global Const $WC_STATUSBAR = 'msctls_statusbar32'
Global Const $WC_TABCONTROL = 'SysTabControl32'
Global Const $WC_TOOLBAR = 'ToolbarWindow32'
Global Const $WC_TOOLTIPS = 'tooltips_class32'
Global Const $WC_TRACKBAR = 'msctls_trackbar32'
Global Const $WC_TREEVIEW = 'SysTreeView32'
Global Const $WC_UPDOWN = 'msctls_updown32'
Global Const $WS_OVERLAPPED = 0
Global Const $WS_TILED = $WS_OVERLAPPED
Global Const $WS_MAXIMIZEBOX = 0x00010000
Global Const $WS_MINIMIZEBOX = 0x00020000
Global Const $WS_TABSTOP = 0x00010000
Global Const $WS_GROUP = 0x00020000
Global Const $WS_SIZEBOX = 0x00040000
Global Const $WS_THICKFRAME = $WS_SIZEBOX
Global Const $WS_SYSMENU = 0x00080000
Global Const $WS_HSCROLL = 0x00100000
Global Const $WS_VSCROLL = 0x00200000
Global Const $WS_DLGFRAME = 0x00400000
Global Const $WS_BORDER = 0x00800000
Global Const $WS_CAPTION = 0x00C00000
Global Const $WS_OVERLAPPEDWINDOW = BitOR($WS_CAPTION, $WS_MAXIMIZEBOX, $WS_MINIMIZEBOX, $WS_OVERLAPPED, $WS_SYSMENU, $WS_THICKFRAME)
Global Const $WS_TILEDWINDOW = $WS_OVERLAPPEDWINDOW
Global Const $WS_MAXIMIZE = 0x01000000
Global Const $WS_CLIPCHILDREN = 0x02000000
Global Const $WS_CLIPSIBLINGS = 0x04000000
Global Const $WS_DISABLED = 0x08000000
Global Const $WS_VISIBLE = 0x10000000
Global Const $WS_MINIMIZE = 0x20000000
Global Const $WS_ICONIC = $WS_MINIMIZE
Global Const $WS_CHILD = 0x40000000
Global Const $WS_CHILDWINDOW = $WS_CHILD
Global Const $WS_POPUP = 0x80000000
Global Const $WS_POPUPWINDOW = 0x80880000
Global Const $DS_3DLOOK = 0x0004
Global Const $DS_ABSALIGN = 0x0001
Global Const $DS_CENTER = 0x0800
Global Const $DS_CENTERMOUSE = 0x1000
Global Const $DS_CONTEXTHELP = 0x2000
Global Const $DS_CONTROL = 0x0400
Global Const $DS_FIXEDSYS = 0x0008
Global Const $DS_LOCALEDIT = 0x0020
Global Const $DS_MODALFRAME = 0x0080
Global Const $DS_NOFAILCREATE = 0x0010
Global Const $DS_NOIDLEMSG = 0x0100
Global Const $DS_SETFONT = 0x0040
Global Const $DS_SETFOREGROUND = 0x0200
Global Const $DS_SHELLFONT = BitOR($DS_FIXEDSYS, $DS_SETFONT)
Global Const $DS_SYSMODAL = 0x0002
Global Const $WS_EX_ACCEPTFILES = 0x00000010
Global Const $WS_EX_APPWINDOW = 0x00040000
Global Const $WS_EX_COMPOSITED = 0x02000000
Global Const $WS_EX_CONTROLPARENT = 0x10000
Global Const $WS_EX_CLIENTEDGE = 0x00000200
Global Const $WS_EX_CONTEXTHELP = 0x00000400
Global Const $WS_EX_DLGMODALFRAME = 0x00000001
Global Const $WS_EX_LAYERED = 0x00080000
Global Const $WS_EX_LAYOUTRTL = 0x400000
Global Const $WS_EX_LEFT = 0x00000000
Global Const $WS_EX_LEFTSCROLLBAR = 0x00004000
Global Const $WS_EX_LTRREADING = 0x00000000
Global Const $WS_EX_MDICHILD = 0x00000040
Global Const $WS_EX_NOACTIVATE = 0x08000000
Global Const $WS_EX_NOINHERITLAYOUT = 0x00100000
Global Const $WS_EX_NOPARENTNOTIFY = 0x00000004
Global Const $WS_EX_RIGHT = 0x00001000
Global Const $WS_EX_RIGHTSCROLLBAR = 0x00000000
Global Const $WS_EX_RTLREADING = 0x2000
Global Const $WS_EX_STATICEDGE = 0x00020000
Global Const $WS_EX_TOOLWINDOW = 0x00000080
Global Const $WS_EX_TOPMOST = 0x00000008
Global Const $WS_EX_TRANSPARENT = 0x00000020
Global Const $WS_EX_WINDOWEDGE = 0x00000100
Global Const $WS_EX_OVERLAPPEDWINDOW = BitOR($WS_EX_CLIENTEDGE, $WS_EX_WINDOWEDGE)
Global Const $WS_EX_PALETTEWINDOW = BitOR($WS_EX_TOOLWINDOW, $WS_EX_TOPMOST, $WS_EX_WINDOWEDGE)
Global Const $WM_NULL = 0x0000
Global Const $WM_CREATE = 0x0001
Global Const $WM_DESTROY = 0x0002
Global Const $WM_MOVE = 0x0003
Global Const $WM_SIZEWAIT = 0x0004
Global Const $WM_SIZE = 0x0005
Global Const $WM_ACTIVATE = 0x0006
Global Const $WM_SETFOCUS = 0x0007
Global Const $WM_KILLFOCUS = 0x0008
Global Const $WM_SETVISIBLE = 0x0009
Global Const $WM_ENABLE = 0x000A
Global Const $WM_SETREDRAW = 0x000B
Global Const $WM_SETTEXT = 0x000C
Global Const $WM_GETTEXT = 0x000D
Global Const $WM_GETTEXTLENGTH = 0x000E
Global Const $WM_PAINT = 0x000F
Global Const $WM_CLOSE = 0x0010
Global Const $WM_QUERYENDSESSION = 0x0011
Global Const $WM_QUIT = 0x0012
Global Const $WM_ERASEBKGND = 0x0014
Global Const $WM_QUERYOPEN = 0x0013
Global Const $WM_SYSCOLORCHANGE = 0x0015
Global Const $WM_ENDSESSION = 0x0016
Global Const $WM_SYSTEMERROR = 0x0017
Global Const $WM_SHOWWINDOW = 0x0018
Global Const $WM_CTLCOLOR = 0x0019
Global Const $WM_SETTINGCHANGE = 0x001A
Global Const $WM_WININICHANGE = 0x001A
Global Const $WM_DEVMODECHANGE = 0x001B
Global Const $WM_ACTIVATEAPP = 0x001C
Global Const $WM_FONTCHANGE = 0x001D
Global Const $WM_TIMECHANGE = 0x001E
Global Const $WM_CANCELMODE = 0x001F
Global Const $WM_SETCURSOR = 0x0020
Global Const $WM_MOUSEACTIVATE = 0x0021
Global Const $WM_CHILDACTIVATE = 0x0022
Global Const $WM_QUEUESYNC = 0x0023
Global Const $WM_GETMINMAXINFO = 0x0024
Global Const $WM_LOGOFF = 0x0025
Global Const $WM_PAINTICON = 0x0026
Global Const $WM_ICONERASEBKGND = 0x0027
Global Const $WM_NEXTDLGCTL = 0x0028
Global Const $WM_ALTTABACTIVE = 0x0029
Global Const $WM_SPOOLERSTATUS = 0x002A
Global Const $WM_DRAWITEM = 0x002B
Global Const $WM_MEASUREITEM = 0x002C
Global Const $WM_DELETEITEM = 0x002D
Global Const $WM_VKEYTOITEM = 0x002E
Global Const $WM_CHARTOITEM = 0x002F
Global Const $WM_SETFONT = 0x0030
Global Const $WM_GETFONT = 0x0031
Global Const $WM_SETHOTKEY = 0x0032
Global Const $WM_GETHOTKEY = 0x0033
Global Const $WM_FILESYSCHANGE = 0x0034
Global Const $WM_ISACTIVEICON = 0x0035
Global Const $WM_QUERYPARKICON = 0x0036
Global Const $WM_QUERYDRAGICON = 0x0037
Global Const $WM_WINHELP = 0x0038
Global Const $WM_COMPAREITEM = 0x0039
Global Const $WM_FULLSCREEN = 0x003A
Global Const $WM_CLIENTSHUTDOWN = 0x003B
Global Const $WM_DDEMLEVENT = 0x003C
Global Const $WM_GETOBJECT = 0x003D
Global Const $WM_CALCSCROLL = 0x003F
Global Const $WM_TESTING = 0x0040
Global Const $WM_COMPACTING = 0x0041
Global Const $WM_OTHERWINDOWCREATED = 0x0042
Global Const $WM_OTHERWINDOWDESTROYED = 0x0043
Global Const $WM_COMMNOTIFY = 0x0044
Global Const $WM_MEDIASTATUSCHANGE = 0x0045
Global Const $WM_WINDOWPOSCHANGING = 0x0046
Global Const $WM_WINDOWPOSCHANGED = 0x0047
Global Const $WM_POWER = 0x0048
Global Const $WM_COPYGLOBALDATA = 0x0049
Global Const $WM_COPYDATA = 0x004A
Global Const $WM_CANCELJOURNAL = 0x004B
Global Const $WM_LOGONNOTIFY = 0x004C
Global Const $WM_KEYF1 = 0x004D
Global Const $WM_NOTIFY = 0x004E
Global Const $WM_ACCESS_WINDOW = 0x004F
Global Const $WM_INPUTLANGCHANGEREQUEST = 0x0050
Global Const $WM_INPUTLANGCHANGE = 0x0051
Global Const $WM_TCARD = 0x0052
Global Const $WM_HELP = 0x0053
Global Const $WM_USERCHANGED = 0x0054
Global Const $WM_NOTIFYFORMAT = 0x0055
Global Const $WM_QM_ACTIVATE = 0x0060
Global Const $WM_HOOK_DO_CALLBACK = 0x0061
Global Const $WM_SYSCOPYDATA = 0x0062
Global Const $WM_FINALDESTROY = 0x0070
Global Const $WM_MEASUREITEM_CLIENTDATA = 0x0071
Global Const $WM_CONTEXTMENU = 0x007B
Global Const $WM_STYLECHANGING = 0x007C
Global Const $WM_STYLECHANGED = 0x007D
Global Const $WM_DISPLAYCHANGE = 0x007E
Global Const $WM_GETICON = 0x007F
Global Const $WM_SETICON = 0x0080
Global Const $WM_NCCREATE = 0x0081
Global Const $WM_NCDESTROY = 0x0082
Global Const $WM_NCCALCSIZE = 0x0083
Global Const $WM_NCHITTEST = 0x0084
Global Const $WM_NCPAINT = 0x0085
Global Const $WM_NCACTIVATE = 0x0086
Global Const $WM_GETDLGCODE = 0x0087
Global Const $WM_SYNCPAINT = 0x0088
Global Const $WM_SYNCTASK = 0x0089
Global Const $WM_KLUDGEMINRECT = 0x008B
Global Const $WM_LPKDRAWSWITCHWND = 0x008C
Global Const $WM_UAHDESTROYWINDOW = 0x0090
Global Const $WM_UAHDRAWMENU = 0x0091
Global Const $WM_UAHDRAWMENUITEM = 0x0092
Global Const $WM_UAHINITMENU = 0x0093
Global Const $WM_UAHMEASUREMENUITEM = 0x0094
Global Const $WM_UAHNCPAINTMENUPOPUP = 0x0095
Global Const $WM_NCMOUSEMOVE = 0x00A0
Global Const $WM_NCLBUTTONDOWN = 0x00A1
Global Const $WM_NCLBUTTONUP = 0x00A2
Global Const $WM_NCLBUTTONDBLCLK = 0x00A3
Global Const $WM_NCRBUTTONDOWN = 0x00A4
Global Const $WM_NCRBUTTONUP = 0x00A5
Global Const $WM_NCRBUTTONDBLCLK = 0x00A6
Global Const $WM_NCMBUTTONDOWN = 0x00A7
Global Const $WM_NCMBUTTONUP = 0x00A8
Global Const $WM_NCMBUTTONDBLCLK = 0x00A9
Global Const $WM_NCXBUTTONDOWN = 0x00AB
Global Const $WM_NCXBUTTONUP = 0x00AC
Global Const $WM_NCXBUTTONDBLCLK = 0x00AD
Global Const $WM_NCUAHDRAWCAPTION = 0x00AE
Global Const $WM_NCUAHDRAWFRAME = 0x00AF
Global Const $WM_INPUT_DEVICE_CHANGE = 0x00FE
Global Const $WM_INPUT = 0x00FF
Global Const $WM_KEYDOWN = 0x0100
Global Const $WM_KEYFIRST = 0x0100
Global Const $WM_KEYUP = 0x0101
Global Const $WM_CHAR = 0x0102
Global Const $WM_DEADCHAR = 0x0103
Global Const $WM_SYSKEYDOWN = 0x0104
Global Const $WM_SYSKEYUP = 0x0105
Global Const $WM_SYSCHAR = 0x0106
Global Const $WM_SYSDEADCHAR = 0x0107
Global Const $WM_YOMICHAR = 0x0108
Global Const $WM_KEYLAST = 0x0109
Global Const $WM_UNICHAR = 0x0109
Global Const $WM_CONVERTREQUEST = 0x010A
Global Const $WM_CONVERTRESULT = 0x010B
Global Const $WM_IM_INFO = 0x010C
Global Const $WM_IME_STARTCOMPOSITION = 0x010D
Global Const $WM_IME_ENDCOMPOSITION = 0x010E
Global Const $WM_IME_COMPOSITION = 0x010F
Global Const $WM_IME_KEYLAST = 0x010F
Global Const $WM_INITDIALOG = 0x0110
Global Const $WM_COMMAND = 0x0111
Global Const $WM_SYSCOMMAND = 0x0112
Global Const $WM_TIMER = 0x0113
Global Const $WM_HSCROLL = 0x0114
Global Const $WM_VSCROLL = 0x0115
Global Const $WM_INITMENU = 0x0116
Global Const $WM_INITMENUPOPUP = 0x0117
Global Const $WM_SYSTIMER = 0x0118
Global Const $WM_GESTURE = 0x0119
Global Const $WM_GESTURENOTIFY = 0x011A
Global Const $WM_GESTUREINPUT = 0x011B
Global Const $WM_GESTURENOTIFIED = 0x011C
Global Const $WM_MENUSELECT = 0x011F
Global Const $WM_MENUCHAR = 0x0120
Global Const $WM_ENTERIDLE = 0x0121
Global Const $WM_MENURBUTTONUP = 0x0122
Global Const $WM_MENUDRAG = 0x0123
Global Const $WM_MENUGETOBJECT = 0x0124
Global Const $WM_UNINITMENUPOPUP = 0x0125
Global Const $WM_MENUCOMMAND = 0x0126
Global Const $WM_CHANGEUISTATE = 0x0127
Global Const $WM_UPDATEUISTATE = 0x0128
Global Const $WM_QUERYUISTATE = 0x0129
Global Const $WM_LBTRACKPOINT = 0x0131
Global Const $WM_CTLCOLORMSGBOX = 0x0132
Global Const $WM_CTLCOLOREDIT = 0x0133
Global Const $WM_CTLCOLORLISTBOX = 0x0134
Global Const $WM_CTLCOLORBTN = 0x0135
Global Const $WM_CTLCOLORDLG = 0x0136
Global Const $WM_CTLCOLORSCROLLBAR = 0x0137
Global Const $WM_CTLCOLORSTATIC = 0x0138
Global Const $MN_GETHMENU = 0x01E1
Global Const $WM_PARENTNOTIFY = 0x0210
Global Const $WM_ENTERMENULOOP = 0x0211
Global Const $WM_EXITMENULOOP = 0x0212
Global Const $WM_NEXTMENU = 0x0213
Global Const $WM_SIZING = 0x0214
Global Const $WM_CAPTURECHANGED = 0x0215
Global Const $WM_MOVING = 0x0216
Global Const $WM_POWERBROADCAST = 0x0218
Global Const $WM_DEVICECHANGE = 0x0219
Global Const $WM_MDICREATE = 0x0220
Global Const $WM_MDIDESTROY = 0x0221
Global Const $WM_MDIACTIVATE = 0x0222
Global Const $WM_MDIRESTORE = 0x0223
Global Const $WM_MDINEXT = 0x0224
Global Const $WM_MDIMAXIMIZE = 0x0225
Global Const $WM_MDITILE = 0x0226
Global Const $WM_MDICASCADE = 0x0227
Global Const $WM_MDIICONARRANGE = 0x0228
Global Const $WM_MDIGETACTIVE = 0x0229
Global Const $WM_DROPOBJECT = 0x022A
Global Const $WM_QUERYDROPOBJECT = 0x022B
Global Const $WM_BEGINDRAG = 0x022C
Global Const $WM_DRAGLOOP = 0x022D
Global Const $WM_DRAGSELECT = 0x022E
Global Const $WM_DRAGMOVE = 0x022F
Global Const $WM_MDISETMENU = 0x0230
Global Const $WM_ENTERSIZEMOVE = 0x0231
Global Const $WM_EXITSIZEMOVE = 0x0232
Global Const $WM_DROPFILES = 0x0233
Global Const $WM_MDIREFRESHMENU = 0x0234
Global Const $WM_TOUCH = 0x0240
Global Const $WM_IME_SETCONTEXT = 0x0281
Global Const $WM_IME_NOTIFY = 0x0282
Global Const $WM_IME_CONTROL = 0x0283
Global Const $WM_IME_COMPOSITIONFULL = 0x0284
Global Const $WM_IME_SELECT = 0x0285
Global Const $WM_IME_CHAR = 0x0286
Global Const $WM_IME_SYSTEM = 0x0287
Global Const $WM_IME_REQUEST = 0x0288
Global Const $WM_IME_KEYDOWN = 0x0290
Global Const $WM_IME_KEYUP = 0x0291
Global Const $WM_NCMOUSEHOVER = 0x02A0
Global Const $WM_MOUSEHOVER = 0x02A1
Global Const $WM_NCMOUSELEAVE = 0x02A2
Global Const $WM_MOUSELEAVE = 0x02A3
Global Const $WM_WTSSESSION_CHANGE = 0x02B1
Global Const $WM_TABLET_FIRST = 0x02C0
Global Const $WM_TABLET_LAST = 0x02DF
Global Const $WM_CUT = 0x0300
Global Const $WM_COPY = 0x0301
Global Const $WM_PASTE = 0x0302
Global Const $WM_CLEAR = 0x0303
Global Const $WM_UNDO = 0x0304
Global Const $WM_PALETTEISCHANGING = 0x0310
Global Const $WM_HOTKEY = 0x0312
Global Const $WM_PALETTECHANGED = 0x0311
Global Const $WM_SYSMENU = 0x0313
Global Const $WM_HOOKMSG = 0x0314
Global Const $WM_EXITPROCESS = 0x0315
Global Const $WM_WAKETHREAD = 0x0316
Global Const $WM_PRINT = 0x0317
Global Const $WM_PRINTCLIENT = 0x0318
Global Const $WM_APPCOMMAND = 0x0319
Global Const $WM_QUERYNEWPALETTE = 0x030F
Global Const $WM_THEMECHANGED = 0x031A
Global Const $WM_UAHINIT = 0x031B
Global Const $WM_DESKTOPNOTIFY = 0x031C
Global Const $WM_CLIPBOARDUPDATE = 0x031D
Global Const $WM_DWMCOMPOSITIONCHANGED = 0x031E
Global Const $WM_DWMNCRENDERINGCHANGED = 0x031F
Global Const $WM_DWMCOLORIZATIONCOLORCHANGED = 0x0320
Global Const $WM_DWMWINDOWMAXIMIZEDCHANGE = 0x0321
Global Const $WM_DWMEXILEFRAME = 0x0322
Global Const $WM_DWMSENDICONICTHUMBNAIL = 0x0323
Global Const $WM_MAGNIFICATION_STARTED = 0x0324
Global Const $WM_MAGNIFICATION_ENDED = 0x0325
Global Const $WM_DWMSENDICONICLIVEPREVIEWBITMAP = 0x0326
Global Const $WM_DWMTHUMBNAILSIZECHANGED = 0x0327
Global Const $WM_MAGNIFICATION_OUTPUT = 0x0328
Global Const $WM_MEASURECONTROL = 0x0330
Global Const $WM_GETACTIONTEXT = 0x0331
Global Const $WM_FORWARDKEYDOWN = 0x0333
Global Const $WM_FORWARDKEYUP = 0x0334
Global Const $WM_GETTITLEBARINFOEX = 0x033F
Global Const $WM_NOTIFYWOW = 0x0340
Global Const $WM_HANDHELDFIRST = 0x0358
Global Const $WM_HANDHELDLAST = 0x035F
Global Const $WM_AFXFIRST = 0x0360
Global Const $WM_AFXLAST = 0x037F
Global Const $WM_PENWINFIRST = 0x0380
Global Const $WM_PENWINLAST = 0x038F
Global Const $WM_DDE_INITIATE = 0x03E0
Global Const $WM_DDE_TERMINATE = 0x03E1
Global Const $WM_DDE_ADVISE = 0x03E2
Global Const $WM_DDE_UNADVISE = 0x03E3
Global Const $WM_DDE_ACK = 0x03E4
Global Const $WM_DDE_DATA = 0x03E5
Global Const $WM_DDE_REQUEST = 0x03E6
Global Const $WM_DDE_POKE = 0x03E7
Global Const $WM_DDE_EXECUTE = 0x03E8
Global Const $WM_DBNOTIFICATION = 0x03FD
Global Const $WM_NETCONNECT = 0x03FE
Global Const $WM_HIBERNATE = 0x03FF
Global Const $WM_USER = 0x0400
Global Const $WM_APP = 0x8000
Global Const $NM_FIRST = 0
Global Const $NM_OUTOFMEMORY = $NM_FIRST - 1
Global Const $NM_CLICK = $NM_FIRST - 2
Global Const $NM_DBLCLK = $NM_FIRST - 3
Global Const $NM_RETURN = $NM_FIRST - 4
Global Const $NM_RCLICK = $NM_FIRST - 5
Global Const $NM_RDBLCLK = $NM_FIRST - 6
Global Const $NM_SETFOCUS = $NM_FIRST - 7
Global Const $NM_KILLFOCUS = $NM_FIRST - 8
Global Const $NM_CUSTOMDRAW = $NM_FIRST - 12
Global Const $NM_HOVER = $NM_FIRST - 13
Global Const $NM_NCHITTEST = $NM_FIRST - 14
Global Const $NM_KEYDOWN = $NM_FIRST - 15
Global Const $NM_RELEASEDCAPTURE = $NM_FIRST - 16
Global Const $NM_SETCURSOR = $NM_FIRST - 17
Global Const $NM_CHAR = $NM_FIRST - 18
Global Const $NM_TOOLTIPSCREATED = $NM_FIRST - 19
Global Const $NM_LDOWN = $NM_FIRST - 20
Global Const $NM_RDOWN = $NM_FIRST - 21
Global Const $NM_THEMECHANGED = $NM_FIRST - 22
Global Const $WM_MOUSEFIRST = 0x0200
Global Const $WM_MOUSEMOVE = 0x0200
Global Const $WM_LBUTTONDOWN = 0x0201
Global Const $WM_LBUTTONUP = 0x0202
Global Const $WM_LBUTTONDBLCLK = 0x0203
Global Const $WM_RBUTTONDOWN = 0x0204
Global Const $WM_RBUTTONUP = 0x0205
Global Const $WM_RBUTTONDBLCLK = 0x0206
Global Const $WM_MBUTTONDOWN = 0x0207
Global Const $WM_MBUTTONUP = 0x0208
Global Const $WM_MBUTTONDBLCLK = 0x0209
Global Const $WM_MOUSEWHEEL = 0x020A
Global Const $WM_XBUTTONDOWN = 0x020B
Global Const $WM_XBUTTONUP = 0x020C
Global Const $WM_XBUTTONDBLCLK = 0x020D
Global Const $WM_MOUSEHWHEEL = 0x020E
Global Const $PS_SOLID = 0
Global Const $PS_DASH = 1
Global Const $PS_DOT = 2
Global Const $PS_DASHDOT = 3
Global Const $PS_DASHDOTDOT = 4
Global Const $PS_NULL = 5
Global Const $PS_INSIDEFRAME = 6
Global Const $PS_USERSTYLE = 7
Global Const $PS_ALTERNATE = 8
Global Const $PS_ENDCAP_ROUND = 0x00000000
Global Const $PS_ENDCAP_SQUARE = 0x00000100
Global Const $PS_ENDCAP_FLAT = 0x00000200
Global Const $PS_JOIN_BEVEL = 0x00001000
Global Const $PS_JOIN_MITER = 0x00002000
Global Const $PS_JOIN_ROUND = 0x00000000
Global Const $PS_GEOMETRIC = 0x00010000
Global Const $PS_COSMETIC = 0x00000000
Global Const $LWA_ALPHA = 0x2
Global Const $LWA_COLORKEY = 0x1
Global Const $RGN_AND = 1
Global Const $RGN_OR = 2
Global Const $RGN_XOR = 3
Global Const $RGN_DIFF = 4
Global Const $RGN_COPY = 5
Global Const $ERRORREGION = 0
Global Const $NULLREGION = 1
Global Const $SIMPLEREGION = 2
Global Const $COMPLEXREGION = 3
Global Const $TRANSPARENT = 1
Global Const $OPAQUE = 2
Global Const $CCM_FIRST = 0x2000
Global Const $CCM_GETUNICODEFORMAT = ($CCM_FIRST + 6)
Global Const $CCM_SETUNICODEFORMAT = ($CCM_FIRST + 5)
Global Const $CCM_SETBKCOLOR = $CCM_FIRST + 1
Global Const $CCM_SETCOLORSCHEME = $CCM_FIRST + 2
Global Const $CCM_GETCOLORSCHEME = $CCM_FIRST + 3
Global Const $CCM_GETDROPTARGET = $CCM_FIRST + 4
Global Const $CCM_SETWINDOWTHEME = $CCM_FIRST + 11
Global Const $GA_PARENT = 1
Global Const $GA_ROOT = 2
Global Const $GA_ROOTOWNER = 3
Global Const $SM_CXSCREEN = 0
Global Const $SM_CYSCREEN = 1
Global Const $SM_CXVSCROLL = 2
Global Const $SM_CYHSCROLL = 3
Global Const $SM_CYCAPTION = 4
Global Const $SM_CXBORDER = 5
Global Const $SM_CYBORDER = 6
Global Const $SM_CXFIXEDFRAME = 7
Global Const $SM_CXDLGFRAME = $SM_CXFIXEDFRAME
Global Const $SM_CYFIXEDFRAME = 8
Global Const $SM_CYDLGFRAME = $SM_CYFIXEDFRAME
Global Const $SM_CYVTHUMB = 9
Global Const $SM_CXHTHUMB = 10
Global Const $SM_CXICON = 11
Global Const $SM_CYICON = 12
Global Const $SM_CXCURSOR = 13
Global Const $SM_CYCURSOR = 14
Global Const $SM_CYMENU = 15
Global Const $SM_CXFULLSCREEN = 16
Global Const $SM_CYFULLSCREEN = 17
Global Const $SM_CYKANJIWINDOW = 18
Global Const $SM_MOUSEPRESENT = 19
Global Const $SM_CYVSCROLL = 20
Global Const $SM_CXHSCROLL = 21
Global Const $SM_DEBUG = 22
Global Const $SM_SWAPBUTTON = 23
Global Const $SM_RESERVED1 = 24
Global Const $SM_RESERVED2 = 25
Global Const $SM_RESERVED3 = 26
Global Const $SM_RESERVED4 = 27
Global Const $SM_CXMIN = 28
Global Const $SM_CYMIN = 29
Global Const $SM_CXSIZE = 30
Global Const $SM_CYSIZE = 31
Global Const $SM_CXSIZEFRAME = 32
Global Const $SM_CXFRAME = $SM_CXSIZEFRAME
Global Const $SM_CYSIZEFRAME = 33
Global Const $SM_CYFRAME = $SM_CYSIZEFRAME
Global Const $SM_CXMINTRACK = 34
Global Const $SM_CYMINTRACK = 35
Global Const $SM_CXDOUBLECLK = 36
Global Const $SM_CYDOUBLECLK = 37
Global Const $SM_CXICONSPACING = 38
Global Const $SM_CYICONSPACING = 39
Global Const $SM_MENUDROPALIGNMENT = 40
Global Const $SM_PENWINDOWS = 41
Global Const $SM_DBCSENABLED = 42
Global Const $SM_CMOUSEBUTTONS = 43
Global Const $SM_SECURE = 44
Global Const $SM_CXEDGE = 45
Global Const $SM_CYEDGE = 46
Global Const $SM_CXMINSPACING = 47
Global Const $SM_CYMINSPACING = 48
Global Const $SM_CXSMICON = 49
Global Const $SM_CYSMICON = 50
Global Const $SM_CYSMCAPTION = 51
Global Const $SM_CXSMSIZE = 52
Global Const $SM_CYSMSIZE = 53
Global Const $SM_CXMENUSIZE = 54
Global Const $SM_CYMENUSIZE = 55
Global Const $SM_ARRANGE = 56
Global Const $SM_CXMINIMIZED = 57
Global Const $SM_CYMINIMIZED = 58
Global Const $SM_CXMAXTRACK = 59
Global Const $SM_CYMAXTRACK = 60
Global Const $SM_CXMAXIMIZED = 61
Global Const $SM_CYMAXIMIZED = 62
Global Const $SM_NETWORK = 63
Global Const $SM_CLEANBOOT = 67
Global Const $SM_CXDRAG = 68
Global Const $SM_CYDRAG = 69
Global Const $SM_SHOWSOUNDS = 70
Global Const $SM_CXMENUCHECK = 71
Global Const $SM_CYMENUCHECK = 72
Global Const $SM_SLOWMACHINE = 73
Global Const $SM_MIDEASTENABLED = 74
Global Const $SM_MOUSEWHEELPRESENT = 75
Global Const $SM_XVIRTUALSCREEN = 76
Global Const $SM_YVIRTUALSCREEN = 77
Global Const $SM_CXVIRTUALSCREEN = 78
Global Const $SM_CYVIRTUALSCREEN = 79
Global Const $SM_CMONITORS = 80
Global Const $SM_SAMEDISPLAYFORMAT = 81
Global Const $SM_IMMENABLED = 82
Global Const $SM_CXFOCUSBORDER = 83
Global Const $SM_CYFOCUSBORDER = 84
Global Const $SM_TABLETPC = 86
Global Const $SM_MEDIACENTER = 87
Global Const $SM_STARTER = 88
Global Const $SM_SERVERR2 = 89
Global Const $SM_CMETRICS = 90
Global Const $SM_REMOTESESSION = 0x1000
Global Const $SM_SHUTTINGDOWN = 0x2000
Global Const $SM_REMOTECONTROL = 0x2001
Global Const $SM_CARETBLINKINGENABLED = 0x2002
Global Const $BLACKNESS = 0x00000042
Global Const $CAPTUREBLT = 0X40000000
Global Const $DSTINVERT = 0x00550009
Global Const $MERGECOPY = 0x00C000CA
Global Const $MERGEPAINT = 0x00BB0226
Global Const $NOMIRRORBITMAP = 0X80000000
Global Const $NOTSRCCOPY = 0x00330008
Global Const $NOTSRCERASE = 0x001100A6
Global Const $PATCOPY = 0x00F00021
Global Const $PATINVERT = 0x005A0049
Global Const $PATPAINT = 0x00FB0A09
Global Const $SRCAND = 0x008800C6
Global Const $SRCCOPY = 0x00CC0020
Global Const $SRCERASE = 0x00440328
Global Const $SRCINVERT = 0x00660046
Global Const $SRCPAINT = 0x00EE0086
Global Const $WHITENESS = 0x00FF0062
Global Const $DT_BOTTOM = 0x8
Global Const $DT_CALCRECT = 0x400
Global Const $DT_CENTER = 0x1
Global Const $DT_EDITCONTROL = 0x2000
Global Const $DT_END_ELLIPSIS = 0x8000
Global Const $DT_EXPANDTABS = 0x40
Global Const $DT_EXTERNALLEADING = 0x200
Global Const $DT_HIDEPREFIX = 0x100000
Global Const $DT_INTERNAL = 0x1000
Global Const $DT_LEFT = 0x0
Global Const $DT_MODIFYSTRING = 0x10000
Global Const $DT_NOCLIP = 0x100
Global Const $DT_NOFULLWIDTHCHARBREAK = 0x80000
Global Const $DT_NOPREFIX = 0x800
Global Const $DT_PATH_ELLIPSIS = 0x4000
Global Const $DT_PREFIXONLY = 0x200000
Global Const $DT_RIGHT = 0x2
Global Const $DT_RTLREADING = 0x20000
Global Const $DT_SINGLELINE = 0x20
Global Const $DT_TABSTOP = 0x80
Global Const $DT_TOP = 0x0
Global Const $DT_VCENTER = 0x4
Global Const $DT_WORDBREAK = 0x10
Global Const $DT_WORD_ELLIPSIS = 0x40000
Global Const $RDW_ERASE = 0x0004
Global Const $RDW_FRAME = 0x0400
Global Const $RDW_INTERNALPAINT = 0x0002
Global Const $RDW_INVALIDATE = 0x0001
Global Const $RDW_NOERASE = 0x0020
Global Const $RDW_NOFRAME = 0x0800
Global Const $RDW_NOINTERNALPAINT = 0x0010
Global Const $RDW_VALIDATE = 0x0008
Global Const $RDW_ERASENOW = 0x0200
Global Const $RDW_UPDATENOW = 0x0100
Global Const $RDW_ALLCHILDREN = 0x0080
Global Const $RDW_NOCHILDREN = 0x0040
Global Const $WM_RENDERFORMAT = 0x0305
Global Const $WM_RENDERALLFORMATS = 0x0306
Global Const $WM_DESTROYCLIPBOARD = 0x0307
Global Const $WM_DRAWCLIPBOARD = 0x0308
Global Const $WM_PAINTCLIPBOARD = 0x0309
Global Const $WM_VSCROLLCLIPBOARD = 0x030A
Global Const $WM_SIZECLIPBOARD = 0x030B
Global Const $WM_ASKCBFORMATNAME = 0x030C
Global Const $WM_CHANGECBCHAIN = 0x030D
Global Const $WM_HSCROLLCLIPBOARD = 0x030E
Global Const $HTERROR = -2
Global Const $HTTRANSPARENT = -1
Global Const $HTNOWHERE = 0
Global Const $HTCLIENT = 1
Global Const $HTCAPTION = 2
Global Const $HTSYSMENU = 3
Global Const $HTGROWBOX = 4
Global Const $HTSIZE = $HTGROWBOX
Global Const $HTMENU = 5
Global Const $HTHSCROLL = 6
Global Const $HTVSCROLL = 7
Global Const $HTMINBUTTON = 8
Global Const $HTMAXBUTTON = 9
Global Const $HTLEFT = 10
Global Const $HTRIGHT = 11
Global Const $HTTOP = 12
Global Const $HTTOPLEFT = 13
Global Const $HTTOPRIGHT = 14
Global Const $HTBOTTOM = 15
Global Const $HTBOTTOMLEFT = 16
Global Const $HTBOTTOMRIGHT = 17
Global Const $HTBORDER = 18
Global Const $HTREDUCE = $HTMINBUTTON
Global Const $HTZOOM = $HTMAXBUTTON
Global Const $HTSIZEFIRST = $HTLEFT
Global Const $HTSIZELAST = $HTBOTTOMRIGHT
Global Const $HTOBJECT = 19
Global Const $HTCLOSE = 20
Global Const $HTHELP = 21
Global Const $COLOR_SCROLLBAR = 0
Global Const $COLOR_BACKGROUND = 1
Global Const $COLOR_ACTIVECAPTION = 2
Global Const $COLOR_INACTIVECAPTION = 3
Global Const $COLOR_MENU = 4
Global Const $COLOR_WINDOW = 5
Global Const $COLOR_WINDOWFRAME = 6
Global Const $COLOR_MENUTEXT = 7
Global Const $COLOR_WINDOWTEXT = 8
Global Const $COLOR_CAPTIONTEXT = 9
Global Const $COLOR_ACTIVEBORDER = 10
Global Const $COLOR_INACTIVEBORDER = 11
Global Const $COLOR_APPWORKSPACE = 12
Global Const $COLOR_HIGHLIGHT = 13
Global Const $COLOR_HIGHLIGHTTEXT = 14
Global Const $COLOR_BTNFACE = 15
Global Const $COLOR_BTNSHADOW = 16
Global Const $COLOR_GRAYTEXT = 17
Global Const $COLOR_BTNTEXT = 18
Global Const $COLOR_INACTIVECAPTIONTEXT = 19
Global Const $COLOR_BTNHIGHLIGHT = 20
Global Const $COLOR_3DDKSHADOW = 21
Global Const $COLOR_3DLIGHT = 22
Global Const $COLOR_INFOTEXT = 23
Global Const $COLOR_INFOBK = 24
Global Const $COLOR_HOTLIGHT = 26
Global Const $COLOR_GRADIENTACTIVECAPTION = 27
Global Const $COLOR_GRADIENTINACTIVECAPTION = 28
Global Const $COLOR_MENUHILIGHT = 29
Global Const $COLOR_MENUBAR = 30
Global Const $COLOR_DESKTOP = 1
Global Const $COLOR_3DFACE = 15
Global Const $COLOR_3DSHADOW = 16
Global Const $COLOR_3DHIGHLIGHT = 20
Global Const $COLOR_3DHILIGHT = 20
Global Const $COLOR_BTNHILIGHT = 20
Global Const $HINST_COMMCTRL = -1
Global Const $IDB_STD_SMALL_COLOR = 0
Global Const $IDB_STD_LARGE_COLOR = 1
Global Const $IDB_VIEW_SMALL_COLOR = 4
Global Const $IDB_VIEW_LARGE_COLOR = 5
Global Const $IDB_HIST_SMALL_COLOR = 8
Global Const $IDB_HIST_LARGE_COLOR = 9
Global Const $STARTF_FORCEOFFFEEDBACK = 0x80
Global Const $STARTF_FORCEONFEEDBACK = 0x40
Global Const $STARTF_PREVENTPINNING = 0x00002000
Global Const $STARTF_RUNFULLSCREEN = 0x20
Global Const $STARTF_TITLEISAPPID = 0x00001000
Global Const $STARTF_TITLEISLINKNAME = 0x00000800
Global Const $STARTF_USECOUNTCHARS = 0x8
Global Const $STARTF_USEFILLATTRIBUTE = 0x10
Global Const $STARTF_USEHOTKEY = 0x200
Global Const $STARTF_USEPOSITION = 0x4
Global Const $STARTF_USESHOWWINDOW = 0x1
Global Const $STARTF_USESIZE = 0x2
Global Const $STARTF_USESTDHANDLES = 0x100
Global Const $CDDS_PREPAINT = 0x00000001
Global Const $CDDS_POSTPAINT = 0x00000002
Global Const $CDDS_PREERASE = 0x00000003
Global Const $CDDS_POSTERASE = 0x00000004
Global Const $CDDS_ITEM = 0x00010000
Global Const $CDDS_ITEMPREPAINT = 0x00010001
Global Const $CDDS_ITEMPOSTPAINT = 0x00010002
Global Const $CDDS_ITEMPREERASE = 0x00010003
Global Const $CDDS_ITEMPOSTERASE = 0x00010004
Global Const $CDDS_SUBITEM = 0x00020000
Global Const $CDIS_SELECTED = 0x0001
Global Const $CDIS_GRAYED = 0x0002
Global Const $CDIS_DISABLED = 0x0004
Global Const $CDIS_CHECKED = 0x0008
Global Const $CDIS_FOCUS = 0x0010
Global Const $CDIS_DEFAULT = 0x0020
Global Const $CDIS_HOT = 0x0040
Global Const $CDIS_MARKED = 0x0080
Global Const $CDIS_INDETERMINATE = 0x0100
Global Const $CDIS_SHOWKEYBOARDCUES = 0x0200
Global Const $CDIS_NEARHOT = 0x0400
Global Const $CDIS_OTHERSIDEHOT = 0x0800
Global Const $CDIS_DROPHILITED = 0x1000
Global Const $CDRF_DODEFAULT = 0x00000000
Global Const $CDRF_NEWFONT = 0x00000002
Global Const $CDRF_SKIPDEFAULT = 0x00000004
Global Const $CDRF_NOTIFYPOSTPAINT = 0x00000010
Global Const $CDRF_NOTIFYITEMDRAW = 0x00000020
Global Const $CDRF_NOTIFYSUBITEMDRAW = 0x00000020
Global Const $CDRF_NOTIFYPOSTERASE = 0x00000040
Global Const $CDRF_DOERASE = 0x00000008
Global Const $CDRF_SKIPPOSTPAINT = 0x00000100
Global Const $GUI_SS_DEFAULT_GUI = BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU)
Global Const $COLOR_AQUA = 0x00FFFF
Global Const $COLOR_BLACK = 0x000000
Global Const $COLOR_BLUE = 0x0000FF
Global Const $COLOR_CREAM = 0xFFFBF0
Global Const $COLOR_FUCHSIA = 0xFF00FF
Global Const $COLOR_GRAY = 0x808080
Global Const $COLOR_GREEN = 0x008000
Global Const $COLOR_LIME = 0x00FF00
Global Const $COLOR_MAROON = 0x8B1C62
Global Const $COLOR_MEDBLUE = 0x0002C4
Global Const $COLOR_MEDGRAY = 0xA0A0A4
Global Const $COLOR_MONEYGREEN = 0xC0DCC0
Global Const $COLOR_NAVY = 0x000080
Global Const $COLOR_OLIVE = 0x808000
Global Const $COLOR_PURPLE = 0x800080
Global Const $COLOR_RED = 0xFF0000
Global Const $COLOR_SILVER = 0xC0C0C0
Global Const $COLOR_SKYBLUE = 0xA6CAF0
Global Const $COLOR_TEAL = 0x008080
Global Const $COLOR_WHITE = 0xFFFFFF
Global Const $COLOR_YELLOW = 0xFFFF00
Global Const $CLR_NONE = 0xFFFFFFFF
Global Const $CLR_DEFAULT = 0xFF000000
Global Const $CLR_AQUA = 0xFFFF00
Global Const $CLR_BLACK = 0x000000
Global Const $CLR_BLUE = 0xFF0000
Global Const $CLR_CREAM = 0xF0FBFF
Global Const $CLR_FUCHSIA = 0xFF00FF
Global Const $CLR_GRAY = 0x808080
Global Const $CLR_GREEN = 0x008000
Global Const $CLR_LIME = 0x00FF00
Global Const $CLR_MAROON = 0x621C8B
Global Const $CLR_MEDBLUE = 0xC40200
Global Const $CLR_MEDGRAY = 0xA4A0A0
Global Const $CLR_MONEYGREEN = 0xC0DCC0
Global Const $CLR_NAVY = 0x800000
Global Const $CLR_OLIVE = 0x008080
Global Const $CLR_PURPLE = 0x800080
Global Const $CLR_RED = 0x0000FF
Global Const $CLR_SILVER = 0xC0C0C0
Global Const $CLR_SKYBLUE = 0xF0CAA6
Global Const $CLR_TEAL = 0x808000
Global Const $CLR_WHITE = 0xFFFFFF
Global Const $CLR_YELLOW = 0x00FFFF
Global Const $CC_ANYCOLOR = 0x0100
Global Const $CC_FULLOPEN = 0x0002
Global Const $CC_RGBINIT = 0x0001
#Region
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
Global Const $aPIDServerFile = @ScriptDir & "\" & $aUtilName & "_lastpid.tmp"
Global Const $aLogFile = @ScriptDir & "\" & $aUtilName & ".log"
Global Const $aIniFile = @ScriptDir & "\" & $aUtilName & ".ini"
Global $aUtilityVer = $aUtilName & " " & $aUtilVersion
Global $aUtilUpdateFile = @ScriptDir & "\__UTIL_UPDATE_AVAILABLE___.txt"
Global $aIniFailFile = @ScriptDir & "\___INI_FAIL_VARIABLES___.txt"
Global $aBeginDelayedShutdown = 0
Global $aFirstBoot = 1
Global $aRebootMe = "no"
Global $aUseSteamCMD = "yes"
Global $aExperimentalString = "latest_experimental"
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
$aServerRebootReason = ""
$aRebootReason = ""
Global $aRebootConfigUpdate = "no"
$aAnnounceCount1 = 0
$aFPCount = 0
$aFPClock = _NowCalc()
$aServerName = "7 Days To Die"
Global $aSteamAppID = "294420"
Global $aSteamDBURLPublic = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
Global $aSteamDBURLExperimental = "https://steamdb.info/app/" & $aSteamAppID & "/depots/?branch=public"
$aUpdateSource = "0"
$aServerUpdateLinkVer = "http://www.phoenix125.com/share/7dtdlatestver.txt"
$aServerUpdateLinkVerBeta = "http://www.phoenix125.com/share/7dtdlatestbeta.txt"
$aServerUpdateLinkDL = "http://www.phoenix125.com/share/7dtdServerUpdateUtility.zip"
$aServerUpdateLinkDLBeta = "http://www.phoenix125.com/share/7dtdServerUpdateUtilityBeta.zip"
Global $aShowUpdate = False
#EndRegion
#Region
OnAutoItExitRegister("Gamercide")
SplashTextOn($aUtilName, "7dtdServerUpdateUtility started.", 250, 50, -1, -1, $DLG_MOVEABLE, "")
FileWriteLine($aLogFile, _NowCalc() & " ============================ " & $aUtilityVer & " Started ============================")
Global $aServerPID = PIDReadServer($aPIDServerFile)
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Importing settings from " & $aIniFile & ".", 400, 110, -1, -1, $DLG_MOVEABLE, "")
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
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Updating config fie.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
AppendConfigSettings()
If $aUpdateUtil = "yes" Then
UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndIf
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Creating temp config fie.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
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
$aServerTelnetReboot = "yes"
$aServerRebootReason = $aServerRebootReason & "Telnet was disabled." & @CRLF
EndIf
Global $aServerTelnetEnable = "true"
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
Global $aTelnetPass = "7dtdServerUpdateUtility"
$aServerTelnetReboot = "yes"
$aServerRebootReason = $aServerRebootReason & "Telnet password was blank or CHANGEME." & @CRLF
EndIf
If $aServerTerminalWindow = "false" Then
Else
FileWriteLine($aLogFile, _NowCalc() & " . . . Terminal window was enabled. Utility cannot function with it enabled. Terminal window set to: false")
$aServerTelnetReboot = "yes"
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
#EndRegion
If $aUseSteamCMD = "yes" Then
Local $sFileExists = FileExists($aSteamCMDDir & "\steamcmd.exe")
If $sFileExists = 0 Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Downloading and installing SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
InetGet("https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip", @ScriptDir & "\steamcmd.zip", 0)
DirCreate($aSteamCMDDir)
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
#Region
If ($aCheckForUpdate = "yes") Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Checking for server updates.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
FileWriteLine($aLogFile, _NowCalc() & " [Server] Running initial update check . . ")
Local $bRestart = UpdateCheck(False)
If $bRestart Then
$aBeginDelayedShutdown = 1
EndIf
SplashOff()
EndIf
#EndRegion
ExternalScriptExist()
If $aRemoteRestartUse = "yes" Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Starting Remote Restart.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
TCPStartup()
Global $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
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
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Preparing icon tray.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Opt("TrayMenuMode", 3)
Local $iTrayAbout = TrayCreateItem("About")
Local $iTrayUpdateUtilCheck = TrayCreateItem("Check for Util Update")
Local $iTrayUpdateUtilPause = TrayCreateItem("Pause Util")
TrayCreateItem("")
Local $iTraySendMessage = TrayCreateItem("Send global chat message")
Local $iTraySendInGame = TrayCreateItem("Send telnet command")
TrayCreateItem("")
Local $iTrayPlayerCount = TrayCreateItem("Show Online Players Window")
Local $iTrayPlayerCheckPause = TrayCreateItem("Disable Online Players Check/Log")
Local $iTrayPlayerCheckUnPause = TrayCreateItem("Enable Online Players Check/Log")
TrayCreateItem("")
Local $iTrayUpdateServCheck = TrayCreateItem("Check for Server Update")
Local $iTrayUpdateServPause = TrayCreateItem("Disable Server Update Check")
Local $iTrayUpdateServUnPause = TrayCreateItem("Enable Server Update Check")
TrayCreateItem("")
Local $iTrayRemoteRestart = TrayCreateItem("Initiate Remote Restart")
Local $iTrayRestartNow = TrayCreateItem("Restart Server Now")
TrayCreateItem("")
Local $iTrayExitCloseN = TrayCreateItem("Exit: Do NOT Shut Down Servers")
Local $iTrayExitCloseY = TrayCreateItem("Exit: Shut Down Servers")
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
TraySetState($TRAY_ICONSTATE_SHOW)
ShowOnlineGUI()
SplashOff()
MsgBox(4096, $aUtilName, "Startup process complete." & @CRLF & @CRLF & "The Phoenix tray icon turns grey (busy):" & @CRLF & "- When scanning for online players" & @CRLF & "- During server process checks every 10 seconds" & @CRLF & @CRLF & "Tray icon menu ready . . .", 10)
If $aUpdateUtil = "yes" Then AdlibRegister("RunUtilUpdate", 28800000)
Func RunUtilUpdate()
UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndFunc
$gTelnetTimeCheck0 = _NowCalc()
#Region
Local $ServExpBeta = " +app_update 294420 -beta latest_experimental"
Local $ServExpStable = " +app_update 294420"
Global $aBatchDIR = @ScriptDir & "\BatchFiles"
DirCreate($aBatchDIR)
Global $aSteamUpdateCMDValY = $aBatchDIR & "\Update_7DTD_Validate_YES.bat"
Global $aSteamUpdateCMDValN = $aBatchDIR & "\Update_7DTD_Validate_NO.bat"
Global $aSteamUpdateCMDBetaValY = $aBatchDIR & "\Update_7DTD_Beta_Validate_YES.bat"
Global $aSteamUpdateCMDBetaValN = $aBatchDIR & "\Update_7DTD_Beta_Validate_NO.bat"
Local $tCmdBeta = 'SET steampath=' & $aSteamCMDDir & @CRLF & 'SET gamepath=' & $aServerDirLocal & @CRLF & '%steampath%\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "%gamepath%" ' & $ServExpBeta & ' ' & $aSteamExtraCMD
Local $tCmd = 'SET steampath=' & $aSteamCMDDir & @CRLF & 'SET gamepath=' & $aServerDirLocal & @CRLF & '%steampath%\steamcmd.exe +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir "%gamepath%" ' & $ServExpStable & ' ' & $aSteamExtraCMD
FileDelete($aSteamUpdateCMDValY)
FileWrite($aSteamUpdateCMDValY, $tCmd & " validate +quit")
FileDelete($aSteamUpdateCMDValN)
FileWrite($aSteamUpdateCMDValN, $tCmd & " +quit")
FileDelete($aSteamUpdateCMDBetaValY)
FileWrite($aSteamUpdateCMDBetaValY, $tCmdBeta & " validate +quit")
FileDelete($aSteamUpdateCMDBetaValN)
FileWrite($aSteamUpdateCMDBetaValN, $tCmdBeta & " +quit")
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
#EndRegion
$aServerCheck = TimerInit()
While True
Switch TrayGetMsg()
Case $iTrayAbout
MsgBox($MB_SYSTEMMODAL, $aUtilName, $aUtilName & @CRLF & "Version: " & $aUtilVersion & @CRLF & @CRLF & "Install Path: " & @ScriptDir & @CRLF & @CRLF & "Discord: http://discord.gg/EU7pzPs" & @CRLF & "Website: http://www.phoenix125.com", 15)
Case $iTrayUpdateUtilCheck
TrayUpdateUtilCheck()
Case $iTrayUpdateUtilPause
TrayUpdateUtilPause()
Case $iTraySendMessage
TraySendMessage()
Case $iTraySendInGame
TraySendInGame()
Case $iTrayUpdateServCheck
TrayUpdateServCheck()
Case $iTrayPlayerCount
TrayShowPlayerCount()
Case $iTrayPlayerCheckPause
TrayShowPlayerCheckPause()
Case $iTrayPlayerCheckUnPause
TrayShowPlayerCheckUnPause()
Case $iTrayUpdateServPause
TrayUpdateServPause()
Case $iTrayUpdateServUnPause
TrayUpdateServUnPause()
Case $iTrayRemoteRestart
TrayRemoteRestart()
Case $iTrayRestartNow
TrayRestartNow()
Case $iTrayExitCloseY
TrayExitCloseY()
Case $iTrayExitCloseN
TrayExitCloseN()
EndSwitch
Switch GUIGetMsg()
Case $GUI_EVENT_CLOSE
GUIDelete()
$aPlayerCountWindowTF = False
$aPlayerCountShowTF = False
EndSwitch
#Region
If TimerDiff($aServerCheck) > 10000 Then
TraySetToolTip("Server process check in progress...")
TraySetIcon(@ScriptName, 201)
If $aRemoteRestartUse = "yes" Then
Local $sRestart = _RemoteRestart($MainSocket, $aRemoteRestartCode, $aRemoteRestartKey, $aServerIP, $aServerName, $xDebug)
Switch @error
Case 0
If ProcessExists($aServerPID) And ($aBeginDelayedShutdown = 0) Then
Local $MEM = ProcessGetStats($aServerPID, 0)
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] [Work Memory:" & $MEM[0] & " | Peak Memory:" & $MEM[1] & "] " & $sRestart)
If ($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes") Then
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
#EndRegion
#Region
If Not ProcessExists($aServerPID) Then
$aBeginDelayedShutdown = 0
SplashTextOn($aUtilName, "Starting server.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
$LogTimeStamp = $aServerDirLocal & '\7DaysToDieServer_Data\output_log_dedi' & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".txt"
Local $tRun = "" & $aServerDirLocal & "\" & $aServerEXE & ' -logfile "' & $LogTimeStamp & '" -quit -batchmode -nographics ' & $aServerExtraCMD & " -configfile=" & $aConfigFileTemp & " -dedicated"
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] 7DTD Dedicated Server Started [" & $tRun & "]")
Else
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] 7DTD Dedicated Server Started.")
EndIf
PurgeLogFile($aServerDirLocal)
$aServerPID = Run($tRun, $aServerDirLocal, @SW_HIDE)
SplashOff()
If ($aRebootMe = "no") And ($aServerTelnetReboot = "no") Then
MsgBox($MB_OK, $aUtilName, "7 Days to Die Server started. PID[" & $aServerPID & "]", 7)
EndIf
$gTelnetTimeCheck0 = _NowCalc()
$gTelnetTimeCheck0 = _NowCalc()
$aFPCount = $aFPCount + 1
If ($aFPCount = 3) And ($aFPAutoUpdateYN = "yes") Then
FPRun()
EndIf
SplashTextOn($aUtilName, "Retrieving server version.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
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
$aGameVer = "-"
Else
$aGameVer = $xGameVer[0]
EndIf
$GameVer = _ArrayToString(_StringBetween($sLogRead, "INF Version: ", " Compatibility Version"))
FileClose($sLogPath)
EndIf
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server version: " & $aGameVer & ".  Version derived from """ & $LogTimeStamp & """.")
Else
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server version: " & $aGameVer & ".")
EndIf
SplashOff()
If ($aRebootMe = "yes") Or ($aServerTelnetReboot = "yes") Then
SplashTextOn($aUtilName, "Making changes to ServerConfig7dtdServerUtilTemp.xml.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Local $tConfigPathOpen = FileOpen($aConfigFileTempFull, 0)
Local $tConfigRead2 = FileRead($tConfigPathOpen)
FileClose($tConfigPathOpen)
Local $tConfigRead1 = StringRegExpReplace($tConfigRead2, "</ServerSettings>", "")
Local $sConfigFileTempExists = FileExists($aConfigFileTempFull)
If $sConfigFileTempExists = 1 Then
FileDelete($aConfigFileTempFull)
EndIf
FileWrite($aConfigFileTempFull, $tConfigRead1)
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
FileWriteLine($aConfigFileTempFull, "<property name=""TelnetEnabled"" value=""" & $aServerTelnetEnable & """/>")
FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPort"" value=""" & $aTelnetPort & """/>")
FileWriteLine($aConfigFileTempFull, "<property name=""TelnetPassword"" value=""" & $aTelnetPass & """/>")
FileWriteLine($aConfigFileTempFull, "</ServerSettings>")
FileWriteLine($aLogFile, _NowCalc() & " ----- Restarting server to apply the following config change(s): " & StringRegExpReplace($aServerRebootReason, @CRLF, " "))
FileClose($aConfigFileTempFull)
SplashTextOn($aUtilName, "Restarting server to apply config change(s)." & @CRLF & "Server name: " & $aServerNameVer & @CRLF & "Game Name: " & $aGameName & @CRLF & @CRLF & "Reboot Reason(s):" & @CRLF & $aServerRebootReason & @CRLF & "Please wait one minute.", 600, 350, -1, -1, $DLG_MOVEABLE, "")
$aRebootConfigUpdate = "yes"
$aRebootMe = "no"
$aServerTelnetReboot = "no"
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
EndIf
If @error Or Not $aServerPID Then
If Not IsDeclared("iMsgBoxAnswer") Then Local $iMsgBoxAnswer
$iMsgBoxAnswer = MsgBox(262405, "Server Failed to Start", "The server tried to start, but it failed. Try again? This will automatically close in 60 seconds and try to start again.", 60)
Select
Case $iMsgBoxAnswer = 4
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start. User Initiated a Restart Attempt.")
Case $iMsgBoxAnswer = 2
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server Failed to Start - " & $aUtilName & " Shutdown - Initiated by User")
Exit
Case $iMsgBoxAnswer = -1
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
#EndRegion
#Region
If $aServerOnlinePlayerYN = "yes" Then
If ((_DateDiff('s', $aTimeCheck8, _NowCalc())) >= $aServerOnlinePlayerSec) Then
$aOnlinePlayers = GetPlayerCount(False)
ShowPlayerCount()
If $aServerReadyTF And $aServerReadyOnce Then
If $aNoExistingPID Then
If $sUseDiscordBotServersUpYN = "yes" Then
Local $aAnnounceCount3 = 0
If $aRebootReason = "remoterestart" And $sUseDiscordBotRemoteRestart = "yes" Then
SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
$aAnnounceCount3 = $aAnnounceCount3 + 1
EndIf
If $aRebootReason = "update" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
$aAnnounceCount3 = $aAnnounceCount3 + 1
EndIf
If $aRebootReason = "mod" And $sUseDiscordBotUpdate = "yes" And ($aAnnounceCount3 = 0) Then
SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
$aAnnounceCount3 = $aAnnounceCount3 + 1
EndIf
If $aRebootReason = "daily" And $sUseDiscordBotDaily = "yes" And ($aAnnounceCount3 = 0) Then
SplashTextOn($aUtilName, " Server online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
$aAnnounceCount3 = $aAnnounceCount3 + 1
EndIf
If $aFirstStartDiscordAnnounce And ($aAnnounceCount3 = 0) Then
SplashTextOn($aUtilName, " All servers online and ready for connection." & @CRLF & @CRLF & "Discord announcement sent . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
SendDiscordMsg($sDiscordWebHookURLs, $sDiscordServersUpMessage, $sDiscordBotName, $bDiscordBotUseTTS, $sDiscordBotAvatar)
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
#EndRegion
#Region
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
#EndRegion
#Region
If ($aTelnetCheckYN = "yes") And (_DateDiff('s', $gTelnetTimeCheck0, _NowCalc()) >= $aTelnetCheckSec) Then
$TelnetCheckResult = TelnetCheck($aTelnetIP, $aTelnetPort, $aTelnetPass)
$gTelnetTimeCheck0 = _NowCalc()
EndIf
#EndRegion
#Region
If ($aCheckForUpdate = "yes") And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aUpdateCheckInterval) And ($aBeginDelayedShutdown = 0) Then
Local $bRestart = UpdateCheck(False)
If $bRestart And (($sUseDiscordBotDaily = "yes") Or ($sUseDiscordBotUpdate = "yes") Or ($sUseTwitchBotDaily = "yes") Or ($sUseTwitchBotUpdate = "yes") Or ($sInGameAnnounce = "yes")) Then
$aBeginDelayedShutdown = 1
$aRebootReason = "update"
ElseIf $bRestart Then
RunExternalScriptUpdate()
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
EndIf
$aTimeCheck0 = _NowCalc()
EndIf
#EndRegion
#Region
If $aDelayShutdownTime Not = 0 Then
If $aBeginDelayedShutdown = 1 Then
RunExternalScriptAnnounce()
If $aRebootReason = "daily" Then
$aAnnounceCount0 = $aDailyCnt
$aAnnounceCount1 = $aAnnounceCount0 - 1
If $aAnnounceCount1 = 0 Then
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
ElseIf ($aBeginDelayedShutdown > 2 And ((_DateDiff('n', $aTimeCheck0, _NowCalc())) >= $aDelayShutdownTime)) Then
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
SendInGame($aTelnetIP, $aTelnetPort, $aTelnetPass, "FINAL WARNING! Rebooting server in 10 seconds...")
Sleep(10000)
EndIf
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
ElseIf ($aBeginDelayedShutdown = 2) And (_DateDiff('n', $aTimeCheck0, _NowCalc()) >= $aDelayShutdownTime) Then
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
#EndRegion
#Region
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
#EndRegion
$aServerCheck = TimerInit()
TraySetToolTip(@ScriptName)
TraySetIcon(@ScriptName, 99)
EndIf
WEnd
#Region
Func Gamercide()
SplashOff()
Local $aMsg = "Thank you for using " & $aUtilName & "." & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & "Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com"
If @exitMethod <> 1 Then
$Shutdown = MsgBox($MB_YESNOCANCEL, $aUtilName, "Utility exited unexpectedly or before it was fully initialized." & @CRLF & @CRLF & "Close utility?" & @CRLF & @CRLF & "Click (YES) to shutdown server and exit utility." & @CRLF & "Click (NO) or (CANCEL) to exit utility but leave server running.", 60)
If $Shutdown = 6 Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
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
ElseIf $Shutdown = 7 Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
If $aRemoteRestartUse = "yes" Then
TCPShutdown()
EndIf
PIDSaveServer($aServerPID, $aPIDServerFile)
MsgBox(4096, $aUtilityVer, $aMsg, 20)
FileWriteLine($aLogFile, _NowCalc() & " [Server] Stopped by User")
Exit
ElseIf $Shutdown = 2 Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
If $aRemoteRestartUse = "yes" Then
TCPShutdown()
EndIf
PIDSaveServer($aServerPID, $aPIDServerFile)
MsgBox(4096, $aUtilityVer, $aMsg, 20)
FileWriteLine($aLogFile, _NowCalc() & " [Server] Stopped by User")
EndIf
Else
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server Shutdown - Initiated by User when closing " & $aUtilityVer & " Script")
SplashOff()
Exit
EndIf
EndFunc
#EndRegion
#Region
Func CloseServer($ip, $port, $pass)
If $aRebootConfigUpdate = "no" Then
SplashTextOn($aUtilName, "Shutting down 7 Days to Die server . . .", 350, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
$aServerReadyOnce = True
$aServerReadyTF = False
$aAnnounceCount1 = 0
$aFPCount = 0
For $i = 1 To 5
If $aRebootConfigUpdate = "no" Then
SplashTextOn($aUtilName, "Sending shutdown command to server . . ." & @CRLF & @CRLF & "Countdown: " & (6 - $i), 350, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
FileWriteLine($aLogFile, _NowCalc() & " [Server] Sending shutdown command to server. Countdown:" & (6 - $i))
$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, "shutdown", True)
If StringInStr($aReply, "shutting server down") = 0 Then
Sleep(1000)
Else
SplashOff()
ExitLoop
EndIf
Next
For $i = 1 To 10
If ProcessExists($aServerPID) Then
If $aRebootConfigUpdate = "no" Then
SplashTextOn($aUtilName, "Waiting for server to finish shutting down." & @CRLF & @CRLF & "Countdown: " & (11 - $i), 350, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
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
SplashTextOn($aUtilName, "Server failed to shutdown. Killing process." & @CRLF & @CRLF & "Countdown: " & (11 - $i), 350, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Server failed to shutdown. Killing process. Countdown:" & (11 - $i))
Sleep(1000)
Else
ExitLoop
EndIf
Next
If $aRebootConfigUpdate = "no" Then
SplashOff()
EndIf
If FileExists($aPIDServerFile) Then
FileDelete($aPIDServerFile)
EndIf
SplashOff()
If $aSteamUpdateNow Then
SteamUpdate()
EndIf
$aRebootConfigUpdate = "no"
EndFunc
#EndRegion
#Region
Func LogWrite($sString)
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] " & $sString)
EndFunc
Func RotateFile($sFile, $sBackupQty, $bDelOrig = True)
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
EndFunc
#EndRegion
#Region
Func SendInGame($ip, $port, $pass, $tMsg)
$tMsg = "say """ & $tMsg & """"
$aReply = SendTelnetTT($ip, $port, $pass, $tMsg, False)
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] In-game message sent (" & $tMsg & ") " & $aReply)
EndFunc
#EndRegion
#Region
Func TelnetCheck($ip, $port, $pass)
For $i = 1 To 6
$aReply = SendTelnetTT($ip, $port, $pass, "version", False)
If $i = 6 Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] KeepAlive check FAILED ALL 5 COUNTS. Restarting server.")
CloseServer($ip, $port, $pass)
ExitLoop
EndIf
If StringInStr($aReply, "Game version") = 0 Then
Sleep(1000)
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] KeepAlive check failed. Count:" & $i)
Else
ExitLoop
EndIf
Next
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] KeepAlive check OK.")
EndIf
EndFunc
#EndRegion
#Region
Func _Discord_ErrFunc($oError)
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & " (PID: " & $aServerPID & ")] Error: 0x" & Hex($oError.number) & " While Sending Discord Bot Message.")
EndFunc
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
EndFunc
#EndRegion
#Region
Opt("TCPTimeout", 500)
Func SendTwitchMsg($sT_Nick, $sT_OAuth, $sT_Channels, $sT_Message)
Local $aTwitchReturn[4] = [False, False, "", False]
Local $sTwitchIRC = TCPConnect(TCPNameToIP("irc.chat.twitch.tv"), 6667)
If @error Then
TCPCloseSocket($sTwitchIRC)
Return $aTwitchReturn
Else
$aTwitchReturn[0] = True
TCPSend($sTwitchIRC, "PASS " & StringLower($sT_OAuth) & @CRLF)
TCPSend($sTwitchIRC, "NICK " & StringLower($sT_Nick) & @CRLF)
Local $sTwitchReceive = ""
Local $iTimer1 = TimerInit()
While TimerDiff($iTimer1) < 1000
$sTwitchReceive &= TCPRecv($sTwitchIRC, 1)
If @error Then ExitLoop
WEnd
Local $aTwitchReceiveLines = StringSplit($sTwitchReceive, @CRLF, 1)
$aTwitchReturn[2] = $aTwitchReceiveLines[1]
If StringRegExp($aTwitchReceiveLines[$aTwitchReceiveLines[0] - 1], "(?i):tmi.twitch.tv 376 " & $sT_Nick & " :>") Then
$aTwitchReturn[1] = True
Local $aTwitchChannels = StringSplit($sT_Channels, ",")
For $i = 1 To $aTwitchChannels[0]
TCPSend($sTwitchIRC, "PRIVMSG #" & StringLower($aTwitchChannels[$i]) & " :" & $sT_Message & @CRLF)
If @error Then
TCPCloseSocket($sTwitchIRC)
$aTwitchReturn[3] = False
Return $aTwitchReturn
ExitLoop
Else
$aTwitchReturn[3] = True
If $aTwitchChannels[0] > 17 Then
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
EndFunc
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
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
Func RunExternalScriptDaily()
If $aExternalScriptDailyYN = "yes" Then
FileWriteLine($aLogFile, _NowCalc() & " Executing DAILY restart external script " & $aExternalScriptDailyDir & "\" & $aExternalScriptDailyFileName)
If $aExternalScriptHideYN = "yes" Then
Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir, @SW_HIDE)
Else
Run($aExternalScriptDailyDir & '\' & $aExternalScriptDailyFileName, $aExternalScriptDailyDir)
EndIf
EndIf
EndFunc
Func RunExternalScriptAnnounce()
If $aExternalScriptAnnounceYN = "yes" Then
FileWriteLine($aLogFile, _NowCalc() & " Executing FIRST ANNOUNCEMENT external script " & $aExternalScriptAnnounceDir & "\" & $aExternalScriptAnnounceFileName)
If $aExternalScriptHideYN = "yes" Then
Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir, @SW_HIDE)
Else
Run($aExternalScriptAnnounceDir & '\' & $aExternalScriptAnnounceFileName, $aExternalScriptAnnounceDir)
EndIf
EndIf
EndFunc
Func RunExternalRemoteRestart()
If $aExternalScriptRemoteYN = "yes" Then
FileWriteLine($aLogFile, _NowCalc() & " Executing REMOTE RESTART external script " & $aExternalScriptRemoteDir & "\" & $aExternalScriptRemoteFileName)
If $aExternalScriptHideYN = "yes" Then
Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir, @SW_HIDE)
Else
Run($aExternalScriptRemoteDir & '\' & $aExternalScriptRemoteFileName, $aExternalScriptRemoteDir)
EndIf
EndIf
EndFunc
Func RunExternalScriptUpdate()
If $aExternalScriptUpdateYN = "yes" Then
FileWriteLine($aLogFile, _NowCalc() & " Executing Script When Restarting For Server Update: " & $aExternalScriptUpdateDir & "\" & $aExternalScriptUpdateFileName)
If $aExternalScriptHideYN = "yes" Then
Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir, @SW_HIDE)
Else
Run($aExternalScriptUpdateDir & '\' & $aExternalScriptUpdateFileName, $aExternalScriptUpdateDir)
EndIf
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
EndFunc
#Region
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
MsgBox($mb_ok, "ERROR", " [Update] Error retrieving buildid via SteamDB website. Please visit:" & @CRLF & @CRLF & $aURL & @CRLF & @CRLF & "in *Internet Explorer* (NOT Chrome.. must be Internet Explorer) to CAPTCHA authorize your PC or use SteamCMD for updates." & @CRLF & "! Press OK to close " & $aUtilName & " !")
FileWriteLine($aLogFile, _NowCalc() & "Error retrieving buildid via SteamDB website. Please visit:" & $aURL & "in **Internet Explorer** (NOT Chrome.. must be Internet Explorer) to CAPTCHA authorize your PC or use SteamCMD for updates.")
EndIf
If FileExists($sFilePath) Then
FileDelete($sFilePath)
EndIf
$aReturn[0] = True
$aReturn[1] = $hBuildID
Return $aReturn
EndFunc
Func GetLatestVersion($sCmdDir)
$hBuildID = "0"
Local $aReturn[2] = [False, ""]
DirRemove($sCmdDir & "\appcache", 1)
DirRemove($sCmdDir & "\depotcache", 1)
$sAppInfoTemp = "app_info_" & StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_") & ".tmp"
$aSteamUpdateCheck = '"' & @ComSpec & '" /c "' & $sCmdDir & "\steamcmd.exe"" +login anonymous +app_info_update 1 +app_info_print " & $aSteamAppID & " +app_info_print " & $aSteamAppID & " +app_info_print " & $aSteamAppID & " +exit > " & $sAppInfoTemp
RunWait($aSteamUpdateCheck, $aSteamCMDDir, @SW_MINIMIZE)
Local Const $sFilePath = $sCmdDir & "\" & $sAppInfoTemp
Local $hFileOpen = FileOpen($sFilePath, 0)
Local $hFileRead1 = FileRead($hFileOpen)
If $hFileOpen = -1 Then
$aReturn[0] = False
FileWriteLine($aLogFile, _NowCalc() & " [Update] SteamCMD update check FAILED to create update file. Skipping this update check.")
Else
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
$aReturn[0] = False
FileWriteLine($aLogFile, _NowCalc() & " [Update] SteamCMD update check returned a FAILURE reponse. Skipping this update check.")
EndIf
FileClose($hFileOpen)
EndIf
$aReturn[1] = $hBuildID
Return $aReturn
EndFunc
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
EndFunc
Func UpdateCheck($tAsk)
Local $bUpdateRequired = False
$aSteamUpdateNow = False
If $aUpdateSource = "1" Then
If $aFirstBoot Or $tAsk Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamDB.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
Local $aLatestVersion = GetLatestVerSteamDB($aSteamAppID, $aServerVer)
Else
If $aFirstBoot Or $tAsk Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Acquiring latest buildid from SteamCMD.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
Local $aLatestVersion = GetLatestVersion($aSteamCMDDir)
EndIf
If $aFirstBoot Or $tAsk Then
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Retrieving installed version buildid.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
Local $aInstalledVersion = GetInstalledVersion($aServerDirLocal)
SplashOff()
If ($aLatestVersion[0] And $aInstalledVersion[0]) Then
If StringCompare($aLatestVersion[1], $aInstalledVersion[1]) = 0 Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server is Up to Date. Installed Version: " & $aInstalledVersion[1])
If $tAsk Then
MsgBox($MB_OK, $aUtilityVer, "Server is Up to Date." & @CRLF & @CRLF & "Installed Version: " & $aInstalledVersion[1] & @CRLF & "   Latest Version: " & $aLatestVersion[1], 5)
EndIf
Else
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server is Out of Date! Installed Version: " & $aInstalledVersion[1] & " Latest Version: " & $aLatestVersion[1])
If $tAsk Then
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilityVer, "Server is Out of Date!!!" & @CRLF & @CRLF & "Installed Version: " & $aInstalledVersion[1] & @CRLF & "   Latest Version: " & $aLatestVersion[1] & @CRLF & @CRLF & "Click (YES) to update server NOW." & @CRLF & "Click (NO) to update server with " & $aUpdateTime[UBound($aUpdateTime) - 1] & " minute announcements." & @CRLF & "Click (CANCEL) to continue without updating.", 15)
If $tMB = 6 Then
$bUpdateRequired = True
$aSteamUpdateNow = True
$aUpdateVerify = "yes"
RunExternalScriptUpdate()
$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
SplashTextOn($aUtilName, "Beginning update. Shutting down and updating server now.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
SplashOff()
ElseIf $tMB = 7 Then
$bUpdateRequired = True
$aSteamUpdateNow = True
$aUpdateVerify = "yes"
RunExternalScriptUpdate()
$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
Else
SplashTextOn($aUtilName, "Utility update check canceled by user." & @CRLF & "Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
Else
If $aFirstBoot Then
SplashOff()
SplashTextOn($aUtilName, "Server is Out of Date!" & @CRLF & "Installed Version: " & $aInstalledVersion[1] & @CRLF & "Latest Version: " & $aLatestVersion[1] & @CRLF & "Updating server . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
EndIf
$bUpdateRequired = True
$aSteamUpdateNow = True
$aUpdateVerify = "yes"
RunExternalScriptUpdate()
$TimeStamp = StringRegExpReplace(_NowCalc(), "[\\\/\: ]", "_")
$aRebootMe = "yes"
$bUpdateRequired = True
EndIf
EndIf
ElseIf Not $aLatestVersion[0] And Not $aInstalledVersion[0] Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Something went wrong retrieving Latest & Installed Versions. Running update with -validate")
SplashTextOn($aUtilName, "Something went wrong retrieving Latest & Installed Versions." & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 500, 125, -1, -1, $DLG_MOVEABLE, "")
$bUpdateRequired = True
$aSteamUpdateNow = True
ElseIf Not $aInstalledVersion[0] Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Something went wrong retrieving Installed Version. Running update with -validate. (This is normal for new install)")
SplashTextOn($aUtilName, "Something went wrong retrieving Installed Version." & @CRLF & "(This is normal for new install)" & @CRLF & "- Running update with -validate" & @CRLF & @CRLF & "(Restart will be delayed if 'announce restart' is enabled)", 450, 175, -1, -1, $DLG_MOVEABLE, "")
$bUpdateRequired = True
$aSteamUpdateNow = True
ElseIf Not $aLatestVersion[0] Then
FileWriteLine($aLogFile, _NowCalc() & " [Update] Something went wrong retrieving Latest Version.  Skipping this update check.")
MsgBox($MB_OK, $aUtilityVer, "Something went wrong retrieving Latest Version. Skipping this update check." & @CRLF & @CRLF & "(This window will close in 5 seconds)", 5)
EndIf
$aFirstBoot = False
Return $bUpdateRequired
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
Func RemoveInvalidCharacters($aString)
Local $bString = StringRegExpReplace($aString, "[\x3D\x22\x3B\x3C\x3E\x3F\x25\x27\x7C]", "")
If $aString = $bString Then
Else
FileWriteLine($aLogFile, _NowCalc() & " [ERROR] Invalid character found in " & $aIniFile & ". Changed parameter from """ & $aString & """ to """ & $bString & """.")
EndIf
Return $bString
EndFunc
#EndRegion
Func SteamUpdate()
SplashTextOn($aUtilName, "Updating server now...", 400, 110, -1, -1, $DLG_MOVEABLE, "")
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
$aSteamUpdateNow = False
If $aServerVer = 1 Then
If $aValidate = "yes" Then
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD Beta with validate: [" & $aSteamUpdateCMDBetaValY & "]")
Else
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD Beta with validate.")
EndIf
RunWait($aSteamUpdateCMDValY)
Else
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD Beta without validate. [" & $aSteamUpdateCMDBetaValN & "]")
Else
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD Beta without validate.")
EndIf
RunWait($aSteamUpdateCMDValN)
EndIf
Else
If $aValidate = "yes" Then
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD with validate: [" & $aSteamUpdateCMDValY & "]")
Else
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD with validate.")
EndIf
RunWait($aSteamUpdateCMDValY)
Else
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD without validate. [" & $aSteamUpdateCMDValN & "]")
Else
FileWriteLine($aLogFile, _NowCalc() & " [Steam Update] Running SteamCMD without validate.")
EndIf
RunWait($aSteamUpdateCMDValN)
EndIf
EndIf
SplashOff()
EndFunc
#Region
Func _ExtractZip($sZipFile, $sFolderStructure, $sFile, $sDestinationFolder)
Local $i
Do
$i += 1
$sTempZipFolder = @TempDir & "\Temporary Directory " & $i & " for " & StringRegExpReplace($sZipFile, ".*\\", "")
Until Not FileExists($sTempZipFolder)
Local $oShell = ObjCreate("Shell.Application")
If Not IsObj($oShell) Then
Return SetError(1, 0, 0)
EndIf
Local $oDestinationFolder = $oShell.NameSpace($sDestinationFolder)
If Not IsObj($oDestinationFolder) Then
Return SetError(2, 0, 0)
EndIf
Local $oOriginFolder = $oShell.NameSpace($sZipFile & "\" & $sFolderStructure)
If Not IsObj($oOriginFolder) Then
Return SetError(3, 0, 0)
EndIf
Local $oOriginFile = $oOriginFolder.ParseName($sFile)
If Not IsObj($oOriginFile) Then
Return SetError(4, 0, 0)
EndIf
$oDestinationFolder.CopyHere($oOriginFile, 4)
DirRemove($sTempZipFolder, 1)
Return 1
EndFunc
#EndRegion
#Region
#Region
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
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilityVer, "New " & $aUtilName & " update available. " & @CRLF & "Installed version: " & $tUtil & @CRLF & "Latest version: " & $tVer[0] & @CRLF & @CRLF & "Notes: " & @CRLF & $tVer[1] & @CRLF & @CRLF & "Click (YES) to download update to " & @CRLF & @ScriptDir & @CRLF & "Click (NO) to stop checking for updates." & @CRLF & "Click (CANCEL) to skip this update check.", 15)
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
If Not FileExists(@ScriptDir & "\" & $tUtilName & "_" & $tVer[0] & ".exe") Then
FileWriteLine($aLogFile, _NowCalc() & " [UTIL] ERROR! " & $tUtilName & ".exe download failed.")
SplashOff()
$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download failed . . . " & @CRLF & "Go to """ & $tLink & """ to download latest version." & @CRLF & @CRLF & "Click (OK), (CANCEL), or wait 15 seconds, to resume current version.", 15)
Else
SplashOff()
$tMB = MsgBox($MB_OKCANCEL, $aUtilityVer, "Download complete. . . " & @CRLF & @CRLF & "Click (OK) to run new version (server will remain running) OR" & @CRLF & "Click (CANCEL), or wait 15 seconds, to resume current version.", 15)
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
EndFunc
Func ReplaceReturn($tMsg0)
If StringInStr($tMsg0, "|") = "0" Then
Return $tMsg0
Else
Return StringReplace($tMsg0, "|", @CRLF)
EndIf
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
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
EndFunc
#Region
#Region
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
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
Func _TCP_Server_ClientIP($hSocket)
Local $pSocketAddress, $aReturn
$pSocketAddress = DllStructCreate("short;ushort;uint;char[8]")
$aReturn = DllCall("ws2_32.dll", "int", "getpeername", "int", $hSocket, "ptr", DllStructGetPtr($pSocketAddress), "int*", DllStructGetSize($pSocketAddress))
If @error Or $aReturn[0] <> 0 Then Return $hSocket
$aReturn = DllCall("ws2_32.dll", "str", "inet_ntoa", "int", DllStructGetData($pSocketAddress, 3))
If @error Then Return $hSocket
$pSocketAddress = 0
Return $aReturn[0]
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
Func RemoveTrailingSlash($aString)
Local $bString = StringRight($aString, 1)
If $bString = "\" Then
$aString = StringTrimRight($sString, 1)
EndIf
Return $aString
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
#Region
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
Return SetError(2, 0, "Invalid Restart Request by: " & $sRecvIP & ".")
Else
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
EndFunc
#EndRegion
#Region
Func ReadUini($sIniFile, $sLogFile)
If FileExists($aIniFailFile) Then
FileDelete($aIniFailFile)
EndIf
Local $iIniError = ""
Local $iIniFail = 0
Local $iniCheck = ""
Local $aChar[3]
For $i = 1 To 13
$aChar[0] = Chr(Random(97, 122, 1))
$aChar[1] = Chr(Random(48, 57, 1))
$iniCheck &= $aChar[Random(0, 1, 1)]
Next
Global $aServerDirLocal = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $iniCheck)
Global $aConfigFile = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $iniCheck)
Global $aServerVer = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (0-Stable,1-Experimental) ###", $iniCheck)
Global $aServerExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $iniCheck)
Global $aServerIP = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $iniCheck)
Global $aSteamCMDDir = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $iniCheck)
Global $aSteamExtraCMD = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (ex. -latest_experimental) ###", $iniCheck)
Global $aServerOnlinePlayerYN = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $iniCheck)
Global $aServerOnlinePlayerSec = IniRead($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $iniCheck)
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
Global $aCheckForUpdate = IniRead($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", $iniCheck)
Global $aUpdateCheckInterval = IniRead($sIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Update check interval in Minutes (05-59) ###", $iniCheck)
Global $aRestartDaily = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Use scheduled restarts? (yes/no) ###", $iniCheck)
Global $aRestartDays = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart days (comma separated 0-Everyday 1-Sunday 7-Saturday 0-7 ex.2,4,6) ###", $iniCheck)
Global $bRestartHours = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart hours (comma separated 00-23 ex.04,16) ###", $iniCheck)
Global $bRestartMin = IniRead($sIniFile, " --------------- SCHEDULED RESTARTS --------------- ", "Restart minute (00-59) ###", $iniCheck)
Global $sAnnounceNotifyTime1 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before DAILY reboot (comma separated 0-60) ###", $iniCheck)
Global $sAnnounceNotifyTime2 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before UPDATES reboot (comma separated 0-60) ###", $iniCheck)
Global $sAnnounceNotifyTime3 = IniRead($sIniFile, " --------------- ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement _ minutes before REMOTE RESTART reboot (comma separated 0-60) ###", $iniCheck)
Global $sInGameAnnounce = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announce messages in-game? (Requires telnet) (yes/no) ###", $iniCheck)
Global $sInGameDailyMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
Global $sInGameUpdateMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
Global $sInGameRemoteRestartMessage = IniRead($sIniFile, " --------------- IN-GAME ANNOUNCEMENT CONFIGURATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
Global $sUseDiscordBotDaily = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for DAILY reboot? (yes/no) ###", $iniCheck)
Global $sUseDiscordBotUpdate = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for UPDATE reboot? (yes/no) ###", $iniCheck)
Global $sUseDiscordBotRemoteRestart = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for REMOTE RESTART reboot? (yes/no) ###", $iniCheck)
Global $sUseDiscordBotServersUpYN = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message when server is back online (yes/no) ###", $iniCheck)
Global $sUseDiscordBotFirstAnnouncement = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Send Discord message for first ANNOUNCEMENT only? (reduces bot spam)(yes/no) ###", $iniCheck)
Global $sDiscordDailyMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement DAILY (\m - minutes) ###", $iniCheck)
Global $sDiscordUpdateMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement UPDATES (\m - minutes) ###", $iniCheck)
Global $sDiscordRemoteRestartMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement REMOTE RESTART (\m - minutes) ###", $iniCheck)
Global $sDiscordServersUpMessage = IniRead($sIniFile, " --------------- DISCORD INTEGRATION --------------- ", "Announcement when server is back online ###", $iniCheck)
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
Global $sObfuscatePass = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $iniCheck)
Global $aUpdateUtil = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $iniCheck)
Global $aUtilBetaYN = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $iniCheck)
Global $aExternalScriptHideYN = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $iniCheck)
Global $aDebug = IniRead($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Enable debug to output more log detail? (yes/no) ###", $iniCheck)
Global $aFPAutoUpdateYN = IniRead($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $iniCheck)
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
EndIf
If $iniCheck = $aUtilBetaYN Then
$aUtilBetaYN = "1"
$iIniFail += 1
$iIniError = $iIniError & "UtilBetaYN, "
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
Global $xDebug = True
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
EndFunc
Func iniFileCheck($sIniFile, $iIniFail, $iIniError)
If FileExists($sIniFile) Then
Local $aMyDate, $aMyTime
_DateTimeSplit(_NowCalc(), $aMyDate, $aMyTime)
Local $iniDate = StringFormat("%04i.%02i.%02i.%02i%02i", $aMyDate[1], $aMyDate[2], $aMyDate[3], $aMyTime[1], $aMyTime[2])
FileMove($sIniFile, $sIniFile & "_" & $iniDate & ".bak", 1)
UpdateIni($sIniFile)
Local $iIniErrorCRLF = StringRegExpReplace($iIniError, ", ", @CRLF & @TAB)
FileWriteLine($aIniFailFile, _NowCalc() & @CRLF & " ---------- Parameters missing or changed ----------" & @CRLF & @CRLF & @TAB & $iIniErrorCRLF)
FileWriteLine($aLogFile, _NowCalc() & " INI MISMATCH: Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini. Backup created and all existing settings transfered to new INI. Please modify INI and restart.")
FileWriteLine($aLogFile, _NowCalc() & " INI MISMATCH: Parameters missing: " & $iIniFail)
SplashOff()
MsgBox(4096, "INI MISMATCH", "INI FILE WAS UPDATED." & @CRLF & "Found " & $iIniFail & " missing variable(s) in " & $aUtilName & ".ini:" & @CRLF & @CRLF & $iIniError & @CRLF & @CRLF & "Backup created and all existing settings transfered to new INI." & @CRLF & @CRLF & "Please modify INI and restart." & @CRLF & @CRLF & "File created: ___INI_FAIL_VARIABLES___.txt")
Run("notepad " & $aIniFailFile, @WindowsDir)
Exit
Else
UpdateIni($sIniFile)
SplashOff()
MsgBox(4096, "Default INI File Created", "Please Modify Default Values and Restart Program." & @CRLF & @CRLF & "IF NEW DEDICATED SERVER INSTALL:" & @CRLF & " - Once the server is installed and running," & @CRLF & "Rt-Click on " & $aUtilName & " icon and shutdown server." & @CRLF & " - Then modify the server files and restart this utility.")
FileWriteLine($aLogFile, _NowCalc() & " Default INI File Created . . Please Modify Default Values and Restart Program.")
Exit
EndIf
EndFunc
Func UpdateIni($sIniFile)
FileWriteLine($sIniFile, "[ --------------- " & StringUpper($aUtilName) & " INFORMATION --------------- ]")
FileWriteLine($sIniFile, "Author   :  Phoenix125")
FileWriteLine($sIniFile, "Version  :  " & $aUtilityVer)
FileWriteLine($sIniFile, "Website  :  http://www.Phoenix125.com")
FileWriteLine($sIniFile, "Discord  :  http://discord.gg/EU7pzPs")
FileWriteLine($sIniFile, "Forum    :  https://phoenix125.createaforum.com/index.php")
FileWriteLine($sIniFile, @CRLF)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " DIR ###", $aServerDirLocal)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " config ###", $aConfigFile)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Version (0-Stable,1-Experimental) ###", $aServerVer)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", $aServerShort & " extra commandline parameters (ex. -serverpassword) ###", $aServerExtraCMD)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Server Local IP (ex. 192.168.1.10) ###", $aServerIP)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD DIR ###", $aSteamCMDDir)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "SteamCMD extra commandline parameters (ex. -latest_experimental) ###", $aSteamExtraCMD)
FileWriteLine($sIniFile, @CRLF)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", $aServerOnlinePlayerYN)
IniWrite($sIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for online players every _ seconds (30-600) ###", $aServerOnlinePlayerSec)
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
IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide passwords in log files? (yes/no) ###", $sObfuscatePass)
IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Hide external scripts when executed? (if yes, scripts may not execute properly) (yes/no) ###", $aExternalScriptHideYN)
IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Check for " & $aUtilName & " updates? (yes/no) ###", $aUpdateUtil)
IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", $aUtilName & " version: (0)Stable, (1)Beta ###", $aUtilBetaYN)
IniWrite($sIniFile, " --------------- " & StringUpper($aUtilName) & " MISC OPTIONS --------------- ", "Enable debug to output more log detail? (yes/no) ###", $aDebug)
FileWriteLine($sIniFile, @CRLF)
FileWriteLine($sIniFile, "[--------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS ---------------]")
FileWriteLine($sIniFile, "During updates, The Fun Pimps sometimes make changes to the ServerConfig.xml file, which can cause the server to fail to start when using the old config file.")
FileWriteLine($sIniFile, "  This section is a best-effort attempt to temporarily adjust to those changes during server updates to keep your server running.")
FileWriteLine($sIniFile, "  If automatic import enabled above, this utility will attempt two reboots. If The server fails to boot after the second reboot,")
FileWriteLine($sIniFile, "  it will backup of your existing serverconfig file (as listed in Game Server Configuration section),")
FileWriteLine($sIniFile, "  copy the contents from the new ServerConfig.xml, import data from your existing config file, and add this data")
FileWriteLine($sIniFile, "  to your serverconfig file (as listed above) at the end of the file.")
FileWriteLine($sIniFile, "Therefore, after an update, it is recommended that you review your config file and make any changes.")
FileWriteLine($sIniFile, "The following parameters will be imported:")
FileWriteLine($sIniFile, "  ServerName, ServerPort, ServerPassword, TelnetPort, TelnetPassword, ServerLoginConfirmationText, ServerMaxPlayerCount, ServerDescription,")
FileWriteLine($sIniFile, "  ServerWebsiteURL,, ServerDisabledNetworkProtocols, GameWorld, WorldGenSeed, WorldGenSize, GameName, GameDifficulty, ServerLoginConfirmationText, DropOnDeath")
IniWrite($sIniFile, " --------------- (ALMOST) FUTURE PROOF UPDATE OPTIONS --------------- ", "Automatically import old priority settings into new config? (yes/no) ###", $aFPAutoUpdateYN)
FileWriteLine($sIniFile, @CRLF)
EndFunc
#EndRegion
#Region
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
EndFunc
#EndRegion
Func PIDReadServer($tFile)
Local $tTmp = FileOpen($tFile)
If $tTmp = -1 Then
$tReturn = "0"
FileWriteLine($aLogFile, _NowCalc() & " [Util] No existing server found. Will start new server.")
$aNoExistingPID = True
Else
$aNoExistingPID = False
$tReturn = FileRead($tTmp)
FileClose($tTmp)
If ProcessExists($tReturn) Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Server PID(" & $tReturn & ") found.")
SplashTextOn($aUtilName, $aUtilName & " " & $aUtilVersion & " started." & @CRLF & @CRLF & "Running server found." & @CRLF & "PID:(" & $tReturn & ")", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Else
$aNoExistingPID = True
FileWriteLine($aLogFile, _NowCalc() & " [Server] -ERROR- Server PID(" & $tReturn & ") NOT found. Server will be restarted.")
EndIf
Sleep(2500)
EndIf
Return $tReturn
EndFunc
Func TrayExitCloseN()
FileWriteLine($aLogFile, _NowCalc() & " [Server] Utility exit without server shutdown initiated by user via tray icon (Exit: Do NOT Shut Down Servers).")
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to close this utility?" & @CRLF & "(Server will remain running)" & @CRLF & @CRLF & "Click (YES) to close this utility." & @CRLF & "Click (NO) or (CANCEL) to cancel.", 15)
If $tMB = 6 Then
MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & @CRLF & "SERVER IS STILL RUNNING ! ! !" & @CRLF & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & "Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
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
EndFunc
Func TrayExitCloseY()
FileWriteLine($aLogFile, _NowCalc() & " [" & $aServerName & "] Utility exit with server shutdown initiated by user via tray icon (Exit: Shut Down Servers).")
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to shut down server and exit this utility?" & @CRLF & @CRLF & "Click (YES) to Shutdown server and exit." & @CRLF & "Click (NO) or (CANCEL) to cancel.", 15)
If $tMB = 6 Then
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
SplashOff()
MsgBox(4096, $aUtilityVer, "Thank you for using " & $aUtilName & "." & @CRLF & "Please report any problems or comments to: " & @CRLF & "Discord: http://discord.gg/EU7pzPs or " & @CRLF & "Forum: http://phoenix125.createaforum.com/index.php. " & @CRLF & @CRLF & "Visit http://www.Phoenix125.com", 20)
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
EndFunc
Func TrayRestartNow()
FileWriteLine($aLogFile, _NowCalc() & " [Server] Restart Server Now requested by user via tray icon (Restart Server Now).")
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to Restart Server Now?" & @CRLF & @CRLF & "Click (YES) to Restart Server Now." & @CRLF & "Click (NO) or (CANCEL) to cancel.", 15)
If $tMB = 6 Then
If $aBeginDelayedShutdown = 0 Then
FileWriteLine($aLogFile, _NowCalc() & " [Server] Restart Server Now request initiated by user.")
CloseServer($aTelnetIP, $aTelnetPort, $aTelnetPass)
EndIf
Else
FileWriteLine($aLogFile, _NowCalc() & " [Server] Restart Server Now request canceled by user.")
SplashTextOn($aUtilName, "Restart Server Now canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
EndIf
SplashOff()
EndFunc
Func TrayRemoteRestart()
FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart requested by user via tray icon (Initiate Remote Restart).")
If $aRemoteRestartUse <> "yes" Then
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "You must enable Remote Restart in the " & $aUtilName & ".ini." & @CRLF & @CRLF & "Would you like to enable it? (Port:" & $aRemoteRestartPort & ")" & @CRLF & "Click (YES) to enable Remote Restart." & @CRLF & "Click (NO) or (CANCEL) to skip.", 15)
If $tMB = 6 Then
FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] Remote Restart enabled in " & $aUtilName & ".ini per user request")
IniWrite($aIniFile, " --------------- REMOTE RESTART OPTIONS --------------- ", "Use Remote Restart? (yes/no) ###", "yes")
$aRemoteRestartUse = "yes"
MsgBox($MB_OK, $aUtilityVer, "Remote Restart enabled in " & $aUtilName & ".ini. " & @CRLF & "Please restart this utility for Remote Restart to be started.", 5)
TCPStartup()
Global $MainSocket = TCPListen($aServerIP, $aRemoteRestartPort, 100)
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
Else
FileWriteLine($aLogFile, _NowCalc() & " [Remote Restart] No changes made to Remote Restart setting in " & $aUtilName & ".ini per user request.")
SplashTextOn($aUtilName, "No changes were made. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
SplashOff()
EndIf
Else
$tMB = MsgBox($MB_YESNOCANCEL, $aUtilName, "Do you wish to initiate Remote Restart (reboot server in " & $aRemoteTime[$aRemoteCnt] & "min)?" & @CRLF & @CRLF & "Click (YES) to Initiate Remote Restart." & @CRLF & "Click (NO) or (CANCEL) to cancel.", 15)
If $tMB = 6 Then
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
EndFunc
Func TrayUpdateUtilCheck()
FileWriteLine($aLogFile, _NowCalc() & " [Update] " & $aUtilName & " update check requested by user via tray icon (Check for Updates).")
$aShowUpdate = True
UtilUpdate($aServerUpdateLinkVerUse, $aServerUpdateLinkDLUse, $aUtilVersion, $aUtilName)
EndFunc
Func TraySendMessage()
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Global chat message requested by user via tray icon. (Send global chat message).")
SplashOff()
$tMsg = InputBox($aUtilName, "Enter global chat message", "", "", 400, 125)
If $tMsg = "" Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Global chat message canceled by user.")
SplashTextOn($aUtilName, "Global chat Message canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
Else
$tMsg = "say """ & $tMsg & """"
SplashTextOn($aUtilName, "Sending global chat message:" & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, $tMsg, True)
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Global chat Message sent (" & $tMsg & ") " & $aReply)
SplashOff()
MsgBox($MB_OKCANCEL, $aUtilityVer, "Global chat Message sent:" & @CRLF & $tMsg & @CRLF & @CRLF & "Response:" & @CRLF & $aReply, 10)
EndIf
SplashOff()
EndFunc
Func TraySendInGame()
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Send Telnet command requested by user via tray icon (Send telnet command).")
SplashOff()
$tMsg = InputBox($aUtilName, "Enter Telnet command to send to server", "", "", 400, 125)
If $tMsg = "" Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Send Telnet command canceled by user.")
SplashTextOn($aUtilName, "Send Telnet command canceled. Resuming utility . . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
Else
SplashTextOn($aUtilName, "Sending Telnet command. " & @CRLF & $tMsg, 400, 110, -1, -1, $DLG_MOVEABLE, "")
$aReply = SendTelnetTT($aTelnetIP, $aTelnetPort, $aTelnetPass, $tMsg, False)
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Telnet command sent (" & $tMsg & ") " & $aReply)
SplashOff()
MsgBox($MB_OKCANCEL, $aUtilityVer, "Telnet command sent: " & @CRLF & $tMsg & @CRLF & @CRLF & "Response:" & @CRLF & $aReply, 15)
EndIf
SplashOff()
EndFunc
Func PIDSaveServer($tPID, $tFile)
If FileExists($tFile) Then
FileDelete($tFile)
EndIf
Local $tTmp = $tPID
FileWrite($tFile, $tTmp)
EndFunc
Func TrayUpdateServCheck()
SplashOff()
SplashTextOn($aUtilName, "Checking for server update.", 400, 110, -1, -1, $DLG_MOVEABLE, "")
UpdateCheck(True)
SplashOff()
EndFunc
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
$sMsg = TelnetOnlinePlayers($aTelnetIP, $aTelnetPort, $aTelnetPass)
If $sMsg[0] = "Error: Timed Out" Then
$tOnlinePlayers[0] = False
$tOnlinePlayers[1] = "Error: Online Players Check Timed Out "
$tOnlinePlayers[2] = "Error: Online Players Check Timed Out "
Else
$tOnlinePlayers[0] = False
$tOnlinePlayers[1] = "Game Time: " & $sMsg[0] & @CRLF & "Total Players "
$tOnlinePlayers[2] = "Game Time(" & $sMsg[0] & ") Total Players "
If StringInStr($sMsg[1], "Total of 0 in the game") <> 0 Then
$aServerPlayers = "0"
$tOnlinePlayers[1] = $tOnlinePlayers[1] & "(0)"
$tOnlinePlayers[2] = $tOnlinePlayers[2] & "(0)"
Else
Local $tUser1 = _StringBetween($sMsg[1], ". id=", "pos=")
Global $tUserCnt = UBound($tUser1)
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
FileWriteLine($aLogFile, _NowCalc() & " [Online Players] Error receiving online players.")
$aErr = True
$aRCONError = False
EndIf
SplashOff()
TraySetToolTip(@ScriptName)
TraySetIcon(@ScriptName, 99)
If ($aOnlinePlayerLast <> $tOnlinePlayers[1]) Then
$tOnlinePlayers[0] = True
FileWriteLine($aLogFile, _NowCalc() & " [Online Players] " & $tOnlinePlayers[2])
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
$aOnlinePlayerLast = $tOnlinePlayers[1]
If $aErr = 0 Then
$aServerReadyTF = True
EndIf
Return $tOnlinePlayers
EndIf
EndFunc
Func ShowOnlineGUI()
If $aServerOnlinePlayerYN = "yes" Then
If $aPlayerCountShowTF Then
If $iEdit <> 0 Then
GUICtrlSetData($iEdit, "")
EndIf
If $aPlayerCountWindowTF = False Then
If $tUserCnt > 13 Then
$aGUIH = 500
$hGUI = GUICreate(@ScriptName & " Online Players", $aGUIW, $aGUIH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME))
GUICtrlSetResizing(-1, $GUI_DOCKAUTO)
GUICtrlSetLimit(-1, 0xFFFFFF)
Else
$aGUIH = 250
$hGUI = GUICreate(@ScriptName & " Online Players", $aGUIW, $aGUIH, -1, -1, BitOR($GUI_SS_DEFAULT_GUI, $WS_SIZEBOX, $WS_THICKFRAME))
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
GUISetState(@SW_SHOW)
EndIf
EndIf
EndFunc
Func ShowPlayerCount()
$aServerOnlinePlayerYN = "yes"
ShowOnlineGUI()
EndFunc
Func TrayShowPlayerCount()
$aPlayerCountShowTF = True
If $aServerOnlinePlayerYN = "no" Then
SplashTextOn($aUtilName, "To show online players, you must Enable Online Players Check/Log. . .", 400, 110, -1, -1, $DLG_MOVEABLE, "")
Sleep(2000)
SplashOff()
Else
ShowPlayerCount()
EndIf
EndFunc
Func WriteOnlineLog($aMsg)
FileWriteLine(@ScriptDir & "\" & $aUtilName & "_OnlineUserLog_" & @YEAR & "-" & @MON & "-" & @MDAY & ".txt", _NowCalc() & " " & $aMsg)
EndFunc
Func TrayShowPlayerCheckPause()
GUIDelete()
$aPlayerCountWindowTF = False
TrayItemSetState($iTrayPlayerCheckPause, $TRAY_DISABLE)
TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_ENABLE)
IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", "no")
$aServerOnlinePlayerYN = "no"
EndFunc
Func TrayShowPlayerCheckUnPause()
TrayItemSetState($iTrayPlayerCheckPause, $TRAY_ENABLE)
TrayItemSetState($iTrayPlayerCheckUnPause, $TRAY_DISABLE)
IniWrite($aIniFile, " --------------- GAME SERVER CONFIGURATION --------------- ", "Check for, and log, online players? (yes/no) ###", "yes")
$aServerOnlinePlayerYN = "yes"
EndFunc
Func TrayUpdateServPause()
TrayItemSetState($iTrayUpdateServPause, $TRAY_DISABLE)
TrayItemSetState($iTrayUpdateServUnPause, $TRAY_ENABLE)
IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", "no")
$aCheckForUpdate = "no"
EndFunc
Func TrayUpdateServUnPause()
TrayItemSetState($iTrayUpdateServPause, $TRAY_ENABLE)
TrayItemSetState($iTrayUpdateServUnPause, $TRAY_DISABLE)
IniWrite($aIniFile, " --------------- CHECK FOR UPDATE --------------- ", "Check for server updates? (yes/no) ###", "yes")
$aCheckForUpdate = "yes"
EndFunc
Func SendTelnetTT($ip, $port, $pwd, $cmd1, $logTF = True)
If $aBusy Then
Return "Telnet Busy. Please try again."
Else
$cmd = ReplaceSingleQuote($cmd1)
$aBusy = True
Local $telnetfn = "ttermpro.exe"
Local $telnetfnz = "tt.zip"
Local $telnetfp = @ScriptDir & "\tt\" & $telnetfn
Local $telnetSend = @ScriptDir & "\tt\_telnetSend.ttl"
Local $telnetOut = @ScriptDir & "\tt\_telnetOut.log"
If FileExists($telnetSend) Then FileDelete($telnetSend)
If FileExists($telnetOut) Then FileDelete($telnetOut)
If $logTF Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Sending telnet command: " & $cmd)
EndIf
Local $sFileExists = FileExists($telnetfp)
If $sFileExists = 0 Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Downloading Modified Tera Term Pro: http://www.phoenix125.com/share/" & $telnetfnz)
InetGet("http://www.phoenix125.com/share/" & $telnetfnz, @ScriptDir & "\" & $telnetfnz, 0)
DirCreate(@ScriptDir & "\tt")
$fail = _ExtractZip(@ScriptDir & "\" & $telnetfnz, "", "tt", @ScriptDir)
If @error Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] ERROR!! Failed to extract Modified Tera Term Pro. Telnet features will not work.")
EndIf
If Not FileExists($telnetfp) Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] ERROR!! Failed to download Modified Tera Term Pro. Telnet features will not work.")
MsgBox(0x0, "ERROR", "Modified Tera Term Pro not found. " & @CRLF & "Telnet features will not work." & @CRLF & @CRLF & "http://www.phoenix125.com/share/" & $telnetfnz, 30)
EndIf
EndIf
If FileExists($telnetfp) Then
FileWriteLine($telnetSend, "showtt -1" & @CRLF & "restoresetup '" & @ScriptDir & "\tt\7dtdTeraTerm.ini'" & @CRLF & "connect '" & $ip & ":" & $port & "'" & @CRLF & "logautoclosemode 1" & @CRLF & "logopen '" & $telnetOut & "'" & @CRLF & "logstart" & @CRLF & "sendln" & @CRLF & "sendln '" & $pwd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'to end session'" & @CRLF & "sendln '" & $cmd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'done'" & @CRLF & "sendln 'exit'" & @CRLF & "logclose" & @CRLF & "closett" & @CRLF)
Local $aRun = $telnetfp & " /m=""" & $telnetSend & """"
Local $mOut = Run($aRun, @ScriptDir & "\tt", @SW_MINIMIZE)
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
Local $sFirstLine = StringRegExpReplace($aReturn, "(?s)^(\V+).*$", "\1")
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
EndFunc
Func TelnetOnlinePlayers($ip, $port, $pwd)
If $aBusy Then
Return "Telnet Busy. Please try again."
Else
$aBusy = True
Local $sReturn[2]
Local $telnetfn = "ttermpro.exe"
Local $telnetfnz = "tt.zip"
Local $telnetfp = @ScriptDir & "\tt\" & $telnetfn
Local $telnetSend = @ScriptDir & "\tt\_telnetSend.ttl"
Local $telnetOut = @ScriptDir & "\tt\_telnetOut.log"
If FileExists($telnetSend) Then FileDelete($telnetSend)
If FileExists($telnetOut) Then FileDelete($telnetOut)
If $xDebug Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Retrieving Online Players and Game Time.")
EndIf
Local $sFileExists = FileExists($telnetfp)
If $sFileExists = 0 Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] Downloading Modified Tera Term Pro: http://www.phoenix125.com/share/" & $telnetfnz)
InetGet("http://www.phoenix125.com/share/" & $telnetfnz, @ScriptDir & "\" & $telnetfnz, 0)
DirCreate(@ScriptDir & "\tt")
$fail = _ExtractZip(@ScriptDir & "\" & $telnetfnz, "", "tt", @ScriptDir)
If @error Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] ERROR!! Failed to extract Modified Tera Term Pro. Telnet features will not work.")
EndIf
If Not FileExists($telnetfp) Then
FileWriteLine($aLogFile, _NowCalc() & " [Telnet] ERROR!! Failed to download Modified Tera Term Pro. Telnet features will not work.")
MsgBox(0x0, "ERROR", "Modified Tera Term Pro not found. " & @CRLF & "Telnet features will not work." & @CRLF & @CRLF & "http://www.phoenix125.com/share/" & $telnetfnz, 30)
EndIf
EndIf
If FileExists($telnetfp) Then
$tCmd = "showtt -1" & @CRLF & "restoresetup '" & @ScriptDir & "\tt\7dtdTeraTerm.ini'" & @CRLF & "connect '" & $ip & ":" & $port & "'" & @CRLF & "logautoclosemode 1" & @CRLF & "logopen '" & $telnetOut & "'" & @CRLF & "logstart" & @CRLF & "sendln" & @CRLF & "sendln '" & $pwd & "'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 500" & @CRLF & "waitln 'to end session'" & @CRLF & "sendln 'gettime'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'done'" & @CRLF & "sendln 'listplayers'" & @CRLF & "timeout = 0" & @CRLF & "mtimeout = 600" & @CRLF & "waitln 'game'" & @CRLF & "sendln 'exit'" & @CRLF & "logclose" & @CRLF & "closett" & @CRLF
FileWriteLine($telnetSend, $tCmd)
Local $aRun = $telnetfp & " /m=""" & $telnetSend & """"
Local $mOut = Run($aRun, @ScriptDir & "\tt", @SW_MINIMIZE)
$tErr = ProcessWaitClose($mOut, 5)
For $i = 0 To 3
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
Else
$aReturn = FileRead($telnetOut)
Local $aReturn1 = _StringBetween($aReturn, "'gettime'", "listplayers")
Local $aReturn2 = _ArrayToString($aReturn1)
Local $sFirstLine1 = StringRegExpReplace($aReturn2, "(?s)^(\V+).*$", "\1")
Local $aReturn3 = StringRegExpReplace($aReturn2, $sFirstLine1 & "\v*", "")
$sReturn[0] = StringRegExpReplace($aReturn3, @CRLF, "")
Local $aReturn4 = _StringBetween($aReturn, "'listplayers'", "exit")
Local $aReturn5 = _ArrayToString($aReturn4)
Local $sFirstLine2 = StringRegExpReplace($aReturn2, "(?s)^(\V+).*$", "\1")
$sReturn[1] = StringRegExpReplace($aReturn5, $sFirstLine2 & "\v*", "")
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
EndFunc
Func ReplaceSingleQuote($tMsg0)
If StringInStr($tMsg0, "'") = "0" Then
Return $tMsg0
Else
Return StringReplace($tMsg0, "'", "' 39 '")
EndIf
EndFunc
Func TrayUpdateUtilPause()
SplashOff()
MsgBox($MB_OK, $aUtilityVer, $aUtilityVer & " Paused.  Press OK to resume.")
EndFunc
