defmodule ScriptdropCodeSample.Accounts.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :address1, :string
    field :address2, :string
    field :city, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :phone, :integer
    field :state, :string
    field :zip, :integer

    timestamps()
  end

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [
      :email,
      :first_name,
      :last_name,
      :address1,
      :address2,
      :city,
      :state,
      :zip,
      :phone
    ])
    |> validate_required([:email, :first_name, :last_name, :address1, :city, :state, :zip, :phone])
    |> unique_constraint(:email)
  end
end
