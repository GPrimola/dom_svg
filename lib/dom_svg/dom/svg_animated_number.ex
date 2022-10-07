defmodule DOM.SVG.SVGAnimatedNumber do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedNumber
  """
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: float(),
          anim_val: float()
        }
end
