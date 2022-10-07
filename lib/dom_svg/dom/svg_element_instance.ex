defprotocol DOM.SVG.SVGElementInstance do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGElementInstance
  """
  use DOM.SVG

  Kernel.defmacro __using__(_opts \\ []) do
    quote do
      @svg_element_instance_fields [:corresponding_element, :corresponding_use_element]
    end
  end

  @type t :: %{
          corresponding_element: SVGElement.t(),
          corresponding_use_element: SVGUseElement.t()
        }
end
