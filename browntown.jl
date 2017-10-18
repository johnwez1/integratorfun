#code extracted from http://nbviewer.jupyter.org/url/www.maths.usyd.edu.au/u/olver/teaching/Computation/Assignment01.ipynb

#Assignment01

#TODO: work through all this shit

function periodicbrowniansamples(n::Integer)
    θ = linspace(0,2π,n+1)
    W = browniansamples(θ)
    # TODO: make W periodic and return n-dimensional vector
end

using Plots
plot(periodicbrowniansamples(1000))  # should look periodic

using Plots

type PeriodicBrownianPath
    negcfs::Vector{Complex128}
    nonnegcfs::Vector{Complex128}
end

# creates a periodic brownian path with coefficients ranging from -m to m
function PeriodicBrownianPath(m::Integer)
    negcfs,nonnegcfs = periodicbrowniancoefficients(m)
    PeriodicBrownianPath(negcfs,nonnegcfs)
end


# implements evaluation: b(t) at a point t
function Base.call(b::PeriodicBrownianPath,t::Float64)
    # TODO: complete definition by summing up coefficients of b.
    #       Hint: remember b.negcfs gives the negative coefficients
end

function Plots.plot!(b::PeriodicBrownianPath)
    θ = linspace(0,2π,10000)
    plot!(θ,real(map(b,θ)))
end

Plots.plot(b::PeriodicBrownianPath) = (plot();plot!(b))



# test it works
plot(PeriodicBrownianPath(100))
plot!(PeriodicBrownianPath(200))

using Plots, ApproxFun
x=Fun([-5.,5.])

histogram(randn(1000);normed=true)
plot!(exp(-x^2/(2))/sqrt(2π))

PeriodicBrownianPath() = PeriodicBrownianPath(Complex128[],Complex128[randn()])

# add coefficients to a path
function resizedata!(B::PeriodicBrownianPath,m::Integer)
    n_neg = length(B.negcfs)
    n_nonneg = length(B.nonnegcfs)

    if n_neg+1 ≠ n_nonneg
        error("Don't need to support the case where the vectors are not compatible.")
    end

    if m ≤ n_neg
        return B
    end

    # resizes the vector with noise.
    resize!(B.negcfs,m)
    resize!(B.nonnegcfs,m+1)


    # TODO: populate vectors B.negcfs and B.nonnegcfs to have samples
    #  Make sure you don't overwrite existing coefficients.
    #  Also, make sure none of the random coefficients are left


    return B
end


# plot a single brownian path with more and more samples
b=PeriodicBrownianPath()
θ⃗=linspace(0,2π,1000)

resizedata!(b,10)
plot(b)
resizedata!(b,100)
plot!(b)
resizedata!(b,1000)
plot!(b)
