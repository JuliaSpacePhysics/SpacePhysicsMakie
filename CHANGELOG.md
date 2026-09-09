# Changelog

## [Unreleased]

### Changed

- **Breaking**: lazy sources are fetched through `SpaceDataModel.getdata(x, t0, t1)` (SpaceDataModel 0.3). Plain functions still work; `Product`, `Dataset` and `Transformed` plot through the same interactive path. Callable products from SpaceDataModel 0.2 are no longer supported.

## [0.2.0] - 2025-11-19

### Changed

- **Breaking**: plotting system has been rewritten to use Makie's (0.24) compute graph API. Support for older Makie versions has been dropped.