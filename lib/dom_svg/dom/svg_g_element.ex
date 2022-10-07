defmodule DOM.SVG.SVGGElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGGElement
  https://www.w3.org/TR/SVG/struct.html#Groups
  """
  use DOM.SVG
  use SVGGraphicsElement

  defstruct @svg_graphics_element_fields

  @type t :: %__MODULE__{}
end
