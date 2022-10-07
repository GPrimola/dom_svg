defmodule DOM.SVG.SVGNumber do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGNumber
  """
  defstruct [:value]

  @type t :: %__MODULE__{
          value: float()
        }
end
