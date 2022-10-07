defmodule DOM.SVG.SVGUnknownElement do
  @moduledoc """
    https://www.w3.org/TR/SVG/struct.html#InterfaceSVGUnknownElement
  """

  use DOM.SVG
  use SVGGraphicsElement
  defstruct @svg_graphics_element_fields

  @type t :: %__MODULE__{}
end
