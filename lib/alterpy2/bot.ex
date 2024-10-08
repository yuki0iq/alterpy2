defmodule Alterpy2.Bot do
  @bot :alterpy2

  use ExGram.Bot,
    name: @bot,
    setup_commands: true

  middleware(ExGram.Middleware.IgnoreUsername)

  def bot(), do: @bot

  def handle({:command, command_atom, message}, context) when message.from.id == 552_514_677 do
    answer(context, "recv'd command as atom #{inspect(command_atom)}")
  end

  def handle({:text, text, message}, context) when message.from.id == 552_514_677 do
    answer(context, "recv'd message #{text}")
  end

  # catch-all nonsense
  def handle(_message, _context) do
    :ignore
  end
end
