using Test
using StaticArrays
using PenguinBCs

@testset "BorderConditions validation" begin
    bc = BorderConditions(; left=Periodic(), right=Periodic())
    @test validate_borderconditions!(bc, 1) === bc

    bad = BorderConditions(; left=Periodic(), right=Dirichlet(0.0))
    @test_throws ArgumentError validate_borderconditions!(bad, 1)
end

@testset "Inflow/Outflow in BorderConditions" begin
    bc = BorderConditions(; left=Periodic(), right=Periodic())
    @test validate_borderconditions!(bc, 1) === bc

    bc2 = BorderConditions(; left=Inflow(1.0), right=Outflow())
    @test validate_borderconditions!(bc2, 1) === bc2

    bad = BorderConditions(; left=Periodic(), right=Outflow())
    @test_throws ArgumentError validate_borderconditions!(bad, 1)
end

@testset "eval_bc" begin
    x = SVector(1.0, 2.0)
    @test eval_bc(3.5, x, 0.1) == 3.5
    @test eval_bc((x, y) -> x + y, x, 0.1) == 3.0
    @test eval_bc((x, y, t) -> x + y + t, x, 0.1) == 3.1
end

@testset "InterfaceConditions" begin
    ic = InterfaceConditions(
        scalar=ScalarJump(1.0, 2.0, 0.5),
        flux=FluxJump(3.0, 4.0, 0.25),
    )
    @test ic.scalar isa ScalarJump
    @test ic.flux isa FluxJump
end
