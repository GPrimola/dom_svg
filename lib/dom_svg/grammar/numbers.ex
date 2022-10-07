defmodule DOM.SVG.Grammar.Numbers do
  @moduledoc """
    This module contains the SVG number grammar

    The EBNF Grammar that describe the rules defined here is:

    ```
      numbers ::= sign? ( floating_point_constant | integer_constant )
      floating_point_constant ::= fractional_constant expoent? | digit_sequence expoent
      integer_constant ::= digit_sequence
      fractional_constant ::= '.' digit_sequence | digit_sequence '.' digit_sequence | digit_sequence '.'
      expoent ::= ( 'e' | 'E' ) sign? digit_sequence
      digit_sequence ::= digit digit*
      sign ::= '+' | '-'
      digit ::= '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '0'
    ```
  """
  import NimbleParsec

  def parse(number) do
    case Integer.parse(number) do
      {int_num, ""} ->
        int_num

      _ ->
        number
        |> Float.parse()
        |> elem(0)
    end
  end

  digit =
    [
      string("0"),
      string("1"),
      string("2"),
      string("3"),
      string("4"),
      string("5"),
      string("6"),
      string("7"),
      string("8"),
      string("9")
    ]
    |> choice()

  digit_sequence =
    digit
    |> repeat(digit)

  @sign choice([string("+"), string("-")])

  expoent =
    choice([
      string("e"),
      string("E")
    ])
    |> optional(@sign)
    |> concat(digit_sequence)

  fractional_constant =
    choice([
      string(".")
      |> replace("0.")
      |> concat(digit_sequence),
      digit_sequence
      |> string(".")
      |> concat(digit_sequence),
      digit_sequence
      |> string(".")
    ])

  @floating_point_constant choice([
                             fractional_constant
                             |> optional(expoent),
                             digit_sequence
                             |> concat(expoent)
                           ])

  @integer_constant digit_sequence

  def numbers do
    optional(@sign)
    |> choice([@floating_point_constant, @integer_constant])
    |> reduce({Enum, :join, [""]})
    |> map(:parse)
  end
end
