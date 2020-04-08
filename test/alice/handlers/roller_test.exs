defmodule Alice.Handlers.RollerTest do
  use ExUnit.Case
  use Alice.Handlers.Case

  test "it rolls a single dice appropriately" do
    expect_response("4\n[1, 1, 1] + 1")

    fake_conn_with_capture("roll 3d1+1", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    verify!()
  end

  test "it rolls multiple dice appropriately" do
    expect_response("7\n[1, 1, 1] + 1 + [1, 1, 1]")

    fake_conn_with_capture("roll 3d1+1+3d1", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    verify!()
  end

  test "it fails gracefully" do
    expect_response("Curiouser and curiouser! I cannot make heads nor tails of that!")

    fake_conn_with_capture("roll invalid", ~r/roll (?<term>.+)/i)
    |> Alice.Handlers.Roller.roll

    verify!()
  end
end
