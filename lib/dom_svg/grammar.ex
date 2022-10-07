defmodule DOM.SVG.Grammar do
  @moduledoc """
    This module aggregates and exports parsers for SVG elements and attributes.
    Check specific modules for details.
  """
  import NimbleParsec
  import DOM.SVG.Grammar.{Numbers, Path, Transforms, ViewBox}

  defparsec(:parse_path_attr_d, svg_path())
  defparsec(:parse_attr_point, list_of_points())
  defparsec(:parse_attr_view_box, view_box())
  defparsec(:parse_attr_transform, transforms())
  defparsec(:parse_number, numbers())
end
