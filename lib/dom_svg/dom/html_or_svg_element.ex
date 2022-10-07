defprotocol DOM.SVG.HTMLOrSVGElement do
  Kernel.defmacro __using__(_opts \\ []) do
    quote do
      @html_or_svg_fields [
        :dataset,
        :nonce,
        :autofocus,
        tab_index: 0
      ]
    end
  end

  @type t :: %{
          dataset: map(),
          nonce: binary(),
          autofocus: boolean(),
          tab_index: integer()
        }

  @spec focus(t(), opts :: map()) :: t()
  def focus(html_or_svg_element, opts \\ %{})

  @spec blur(t()) :: t()
  def blur(html_or_svg_element)
end
