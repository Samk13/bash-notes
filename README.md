
## Evaluate expression
[label](./evaluate.sh)
```bash
expr # Evaluate an expression
```

## If statements
```bash
if [ $num -eq 200 ]  # -eq equal
if [ ! $num -eq 200 ]  # ! not equal
if [ ! $num -ne 200 ]  # -ne not equal
if [ ! $num -gt 200 ]  # -gt greater then
if [ -f README.md ] # -f check file exists
if [ -d /src ] # -d check directory exists
if command -v $command # check command exists

```

> test - check file types and compare values

# Exit codes
```bash
# Special vaieables for exit codes
echo $? # if exit code is 0 the command is successfull, otherwise there is somthing went wrong. so you can test on exit code value if it's not 0 do something
[label](./exit_codes.sh)
```

# While loop:

```bash
while [ -f $file ]
do
    echo "file exists $(date)"
    sleep 5
done
```

# Data stream:
number 1 -> standard output
number 2 -> standard error
diffrence between 1> /path, and 1>> /path is the second one with double >> is append to the file localtion the first one will override everything

```bash
find /etc -type f 2> /dev/null  # redirect err to linux special place dev/null where if you move something there it will be completely wiped out like a block hole
find /etc -type f &> /dev/null # redirect both standard output and standard error to the specified location
```

# Functions:

```bash

```
