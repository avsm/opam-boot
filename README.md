opam-boot
=========

`opam-boot` makes it simpler for users to create standalone distributions of
OCaml and [OPAM](https://opam.ocaml.org) packages that do not require
preexisting installations of OCaml or OPAM.  The bootstrap script downloads and
installs a local copy of OPAM into the current directory (with no root
privileges required).

Since OCaml native binaries are typically standalone, this makes it easy for
users to compile an application with minimal toolchain requirement.

## Installation

To use it, just:

* copy the `opam-boot` script into your own source tree
* add a local `opam` file to describe the project using the [pinning workflow](https://opam.ocaml.org/blog/opam-1-2-pin/)
* tell users to run `opam-boot <package-name>` to perform a local build.
