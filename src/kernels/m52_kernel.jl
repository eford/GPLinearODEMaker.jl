import GPLinearODEMaker.powers_of_negative_one

"""
m52_kernel function created by kernel_coder(). Requires 1 hyperparameters. Likely created using m52_kernel_base() as an input.
Use with include("src/kernels/m52_kernel.jl").
hyperparameters == ["λ"]
"""
function m52_kernel(
    hyperparameters::Vector{<:Real},
    δ::Real;
    dorder::Vector{<:Integer}=zeros(Int64, length(hyperparameters) + 2))

    @assert length(hyperparameters)==1 "hyperparameters is the wrong length"
    dorder_len = 3
    @assert length(dorder)==dorder_len "dorder is the wrong length"
    dorder2 = dorder[2]
    @assert maximum(dorder) < 3 "No more than two time derivatives for either t1 or t2 can be calculated"

    dorder[2] = sum(dorder[1:2])

    λ = hyperparameters[1]

    dabs_δ = powers_of_negative_one(δ < 0)  # store derivative of abs()
    abs_δ = abs(δ)

    if view(dorder, 2:dorder_len)==[4, 2]
        func = 500.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^6 - 200.0*exp(-2.23606797749979*abs_δ/λ)*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^5 + 180.0*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))/λ^4 + 25.0*exp(-2.23606797749979*abs_δ/λ)*(6.66666666666667*abs_δ^2/λ^4 + 4.47213595499958*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^3)/λ^4 - 120.0*exp(-2.23606797749979*abs_δ/λ)*(-6.66666666666667*λ^(-3))/λ^3 + 30.0*exp(-2.23606797749979*abs_δ/λ)*(20.0*λ^(-4))/λ^2 + 125.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^8 - 559.016994374948*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^7 + 111.80339887499*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^6 + 150.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(3.33333333333333*λ^(-2))/λ^6 - 402.492235949962*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))/λ^5 - 536.65631459995*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^5 + 134.164078649987*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-6.66666666666667*λ^(-3))/λ^4 + 268.328157299975*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^4 - 44.7213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(16.6666666666667*abs_δ*dabs_δ/λ^4 + 4.47213595499958*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^3)/λ^3 - 223.606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^7 + 800.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^6 - 200.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^5
    end

    if view(dorder, 2:dorder_len)==[3, 2]
        func = 90.0*exp(-2.23606797749979*abs_δ/λ)*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^4 - 60.0*exp(-2.23606797749979*abs_δ/λ)*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^3 + 15.0*exp(-2.23606797749979*abs_δ/λ)*(16.6666666666667*abs_δ*dabs_δ/λ^4 + 4.47213595499958*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^3)/λ^2 + 75.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^6 - 201.246117974981*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^5 - 134.164078649987*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^5 + 67.0820393249937*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^4 + 67.0820393249937*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^4 - 11.180339887499*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(6.66666666666667*abs_δ^2/λ^4 + 4.47213595499958*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^3)/λ^3 - 13.4164078649987*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))*dabs_δ/λ^3 + 13.4164078649987*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-6.66666666666667*λ^(-3))/λ^2 - 6.70820393249937*exp(-2.23606797749979*abs_δ/λ)*(20.0*λ^(-4))*dabs_δ/λ - 55.9016994374948*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^7 + 200.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^6 - 50.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^5 - 33.5410196624969*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(3.33333333333333*λ^(-2))*dabs_δ/λ^5 + 60.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))*dabs_δ/λ^4 - 30.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(-6.66666666666667*λ^(-3))/λ^3
    end

    if view(dorder, 2:dorder_len)==[2, 2]
        func = exp(-2.23606797749979*abs_δ/λ)*(20.0*λ^(-4)) + 30.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 - 20.0*exp(-2.23606797749979*abs_δ/λ)*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^3 + 5.0*exp(-2.23606797749979*abs_δ/λ)*(6.66666666666667*abs_δ^2/λ^4 + 4.47213595499958*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^3)/λ^2 + 25.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^6 - 67.0820393249937*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^5 + 22.3606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^4 + 5.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(3.33333333333333*λ^(-2))/λ^4 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))/λ^3 - 8.94427190999916*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^3 + 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-6.66666666666667*λ^(-3))/λ^2 + 8.94427190999916*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^2 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(16.6666666666667*abs_δ*dabs_δ/λ^4 + 4.47213595499958*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^3)/λ - 22.3606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^5 + 40.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^4 - 20.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^3
    end

    if view(dorder, 2:dorder_len)==[1, 2]
        func = exp(-2.23606797749979*abs_δ/λ)*(16.6666666666667*abs_δ*dabs_δ/λ^4 + 4.47213595499958*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^3) + 5.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^4 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^3 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^3 + 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^2 + 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^2 - 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(6.66666666666667*abs_δ^2/λ^4 + 4.47213595499958*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^3)/λ - 11.180339887499*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^5 + 20.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 - 10.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^3
    end

    if view(dorder, 2:dorder_len)==[0, 2]
        func = exp(-2.23606797749979*abs_δ/λ)*(6.66666666666667*abs_δ^2/λ^4 + 4.47213595499958*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^3) + 5.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ^2*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^3 + 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^2
    end

    if view(dorder, 2:dorder_len)==[4, 1]
        func = -100.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^5 + 25.0*exp(-2.23606797749979*abs_δ/λ)*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^4 - 60.0*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))/λ^3 + 30.0*exp(-2.23606797749979*abs_δ/λ)*(-6.66666666666667*λ^(-3))/λ^2 + 55.9016994374948*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^6 + 67.0820393249937*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))/λ^4 + 134.164078649987*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^4 - 44.7213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^3 - 100.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^5
    end

    if view(dorder, 2:dorder_len)==[3, 1]
        func = -30.0*exp(-2.23606797749979*abs_δ/λ)*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^3 + 15.0*exp(-2.23606797749979*abs_δ/λ)*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ^2 + 33.5410196624969*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^4 + 33.5410196624969*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 - 11.180339887499*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^3 + 6.70820393249937*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))*dabs_δ/λ^2 - 6.70820393249937*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-6.66666666666667*λ^(-3))/λ - 25.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^5 - 15.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))*dabs_δ/λ^3
    end

    if view(dorder, 2:dorder_len)==[2, 1]
        func = exp(-2.23606797749979*abs_δ/λ)*(-6.66666666666667*λ^(-3)) - 10.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^3 + 5.0*exp(-2.23606797749979*abs_δ/λ)*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ^2 + 11.180339887499*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 + 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(3.33333333333333*λ^(-2))/λ^2 + 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^2 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2)/λ - 10.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^3
    end

    if view(dorder, 2:dorder_len)==[1, 1]
        func = exp(-2.23606797749979*abs_δ/λ)*(-5.0*abs_δ*dabs_δ/λ^3 - 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ^2) + 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^2 + 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^2 - 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2)/λ - 5.0*exp(-2.23606797749979*abs_δ/λ)*abs_δ*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^3
    end

    if view(dorder, 2:dorder_len)==[0, 1]
        func = exp(-2.23606797749979*abs_δ/λ)*(-1.66666666666667*abs_δ^2/λ^3 - 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ^2) + 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*abs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^2
    end

    if view(dorder, 2:dorder_len)==[4, 0]
        func = 25.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^4 + 30.0*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))/λ^2 - 44.7213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^3
    end

    if view(dorder, 2:dorder_len)==[3, 0]
        func = 15.0*exp(-2.23606797749979*abs_δ/λ)*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ^2 - 11.180339887499*exp(-2.23606797749979*abs_δ/λ)*dabs_δ^3*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^3 - 6.70820393249937*exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2))*dabs_δ/λ
    end

    if view(dorder, 2:dorder_len)==[2, 0]
        func = exp(-2.23606797749979*abs_δ/λ)*(3.33333333333333*λ^(-2)) + 5.0*exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ^2 - 4.47213595499958*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ)/λ
    end

    if view(dorder, 2:dorder_len)==[1, 0]
        func = exp(-2.23606797749979*abs_δ/λ)*(1.66666666666667*abs_δ*dabs_δ/λ^2 + 2.23606797749979*(1 + 0.74535599249993*abs_δ/λ)*dabs_δ/λ) - 2.23606797749979*exp(-2.23606797749979*abs_δ/λ)*dabs_δ*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)/λ
    end

    if view(dorder, 2:dorder_len)==[0, 0]
        func = exp(-2.23606797749979*abs_δ/λ)*(1 + 2.23606797749979*abs_δ*(1 + 0.74535599249993*abs_δ/λ)/λ)
    end

    dorder[2] = dorder2  # resetting dorder[2]
    return powers_of_negative_one(dorder2) * float(func)  # correcting for amount of t2 derivatives

end


return m52_kernel, 1  # the function handle and the number of kernel hyperparameters