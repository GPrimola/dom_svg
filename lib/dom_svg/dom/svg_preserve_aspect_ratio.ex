defmodule DOM.SVG.SVGPreserveAspectRatio do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#coords-InterfaceSVGPreserveAspectRatio
  """
  defstruct [:align, :meet_or_slice]

  # Alignment Types
  @svg_preserveaspectratio_unknown 0
  @svg_preserveaspectratio_none 1
  @svg_preserveaspectratio_xminymin 2
  @svg_preserveaspectratio_xmidymin 3
  @svg_preserveaspectratio_xmaxymin 4
  @svg_preserveaspectratio_xminymid 5
  @svg_preserveaspectratio_xmidymid 6
  @svg_preserveaspectratio_xmaxymid 7
  @svg_preserveaspectratio_xminymax 8
  @svg_preserveaspectratio_xmidymax 9
  @svg_preserveaspectratio_xmaxymax 10

  # Meet-or-slice Types
  @svg_meetorslice_unknown 0
  @svg_meetorslice_meet 1
  @svg_meetorslice_slice 2

  @align_types_map %{
    unknown: @svg_preserveaspectratio_unknown,
    none: @svg_preserveaspectratio_none,
    x_min_y_min: @svg_preserveaspectratio_xminymin,
    x_mid_y_min: @svg_preserveaspectratio_xmidymin,
    x_max_y_min: @svg_preserveaspectratio_xmaxymin,
    x_min_y_mid: @svg_preserveaspectratio_xminymid,
    x_mid_y_mid: @svg_preserveaspectratio_xmidymid,
    x_max_y_mid: @svg_preserveaspectratio_xmaxymid,
    x_min_y_max: @svg_preserveaspectratio_xminymax,
    x_mid_y_max: @svg_preserveaspectratio_xmidymax,
    x_max_y_max: @svg_preserveaspectratio_xmaxymax
  }

  @meet_or_slice_type_map %{
    unknown: @svg_meetorslice_unknown,
    meet: @svg_meetorslice_meet,
    slice: @svg_meetorslice_slice
  }

  @type t :: %__MODULE__{
          align: integer(),
          meet_or_slice: integer()
        }
end
