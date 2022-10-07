defmodule DOM.SVG.SVGUseElementShadowRoot do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGUseElementShadowRoot
  """
  use DOM.SVG
  defstruct [:dom_shadow_root]

  @type t :: %__MODULE__{
          dom_shadow_root: DOMShadowRoot.t()
        }
end
