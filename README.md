# ExampleProject

This repo contains an example of how to set up a project using Julia.
Reusable function definitions are defined in `src/ExampleProject.jl`.
These functions can then be used in Julia scripts stored in `scripts`.
Scripts must load the package using `using ExampleProject` (but there is no need for `include` calls).

The script can be run either interactively from the REPL or from the command line with `julia --project=@. scripts/example.jl`.

## Subpackages
If some sections of code are distinct they can be seperated into a subpackage with their own `Project.toml`.
An example is the `LinearRegression` directory.
The subpackage shares the overall `Manifest.toml` using the line `manifest = "../Manifest.toml"` in `LinearRegression/Project.toml`.
The subpackage must also be devved into the overall environment using `] dev ./LinearRegression`.
Finally the package needs to be separately loaded with `using LinearRegression` in any scripts that use it.

## LSP integration
Unfortunately the Julia LSP currently does not reference functions from the current package in scripts that are not included in package source.
See [Issue #2719](https://github.com/julia-vscode/julia-vscode/issues/2719) and this [discussion](https://discourse.julialang.org/t/lsp-missing-reference-woes/98231/15).

The workaround is to include the following section in the package main file:
```
# in src/ExampleProject.jl
@static if false
    include("../scripts/example.jl")
end
```
