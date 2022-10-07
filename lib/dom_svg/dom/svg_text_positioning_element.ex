defmodule DOM.SVG.SVGTextPositioningElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#text-InterfaceSVGTextPositioningElement
  """
  use DOM.SVG

  defmacro __using__(_opts \\ []) do
    quote do
      use SVGTextContentElement

      @svg_text_positioning_element_fields @svg_text_content_element_fields ++
                                             [
                                               :x,
                                               :y,
                                               :dx,
                                               :dy,
                                               :rotate
                                             ]
    end
  end

  @type t ::
          Map.merge(SVGTextContentElement.t(), %{
            x: list(SVGAnimatedLength.t()),
            y: list(SVGAnimatedLength.t()),
            dx: list(SVGAnimatedLength.t()),
            dy: list(SVGAnimatedLength.t()),
            rotate: list(SVGAnimatedNumber.t())
          })
end
