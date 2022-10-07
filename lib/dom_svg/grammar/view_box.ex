defmodule DOM.SVG.Grammar.ViewBox do
  @moduledoc """
    This module defines the grammar for SVG attribute viewBox
    Check the official grammar here: https://svgwg.org/svg2-draft/single-page.html#coords-ViewBoxAttribute

    The EBNF Grammar that describe the rules defined here is:

    ```
    view_box ::= wsp* coordinate_pair_double wsp*
    coordinate_pair_double ::= coordinate_pair comma_wsp? coordinate_pair
    coordinate_pair ::= coordinate comma_wsp? coordinate
    number ::= numbers
    ```
  """
  import NimbleParsec
  import DOM.SVG.Grammar.{Common, Numbers}

  number = numbers()

  coordinate_pair =
    number
    |> optional(comma_wsp())
    |> concat(number)
    |> reduce({Enum, :into, [[]]})

  @coordinate_pair_double coordinate_pair
                          |> optional(comma_wsp())
                          |> concat(coordinate_pair)
                          |> reduce({Enum, :into, [[]]})

  def view_box do
    repeat(wsp())
    |> concat(@coordinate_pair_double)
    |> repeat(wsp())
  end
end
