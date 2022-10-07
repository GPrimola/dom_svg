defmodule DOM.SVG.Parser do
  alias DOM.SVG.SVGDocument

  @spec parse(list()) :: SVGDocument.t()
  def parse(svg_doc_xml) do
    svg_document = %SVGDocument{
      node_type: :document,
      node_name: "#document"
    }

    Enum.reduce(svg_doc_xml, svg_document, &DOM.SVG.Parser.Elements.parse/2)
  end
end
