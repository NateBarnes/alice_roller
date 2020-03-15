defmodule Alice.Handlers.RollerTest do
  use ExUnit.Case

  alias Alice.Conn

  def conn_with_text(text) do
    Conn.make(%{text: text}, %{})
  end

  test "it rolls dice appropriately" do
    result =
      "roll 3d1+1"
      |> conn_with_text
      |> Conn.add_captures(~r/roll (?<term>.+)/i)
      |> Alice.Handlers.Roller.generate_roll_response

    assert result == 4
  end
end
