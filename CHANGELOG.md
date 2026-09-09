# Changelog

## [Unreleased]

### Changed

- Interactive panels show exactly the requested time range and refetch only when the view leaves the loaded range; the loaded range is tracked as the compute-graph input instead of the axis limits at creation.
- **Breaking**: the mutable `DEFAULTS` global is gone; defaults live in `THEME` and are overridden through Makie's theme (`update_theme!(SpacePhysicsMakie = (; add_title = true))`, `with_theme`).
- **Breaking**: time series are recognised through SpaceDataModel's interface (`hastimedim`, `times`, `tdimnum`) instead of sniffing `.time`/`.times`/`.dims` properties. A `DimArray` without a `Ti` or `:time` dimension now plots through Makie's default recipe.
- **Breaking**: `degap` and `reindex` moved to TimeseriesUtilities (0.2.3); they are array operations, not plotting.
- **Breaking**: metadata schemas (`MetadataSchema`, `ISTPSchema`, `get_schema`, `validate_schema`, …) are no longer defined here; use SpaceDataModel's. The HAPIClient extension is gone since HAPIClient tags its metadata with `SchemaDict`. This package only maps semantic keys (`:name`, `:unit`, `:scale`, `:labels`, `:display_type`, `:depend_1_*`) to Makie attributes.
- **Breaking**: lazy sources are fetched through `SpaceDataModel.getdata(x, t0, t1)` (SpaceDataModel 0.3). Plain functions still work; `Product`, `Dataset` and `Transformed` plot through the same interactive path. Callable products from SpaceDataModel 0.2 are no longer supported.

## [0.2.0] - 2025-11-19

### Changed

- **Breaking**: plotting system has been rewritten to use Makie's (0.24) compute graph API. Support for older Makie versions has been dropped.