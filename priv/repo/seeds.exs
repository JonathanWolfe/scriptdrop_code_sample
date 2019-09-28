# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

pharmacy1 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Pharmacy{
    id: 1,
    email: "betterrx@betterrx.com",
    display_name: "BetterRX",
    address1: "1275 Kinnear Road",
    address2: nil,
    city: "Columbus",
    state: "OH",
    zip: "43212",
    phone: "555-555-5555",
    couriers: []
    # orders: []
  })

pharmacy2 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Pharmacy{
    id: 2,
    email: "bestrx@bestrx.net",
    display_name: "BestRx",
    address1: "123 Austin St",
    address2: nil,
    city: "Austin",
    state: "TX",
    zip: "78702",
    phone: "(555) 555-5555",
    couriers: []
    # orders: []
  })

pharmacy3 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Pharmacy{
    id: 3,
    email: "drugsrus@drugsrus.com",
    display_name: "Drugs R Us",
    address1: "4925 LA Ave",
    address2: "Suite 144",
    city: "Los Angeles",
    state: "CA",
    zip: "90056",
    phone: "5555555555",
    couriers: []
    # orders: []
  })

patient1 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Patient{
    id: 1,
    email: "brenda.hill@gmail.com",
    first_name: "Brenda",
    last_name: "Hill",
    address1: "500 West Rich Street",
    address2: "Apt 225",
    city: "Columbus",
    state: "OH",
    zip: "43212",
    phone: "(555) 555-5555"
  })

patient2 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Patient{
    id: 2,
    email: "thomasjones@yahoo.com",
    first_name: "Thomas",
    last_name: "Jones",
    address1: "5509 Desert Lane",
    address2: nil,
    city: "Austin",
    state: "TX",
    zip: "78702",
    phone: "555-555-5555"
  })

patient3 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Patient{
    id: 3,
    email: "antoniogonzales@gmail.com",
    first_name: "Antonio",
    last_name: "Gonzales",
    address1: "1212 San Bertha Drive",
    address2: "Unit C44",
    city: "Los Angeles",
    state: "CA",
    zip: "90056",
    phone: "5555555555"
  })

courier1 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Courier{
    id: 1,
    email: "hello@samedaydelivery.com",
    display_name: "Same Day Delivery",
    address1: "900 Trenton Lane",
    address2: nil,
    city: "Trenton",
    state: "NJ",
    zip: "08536",
    phone: "555-555-5555",
    pharmacies: []
  })

courier2 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Accounts.Courier{
    id: 2,
    email: "hello@previousdaydeliveries.com",
    display_name: "Previous Day Delivery",
    address1: "7433 LA Ct",
    address2: "A4",
    city: "Los Angeles",
    state: "CA",
    zip: "90056",
    phone: "(555) 555-5555",
    pharmacies: []
  })

order1 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Orders.Order{
    completed: false,
    canceled: false,
    pickup_time: DateTime.truncate(DateTime.utc_now(), :second),
    dropoff_time: DateTime.truncate(DateTime.utc_now(), :second),
    pharmacy_id: 1,
    patient_id: 1
  })

order2 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Orders.Order{
    completed: false,
    canceled: false,
    pickup_time: DateTime.truncate(DateTime.utc_now(), :second),
    dropoff_time: DateTime.truncate(DateTime.utc_now(), :second),
    pharmacy_id: 1,
    patient_id: 2
  })

order3 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Orders.Order{
    completed: false,
    canceled: false,
    pickup_time: DateTime.truncate(DateTime.utc_now(), :second),
    dropoff_time: DateTime.truncate(DateTime.utc_now(), :second),
    pharmacy_id: 2,
    patient_id: 2
  })

order4 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Orders.Order{
    completed: false,
    canceled: false,
    pickup_time: DateTime.truncate(DateTime.utc_now(), :second),
    dropoff_time: DateTime.truncate(DateTime.utc_now(), :second),
    pharmacy_id: 3,
    patient_id: 3
  })

order5 =
  ScriptdropCodeSample.Repo.insert!(%ScriptdropCodeSample.Orders.Order{
    completed: false,
    canceled: false,
    pickup_time: DateTime.truncate(DateTime.utc_now(), :second),
    dropoff_time: DateTime.truncate(DateTime.utc_now(), :second),
    pharmacy_id: 3,
    patient_id: 3
  })

# Create courier-pharmacy relationships
preloaded1 = ScriptdropCodeSample.Repo.preload(courier1, [:pharmacies])
courier_changeset = Ecto.Changeset.change(preloaded1)

relation_changeset1 =
  courier_changeset |> Ecto.Changeset.put_assoc(:pharmacies, [pharmacy1, pharmacy2])

preloaded2 = ScriptdropCodeSample.Repo.preload(courier2, [:pharmacies])
courier_changeset2 = Ecto.Changeset.change(preloaded2)
relation_changeset2 = courier_changeset2 |> Ecto.Changeset.put_assoc(:pharmacies, [pharmacy3])

ScriptdropCodeSample.Repo.update!(relation_changeset1)
ScriptdropCodeSample.Repo.update!(relation_changeset2)
