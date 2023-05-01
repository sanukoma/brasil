Sure, I can help you with that. Here's the updated README.md:

# BRASIL - Build Reliable Applications Selecting Imperfect Library

BRASIL is a library for Bash scripts that provides a collection of useful functions, helper scripts, and common patterns to help developers write more reliable and maintainable code.

## Installation

To use BRASIL in your Bash scripts, simply source the `brasil` script in your script like this:

```bash
source $(cd $(dirname $(readlink -f $0))/ && pwd)/../lib/brasil $0 "$@" || { echo "ERROR: INITIALIZING BRASIL FAILED!" >&2; exit 8; }
```

This will load the BRASIL library and make its functions available for use in your script.

## Usage

Once you have sourced the BRASIL library, you can start using its functions in your Bash script. Here is an example of a "Hello World" script using the `BIL:msg` function:

```bash
#!/bin/bash
source $(cd $(dirname $(readlink -f $0))/ && pwd)/../lib/brasil $0 "$@" || { echo "ERROR: INITIALIZING BRASIL FAILED!" >&2; exit 8; }

BIL:msg info "Hello World!"
```

## Acronym

BRASIL stands for "Build Reliable Applications Selecting Imperfect Library". This acronym reflects the library's mission to help developers build reliable applications even when using imperfect or incomplete libraries.

## Contribution

Contributions to BRASIL are welcome. If you have a suggestion for a new functionality that you think would be useful to others, please submit a pull request on GitHub.

## License

BRASIL is released under the MIT License. See the [LICENSE](LICENSE) file for details.
