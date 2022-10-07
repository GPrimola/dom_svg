defmodule DOM.SVG.SVGAnimatedAngle do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedAngle
  """
  use DOM.SVG
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: SVGAngle.t(),
          anim_val: SVGAngle.t()
        }
end
