# AUTHOR: github username: gabe31415
# Not updated since 2018-ish
# system compromise checks
# 'Get-winevent' has an undocumented/bug limit of 23 events in the 'filterhashtable'
#   to circumvent this, I chose to do each event check separately

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "==================== $Title ===================="
    Write-Host ""
    Write-Host "H: Press 'H' for HIGH severity checks"
    Write-Host "M: Press 'M' for MEDIUM severity checks"
    Write-Host "L: Press 'L' for LOW severity checks"
    Write-Host "Q: Press 'Q' to quit."
    Write-Host ""
}

function EventChecksHIGH
{
    if ($OSflavor = '2012-2016')
        { $eventList = 4618,4649,4719,4765,4766,4794,4897,4964,5124,1102 }
    elseif ($OSflavor = '2003')
        { $eventList = 517,550,612,801 }
    for ($i = 0; $i -lt $eventList.count; $i=$i+1)
    {
        try { get-winevent -filterhashtable @{logname="security";id=$eventList[$i]}  -ErrorAction Stop -MaxEvents 1
            }
        catch [Exception] {
            if ($_.Exception -match "No events were found that match the specified selection criteria.") {
            write-Host $eventList[$i] ": not found";
                }
            }
    }
}

function EventChecksMEDIUM
{
    if ($OSflavor = '2012-2016')
        { $eventList = 4621,4675,4692,4693,4706,4713,4714,4715,4716,4724,4727,4735,4737,4739,4754,4755,4764,4780,4816,4865,4866,4867,4868,4870,4882,4885,4890,4892,4896,4906,4907,4908,4912,4960,4961,4962,4963,4965,4976,4977,4978,4983,4984,5027,5028,5029,5030,5035,5037,5038,5120,5121,5122,5123,5376,5377,5453,5480,5483,5484,5485,6145,6273,6274,6275,6276,6277,6278,6279,6280,24586,24592,24593,24594 }
    elseif ($OSflavor = '2003')
        { $eventList = 610,617,618,619,620,628,631,639,640,641,643,658,659,667,668,684,772,774,786,789,794,796,800,807 }
    for ($i = 0; $i -lt $eventList.count; $i=$i+1)
    {
        try { get-winevent -filterhashtable @{logname="security";id=$eventList[$i]}  -ErrorAction Stop -MaxEvents 1
            }
        catch [Exception] {
            if ($_.Exception -match "No events were found that match the specified selection criteria.") {
            write-Host $eventList[$i] ": not found";
                }
            }
    }
}

function EventChecksLOW
{
    if ($OSflavor = '2012-2016')
        { $eventList = 4608,4609,4610,4611,4612,4614,4615,4616,4622,4624,4625,4634,4646,4647,4648,4650,4651,4652,4653,4654,4655,4656,4657,4658,4659,4660,4661,4662,4663,4664,4665,4666,4667,4668,4670,4671,4672,4673,4674,4688,4689,4690,4691,4694,4695,4696,4697,4698,4699,4700,4701,4702,4704,4705,4707,4709,4710,4711,4712,4717,4718,4720,4722,4723,4725,4726,4728,4729,4730,4731,4732,4733,4734,4738,4740,4741,4742,4743,4744,4745,4746,4747,4748,4749,4750,4751,4752,4753,4756,4757,4758,4759,4760,4761,4762,4767,4768,4769,4770,4771,4772,4774,4775,4776,4777,4778,4779,4781,4782,4783,4784,4785,4786,4787,4788,4789,4790,4793,4800,4801,4802,4803,4864,4869,4871,4872,4873,4874,4875,4876,4877,4878,4879,4880,4881,4883,4884,4886,4887,4888,4889,4891,4893,4894,4895,4898,4902,4904,4905,4909,4910,4928,4929,4930,4931,4932,4933,4934,4935,4936,4937,4944,4945,4946,4947,4948,4949,4950,4951,4952,4953,4954,4956,4957,4958,4979,4980,4981,4982,4985,5024,5025,5031,5032,5033,5034,5039,5040,5041,5042,5043,5044,5045,5046,5047,5048,5049,5050,5051,5056,5057,5058,5059,5060,5061,5062,5063,5064,5065,5066,5067,5068,5069,5070,5125,5126,5127,5136,5137,5138,5139,5140,5141,5152,5153,5154,5155,5156,5157,5158,5159,5378,5440,5441,5442,5443,5444,5446,5447,5448,5449,5450,5451,5452,5456,5457,5458,5459,5460,5461,5462,5463,5464,5465,5466,5467,5468,5471,5472,5473,5474,5477,5478,5479,5632,5633,5712,5888,5889,5890,6008,6144,6272,24577,24578,24579,24580,24581,24582,24583,24584,24588,24595,24621 }
    elseif ($OSflavor = '2003')
        { $eventList = 512,513,514,515,516,518,519,520,528,529,530,531,532,533,534,535,536,537,538,539,540,551,552,560,561,562,563,564,565,566,567,576,577,578,592,593,594,595,600,601,602,608,609,611,613,614,615,616,621,622,624,625,626,627,629,630,632,633,634,635,636,637,638,642,644,645,646,647,648,649,650,651,652,653,654,655,656,657,660,661,662,663,664,665,666,667,671,672,673,674,675,676,678,679,680,681,682,683,685,689,690,691,692,693,694,773,775,776,777,778,779,780,781,782,783,784,785,787,788,790,791,792,793,795,797,798,799,802 }
    for ($i = 0; $i -lt $eventList.count; $i=$i+1)
    {
        try { get-winevent -filterhashtable @{logname="security";id=$eventList[$i]}  -ErrorAction Stop -MaxEvents 1
            }
        catch [Exception] {
            if ($_.Exception -match "No events were found that match the specified selection criteria.") {
            write-Host $eventList[$i] ": not found";
                }
            }
    }
}


function DoCompromiseChecks
{
    $OsFriendly = GetOsNameFriendly
    if (($OsFriendly -like "*10 Pro*") -or ($OsFriendly -like "*2012*") -or ($OsFriendly -like "*2016*"))
        {$OSflavor = "2012-2016"}
    elseif ($OsFriendly -like "*2003*")
        {$OSflavor = "2003"}
    else
    {
    Clear-Host
    Write-Host "*****************************************"
    Write-Host "*****************************************"
    Write-Host ""
    Write-Host ""
    write-host "This OS: " $OsFriendly " is not yet accounted for in these checks"
    Write-Host ""
    Write-Host ""
    Write-Host "*****************************************"
    Write-Host "*****************************************"
    return
    }
    do
    {
        Show-Menu -Title 'Check for events often correlating to a "Compromised System"'
        $selection = Read-Host "Please make a selection"
        switch ($selection)
        {
            'h' { EventChecksHIGH }
            'm' { EventChecksMEDIUM}
            'l' { EventChecksLOW}
            'q' { return }
        }
        pause
    }
    until ($selection -eq 'q')
}