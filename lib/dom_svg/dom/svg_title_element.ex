defmodule DOM.SVG.SVGTitleElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGTitleElement
  """
  use DOM.SVG
  use SVGElement
  defstruct @svg_element_fields

  @type t :: SVGElement.t()
end
