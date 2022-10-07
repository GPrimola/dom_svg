defmodule DOM.SVG.SVGLinearGradientElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#pservers-InterfaceSVGLinearGradientElement
  """
  use DOM.SVG

  defstruct [
    :svg_gradient_element,
    :x1,
    :y1,
    :x2,
    :y2
  ]

  @type t :: %__MODULE__{
          svg_gradient_element: SVGGradientElement.t(),
          x1: SVGAnimatedLength.t(),
          y1: SVGAnimatedLength.t(),
          x2: SVGAnimatedLength.t(),
          y2: SVGAnimatedLength.t()
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
