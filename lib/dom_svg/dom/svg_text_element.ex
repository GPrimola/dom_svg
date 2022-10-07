defmodule DOM.SVG.SVGTextElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#text-InterfaceSVGTextElement
  """
  use DOM.SVG
  use SVGTextPositioningElement
  defstruct @svg_text_positioning_element_fields

  @type t :: %__MODULE__{}
end
