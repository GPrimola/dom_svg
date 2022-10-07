defmodule DOM.SVG.SVGRadialGradientElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#pservers-InterfaceSVGRadialGradientElement
  """
  use DOM.SVG

  defstruct [
    :svg_gradient_element,
    :cx,
    :cy,
    :r,
    :fx,
    :fy,
    :fr
  ]

  @type t :: %__MODULE__{
          svg_gradient_element: SVGGradientElement.t(),
          cx: SVGAnimatedLength.t(),
          cy: SVGAnimatedLength.t(),
          r: SVGAnimatedLength.t(),
          fx: SVGAnimatedLength.t(),
          fy: SVGAnimatedLength.t(),
          fr: SVGAnimatedLength.t()
        }
end
