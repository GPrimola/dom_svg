defmodule DOM.SVG.SVGAnimatedEnumeration do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAnimatedEnumeration
  """
  defstruct [:base_val, :anim_val]

  @type t :: %__MODULE__{
          base_val: integer(),
          anim_val: integer()
        }
end
