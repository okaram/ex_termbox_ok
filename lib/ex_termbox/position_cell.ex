defmodule ExTermbox do
  defmodule Position do
    @moduledoc """
    Represents a position on the screen by encoding a pair of cartesian
    coordinates. The origin is the top-left-most character on the screen
    `(0, 0)`, while x and y increase from left to right and top to bottom,
    respectively.
    """

    alias __MODULE__, as: Position

    @enforce_keys [:x, :y]
    defstruct [:x, :y]

    @type t :: %__MODULE__{x: non_neg_integer, y: non_neg_integer}

    @doc """
    Translates (shifts) a position by some delta x and y.

    Returns a new `%Position{}`.

    ## Examples

        iex> translate(%Position{x: 0, y: 0}, 1, 2)
        %Position{x: 1, y: 2}
        iex> translate(%Position{x: 10, y: 0}, -1, 0)
        %Position{x: 9, y: 0}

    """
    @spec translate(t, integer, integer) :: t
    def translate(%Position{x: x, y: y}, dx, dy),
      do: %Position{x: x + dx, y: y + dy}

    @doc """
    Translates a position by a delta x.

    Returns a new `%Position{}`.

    ## Examples

        iex> translate_x(%Position{x: 0, y: 0}, 2)
        %Position{x: 2, y: 0}
        iex> translate_x(%Position{x: 2, y: 0}, -1)
        %Position{x: 1, y: 0}

    """
    @spec translate_x(t, integer) :: t
    def translate_x(%Position{} = pos, dx), do: translate(pos, dx, 0)

    @doc """
    Translates a position by a delta y.

    Returns a new `%Position{}`.

    ## Examples

        iex> translate_y(%Position{x: 0, y: 0}, 2)
        %Position{x: 0, y: 2}
        iex> translate_y(%Position{x: 0, y: 2}, -1)
        %Position{x: 0, y: 1}

    """
    @spec translate_y(t, integer) :: t
    def translate_y(%Position{} = pos, dy), do: translate(pos, 0, dy)
  end


  defmodule Cell do
    @moduledoc """
    Represents a termbox cell, a character at a position, along with the cell's
    background and foreground colors.
    """

    alias __MODULE__, as: Cell
    alias ExTermbox.{Constants, Position}

    @type t :: %__MODULE__{
            position: Position.t(),
            ch: non_neg_integer()
          }

    @enforce_keys [:position, :ch]
    defstruct position: nil,
              ch: nil,
              bg: Constants.colors().default,
              fg: Constants.colors().default

    def empty do
      %Cell{position: nil, ch: nil}
    end
  end

end
