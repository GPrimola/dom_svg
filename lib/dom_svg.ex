defmodule DOM.SVG do
  defmacro __using__(_opts \\ []) do
    quote do
      use DOM
      import unquote(__MODULE__)

      alias DOM.SVG.{
        HTMLOrSVGElement,
        SVGAElement,
        SVGAngle,
        SVGAnimatedAngle,
        SVGAnimatedEnumeration,
        SVGAnimatedNumber,
        SVGAnimatedPreserveAspectRatio,
        SVGAnimatedString,
        SVGCircleElement,
        SVGDefsElement,
        SVGDescElement,
        SVGDocument,
        SVGElement,
        SVGElementInstance,
        SVGEllipseElement,
        SVGFitToViewBox,
        SVGForeignObjectElement,
        SVGGElement,
        SVGGeometryElement,
        SVGGradientElement,
        SVGGraphicsElement,
        SVGImageElement,
        SVGLength,
        SVGLineElement,
        SVGLinearGradientElement,
        SVGMarkerElement,
        SVGMetadataElement,
        SVGNumber,
        SVGPathElement,
        SVGPatternElement,
        SVGPolylineElement,
        SVGPolygonElement,
        SVGPreserveAspectRatio,
        SVGRadialGradientElement,
        SVGRectElement,
        SVGScriptElement,
        SVGStopElement,
        SVGSVGElement,
        SVGSwitchElement,
        SVGSymbolElement,
        SVGTextElement,
        SVGTextContentElement,
        SVGTextPositioningElement,
        SVGTitleElement,
        SVGTSpanElement,
        SVGTransform,
        SVGUnknownElement,
        SVGUseElement,
        SVGURIReference,
        SVGViewElement
      }
    end
  end
end
