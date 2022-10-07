defmodule DOM.SVG.SVGRectElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#shapes-InterfaceSVGRectElement
  """
  use DOM.SVG
  use SVGGeometryElement

  defstruct @svg_geometry_element_fields ++
              [
                :width,
                :height,
                x: 0.0,
                y: 0.0,
                rx: 0.0,
                ry: 0.0
              ]

  @type t ::
          Map.merge(SVGGeometryElement.t(), %__MODULE__{
            x: SVGAnimatedLength.t(),
            y: SVGAnimatedLength.t(),
            width: SVGAnimatedLength.t(),
            height: SVGAnimatedLength.t(),
            rx: SVGAnimatedLength.t(),
            ry: SVGAnimatedLength.t()
          })
end
