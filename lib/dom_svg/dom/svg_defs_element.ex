defmodule DOM.SVG.SVGDefsElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGDefsElement
  """
  use DOM.SVG
  use SVGGraphicsElement
  defstruct @svg_graphics_element_fields

  @type t :: %__MODULE__{}
end
