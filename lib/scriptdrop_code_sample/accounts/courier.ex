defmodule ScriptdropCodeSample.Accounts.Courier do
  use Ecto.Schema
  import Ecto.Changeset

  schema "couriers" do
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :display_name, :string
    field :email, :string
    field :phone, :integer
    field :state, :string
    field :zip, :integer

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:email, :display_name, :address1, :address2, :city, :state, :zip, :phone])
    |> validate_required([:email, :display_name, :address1, :city, :state, :zip, :phone])
    |> unique_constraint(:email)
  end
end
