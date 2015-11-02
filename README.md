# Unix-executables for Quantitative Language Comparison (QLC)

Michael Cysouw <cysouw@mac.com>

Currently, there many different projects using either Python, R, or even Java or basic C++ for analyses of linguistic data. The basic idea of this project is to make simple wrappers around useful algorithms that can then be piped together in the command line. In this way it might become easier to combine different methods from different implementations.

As a proof-of-concept, we will be collecting various executables here. However, in the future these executables should become part of the published code of any of the projects.

There is no packaging of all dependencies (yet), so you will have to install all dependencies yourself for now. This is the current list of dependencies:

- R <https://www.r-project.org> with the following CRAN-packages
	* docopt
	* qlcMatrix
	* qlcData
	* stringdist
- Python 3 with
	* LingPy ...

The input and output of these executables should be as simple as possible, and the functionality be as low-level as possible. The idea is to build higher-level functionality processing complex data files by using pipes of the executables here.

Basically, there are two kinds of IO-structures currently assumed:

- Line-based lists, i.e. UTF-8 data with LF line breaks in which each item is put on a new line
- Square matrices: pairwise similarities/distances with items separated by tabs, lines separated by LF line breaks

Currently, I would propose to **not** use CSV-type multi-column files, but (when necessary) use executables with more than one argument to pass multiple columns.

Just for convenience, the executables are organised by underlying code language in this repository.
