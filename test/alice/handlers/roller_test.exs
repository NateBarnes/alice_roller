defmodule Alice.Handlers.RollerTest do
  use Alice.HandlersCase, handlers: Alice.Handlers.Roller

  test "it rolls a single dice appropriately" do
    send_message("roll 3d1+1")

    assert first_reply() == "4\n[1, 1, 1] + 1"
  end

  test "it rolls multiple dice appropriately" do
    send_message("roll 3d1+1+3d1")

    assert first_reply() == "7\n[1, 1, 1] + 1 + [1, 1, 1]"
  end

  test "it fails gracefully" do
    send_message("roll invalid")

    assert first_reply() == "Curiouser and curiouser! I cannot make heads nor tails of that!"
  end
end
