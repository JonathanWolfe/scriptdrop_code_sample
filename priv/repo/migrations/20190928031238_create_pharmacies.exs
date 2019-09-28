defmodule ScriptdropCodeSample.Repo.Migrations.CreatePharmacies do
  use Ecto.Migration

  def change do
    create table(:pharmacies) do
      add :email, :string
      add :display_name, :string
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :state, :string
      add :zip, :integer
      add :phone, :integer

      timestamps()
    end

    create unique_index(:pharmacies, [:email])
  end
end
