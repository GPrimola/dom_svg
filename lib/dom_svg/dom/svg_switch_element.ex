defmodule DOM.SVG.SVGSwitchElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGSwitchElement
  """
  use DOM.SVG
  use SVGGraphicsElement
  defstruct @svg_graphics_element_fields

  @type t :: SVGGraphicsElement.t()
end
