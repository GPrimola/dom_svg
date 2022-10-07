defmodule DOM.SVG.SVGTextPathElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#text-InterfaceSVGTextPathElement
  """
  use DOM.SVG

  defstruct [
    :svg_text_content_element,
    :start_offset,
    :method,
    :spacing
  ]

  @type t :: %__MODULE__{
          svg_text_content_element: SVGTextContentElement.t(),
          start_offset: SVGAnimatedLength.t(),
          method: SVGAnimatedEnumeration.t(),
          spacing: SVGAnimatedEnumeration.t()
        }

  # textPath Method Types
  @text_path_method_type_unknown 0
  @text_path_method_type_align 1
  @text_path_method_type_stretch 2

  # textPath Spacing Types
  @text_path_spacing_type_unknown 0
  @text_path_spacing_type_auto 1
  @text_path_spacing_type_exact 2

  @text_path_method_type_map %{
    unknown: @text_path_method_type_unknown,
    align: @text_path_method_type_align,
    stretch: @text_path_method_type_stretch
  }
  @text_path_spacing_type_map %{
    unknown: @text_path_spacing_type_unknown,
    auto: @text_path_spacing_type_auto,
    exact: @text_path_spacing_type_exact
  }
end
