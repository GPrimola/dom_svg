defprotocol DOM.SVG.SVGElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGElement
  """

  use DOM.SVG
  use DOMElement

  Kernel.defmacro __using__(_opts \\ []) do
    quote do
      use DOMElement
      use HTMLOrSVGElement
      use SVGElementInstance

      @svg_element_fields @dom_element_fields ++
                            @html_or_svg_fields ++
                            @svg_element_instance_fields ++
                            [
                              # :class_name,
                              :owner_svg_element,
                              :viewport_element
                            ]
    end
  end

  @typep extends ::
           Map.merge(Map.merge(DOMElement.t(), HTMLOrSVGElement.t()), SVGElementInstance.t())

  @type t ::
          Map.merge(extends(), %{
            class_name: SVGAnimatedString.t(),
            owner_svg_element: SVGSVGElement.t(),
            viewport_element: SVGElement.t()
          })
end
