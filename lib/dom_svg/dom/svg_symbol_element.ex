defmodule DOM.SVG.SVGSymbolElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGSymbolElement
  """
  use DOM.SVG
  use SVGGraphicsElement
  use SVGFitToViewBox
  defstruct @svg_graphics_element_fields ++ @svg_fit_to_view_box_fields

  @type t :: Map.merge(SVGGraphicsElement.t(), SVGFitToViewBox.t())
end
