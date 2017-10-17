#lets try out runge-kutta (45?)

function rk_jdefault(t, f, y0)
    #this is my first go at runge-kutta
    #following along with wikipedia
    #dy_dt = f(t, y), y(t0) = y0
    h = 0.1 #timestep
    y_n_1 = y_n + (h/6)(k1 +2k2+2k3+k4)
    t_n_1 = t_n + h

    k1 = f(t_n, y_n)
    k2 = f(t_n + h/2, y_n + (h/2)*k1)
    k3 = f(t_n + h/2, y_n + (h/2)*k2)
    k4 = f(t_n + h, y_n + (h * k3))


    return rk_y
end
