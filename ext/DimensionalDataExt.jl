import DimensionalData
import DimensionalData as DD
using DimensionalData: AbstractDimArray, AbstractDimStack, TimeDim, Dim, hasdim

hastimedim(x::AbstractDimArray) = hasdim(x, TimeDim) || hasdim(x, Dim{:time})

plot2spec(ds::AbstractDimStack; kwargs...) =
    map(values(ds)) do ds
    plot2spec(ds; kwargs...)
end |> collect
