# Changelog

## [Unreleased]

### Changed

- **Breaking**: `degap` and `reindex` moved to TimeseriesUtilities (0.2.3); they are array operations, not plotting.
- **Breaking**: metadata schemas (`MetadataSchema`, `ISTPSchema`, `get_schema`, `validate_schema`, …) are no longer defined here; use SpaceDataModel's. The HAPIClient extension is gone since HAPIClient tags its metadata with `SchemaDict`. This package only maps semantic keys (`:name`, `:unit`, `:scale`, `:labels`, `:display_type`, `:depend_1_*`) to Makie attributes.
- **Breaking**: lazy sources are fetched through `SpaceDataModel.getdata(x, t0, t1)` (SpaceDataModel 0.3). Plain functions still work; `Product`, `Dataset` and `Transformed` plot through the same interactive path. Callable products from SpaceDataModel 0.2 are no longer supported.

## [0.2.0] - 2025-11-19

### Changed

- **Breaking**: plotting system has been rewritten to use Makie's (0.24) compute graph API. Support for older Makie versions has been dropped.