get_xrange(limit) = (limit.origin[1], limit.origin[1] + limit.widths[1])

# Reactive value carriers. `Computed` comes from Makie's ComputePipeline (used by
# `iviz_api!`); `Observable` is what `lift` produces. They are not in a common
# supertype, so we union them for dispatch.
const Reactive = Union{ComputePipeline.Computed, Observable}

# Normalize a recipe input to a reactive
_obs(A::Reactive) = A
_obs(A) = Observable(A)

"""
    iviz_api!(ax, f, trange; delay=setting(:delay), kw...)

Plot `getdata(f, trange...)` on `ax`, show exactly `trange`, and refetch (debounced by
`delay` seconds) whenever the view leaves the loaded range. The graph input is the loaded range.
"""
function iviz_api!(ax::Axis, f, trange; delay = setting(:delay), kw...)
    graph = ComputeGraph()
    add_input!(graph, :input1, trange)
    map!(tr -> transform(getdata(f, tr...)), graph, :input1, :output)
    plots = plotfunc!(graph[:output][])(ax, graph[:output]; kw...)
    tlims!(ax, trange...)

    function update(lims)
        t0, t1 = x2t.(get_xrange(lims))
        loaded0, loaded1 = graph[:input1][]
        (t0 < loaded0 || t1 > loaded1) || return
        update!(graph, input1 = (t0, t1))
        graph[:output][]
        return
    end
    on(Debouncer(update, delay), ax.finallimits)
    return plots
end

iviz_api(f, args...; kwargs...) = iviz_api!(current_axis(), f, args...; kwargs...)
