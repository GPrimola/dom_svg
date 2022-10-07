defmodule DOM.SVG.Grammar.Transforms do
  @moduledoc """
    This module defines the grammar for SVG transforms
    Check the official grammar here: https://www.w3.org/TR/css-transforms-1/#svg-syntax

    The EBNF Grammar that describe the rules defined here is:

    ```
    transforms ::= wsp* transform_sequence? wsp*
    transform_sequence ::= transform ( comma_wsp* transform )*
    transform ::= matrix | translate | scale | rotate | skew_x | skew_y
    matrix ::= 'matrix' wsp* '(' wsp* number comma_wsp? number comma_wsp? number comma_wsp? number comma_wsp? number comma_wsp? number wsp* ')'
    translate ::= 'translate' wsp* '(' wsp* number ( comma_wsp? number )? wsp* ')'
    scale ::= 'scale' wsp* '(' wsp* number ( comma_wsp? number )? wsp* ')'
    rotate ::= 'rotate' wsp* '(' wsp* number ( comma_wsp? number comma_wsp? number )? wsp* ')'
    skew_x ::= 'skewX' wsp* '(' wsp* number wsp* ')'
    skew_y ::= 'skewY' wsp* '(' wsp* number wsp* ')'
    number ::= numbers
    ```
  """
  import NimbleParsec
  import DOM.SVG.Grammar.{Common, Numbers}

  number = numbers()

  skew_y =
    ignore(string("skewY"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> repeat(wsp())
    |> ignore(string(")"))
    |> tag(:skew_y)

  skew_x =
    ignore(string("skewX"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> repeat(wsp())
    |> ignore(string(")"))
    |> tag(:skew_x)

  rotate =
    ignore(string("rotate"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> optional(
      optional(comma_wsp())
      |> concat(number)
      |> optional(comma_wsp())
      |> concat(number)
    )
    |> repeat(wsp())
    |> ignore(string(")"))
    |> tag(:rotate)

  scale =
    ignore(string("scale"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> optional(optional(comma_wsp()) |> concat(number))
    |> repeat(wsp())
    |> ignore(string(")"))
    |> tag(:scale)

  translate =
    ignore(string("translate"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> optional(optional(comma_wsp()) |> concat(number))
    |> repeat(wsp())
    |> ignore(string(")"))
    |> tag(:translate)

  matrix =
    ignore(string("matrix"))
    |> repeat(wsp())
    |> ignore(string("("))
    |> repeat(wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> repeat(wsp())
    |> ignore(string(")"))

  transform =
    [
      matrix,
      translate,
      scale,
      rotate,
      skew_x,
      skew_y
    ]
    |> choice()

  @transform_sequence transform
                      |> repeat(repeat(comma_wsp()) |> concat(transform))

  def transforms do
    repeat(wsp())
    |> optional(@transform_sequence)
    |> repeat(wsp())
  end
end
