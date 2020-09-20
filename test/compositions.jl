@testset "Composition" begin
  # basic tests
  c₀ = Composition(1,1,1)
  c₁ = Composition(1,2,3)
  c₂ = Composition(10,20,30)
  @test c₁ == c₂
  @test c₁ - c₂ == c₀
  @test norm(c₀) ≈ 0.
  @test isapprox(distance(c₁, c₁), 0., atol=1e-6)

  # make sure names are preserved
  c = Composition(a=1, b=2)
  @test names(c + c) == names(c)
  @test names(-c) == names(c)
  @test names(c - c) == names(c)
  @test names(2c) == names(c)

  # get part by name
  c = Composition(a=2,b=3,c=3)
  @test c.a == 0.25
  @test c.b == 0.375
  @test c.c == 0.375
end
