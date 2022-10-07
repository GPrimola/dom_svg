defmodule DOM.SVG.SVGAElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#linking-InterfaceSVGAElement
  """
  use DOM.SVG

  defstruct [
    :svg_graphics_element,
    :svg_uri_reference,
    :target,
    :download,
    :ping,
    :rel,
    :rel_list,
    :hreflang,
    :type,
    :referrer_policy
  ]

  @type t :: %__MODULE__{
          svg_graphics_element: SVGGraphicsElement.t(),
          svg_uri_reference: SVGURIReference.t(),
          target: SVGAnimatedString.t(),
          download: binary(),
          ping: binary(),
          rel: binary(),
          rel_list: list(),
          hreflang: binary(),
          type: binary(),
          referrer_policy: binary()
        }
end
