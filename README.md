
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

```