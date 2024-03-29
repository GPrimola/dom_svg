defmodule DOM.SVG.Parser do
  alias DOM.DOMNode
  alias DOM.SVG.SVGDocument

  @spec parse(list()) :: SVGDocument.t()
  def parse(svg_doc_xml) do
    svg_document = %SVGDocument{
      node_type: :document,
      node_name: "#document"
    }

    svg_document =
      svg_doc_xml
      |> Enum.reduce(svg_document, &DOM.SVG.Parser.Elements.parse/2)

    DOMNode.set_owner_document(svg_document, svg_document)
  end
end
