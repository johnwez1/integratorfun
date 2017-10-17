#lets try out runge-kutta (45?)
using PyPlot

function rk_jdefault(t0, tN, h, f, y0)
    #this is my first go at runge-kutta
    #following along with wikipedia
    #dy_dt = f(t, y), y(t0) = y0

    #y_n_1 = y_n + (h/6)(k1 + 2k2 + 2k3 + k4)
    #t_n_1 = t_n + h

    # k1 = f(t_n, y_n)
    # k2 = f(t_n + h/2, y_n + (h/2)*k1)
    # k3 = f(t_n + h/2, y_n + (h/2)*k2)
    # k4 = f(t_n + h, y_n + (h * k3))

    t = collect(t0:h:tN)
    #naively, let us loop
    y_array = [y0]
    #init:
    y_n = y0
    t_n = t0

    while t_n < tN
      k1 = f(t_n, y_n)
      k2 = f(t_n + h/2, y_n + (h/2)*k1)
      k3 = f(t_n + h/2, y_n + (h/2)*k2)
      k4 = f(t_n + h, y_n + (h * k3))
      y_n = y_n + (h/6)*(k1 + 2k2 + 2k3 + k4)
      t_n = t_n + h
      push!(y_array, y_n)
    end
    return y_array
end

function testf(t, y)
    tf = y + (0.00000001*t)*y
    return tf
end

function plot_result()
  y0 = 1.0
  t0, h, tN, = 0, 0.1, 10
  t = collect(t0:h:tN)
  rkj = rk_jdefault(t0, tN, h, testf, y0)
  pyplot()
  plot(rkj)
  gui()
  return rkj
end
