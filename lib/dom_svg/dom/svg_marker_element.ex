defmodule DOM.SVG.SVGMarkerElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#painting-InterfaceSVGMarkerElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :svg_fit_to_view_box,
    :ref_x,
    :ref_y,
    :marker_units,
    :marker_width,
    :marker_height,
    :orient_type,
    :orient_angle,
    :orient
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          svg_fit_to_view_box: SVGFitToViewBox.t(),
          ref_x: SVGAnimatedLength.t(),
          ref_y: SVGAnimatedLength.t(),
          marker_units: SVGAnimatedEnumeration.t(),
          marker_width: SVGAnimatedLength.t(),
          marker_height: SVGAnimatedLength.t(),
          orient_type: SVGAnimatedEnumeration.t(),
          orient_angle: SVGAnimatedAngle.t(),
          orient: binary()
        }

  # Marker Unit Types
  @svg_marker_units_unknown 0
  @svg_marker_units_userspaceonuse 1
  @svg_marker_units_strokewidth 2

  # Marker Orientation Types
  @svg_marker_orient_unknown 0
  @svg_marker_orient_auto 1
  @svg_marker_orient_angle 2

  @svg_marker_units_type_map %{
    unknown: @svg_marker_units_unknown,
    userspaceonuse: @svg_marker_units_userspaceonuse,
    strokewidth: @svg_marker_units_strokewidth
  }

  @svg_marker_orient_type_map %{
    unknown: @svg_marker_orient_unknown,
    auto: @svg_marker_orient_auto,
    angle: @svg_marker_orient_angle
  }
end
