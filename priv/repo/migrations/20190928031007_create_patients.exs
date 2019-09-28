defmodule ScriptdropCodeSample.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :address1, :string
      add :address2, :string
      add :city, :string
      add :state, :string
      add :zip, :integer
      add :phone, :integer

      timestamps()
    end

    create unique_index(:patients, [:email])
  end
end
