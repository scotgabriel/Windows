$currentPowerScheme = powercfg /getactivescheme
if($currentPowerScheme -Match "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"){
	$localPowerMode = "HighPerformance"
}elseif($currentPowerScheme -Match "381b4222-f694-41f0-9685-ff5bb260df2e"){
	$localPowerMode = "Balanced"
}elseif($currentPowerScheme -Match "a1841308-3541-4fab-bc81-f71556f20b4a"){
	$localPowerMode = "PowerSaver"
}elseif{$currentPowerScheme -Match "fb5220ff-7e1a-47aa-9a42-50ffbf45c673"
	$localPowerMode = "(HP Optimized (Modern Standby))"
}else{
	$localPowerMode = "Unknown"
}
