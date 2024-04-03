using ExampleProject
using LinearRegression

greet("Ruairidh")
res = reg(rand(10), [rand(10), rand(10)])
println(sum(res))
