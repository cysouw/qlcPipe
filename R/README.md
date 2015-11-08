# R executables

For turning R-functions into executables, I propose to use the following approach:

- use shebang `#!/usr/bin/env Rscript`
- add some license!
- write the executable structure using docopt <http://docopt.org> and store it as a string in a variable `DOC`
- add a list of all dependencies using `require( )`
- ingest the variables from the executable with `attach(docopt::docopt(DOC))`
- to be able to pipe data to the argument `ARG` from the executable, use something like the following. Not pretty, but it works...

````
if (length(ARG) == 0) {
ARG <- scan(file("stdin"), "\n", quiet = TRUE, what = "character")
closeAllConnections() 
}
````

- Note that all input is turned into strings by docopt, so for numbers you have to declare something like this for a numeric VAR:

```
VAR <- as.numeric(VAR)
```

- Note that spaces are hard to pass to a variable in the command line, so I propose to add a line to the help offering an option like `use "S" to get space` and then add this into the script for any relevant VAR:

```
if (VAR == "S") {VAR <- " "}
```

