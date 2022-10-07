defmodule DOM.SVG.SVGURIReference do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGURIReference
  """
  use DOM.SVG

  defmacro __using__(_opts \\ []) do
    quote do
      @svg_uri_reference_fields [:href]
    end
  end

  @type t :: %{
          href: SVGAnimatedString.t()
        }
end
