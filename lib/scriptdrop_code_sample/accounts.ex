defmodule ScriptdropCodeSample.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias ScriptdropCodeSample.Repo

  alias ScriptdropCodeSample.Accounts.Patient

  @doc """
  Returns the list of patients.

  ## Examples

      iex> list_patients()
      [%Patient{}, ...]

  """
  def list_patients do
    Repo.all(Patient)
  end

  @doc """
  Gets a single patient.

  Raises `Ecto.NoResultsError` if the Patient does not exist.

  ## Examples

      iex> get_patient!(123)
      %Patient{}

      iex> get_patient!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patient!(id), do: Repo.get!(Patient, id)

  @doc """
  Creates a patient.

  ## Examples

      iex> create_patient(%{field: value})
      {:ok, %Patient{}}

      iex> create_patient(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patient(attrs \\ %{}) do
    %Patient{}
    |> Patient.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patient.

  ## Examples

      iex> update_patient(patient, %{field: new_value})
      {:ok, %Patient{}}

      iex> update_patient(patient, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patient(%Patient{} = patient, attrs) do
    patient
    |> Patient.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Patient.

  ## Examples

      iex> delete_patient(patient)
      {:ok, %Patient{}}

      iex> delete_patient(patient)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patient(%Patient{} = patient) do
    Repo.delete(patient)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patient changes.

  ## Examples

      iex> change_patient(patient)
      %Ecto.Changeset{source: %Patient{}}

  """
  def change_patient(%Patient{} = patient) do
    Patient.changeset(patient, %{})
  end

  alias ScriptdropCodeSample.Accounts.Pharmacy

  @doc """
  Returns the list of pharmacies.

  ## Examples

      iex> list_pharmacies()
      [%Pharmacy{}, ...]

  """
  def list_pharmacies do
    Repo.all(Pharmacy)
  end

  @doc """
  Gets a single pharmacy.

  Raises `Ecto.NoResultsError` if the Pharmacy does not exist.

  ## Examples

      iex> get_pharmacy!(123)
      %Pharmacy{}

      iex> get_pharmacy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy!(id), do: Repo.get!(Pharmacy, id)

  @doc """
  Creates a pharmacy.

  ## Examples

      iex> create_pharmacy(%{field: value})
      {:ok, %Pharmacy{}}

      iex> create_pharmacy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy(attrs \\ %{}) do
    %Pharmacy{}
    |> Pharmacy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy.

  ## Examples

      iex> update_pharmacy(pharmacy, %{field: new_value})
      {:ok, %Pharmacy{}}

      iex> update_pharmacy(pharmacy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy(%Pharmacy{} = pharmacy, attrs) do
    pharmacy
    |> Pharmacy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pharmacy.

  ## Examples

      iex> delete_pharmacy(pharmacy)
      {:ok, %Pharmacy{}}

      iex> delete_pharmacy(pharmacy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy(%Pharmacy{} = pharmacy) do
    Repo.delete(pharmacy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy changes.

  ## Examples

      iex> change_pharmacy(pharmacy)
      %Ecto.Changeset{source: %Pharmacy{}}

  """
  def change_pharmacy(%Pharmacy{} = pharmacy) do
    Pharmacy.changeset(pharmacy, %{})
  end

  alias ScriptdropCodeSample.Accounts.Courier

  @doc """
  Returns the list of couriers.

  ## Examples

      iex> list_couriers()
      [%Courier{}, ...]

  """
  def list_couriers do
    Repo.all(Courier)
  end

  @doc """
  Gets a single courier.

  Raises `Ecto.NoResultsError` if the Courier does not exist.

  ## Examples

      iex> get_courier!(123)
      %Courier{}

      iex> get_courier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_courier!(id), do: Repo.get!(Courier, id)

  @doc """
  Creates a courier.

  ## Examples

      iex> create_courier(%{field: value})
      {:ok, %Courier{}}

      iex> create_courier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_courier(attrs \\ %{}) do
    %Courier{}
    |> Courier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a courier.

  ## Examples

      iex> update_courier(courier, %{field: new_value})
      {:ok, %Courier{}}

      iex> update_courier(courier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_courier(%Courier{} = courier, attrs) do
    courier
    |> Courier.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Courier.

  ## Examples

      iex> delete_courier(courier)
      {:ok, %Courier{}}

      iex> delete_courier(courier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_courier(%Courier{} = courier) do
    Repo.delete(courier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking courier changes.

  ## Examples

      iex> change_courier(courier)
      %Ecto.Changeset{source: %Courier{}}

  """
  def change_courier(%Courier{} = courier) do
    Courier.changeset(courier, %{})
  end
end
