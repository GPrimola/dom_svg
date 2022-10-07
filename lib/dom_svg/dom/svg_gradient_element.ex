defmodule DOM.SVG.SVGGradientElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#pservers-InterfaceSVGGradientElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :svg_uri_reference,
    :gradient_units,
    :gradient_transform,
    :spread_method
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          svg_uri_reference: SVGURIReference.t(),
          gradient_units: SVGAnimatedEnumeration.t(),
          gradient_transform: list(SVGAnimatedTransform.t()),
          spread_method: SVGAnimatedEnumeration.t()
        }

  # Spread Method Types
  @svg_spread_method_unknown 0
  @svg_spread_method_pad 1
  @svg_spread_method_reflect 2
  @svg_spread_method_repeat 3

  @svg_spread_method_type_map %{
    unknown: @svg_spread_method_unknown,
    pad: @svg_spread_method_pad,
    reflect: @svg_spread_method_reflect,
    repeat: @svg_spread_method_repeat
  }
end
