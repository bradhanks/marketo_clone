defmodule MarketoClone.Model.Company do
  @moduledoc """

  Company data model

  """
  use Ecto.Schema
  import Ecto.Changeset

  alias MarketoClone.Model.User

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name)

  schema "companies" do

    field :name, :string, unique: true
    field :description, :string
    field :address, :string
    field :website_url, :string
    field :tags, {:array, :string}

    has_many :user, User

    timestamps()

    end

  def changeset(%MarketoClone.Model.Company{} = company, attrs) do

      company
      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

    end
  end

