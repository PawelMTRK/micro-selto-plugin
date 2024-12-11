# Selto

A simple plugin that allows the user to quickly select portion of the buffer,
beginning from the current line up to the specified one.

Plugin adds two new commands:

 - `selto [NUMBER]` - works similarly to `goto`
 - `seljump [NUMBER]` - works like `jump`

## Examples 

Assuming your cursor is on line 5:

 - `selto 10` will select from lines 5 to 10
 - `selto -5` will select from 5th line, counting from the beginning of the file,
    to the 5th line counting from the end of the file
 - `selto -1` will select from the 5th line all the way to the end of the file
 - `selto -1` will select from the 5th line all the way to the end of the file
 - `seljump -1` will select one line up
 - `seljump 20` will select 20 lines down