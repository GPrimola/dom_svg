defmodule DOM.SVG.SVGDescElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGDescElement
  """
  use DOM.SVG
  use SVGElement
  defstruct @svg_element_fields

  @type t :: %__MODULE__{}
end
