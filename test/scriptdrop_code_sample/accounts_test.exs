defmodule ScriptdropCodeSample.AccountsTest do
  use ScriptdropCodeSample.DataCase

  alias ScriptdropCodeSample.Accounts

  describe "patients" do
    alias ScriptdropCodeSample.Accounts.Patient

    @valid_attrs %{
      address1: "some address1",
      address2: "some address2",
      city: "some city",
      email: "some email",
      first_name: "some first_name",
      last_name: "some last_name",
      phone: "555-555-5555",
      state: "some state",
      zip: "25222"
    }
    @update_attrs %{
      address1: "some updated address1",
      address2: "some updated address2",
      city: "some updated city",
      email: "some updated email",
      first_name: "some updated first_name",
      last_name: "some updated last_name",
      phone: "(555) 555-5555",
      state: "some updated state",
      zip: "88558"
    }
    @invalid_attrs %{
      address1: nil,
      address2: nil,
      city: nil,
      email: nil,
      first_name: nil,
      last_name: nil,
      phone: nil,
      state: nil,
      zip: nil
    }

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Accounts.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Accounts.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Accounts.create_patient(@valid_attrs)
      assert patient.address1 == "some address1"
      assert patient.address2 == "some address2"
      assert patient.city == "some city"
      assert patient.email == "some email"
      assert patient.first_name == "some first_name"
      assert patient.last_name == "some last_name"
      assert patient.phone == "555-555-5555"
      assert patient.state == "some state"
      assert patient.zip == "25222"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Accounts.update_patient(patient, @update_attrs)
      assert patient.address1 == "some updated address1"
      assert patient.address2 == "some updated address2"
      assert patient.city == "some updated city"
      assert patient.email == "some updated email"
      assert patient.first_name == "some updated first_name"
      assert patient.last_name == "some updated last_name"
      assert patient.phone == "(555) 555-5555"
      assert patient.state == "some updated state"
      assert patient.zip == "88558"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_patient(patient, @invalid_attrs)
      assert patient == Accounts.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Accounts.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Accounts.change_patient(patient)
    end
  end

  describe "pharmacies" do
    alias ScriptdropCodeSample.Accounts.Pharmacy

    @valid_attrs %{
      address1: "some address1",
      address2: "some address2",
      city: "some city",
      display_name: "some display_name",
      email: "some email",
      phone: "555-555-5555",
      state: "some state",
      zip: "25222"
    }
    @update_attrs %{
      address1: "some updated address1",
      address2: "some updated address2",
      city: "some updated city",
      display_name: "some updated display_name",
      email: "some updated email",
      phone: "(555) 555-5555",
      state: "some updated state",
      zip: "88558"
    }
    @invalid_attrs %{
      address1: nil,
      address2: nil,
      city: nil,
      display_name: nil,
      email: nil,
      phone: nil,
      state: nil,
      zip: nil
    }

    def pharmacy_fixture(attrs \\ %{}) do
      {:ok, pharmacy} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_pharmacy()

      pharmacy
    end

    test "list_pharmacies/0 returns all pharmacies" do
      pharmacy = pharmacy_fixture()
      assert Accounts.list_pharmacies() == [pharmacy]
    end

    test "get_pharmacy!/1 returns the pharmacy with given id" do
      pharmacy = pharmacy_fixture()
      assert Accounts.get_pharmacy!(pharmacy.id) == pharmacy
    end

    test "create_pharmacy/1 with valid data creates a pharmacy" do
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.create_pharmacy(@valid_attrs)
      assert pharmacy.address1 == "some address1"
      assert pharmacy.address2 == "some address2"
      assert pharmacy.city == "some city"
      assert pharmacy.display_name == "some display_name"
      assert pharmacy.email == "some email"
      assert pharmacy.phone == "555-555-5555"
      assert pharmacy.state == "some state"
      assert pharmacy.zip == "25222"
    end

    test "create_pharmacy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_pharmacy(@invalid_attrs)
    end

    test "update_pharmacy/2 with valid data updates the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{} = pharmacy} = Accounts.update_pharmacy(pharmacy, @update_attrs)
      assert pharmacy.address1 == "some updated address1"
      assert pharmacy.address2 == "some updated address2"
      assert pharmacy.city == "some updated city"
      assert pharmacy.display_name == "some updated display_name"
      assert pharmacy.email == "some updated email"
      assert pharmacy.phone == "(555) 555-5555"
      assert pharmacy.state == "some updated state"
      assert pharmacy.zip == "88558"
    end

    test "update_pharmacy/2 with invalid data returns error changeset" do
      pharmacy = pharmacy_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_pharmacy(pharmacy, @invalid_attrs)
      assert pharmacy == Accounts.get_pharmacy!(pharmacy.id)
    end

    test "delete_pharmacy/1 deletes the pharmacy" do
      pharmacy = pharmacy_fixture()
      assert {:ok, %Pharmacy{}} = Accounts.delete_pharmacy(pharmacy)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_pharmacy!(pharmacy.id) end
    end

    test "change_pharmacy/1 returns a pharmacy changeset" do
      pharmacy = pharmacy_fixture()
      assert %Ecto.Changeset{} = Accounts.change_pharmacy(pharmacy)
    end
  end

  describe "couriers" do
    alias ScriptdropCodeSample.Accounts.Courier

    @valid_attrs %{
      address1: "some address1",
      address2: "some address2",
      city: "some city",
      display_name: "some display_name",
      email: "some email",
      phone: "555-555-5555",
      state: "some state",
      zip: "25222"
    }
    @update_attrs %{
      address1: "some updated address1",
      address2: "some updated address2",
      city: "some updated city",
      display_name: "some updated display_name",
      email: "some updated email",
      phone: "(555) 555-5555",
      state: "some updated state",
      zip: "88558"
    }
    @invalid_attrs %{
      address1: nil,
      address2: nil,
      city: nil,
      display_name: nil,
      email: nil,
      phone: nil,
      state: nil,
      zip: nil
    }

    def courier_fixture(attrs \\ %{}) do
      {:ok, courier} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_courier()

      courier
    end

    test "list_couriers/0 returns all couriers" do
      courier = courier_fixture()
      assert Accounts.list_couriers() == [courier]
    end

    test "get_courier!/1 returns the courier with given id" do
      courier = courier_fixture()
      assert Accounts.get_courier!(courier.id) == courier
    end

    test "create_courier/1 with valid data creates a courier" do
      assert {:ok, %Courier{} = courier} = Accounts.create_courier(@valid_attrs)
      assert courier.address1 == "some address1"
      assert courier.address2 == "some address2"
      assert courier.city == "some city"
      assert courier.display_name == "some display_name"
      assert courier.email == "some email"
      assert courier.phone == "555-555-5555"
      assert courier.state == "some state"
      assert courier.zip == "25222"
    end

    test "create_courier/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_courier(@invalid_attrs)
    end

    test "update_courier/2 with valid data updates the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{} = courier} = Accounts.update_courier(courier, @update_attrs)
      assert courier.address1 == "some updated address1"
      assert courier.address2 == "some updated address2"
      assert courier.city == "some updated city"
      assert courier.display_name == "some updated display_name"
      assert courier.email == "some updated email"
      assert courier.phone == "(555) 555-5555"
      assert courier.state == "some updated state"
      assert courier.zip == "88558"
    end

    test "update_courier/2 with invalid data returns error changeset" do
      courier = courier_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_courier(courier, @invalid_attrs)
      assert courier == Accounts.get_courier!(courier.id)
    end

    test "delete_courier/1 deletes the courier" do
      courier = courier_fixture()
      assert {:ok, %Courier{}} = Accounts.delete_courier(courier)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_courier!(courier.id) end
    end

    test "change_courier/1 returns a courier changeset" do
      courier = courier_fixture()
      assert %Ecto.Changeset{} = Accounts.change_courier(courier)
    end
  end
end
