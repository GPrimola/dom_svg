defmodule DOM.SVG.SVGGeometryElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGGeometryElement
  """
  use DOM.SVG

  defmacro __using__(_opts \\ []) do
    quote do
      use SVGGraphicsElement
      @svg_geometry_element_fields @svg_graphics_element_fields ++ [:path_length]
    end
  end

  @type t ::
          Map.merge(SVGGraphicsElement.t(), %{
            path_length: SVGAnimatedNumber.t()
          })
end
