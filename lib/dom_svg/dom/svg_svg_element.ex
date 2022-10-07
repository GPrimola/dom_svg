defprotocol DOM.SVG.SVGSVGElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGSVGElement
  """

  use DOM.SVG
  use SVGGraphicsElement
  use SVGFitToViewBox

  defstruct @svg_graphics_element_fields ++
              @svg_fit_to_view_box_fields ++
              [
                :width,
                :height,
                :current_scale,
                :current_translate,
                :x,
                :y
              ]

  @typep extends :: Map.merge(SVGGraphicsElement.t(), SVGFitToViewBox.t())
  @type t ::
          Map.merge(extends(), %__MODULE__{
            x: SVGAnimatedLength.t(),
            y: SVGAnimatedLength.t(),
            width: SVGAnimatedLength.t(),
            height: SVGAnimatedLength.t(),
            current_scale: float(),
            current_translate: DOMPoint.t()
          })
end
