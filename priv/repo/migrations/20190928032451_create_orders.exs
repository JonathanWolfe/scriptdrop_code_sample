defmodule ScriptdropCodeSample.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :pickup_time, :utc_datetime
      add :dropoff_time, :utc_datetime
      add :completed, :boolean, default: false, null: false
      add :canceled, :boolean, default: false, null: false
      add :courier, references(:couriers, on_delete: :nothing)
      add :pharmacy, references(:pharmacies, on_delete: :nothing)
      add :patient, references(:patients, on_delete: :nothing)

      timestamps()
    end

    create index(:orders, [:courier])
    create index(:orders, [:pharmacy])
    create index(:orders, [:patient])
  end
end
