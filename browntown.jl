#code extracted from http://nbviewer.jupyter.org/url/www.maths.usyd.edu.au/u/olver/teaching/Computation/Assignment01.ipynb

#Assignment01

using Plots, ApproxFun

#Problem 1
#TODO: work through all this shit
function browniansamples(t::AbstractVector{Float64})
    # TODO: return a `Vector{Float64}` of size `length(t)` corresponding to Brownian motion evaluated at `t`
end

# TODO: plot(browniansamples(linspace(0,2π,10000)))


#Problem 2
function periodicbrowniansamples(n::Integer)
    θ = linspace(0,2π,n+1)
    W = browniansamples(θ)
    # TODO: make W periodic and return n-dimensional vector
end

# TODO: plot(periodicbrowniansamples(1000))  # should look periodic

#Problem 3
function periodicbrowniancoefficients(m::Integer)
    ## TODO: Construct two `Vector{Complex128}` negcfs and nonnegcfs

    return negcfs, nonnegcfs
end

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

# TODO: Plots.plot(b::PeriodicBrownianPath) = (plot();plot!(b))

# test it works
# TODO: plot(PeriodicBrownianPath(100))
# TODO: plot!(PeriodicBrownianPath(200))


#Problem 4 The random variables ℜP̂ 1291ℜP^1129, ℜP̂ 1292ℜP^2129 and ℜP̂ 1293ℜP^3129
#have mean zero. Approximate the variance using 10,000 samples (Hint: the built-in
#function for calculating variance var.). Does the answer differ (more than noise)
#for ℜP̂ 2571ℜP^1257, ℜP̂ 2572ℜP^2257 and ℜP̂ 2573ℜP^3257?

#Problem 5 Plot a normalized histogram of the samples versus a normal distribution
#12πv√e−x22v12πve−x22v for ℜP̂ 1291ℜP^1129, ℜP̂ 1292ℜP^2129 and ℜP̂ 1293ℜP^3129.
#Hint: the following code plots a normalized histogram versus a Gaussian:
#x=Fun([-5.,5.])
#
#histogram(randn(1000);normed=true)
#plot!(exp(-x^2/(2))/sqrt(2π))

#Problem 6 The previous parts give us a way to sample Fourier coefficients
#of P(t)P(t) directly. This is important because we can converge to a fixed path.
#Complete the following code that adaptively grows a single sample of periodic
#Brownian motion, assuming (incorrectly) that P̂ 0=(0,1)P^0=N(0,1),
#ℜP̂ k=(0,1)/(k+1)ℜP^k=N(0,1)/(k+1) and ℑP̂ k=(0,1)/(k+1)ℑP^k=N(0,1)/(k+1)
#for k>0k>0, and using P̂ k=P̂ −k⎯⎯⎯⎯⎯⎯⎯⎯⎯P^k=P^−k¯ for k<0k<0.

# TODO: PeriodicBrownianPath() = PeriodicBrownianPath(Complex128[],Complex128[randn()])

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


# TODO: plot a single brownian path with more and more samples
#b=PeriodicBrownianPath()
#θ⃗=linspace(0,2π,1000)

#resizedata!(b,10)
#plot(b)
#resizedata!(b,100)
#plot!(b)
#resizedata!(b,1000)
#plot!(b)
