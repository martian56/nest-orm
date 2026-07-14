param(
    [switch]$Keep
)

$ErrorActionPreference = "Stop"
$project = "nest-orm-test"
$root = Split-Path -Parent $PSScriptRoot

Push-Location $root
try {
    docker compose -p $project up -d --wait
    if ($LASTEXITCODE -ne 0) {
        throw "database containers did not become healthy"
    }

    $env:NEST_POSTGRES_E2E = "1"
    $env:NEST_MYSQL_E2E = "1"
    rvpm test
    if ($LASTEXITCODE -ne 0) {
        throw "Nest end-to-end tests failed"
    }
}
finally {
    Remove-Item Env:NEST_POSTGRES_E2E -ErrorAction SilentlyContinue
    Remove-Item Env:NEST_MYSQL_E2E -ErrorAction SilentlyContinue
    if (-not $Keep) {
        docker compose -p $project down --volumes --remove-orphans
    }
    Pop-Location
}
