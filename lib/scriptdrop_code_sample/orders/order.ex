defmodule ScriptdropCodeSample.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  alias ScriptdropCodeSample.Accounts.Pharmacy
  alias ScriptdropCodeSample.Accounts.Patient

  schema "orders" do
    field :canceled, :boolean, default: false
    field :completed, :boolean, default: false
    field :dropoff_time, :utc_datetime
    field :pickup_time, :utc_datetime

    belongs_to :pharmacy, Pharmacy
    belongs_to :patient, Patient

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:pickup_time, :dropoff_time, :completed, :canceled])
    |> validate_required([:pickup_time, :dropoff_time, :completed, :canceled])
  end
end
