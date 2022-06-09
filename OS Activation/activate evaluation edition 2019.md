An evaluation version can only be activated using a retail key, if the key was from volume center then you'll need to use volume distribution media that can be downloaded from volume licensing center over here: https://www.microsoft.com/Licensing/servicecenter/default.aspx

To activate your Windows Server:
1. Enter key via GUI or run the command: slmgr.vbs /ipk XXXXX-XXXXX-XXXXX-XXXXX-XXXXX

To get the available editions:
1. Open an elevated command prompt.
2. Run the following command: DISM.exe /Online /Get-TargetEditions

To set your Windows Server to a higher edition:
1. Run the following command: DISM.exe /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula
(Use key from table below if this is a MAK/Volume license key)


Windows Server 2022 - KMS Client Setup Key

Windows Server 2022 Datacenter
- WX4NM-KYWYW-QJJR4-XV3QB-6VM33

Windows Server 2022 Standard
- VDYBN-27WPP-V4HQT-9VMD4-VMK7H

Windows Server 2019 - KMS Client Setup Key

Windows Server 2019 Datacenter
- WMDGN-G9PQG-XVVXX-R3X43-63DFG

Windows Server 2019 Standard
- N69G4-B89J2-4G8F4-WWYCC-J464C

Windows Server 2019 Essentials
- WVDHN-86M7X-466P6-VHXV7-YY726

Windows Server 2016 - KMS Client Setup Key

Windows Server 2016 Datacenter
- CB7KF-BWN84-R7R2Y-793K2-8XDDG

Windows Server 2016 Standard
- WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY

Windows Server 2016 Essentials
- JCKRF-N37P4-C2D82-9YXRT-4M63B


Note: It may take some time for the command to complete.