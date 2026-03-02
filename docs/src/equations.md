# Equations

This page maps package types to common PDE boundary/interface formulations.

## Boundary Conditions

Let `u` be the unknown scalar field, `n` the outward unit normal, and `g` a prescribed function.

Dirichlet (`Dirichlet(g)`):
```math
u = g \quad \text{on } \partial\Omega_D
```

Neumann (`Neumann(g)`):
```math
\partial_n u = g \quad \text{on } \partial\Omega_N
```

Robin (`Robin(\alpha, \beta, g)`):
```math
\alpha u + \beta\,\partial_n u = g \quad \text{on } \partial\Omega_R
```

Periodic (`Periodic()`): opposite sides are constrained by periodic identification. `validate_borderconditions!(bc, N)` enforces that periodic sides are paired.

## Interface Conditions

Let `\Gamma` be an interior interface with traces `(\cdot)_1` and `(\cdot)_2` on each side.

Scalar jump (`ScalarJump(\alpha_1, \alpha_2, g)`):
```math
\alpha_1 u_1 - \alpha_2 u_2 = g \quad \text{on } \Gamma
```

Flux jump (`FluxJump(\beta_1, \beta_2, g)`):
```math
\beta_1\,\partial_n u_1 - \beta_2\,\partial_n u_2 = g \quad \text{on } \Gamma
```

Robin-type jump (`RobinJump(\alpha, \beta, g)`):
```math
\alpha [u] + \beta [\partial_n u] = g \quad \text{on } \Gamma
```
where `[q] := q_1 - q_2`.

## Runtime Evaluation Semantics

For all coefficients/values, `eval_bc` supports:
- constant scalars
- callbacks with signature `(x...)`
- callbacks with signature `(x..., t)`

with `x` passed as `StaticArrays.SVector` and expanded into scalar coordinates.
