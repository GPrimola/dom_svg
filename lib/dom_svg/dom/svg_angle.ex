defmodule DOM.SVG.SVGAngle do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGAngle
  """
  defstruct [
    :unit_type,
    :value,
    :value_in_specified_units,
    :value_as_string
  ]

  # Angle Unit Types
  @svg_angletype_unknown 0
  @svg_angletype_unspecified 1
  @svg_angletype_deg 2
  @svg_angletype_rad 3
  @svg_angletype_grad 4

  @unit_type_map %{
    unknown: @svg_angletype_unknown,
    "": @svg_angletype_unspecified,
    deg: @svg_angletype_deg,
    rad: @svg_angletype_rad,
    grad: @svg_angletype_grad
  }

  @type t :: %__MODULE__{
          unit_type: atom(),
          value: float(),
          value_in_specified_units: float(),
          value_as_string: binary()
        }

  @spec new_value_specified_units(__MODULE__.t(), atom(), float()) :: __MODULE__.t()
  def new_value_specified_units(svg_length, unit_type, value_in_specified_units), do: svg_length

  @spec convert_to_specified_units(__MODULE__.t(), atom()) :: __MODULE__.t()
  def convert_to_specified_units(svg_length, unit_type), do: svg_length
end
