defmodule DOM.SVG.SVGLineElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#shapes-InterfaceSVGLineElement
  """
  use DOM.SVG
  use SVGGeometryElement

  defstruct @svg_geometry_element_fields ++
              [
                :x1,
                :y1,
                :x2,
                :y2
              ]

  @type t ::
          Map.merge(SVGGeometryElement.t(), %__MODULE__{
            x1: SVGAnimatedLength.t(),
            y2: SVGAnimatedLength.t(),
            x2: SVGAnimatedLength.t(),
            y2: SVGAnimatedLength.t()
          })
end
