defmodule CodetestWeb.CommandLive do
  use Phoenix.LiveView
  use Phoenix.HTML

  alias Codetest.Command

  def mount(_arg0, _session, socket) do
    {:ok, socket |> assign(commands: [])}
  end

  def render(assigns) do
    ~L"""

    <H1> Input </H1>

    <%= for file <- readfile()  do %>
    <div class="row">
      <div class="column"> <%= file %> </div>
    </div>
    <% end %>


    <H1> Output</H1>

      <%= for command <- read_command(readfile()) do %>
        <div class="row">
          <div class="column"> <%= command %> </div>
        </div>
      <% end %>

    </div>
    """
  end


  def handle_event("add", _ , socket) do
    {:noreply, socket}
  end
  def handle_event("clear",_, socket) do
    {:norepy, clear(socket)}
  end

  defp add do
    random_digits = Enum.random(1..1000000000000) |> to_string()
    digits = "A" <> random_digits
    [digits]
  end

  def readfile do
    {:ok, filename} = File.read("test input/testfile.txt")
    inputlist = filename |> String.split("\n")
    inputlist
  end


  def read_command(list) do

    for x <- list do
      cond do
        x == "C" -> clear(list)
        x == "A" -> add()
        x == "CS" ->  Command.checksum([1234567])
        true -> ""
      end
    end
  end

  def clear(list) do
    list = list -- Command.pop(list)
    list
  end



end
