defmodule DOM.SVG.SVGCircleElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#shapes-InterfaceSVGCircleElement
  """
  use DOM.SVG
  use SVGGeometryElement

  defstruct @svg_geometry_element_fields ++
              [
                cx: 0.0,
                cy: 0.0,
                r: 0.0
              ]

  @type t ::
          Map.merge(SVGGeometryElement.t(), %__MODULE__{
            cx: SVGAnimatedLength.t(),
            cy: SVGAnimatedLength.t(),
            r: SVGAnimatedLength.t()
          })

  def new() do
    %__MODULE__{
      tag_name: "circle"
    }
  end
end
