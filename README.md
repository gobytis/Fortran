# argument_getter

## Summary

This is a class to get commandline arguments.

## Usage

```fortran
use class_argument_getter

type(argument_getter) args_getter

! get(i) returns the ith argument as character (i >= 1).
print*, args_getter%get(1)

! to_int32(i) returns the ith argument as int32 (i >= 1).
print*, args_getter%to_int32(1)

! to_real64(i) returns the ith argument as real64 (i >= 1).
print*, args_getter%to_real64(1)

! get_size() returns the number of arguments.
print*, args_getter%get_size()
```
