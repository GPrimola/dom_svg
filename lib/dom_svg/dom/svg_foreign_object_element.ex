defmodule DOM.SVG.SVGForeignObjectElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#embedded-InterfaceSVGForeignObjectElement
  """
  use DOM.SVG

  defstruct [
    :svg_graphics_element,
    :x,
    :y,
    :width,
    :height
  ]

  @type t :: %{
          svg_graphics_element: SVGGraphicsElement.t(),
          x: SVGAnimatedLength.t(),
          y: SVGAnimatedLength.t(),
          width: SVGAnimatedLength.t(),
          height: SVGAnimatedLength.t()
        }
end
