#!/usr/bin/env Rscript

# =================
# Copyright 2015 Michael Cysouw <cysouw@mac.com>
#
# This file is free software: you may copy, redistribute and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This file is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# =================

# ============
# dependencies
# ============

require(docopt)

# =====
# usage
# =====

DOC <- "
Usage: 
  partition [-h -c CUT -s SEP <DIST>]

This is only an example of using R functions in pipes. Simple partitioning by cutting complete (\'maximum\') hierarchical clustering. Input <DIST> should be a square distance matrix.

Options:
  -h, --help  Showing this help text
  -c CUT      Height of cutting the tree, in fraction of maximum [default: 0.99]
  -s SEP      Column separator [default: \t]
"

# ==============
# docopt parsing
# ==============

attach(docopt::docopt(DOC))

# for piping data
if (length(DIST) == 0) {
	DIST <- read.table(file("stdin"), sep = s)
	closeAllConnections() 
}

c <- as.numeric(c)

# ======
# R code
# ======

result <- cutree(hclust(as.dist(DIST)), h = max(DIST) * c)

# =============
# Return output
# =============

cat(result, sep = "\n")
	