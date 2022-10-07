defmodule DOM.SVG.SVGAnimatedString do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedString
  """
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: binary(),
          anim_val: binary()
        }
end
