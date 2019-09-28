defmodule ScriptdropCodeSample.Repo.Migrations.CreateCouriers do
  use Ecto.Migration

  def change do
    create table(:couriers) do
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

    create unique_index(:couriers, [:email])
  end
end
