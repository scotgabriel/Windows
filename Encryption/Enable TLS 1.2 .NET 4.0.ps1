# Allows TLS 1.2 connections for .NET Framework 4.0 applications when .NET Framework 4.5 is installed

Set-ItemProperty -Path "HKLM:\Software\Microsoft\.NETFramework\v4.0.30319" -Name "SchUseStrongCrypto" -Value 1 -Type DWord

