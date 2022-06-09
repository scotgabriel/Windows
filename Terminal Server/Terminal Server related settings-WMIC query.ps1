<#

WMIC query return attributes
    ActiveDesktop
    AllowTSConnections
    Caption
    DeleteTempFolders
    Description
    DirectConnectLicenseServers
    DisableForcibleLogoff
    EnableAutomaticReconnection
    EnableDFSS
    EnableDiskFSS
    EnableNetworkFSS
    EnableRemoteDesktopMSI
    FallbackPrintDriverType
    GetCapabilitiesID
    HomeDirectory
    InstallDate
    LicensingDescription
    LicensingName
    LicensingType
    LimitedUserSessions
    Logons
    Name
    NetworkFSSCatchAllWeight
    NetworkFSSLocalSystemWeight
    NetworkFSSUserSessionWeight
    PolicySourceAllowTSConnections
    PolicySourceConfiguredLicenseServers
    PolicySourceDeleteTempFolders
    PolicySourceDirectConnectLicenseServers
    PolicySourceEnableAutomaticReconnection
    PolicySourceEnableDFSS
    PolicySourceEnableRemoteDesktopMSI
    PolicySourceFallbackPrintDriverType
    PolicySourceHomeDirectory
    PolicySourceLicensingType
    PolicySourceProfilePath
    PolicySourceRedirectSmartCards
    PolicySourceSingleSession
    PolicySourceTimeZoneRedirection
    PolicySourceUseRDEasyPrintDriver
    PolicySourceUseTempFolders
    PossibleLicensingTypes
    ProfilePath
    RedirectSmartCards
    ServerName
    SessionBrokerDrainMode
    SingleSession
    Status
    TerminalServerMode
        0 = Remote Administration Mode (Not an RDS/TS host)
        1 = Application Server Mode (it IS an RDS/TS host)
    TimeZoneRedirection
    UseRDEasyPrintDriver
    UserPermission
    UseTempFolders
#>

$tsSettingsViaWMIC = (wmic /namespace:\\root\CIMV2\TerminalServices PATH Win32_TerminalServiceSetting Get) -split "\n" -replace '\s\s+', ',' | convertfrom-csv -Delimiter ','

$tsSettingsViaWMIC