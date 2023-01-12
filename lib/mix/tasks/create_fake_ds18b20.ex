defmodule Mix.Tasks.CreateFakeDs18b20 do
  @moduledoc """
  `mix create_fake_ds198b20` to create a file in your project
  `fake/ds18b20/28-device/w1slave` also a
  `fake/ds18b20/28-device/.gitignore` that ignores the file

  This will create a file purposting to show a temperature of 12.457 degrees C. You can fiddle with that file
  to make other temperatures.

  """

  @shortdoc "Create a file for host development showing a fake temperature"

  use Mix.Task

  alias Ds18b20.TemperatureServer

  @file_content """
  c7 00 4b 46 7f ff 0c 10 c3 : crc=c3 YES
  c7 00 4b 46 7f ff 0c 10 c3 t=12567
  """

  def run(_args) do
    base = TemperatureServer.devices_base()
    dir = base |> Path.join("28-device") |> Path.expand()

    Mix.shell().info("Creating fake ds18b20 file under #{dir}")

    File.mkdir_p!(dir)

    dir
    |> Path.join(".gitignore")
    |> File.write!("w1_slave\n")

    dir
    |> Path.join("w1_slave")
    |> File.write!(@file_content)
  end
end
