defmodule ScriptdropCodeSample.Repo.Migrations.CouriersPharmaciesRelationship do
  use Ecto.Migration

  def change do
    create table(:couriers_pharmacies) do
      add :courier_id, references(:couriers)
      add :pharmacy_id, references(:pharmacies)
    end

    create unique_index(:couriers_pharmacies, [:courier_id, :pharmacy_id])
  end
end
