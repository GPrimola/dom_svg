defmodule DOM.SVG.SVGPatternElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#pservers-InterfaceSVGPatternElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :svg_fit_to_view_box,
    :svg_uri_reference,
    :pattern_units,
    :pattern_content_units,
    :pattern_transform,
    :x,
    :y,
    :width,
    :height
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          svg_fit_to_view_box: SVGFitToViewBoxElement.t(),
          svg_uri_reference: SVGURIReference.t(),
          pattern_units: SVGAnimatedEnumeration.t(),
          pattern_content_units: SVGAnimatedEnumeration.t(),
          pattern_transform: list(SVGAnimatedTransform.t()),
          x: SVGAnimatedLength.t(),
          y: SVGAnimatedLength.t(),
          width: SVGAnimatedLength.t(),
          height: SVGAnimatedLength.t()
        }
end
