# Restart Print Spooler and Print Test Page
# Restarts the print spooler service and prints a test page for the default printer.
# Note: On Windows 10, if Windows is managing the default printer then the most recently used printer will be marked as default.

Restart-Service Spooler
$printer = Get-CimInstance win32_printer -Filter "Default = 1"
$printer
Invoke-CimMethod -MethodName PrintTestPage -InputObject $printer
exit 0