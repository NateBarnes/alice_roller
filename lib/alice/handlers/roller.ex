defmodule Alice.Handlers.Roller do
  use Alice.Router

  command ~r/roll (?<term>.+)/i, :roll
  route   ~r/^(alice )?roll (?<term>.+)/i, :roll

  @doc "`roll 3d6kh2+1` - rolls 3d6s, keeps the highest 2 and adds 1"
  def roll(conn) do
    conn
    |> generate_roll_response
    |> reply(conn)
  end

  defp generate_roll_response(conn) do
    conn
    |> Alice.Conn.last_capture
    |> convert_a_to_one
    |> HighRoller.Parser.parse_with_results
    |> convert_roll_parse_to_message
  end

  defp convert_a_to_one(message) do
    Regex.replace(~r/a /i, message, "1")
  end

  defp convert_roll_parse_to_message(:error), do: "Curiouser and curiouser! I cannot make heads nor tails of that!"
  defp convert_roll_parse_to_message(%{total: total, full_results: results}) do
    results_string =
      results
      |> Enum.map(fn
        x when is_bitstring(x) -> x
        x -> Kernel.inspect(x, charlists: :as_lists)
      end)
      |> Enum.join(" ")

    "#{total}\n#{results_string}"
  end
end
