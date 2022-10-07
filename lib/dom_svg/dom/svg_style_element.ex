defmodule DOM.SVG.SVGStyleElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#styling-InterfaceSVGStyleElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :type,
    :media,
    :title
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          type: binary(),
          media: binary(),
          title: binary()
        }
end
