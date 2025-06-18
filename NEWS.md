# mapgl 0.3

* Added `enable_shiny_hover()` function for optional hover events in Shiny applications:
  - Provides `_hover` input for mouse coordinates and `_feature_hover` input for feature information
  - Performance-conscious design: hover functionality is disabled by default and must be explicitly enabled
  - Works with both `maplibre()` and `mapboxgl()` widgets, including compare views
  - Configurable options: `coordinates = TRUE/FALSE` and `features = TRUE/FALSE`
  - Example: `maplibre() |> add_circle_layer(...) |> enable_shiny_hover()`
  - Compare views support: hover events include map side (`"before"` or `"after"`) in input names

* Comprehensive legend styling system: Major enhancement to legend functionality with extensive customization options:
  - New `legend_style()` function provides user-friendly interface for legend styling without requiring CSS knowledge
  - Container styling: background colors/opacity, borders, border radius, padding, and customizable drop shadows
  - Typography control: font families (with fallbacks), sizes, weights, and colors for both title and text
  - Element borders: add borders around categorical patches/circles and continuous color bars for improved visibility
  - Shadow customization: control shadow color, size, and opacity for professional appearance
  - Works with custom legend IDs and maintains full backward compatibility
  - All legend functions now consolidated under unified `map_legends` documentation

* Advanced data classification system: New functions for automatic choropleth mapping similar to GIS software:
  - `step_equal_interval()`, `step_quantile()`, and `step_jenks()` for automatic classification with equal interval, quantile, and Jenks natural breaks methods
  - `interpolate_palette()` for continuous color scaling with multiple interpolation methods
  - Helper functions `get_legend_labels()`, `get_legend_colors()`, and `get_breaks()` for extracting classification metadata
  - Comprehensive number formatting support (currency, percent, scientific, compact notation) with customizable prefixes, suffixes, and decimal places
  - Seamless integration with existing legend system and step expressions
  - Built on `classInt` package for robust statistical classification algorithms

* Enhanced MapTiler integration: Expanded support for MapTiler mapping styles:
  - Added support for MapTiler style variants through new `variant` parameter in `maptiler_style()`
  - Support for light/dark variants of streets style and hybrid satellite imagery
  - Improved style switching with proper handling of MapTiler-specific features
  - Better integration with basemap switcher functionality

* Robust `set_style()` improvements: Fixed critical issues with dynamic style switching in Shiny applications:
  - Resolved #100: `set_style()` now properly preserves user-added layers, sources, popups, tooltips, and other map elements when switching base styles
  - Enhanced state tracking system maintains map configuration across style changes
  - Improved compatibility with basemap switcher controls for seamless style transitions
  - Fixed legend reversion issues when changing map styles
  - Better handling of map configuration properties in both regular and compare environments

* New `number_format()` function: Comprehensive number formatting for tooltips and map content:
  - Support for currency, percentage, scientific notation, and compact formats
  - Customizable decimal places, thousands separators, and currency symbols
  - Integration with tooltip expressions for dynamic number formatting
  - Works with both static content and expression-based tooltips

* Enhanced draw control functionality with improved feature editing capabilities:
  - Added ability to load existing features from map sources into the draw control for editing either when initializing the draw control or via `add_features_to_draw()`
  - Fixed vertex styling to properly highlight selected vertices during editing
  - Extended draw control support to compare views, enabling feature editing in side-by-side map comparisons
  - Improved compatibility with both Mapbox GL JS and MapLibre GL JS

* Fixed `hover_options` for vector tile sources in MapLibre (#67):
  - Added proper source layer handling for vector tiles when using hover effects
  - Now works correctly with PMTiles and other vector tile sources that include feature IDs
  - Note: Vector tiles must include feature IDs for hover effects to work. GeoJSON sources automatically generate IDs.

* Enhanced tooltip functionality with expression support:
  - Tooltips can now use expressions for dynamic content generation
  - Use `get_column()` to reference feature properties in tooltips
  - Added `concat()` helper function for combining strings and expressions
  - Example: `tooltip = concat("<strong>Name:</strong> ", get_column("name"), "<br>Value: ", get_column("value"))`
  - Works with both regular tooltips and `set_tooltip()` in Shiny applications

# mapgl 0.2.2

* Added `mapboxgl_view()` and `maplibre_view()` functions for quick visualization of sf objects with automatic geometry detection and column-based styling (#102).
* Added support for rain and snow effects on Mapbox GL maps with `set_rain()` and `set_snow()` functions.
* Added `add_globe_control()` for MapLibre maps, allowing users to toggle between "mercator" and "globe" projections.
* Fixed issue with `set_style()` in Shiny applications for both Mapbox and MapLibre maps (#99).
* Fixed namespacing issue in `get_drawn_features()` for Shiny modules (#95).
* Improved compare functionality with better control support and swiper color customization.

# mapgl 0.2.1

* Improved styling and positioning behavior of the layers control. Users can now customize the appearance of the layers control, and the layers control is collapsed by default with cleaner appearance.
Added ability to link legends to specific layers with the new `layer_id` parameter in `add_legend()`. When a layer is toggled in the layers control, its associated legend will automatically show or hide.
* Added support for custom legend positioning with new margin parameters (`margin_top`, `margin_right`, `margin_bottom`, `margin_left`) that allow fine-grained control over legend placement.
* Fixed layers control toggle button state to correctly reflect the initial visibility of layers, resolving the issue with layers set to `visibility = "none"` showing as active in the control.
* Support for the `compare()` plugin in Shiny applications, with new rendering and proxy functions for comparison apps in Mapbox and MapLibre.
* New `mode` parameter in `compare()` allowing users to choose between `"swipe"` mode with a comparison slider, and `"sync"` mode which displays synchronized maps side-by-side.
* Updates throughout the codebase to allow features to be used in comparison maps via Shiny proxy sessions.

# mapgl 0.2.0

* A new "story map" feature allows users to build interactive story maps.  [View the story mapping vignette](https://walker-data.com/mapgl/articles/story-maps.html) for more information.
* Various bug fixes and performance improvements; [visit the package GitHub page for more details](https://github.com/walkerke/mapgl).

# mapgl 0.1.4

* `add_image()` allows you to add your own image to the map's sprite for use as an icon / symbol layer
* `add_geolocate_control()` adds a Geolocate control to the map
* `add_globe_minimap()` adds a mini globe overview map that tracks how your map moves around the globe
* Support for multiple legends with the argument `add = TRUE`
* A `move_layer()` function that gives you more fine-grained control over layer ordering in a Shiny session
* Various bug fixes and performance improvements.


# mapgl 0.1.3

* Geocoding support for Mapbox and MapLibre maps added with `add_geocoder_control()`
* Freehand draw support in the draw toolbar with `add_draw_control(freehand = TRUE)`
* A "reset view" control available with `add_reset_control()`
* Circle clustering is streamlined with the `cluster_options()` function, to be used with the `cluster_options` argument in `add_circle_layer()` and `add_symbol_layer()`
* Various bug fixes and performance improvements.

# mapgl 0.1.0

* Initial release.
