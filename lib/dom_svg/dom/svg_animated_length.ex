defmodule DOM.SVG.SVGAnimatedLength do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedLength
  """
  use DOM.SVG
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: SVGLength.t(),
          anim_val: SVGLength.t()
        }
end
