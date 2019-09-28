defmodule ScriptdropCodeSample.AccountsTest do
  use ScriptdropCodeSample.DataCase

  alias ScriptdropCodeSample.Accounts

  describe "patients" do
    alias ScriptdropCodeSample.Accounts.Patient

    @valid_attrs %{address1: "some address1", address2: "some address2", city: "some city", email: "some email", first_name: "some first_name", last_name: "some last_name", phone: 42, state: "some state", zip: 42}
    @update_attrs %{address1: "some updated address1", address2: "some updated address2", city: "some updated city", email: "some updated email", first_name: "some updated first_name", last_name: "some updated last_name", phone: 43, state: "some updated state", zip: 43}
    @invalid_attrs %{address1: nil, address2: nil, city: nil, email: nil, first_name: nil, last_name: nil, phone: nil, state: nil, zip: nil}

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
      assert patient.phone == 42
      assert patient.state == "some state"
      assert patient.zip == 42
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
      assert patient.phone == 43
      assert patient.state == "some updated state"
      assert patient.zip == 43
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
end
