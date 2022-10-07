defmodule DOM.SVG.SVGAnimatedPreserveAspectRatio do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#coords-InterfaceSVGAnimatedPreserveAspectRatio
  """
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: SVGPreserveAspectRatio.t(),
          anim_val: SVGPreserveAspectRatio.t()
        }
end
