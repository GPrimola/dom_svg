defmodule DOM.SVG.SVGTextContentElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#text-InterfaceSVGTextContentElement
  """
  use DOM.SVG

  defmacro __using__(_opts \\ []) do
    quote do
      use SVGGraphicsElement

      @svg_text_content_element_fields @svg_graphics_element_fields ++
                                         [
                                           :text_length,
                                           :length_adjust
                                         ]

      # lengthAdjust Types
      @length_adjust_unknown 0
      @length_adjust_spacing 1
      @length_adjust_spacing_and_glyphs 2

      @length_adjust_type_map %{
        unknown: @length_adjust_unknown,
        spacing: @length_adjust_spacing,
        spacing_and_glyphs: @length_adjust_spacing_and_glyphs
      }
    end
  end

  @type t ::
          Map.merge(SVGGraphicsElement.t(), %{
            text_length: SVGAnimatedLength.t(),
            length_adjust: SVGAnimatedEnumeration.t()
          })
end
