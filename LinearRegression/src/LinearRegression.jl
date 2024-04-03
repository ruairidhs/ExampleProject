module LinearRegression

using LinearAlgebra

export reg

"""
    reg(y, xs)

Run a regression.
"""
function reg(y, xs)
    X = hcat(xs...)
    return (X' * X) \ (X' * y)
end

end#module
