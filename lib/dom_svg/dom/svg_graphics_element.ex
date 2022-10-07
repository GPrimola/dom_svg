defprotocol DOM.SVG.SVGGraphicsElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGGraphicsElement
  """
  use DOM.SVG

  Kernel.defmacro __using__(_opts \\ []) do
    quote do
      use SVGElement
      @svg_graphics_element_fields @svg_element_fields ++ [:transform]
    end
  end

  @type t ::
          Map.merge(SVGElement.t(), %{
            transform: list(SVGAnimatedTransform.t())
          })

  @svg_bounding_box_options %{
    fill: true,
    stroke: false,
    markers: false,
    clipped: false
  }

  @spec get_b_box(t(), map()) :: DOMRect.t()
  def get_b_box(svg_graphics_element, opts \\ @svg_bounding_box_options)

  @spec get_ctm(t()) :: DOMMatrix.t()
  def get_ctm(svg_graphics_element)

  @spec get_screen_ctm(t()) :: DOMMatrix.t()
  def get_screen_ctm(svg_graphics_element)
end
