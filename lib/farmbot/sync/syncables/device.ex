defmodule Device do
  @moduledoc """
    Device Object
  """
  defstruct [
    id: nil,
    planting_area_id: nil,
    name: nil,
    webcam_url: nil]
 @type t :: %__MODULE__{
   id: integer,
   planting_area_id: integer,
   name: String.t,
   webcam_url: String.t}

  @spec create(map) :: {:ok, t} | {atom, :malformed}
  def create(%{
    "id" => id,
    "planting_area_id" => paid,
    "name" => name,
    "webcam_url" => wcu})
    when is_integer(id)
     and (is_integer(paid) or is_nil(paid))
     and (is_bitstring(wcu) or is_nil(wcu))
     and is_bitstring(name)
    do
      f =
      %Device{
        id: id,
        planting_area_id: paid,
        name: name,
        webcam_url: wcu}
      {:ok, f}
  end
  def create(_), do: {__MODULE__, :malformed}

  @spec create!(map) :: t
  def create!(thing) do
    case create(thing) do
      {:ok, success} -> success
      {__MODULE__, :malformed} -> raise "Malformed #{__MODULE__} Object"
    end
  end
end
