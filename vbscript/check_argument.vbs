
check_argument()

Sub check_argument
	Set objArgs = WScript.Arguments
	For I = 0 to objArgs.Count - 1
		WScript.Echo "argv[" & i & "] = " & objArgs(I)
	Next
End Sub
	