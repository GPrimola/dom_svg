defmodule DOM.SVG.SVGUseElement do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceSVGUseElement
  """
  use DOM.SVG
  use SVGGraphicsElement
  use SVGURIReference

  defstruct @svg_graphics_element_fields ++
              @svg_uri_reference_fields ++
              [
                :svg_graphics_element,
                :svg_uri_reference,
                :x,
                :y,
                :width,
                :height,
                :instance_root,
                :animated_instance_root
              ]

  @typep extends :: Map.merge(SVGGraphicsElement.t(), SVGURIReference.t())
  @type t ::
          Map.merge(extends(), %__MODULE__{
            x: SVGAnimatedLength.t(),
            y: SVGAnimatedLength.t(),
            width: SVGAnimatedLength.t(),
            height: SVGAnimatedLength.t(),
            instance_root: SVGElement.t(),
            animated_instance_root: SVGElement.t()
          })
end
