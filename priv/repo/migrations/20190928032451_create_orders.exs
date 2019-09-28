defmodule ScriptdropCodeSample.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :pickup_time, :utc_datetime, null: false
      add :dropoff_time, :utc_datetime, null: false
      add :completed, :boolean, default: false, null: false
      add :canceled, :boolean, default: false, null: false
      add :pharmacy_id, references(:pharmacies, on_delete: :nothing)
      add :patient_id, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:pharmacy_id])
    create index(:orders, [:patient_id])
  end
end
