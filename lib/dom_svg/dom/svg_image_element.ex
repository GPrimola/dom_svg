defmodule DOM.SVG.SVGImageElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#embedded-InterfaceSVGImageElement
  """
  use DOM.SVG

  defstruct [
    :svg_graphics_element,
    :x,
    :y,
    :width,
    :height,
    :preserve_aspect_ratio,
    :cross_origin
  ]

  @type t :: %{
          svg_graphics_element: SVGGraphicsElement.t(),
          x: SVGAnimatedLength.t(),
          y: SVGAnimatedLength.t(),
          width: SVGAnimatedLength.t(),
          height: SVGAnimatedLength.t(),
          preserve_aspect_ration: SVGAnimatedPreserveAspectRatio.t(),
          cross_origin: binary()
        }
end
