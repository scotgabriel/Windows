function GetOsActivationStatus
{
    $wmiOSActivation = (Get-CimInstance -ClassName SoftwareLicensingProduct | Where-Object {$_.PartialProductKey -and ($_.name -match 'windows')}).LicenseStatus
        # codes from "license status" and there meaning
        # 0 = Unlicensed
        # 1 = Licensed
        # 2 = OOBGrace (Out-of-Box Grace)
        # 3 = OOTGrace (Out-of-Tolerance Grace)
        # 4 = NonGeniuneGrace
        # 5 = Notification
        # 6 = ExtendedGrace
    If ($wmiOSActivation -ne 1)
    {
        return "fail"
    }
    else
    {
        return "pass"
    }
}
