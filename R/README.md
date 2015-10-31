# R executables

For turning R-functions into executables, I propose to use the following approach:

- use shebang `#!/usr/bin/env Rscript`
- add some license!
- write the executable structure using docopt <http://docopt.org> and store it as a string in a variable `DOC`
- ingest the variables from the executable with `attach(docopt::docopt(DOC))`
- to be able to pipe data to the argument ARG from the executable, use something like the following. Not pretty, but it works...

    if (length(ARG) == 0) {
    	ARG <- scan(file("stdin"), "\n", quiet = TRUE)
    	closeAllConnections() 
    }
