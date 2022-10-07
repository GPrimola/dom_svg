defmodule DOM.SVG.SVGPolylineElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#shapes-InterfaceSVGPolylineElement
  """
  use DOM.SVG
  use SVGGeometryElement

  defstruct @svg_geometry_element_fields

  @type t :: %__MODULE__{}
end
