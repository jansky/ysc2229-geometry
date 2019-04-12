# YSC2229: Computational Geometry

This project contains the libraries with basic data structures and
algoritmhs of Computational Geometry, presented on week 14 of
Introductory Data Structures and Algorithms (YSC2229). The lecture
notes for the course are available at

## Setup

This project relies on OCaml's `graphics` package.

* Follow the
  [instructions](https://github.com/ilyasergey/ocaml-graphics-demo)
  given for a similar project.

## Building the Project

Building the project requires OCaml version 4.06.1 or higher. You
install required opam packages (specifically, the build tool `dune`)
using the commands listed below:

```
opam install -y dune
```

Next, to build the project, simply type:

```
make
```

## Using the Project as a Library

Once successfully built, you can install the contents of the Week 8-14
of YSC2229 as libraries to use in your own projects. Check out the
example project explaining how to use the libraries from Weeks 1-6:

https://github.com/ilyasergey/ysc2229-geometry

### Installing the project via opam

To install the project as an independent packege, from the root folder
of the project, run

```
opam install .
```

If in the future you need to update the package installation, you can
reinstall it as follows (again, from the root folder of the project):

```
opam reinstall .
```

To uninstall the package, type in terminal

```
opam uninstall ysc2229-geometry
```

## Running with utop

From the console, run

```
make utop
```

## Related projects

* [Part-one libraries](https://github.com/ilyasergey/ysc2229-part-one)
* [Part-two libraries](https://github.com/ilyasergey/ysc2229-part-two)
* [OCaml graphics demo](https://github.com/ilyasergey/ocaml-graphics-demo)
