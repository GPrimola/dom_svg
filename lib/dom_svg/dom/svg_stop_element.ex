defmodule DOM.SVG.SVGStopElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#pservers-InterfaceSVGStopElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :offset
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          offset: SVGAnimatedNumber.t()
        }
end
