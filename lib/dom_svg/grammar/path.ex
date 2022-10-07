defmodule DOM.SVG.Grammar.Path do
  @moduledoc """
    This module contains rules for path's SVG grammar data defined in
    https://svgwg.org/svg2-draft/single-page.html#paths-PathDataBNF

    The EBNF Grammar that describe the rules defined here is:

    ```
      svg_path ::= wsp* ( moveto wsp* drawto_command* )? moveto?
      list_of_points ::= wsp* coordinate_pair_sequence wsp*
      drawto_command ::= wsp* ( moveto | closepath | lineto | horizontal_lineto | vertical_lineto | curveto | smooth_curveto | quadratic_bezier_curveto | smooth_quadratic_bezier_curveto | elliptical_arc )
      moveto ::= ( 'm' | 'M' ) wsp* coordinate_pair_sequence
      closepath ::= 'z' | 'Z'
      lineto ::= ( 'l' | 'L' ) wsp* coordinate_pair_sequence
      horizontal_lineto ::= ( 'h' | 'H' ) wsp* coordinate_sequence
      vertical_lineto ::= ( 'v' | 'V' ) wsp* coordinate_sequence
      curveto ::= ( 'c' | 'C' ) wsp* curveto_coordinate_sequence
      curveto_coordinate_sequence ::= coordinate_pair_triplet ( comma_wsp? coordinate_pair_triplet )*
      smooth_curveto ::= ( 's' | 'S' ) wsp* smooth_curveto_coordinate_sequence
      smooth_curveto_coordinate_sequence ::= coordinate_pair_double ( comma_wsp? coordinate_pair_double )*
      quadratic_bezier_curveto ::= ( 'q' | 'Q' ) wsp* quadratic_bezier_curveto_coordinate_sequence
      quadratic_bezier_curveto_coordinate_sequence ::= coordinate_pair_double ( comma_wsp? coordinate_pair_double )*
      smooth_quadratic_bezier_curveto ::= ( 't' | 'T' ) wsp* coordinate_pair_sequence
      elliptical_arc ::= ( 'a' | 'A' ) wsp* elliptical_arc_argument_sequence
      elliptical_arc_argument_sequence ::= elliptical_arc_argument ( comma_wsp? elliptical_arc_argument )*
      elliptical_arc_argument ::= number comma_wsp? number comma_wsp? number comma_wsp? large_arc_flag comma_wsp? sweep_flag comma_wsp? coordinate_pair
      large_arc_flag ::= '0' | '1'
      sweep_flag ::= '0' | '1'
      coordinate ::= numbers
      number ::= numbers
      coordinate_sequence ::= coordinate ( comma_wsp? coordinate )*
      coordinate_pair ::= coordinate comma_wsp? coordinate
      coordinate_pair_sequence ::= coordinate_pair ( comma_wsp? coordinate_pair )*
      coordinate_pair_triplet ::= coordinate_pair comma_wsp? coordinate_pair comma_wsp? coordinate_pair
      coordinate_pair_double ::= coordinate_pair comma_wsp? coordinate_pair
    ```
  """
  import NimbleParsec
  import DOM.SVG.Grammar.{Common, Numbers}

  coordinate = numbers()
  number = numbers()

  coordinate_sequence =
    coordinate
    |> repeat(optional(comma_wsp()) |> concat(coordinate))

  coordinate_pair =
    coordinate
    |> optional(comma_wsp())
    |> concat(coordinate)
    |> reduce({Enum, :into, [[]]})

  @coordinate_pair_sequence coordinate_pair
                            |> repeat(optional(comma_wsp()) |> concat(coordinate_pair))

  coordinate_pair_triplet =
    coordinate_pair
    |> optional(comma_wsp())
    |> concat(coordinate_pair)
    |> optional(comma_wsp())
    |> concat(coordinate_pair)
    |> reduce({Enum, :into, [[]]})

  coordinate_pair_double =
    coordinate_pair
    |> optional(comma_wsp())
    |> concat(coordinate_pair)
    |> reduce({Enum, :into, [[]]})

  large_arg_flag = choice([string("0"), string("1")])
  sweep_flag = choice([string("0"), string("1")])

  elliptical_arc_argument =
    number
    |> optional(comma_wsp())
    |> concat(number)
    |> optional(comma_wsp())
    |> concat(number)
    |> concat(comma_wsp())
    |> concat(large_arg_flag)
    |> optional(comma_wsp())
    |> concat(sweep_flag)
    |> optional(comma_wsp())
    |> concat(coordinate_pair)
    |> reduce({Enum, :into, [[]]})

  elliptical_arc_argument_sequence =
    elliptical_arc_argument
    |> repeat(optional(comma_wsp()) |> concat(elliptical_arc_argument))

  elliptical_arc =
    choice([string("a"), string("A")])
    |> repeat(wsp())
    |> concat(elliptical_arc_argument_sequence)
    |> tag(:e_arc)

  smooth_quadratic_bezier_curveto =
    choice([string("t"), string("T")])
    |> repeat(wsp())
    |> concat(@coordinate_pair_sequence)
    |> tag(:t_curveto)

  quadratic_bezier_curveto_coordinate_sequence =
    coordinate_pair_double
    |> repeat(optional(comma_wsp()) |> concat(coordinate_pair_double))

  quadratic_bezier_curveto =
    choice([string("q"), string("Q")])
    |> repeat(wsp())
    |> concat(quadratic_bezier_curveto_coordinate_sequence)
    |> tag(:q_curveto)

  smooth_curveto_coordinate_sequence =
    coordinate_pair_double
    |> repeat(optional(comma_wsp()) |> concat(coordinate_pair_double))

  smooth_curveto =
    choice([string("s"), string("S")])
    |> repeat(wsp())
    |> concat(smooth_curveto_coordinate_sequence)
    |> tag(:s_curveto)

  curveto_coordinate_sequence =
    coordinate_pair_triplet
    |> repeat(optional(comma_wsp()) |> concat(coordinate_pair_triplet))

  curveto =
    choice([string("c"), string("C")])
    |> repeat(wsp())
    |> concat(curveto_coordinate_sequence)
    |> tag(:curveto)

  @moveto choice([string("m"), string("M")])
          |> repeat(wsp())
          |> concat(@coordinate_pair_sequence)
          |> tag(:moveto)

  lineto =
    choice([string("l"), string("L")])
    |> repeat(wsp())
    |> concat(@coordinate_pair_sequence)
    |> tag(:lineto)

  horizontal_lineto =
    choice([string("h"), string("H")])
    |> repeat(wsp())
    |> concat(coordinate_sequence)
    |> tag(:h_lineto)

  vertical_lineto =
    choice([string("v"), string("V")])
    |> repeat(wsp())
    |> concat(coordinate_sequence)
    |> tag(:v_lineto)

  closepath =
    choice([string("z"), string("Z")])
    |> tag(:closepath)

  @drawto_command repeat(wsp())
                  |> choice([
                    @moveto,
                    closepath,
                    lineto,
                    horizontal_lineto,
                    vertical_lineto,
                    curveto,
                    smooth_curveto,
                    quadratic_bezier_curveto,
                    smooth_quadratic_bezier_curveto,
                    elliptical_arc
                  ])

  def list_of_points do
    repeat(wsp())
    |> optional(@coordinate_pair_sequence)
    |> repeat(wsp())
  end

  def svg_path do
    repeat(wsp())
    |> optional(@moveto |> repeat(wsp()) |> repeat(@drawto_command))
    |> optional(@moveto)
  end
end
