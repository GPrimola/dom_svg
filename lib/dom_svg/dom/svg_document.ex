defmodule DOM.SVG.SVGDocument do
  @moduledoc """
  https://svgwg.org/svg2-draft/single-page.html#struct-InterfaceDocumentExtensions
  """
  use DOM.SVG
  use DOMDocument

  @svg_public_id "-//W3C//DTD SVG 1.0//EN"
  @svg_system_id "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"

  @doc """
    https://infra.spec.whatwg.org/#svg-namespace
  """
  @svg_namespace_uri "http://www.w3.org/2000/svg"
  @svg_version "1.0"

  defstruct @dom_document_fields ++
              [
                :root_element,
                :title,
                :referrer,
                :domain,
                :active_element
              ]

  @type t ::
          Map.merge(DOMDocument.t(), %__MODULE__{
            root_element: SVGSVGElement.t(),
            title: binary(),
            referrer: binary(),
            domain: binary(),
            active_element: DOMElement.t()
          })

  def module_of(tag_name) do
    case tag_name do
      "svg" -> SVGSVGElement
      "g" -> SVGGElement
      "path" -> SVGPathElement
      "rect" -> SVGRectElement
      "circle" -> SVGCircleElement
      "ellipse" -> SVGEllipseElement
      "line" -> SVGLineElement
      "polyline" -> SVGPolylineElement
      "polygon" -> SVGPolygonElement
      "text" -> SVGTextElement
      "tspan" -> SVGTSpanElement
      "defs" -> SVGDefsElement
      "desc" -> SVGDescElement
      "title" -> SVGTitleElement
      "use" -> SVGUseElement
      _ -> SVGUnknownElement
    end
  end

  @doc """
    https://dom.spec.whatwg.org/#dom-document-createelement
  """
  @impl DOMDocument
  def create_element(document, local_name, opts \\ %{}) do
    namespace = @svg_namespace_uri
    qualified_name = local_name
    __MODULE__.create_element_ns(document, namespace, qualified_name, opts)
  end

  @doc """
    https://dom.spec.whatwg.org/#internal-createelementns-steps
  """
  @impl DOMDocument
  def create_element_ns(document, namespace, qualified_name, _opts \\ %{}) do
    {namespace, prefix, local_name} = DOMDocument.validate_and_extract(namespace, qualified_name)

    local_name
    |> SVGDocument.module_of()
    |> struct!(
      node_type: :element,
      node_name: local_name,
      tag_name: local_name,
      local_name: local_name,
      owner_document: document,
      namespace_uri: namespace,
      prefix: prefix
    )
  end
end
