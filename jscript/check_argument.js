
check_argument()

function check_argument()
{
	objArgs = WScript.Arguments;
	for (i = 0; i < objArgs.length; i++)
	{
		WScript.Echo(' arg[' + i + '] = ' + objArgs(i));
	}
}
