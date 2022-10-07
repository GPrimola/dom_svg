defmodule DOM.SVG.SVGAnimatedRect do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedRect
  """
  use DOM.SVG

  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: DOMRect.t(),
          anim_val: DOMRect.t()
        }
end
