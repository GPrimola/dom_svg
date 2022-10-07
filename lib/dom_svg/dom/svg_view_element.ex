defmodule DOM.SVG.SVGViewElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#linking-InterfaceSVGViewElement
  """
  use DOM.SVG
  use SVGElement
  use SVGFitToViewBox
  defstruct @svg_element_fields ++ @svg_fit_to_view_box_fields

  @type t :: Map.merge(SVGElement.t(), SVGFitToViewBox.t())
end
