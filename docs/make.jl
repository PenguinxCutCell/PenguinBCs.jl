using Documenter
using PenguinBCs

makedocs(
    modules = [PenguinBCs],
    authors = "PenguinxCutCell contributors",
    sitename = "PenguinBCs.jl",
    format = Documenter.HTML(
        canonical = "https://PenguinxCutCell.github.io/PenguinBCs.jl",
        repolink = "https://github.com/PenguinxCutCell/PenguinBCs.jl",
        collapselevel = 2,
    ),
    pages = [
        "Home" => "index.md",
        "Equations" => "equations.md",
        "References" => "references.md",
        "API" => "api.md",
    ],
    pagesonly = true,
    warnonly = true,
    remotes = nothing,
)

# Only deploy docs if running in CI environment
if get(ENV, "CI", "") == "true"
    deploydocs(
        repo = "github.com/PenguinxCutCell/PenguinBCs.jl",
        push_preview = true,
    )
end
