defmodule DOM.SVG.SVGFitToViewBox do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#types-InterfaceSVGFitToViewBox
  """
  use DOM.SVG

  defmacro __using__(_opts \\ []) do
    quote do
      @svg_fit_to_view_box_fields [
        :view_box,
        :preserve_aspect_ratio
      ]
    end
  end

  @type t :: %{
          view_box: SVGAnimatedRect.t(),
          preserve_aspect_ratio: SVGAnimatedPreserveAspectRatio.t()
        }
end
