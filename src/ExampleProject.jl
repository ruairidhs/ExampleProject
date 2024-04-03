module ExampleProject

export greet

"""
    greet(name)

Say hello to `name`.
"""
function greet(name)
    println("Hello $(name)!")
end

#>>> LSP workaround: does not run but allows for autocomplete, documentation etc.
@static if false
    include("../scripts/example.jl")
end
#<<<

end#module
