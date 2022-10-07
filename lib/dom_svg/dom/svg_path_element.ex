defmodule DOM.SVG.SVGPathElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#paths-InterfaceSVGPathElement
  https://www.w3.org/TR/SVG11/shapes.html#PathElement
  """
  use DOM.SVG
  use SVGGeometryElement
  defstruct @svg_geometry_element_fields

  @type t :: %__MODULE__{}
end
