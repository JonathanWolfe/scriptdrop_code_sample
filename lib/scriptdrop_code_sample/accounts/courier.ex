defmodule ScriptdropCodeSample.Accounts.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  alias ScriptdropCodeSample.Accounts.Pharmacy

  schema "couriers" do
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :display_name, :string
    field :email, :string
    field :phone, :string
    field :state, :string
    field :zip, :string

    many_to_many :pharmacies, Pharmacy, join_through: "couriers_pharmacies"

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:email, :display_name, :address1, :address2, :city, :state, :zip, :phone])
    |> validate_required([:email, :display_name, :address1, :city, :state, :zip, :phone],
      trim: true
    )
    |> unique_constraint(:email)
  end
end
