defmodule DOM.SVG.SVGMetadataElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGMetadataElement
  """
  use DOM.SVG
  use SVGElement
  defstruct @svg_element_fields

  @type t :: %__MODULE__{}
end
