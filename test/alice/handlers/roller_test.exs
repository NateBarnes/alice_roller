defmodule Alice.Handlers.RollerTest do
  use ExUnit.Case
  import Alice.Handlers.Case

  test "it rolls a single dice appropriately" do
    fake_conn_with_capture("roll 3d1+1", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    assert first_reply() == "4\n[1, 1, 1] + 1"
  end

  test "it rolls multiple dice appropriately" do
    fake_conn_with_capture("roll 3d1+1+3d1", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    assert first_reply() == "7\n[1, 1, 1] + 1 + [1, 1, 1]"
  end

  test "it fails gracefully" do
    fake_conn_with_capture("roll invalid", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    assert first_reply() == "Curiouser and curiouser! I cannot make heads nor tails of that!"
  end
end
