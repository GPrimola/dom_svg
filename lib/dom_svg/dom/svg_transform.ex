defmodule DOM.SVG.SVGTransform do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#coords-InterfaceSVGTransform
  """
  defstruct [:type, :matrix, :angle]

  # Transform Types
  @svg_transform_unknown 0
  @svg_transform_matrix 1
  @svg_transform_translate 2
  @svg_transform_scale 3
  @svg_transform_rotate 4
  @svg_transform_skew_x 5
  @svg_transform_skew_y 6

  @type_map %{
    unknown: @svg_transform_unknown,
    matrix: @svg_transform_matrix,
    translate: @svg_transform_translate,
    scale: @svg_transform_scale,
    rotate: @svg_transform_rotate,
    skew_x: @svg_transform_skew_x,
    skew_y: @svg_transform_skew_y
  }

  @type t :: %__MODULE__{
          type: atom(),
          matrix: list(),
          angle: float()
        }
end
