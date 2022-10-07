defmodule DOM.SVG.SVGLength do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGLength
  """
  defstruct [:unit_type, :value, :value_specified_units, :value_as_string]

  @svg_lengthtype_unknown 0
  @svg_lengthtype_number 1
  @svg_lengthtype_percentage 2
  @svg_lengthtype_ems 3
  @svg_lengthtype_exs 4
  @svg_lengthtype_px 5
  @svg_lengthtype_cm 6
  @svg_lengthtype_mm 7
  @svg_lengthtype_in 8
  @svg_lengthtype_pt 9
  @svg_lengthtype_pc 10

  @unit_type_map %{
    unknown: @svg_lengthtype_unknown,
    "": @svg_lengthtype_number,
    %: @svg_lengthtype_percentage,
    em: @svg_lengthtype_ems,
    ex: @svg_lengthtype_exs,
    px: @svg_lengthtype_px,
    cm: @svg_lengthtype_cm,
    mm: @svg_lengthtype_mm,
    in: @svg_lengthtype_in,
    pt: @svg_lengthtype_pt,
    pc: @svg_lengthtype_pc
  }

  @type t :: %__MODULE__{
          unit_type: atom(),
          value: float(),
          value_specified_units: float(),
          value_as_string: binary()
        }

  @spec new_value_specified_units(__MODULE__.t(), atom(), float()) :: __MODULE__.t()
  def new_value_specified_units(svg_length, unit_type, value_in_specified_units), do: svg_length

  @spec convert_to_specified_units(__MODULE__.t(), atom()) :: __MODULE__.t()
  def convert_to_specified_units(svg_length, unit_type), do: svg_length
end
