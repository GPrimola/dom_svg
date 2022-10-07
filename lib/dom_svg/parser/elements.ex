defmodule DOM.SVG.Parser.Elements do
  require Logger
  use DOM.SVG

  @spec parse({binary(), any()}, SVGDocument.t()) :: SVGDocument.t()
  def parse({"#content", nil}, element), do: element

  def parse({"#content", text}, element) when is_binary(text) do
    text_element = DOMDocument.create_text_node(element.owner_document, text)

    DOMNode.append_child(element, text_element)
  end

  def parse({"#content", content}, element) do
    Enum.reduce(content, element, &parse/2)
  end

  def parse({"-" <> svg_attr, attr_value}, element),
    do: DOMElement.set_attribute(element, svg_attr, attr_value)

  def parse({tag_name, tag_content}, %SVGDocument{} = document) when is_binary(tag_content) do
    element =
      document
      |> SVGDocument.create_element(tag_name)
      |> Map.put(:node_value, tag_content)
      |> Map.put(:text_content, tag_content)

    DOMNode.append_child(document, element)
  end

  def parse({tag_name, tag_content}, %{owner_document: document} = parent_element)
      when is_binary(tag_content) do
    element = SVGDocument.create_element(document, tag_name)
    DOMNode.append_child(parent_element, %{element | node_value: tag_content})
  end

  def parse({tag_name, tag_structure}, %SVGDocument{} = document) do
    element = SVGDocument.create_element(document, tag_name)
    element = Enum.reduce(tag_structure, element, &parse/2)

    document
    |> Map.put(:document_element, element)
    |> DOMNode.append_child(element)
  end

  def parse({tag_name, tag_structure}, %{owner_document: document} = parent_element) do
    element = SVGDocument.create_element(document, tag_name)
    element = Enum.reduce(tag_structure, element, &parse/2)
    DOMNode.append_child(parent_element, element)
  end

  def parse(scructure, element) do
    Logger.error("Received #{inspect(scructure)}")
    Enum.reduce(scructure, element, &parse/2)
  end
end
