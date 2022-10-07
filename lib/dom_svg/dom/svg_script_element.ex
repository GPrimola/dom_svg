defmodule DOM.SVG.SVGScriptElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#interact-InterfaceSVGScriptElement
  """
  use DOM.SVG

  defstruct [
    :svg_element,
    :svg_uri_reference,
    :type,
    :cross_origin
  ]

  @type t :: %__MODULE__{
          svg_element: SVGElement.t(),
          svg_uri_reference: SVGURIReference.t(),
          type: binary(),
          cross_origin: binary()
        }
end
