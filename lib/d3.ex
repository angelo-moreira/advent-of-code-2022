defmodule D3 do
  @moduledoc false

  Enum.with_index('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', 1)
  |> Enum.each(fn {key, priority} ->
    def priority(unquote(key)), do: unquote(priority)
  end)

  defp file_to_list(file) do
    file
    |> File.stream!(
      line_or_bytes: :line,
      trim: true,
      modes: [:raw, :raw_ahead, :trim_bom]
    )
    |> Stream.map(&String.trim/1)
    |> Enum.take_every(1)
  end

  def part1(file) do
    file
    |> file_to_list()
    |> Enum.map(&split_list/1)
    |> Enum.map(&common_char/1)
    |> Enum.reduce(0, fn char, acc ->
      acc + priority(char)
    end)
  end

  def split_list(str) do
    charlist = String.to_charlist(str)

    half =
      charlist
      |> length()
      |> div(2)
      |> trunc()

    Enum.split(charlist, half)
  end

  def common_char({first, second}) do
    [char] =
      MapSet.new(first)
      |> MapSet.intersection(MapSet.new(second))
      |> MapSet.to_list()

    char
  end
end
