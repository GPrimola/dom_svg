defmodule DOM.SVG.SVGTSpanElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#text-InterfaceSVGTSpanElement
  """
  use DOM.SVG
  use SVGTextPositioningElement
  defstruct @svg_text_positioning_element_fields

  @type t :: %__MODULE__{}
end
