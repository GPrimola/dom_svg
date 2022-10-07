defmodule DOM.SVG.SVGEllipseElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#shapes-InterfaceSVGEllipseElement
  """
  use DOM.SVG
  use SVGGeometryElement

  defstruct @svg_geometry_element_fields ++
              [
                cx: 0.0,
                cy: 0.0,
                rx: 0.0,
                ry: 0.0
              ]

  @type t ::
          Map.merge(SVGGeometryElement.t(), %__MODULE__{
            cx: SVGAnimatedLength.t(),
            cy: SVGAnimatedLength.t(),
            rx: SVGAnimatedLength.t(),
            ry: SVGAnimatedLength.t()
          })
end
