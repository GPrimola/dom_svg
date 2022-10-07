defmodule DOM.SVG.Grammar.Common do
  @moduledoc """
    This module contains common grammar to be used by all SVG Grammars

    The EBNF Grammar that describe the rules defined here is:

    ```
      comma_wsp ::= ',' wsp* | wsp+ ','? wsp*
      wsp ::= ' ' | '\f' | '\n' | '\t' | '\r'
    ```
  """
  import NimbleParsec

  def wsp do
    [
      string(" "),
      string("\t"),
      string("\n"),
      string("\r"),
      string("\f")
    ]
    |> choice()
    |> ignore()
  end

  def comma_wsp do
    choice([
      string(",")
      |> repeat(wsp()),
      wsp()
      |> repeat(wsp())
      |> optional(string(","))
      |> repeat(wsp())
    ])
    |> ignore()
  end
end
