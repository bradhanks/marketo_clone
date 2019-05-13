defmodule MarketoClone.Model.User do
  @moduledoc """

  User data model

  """
  use Ecto.Schema
  import Ecto.Changeset


  alias  MarketoClone.Model.{Campaign,Company}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name email role)


    schema "users" do

      field :name, :string
      field :email, :string
      field :phone, :string
      field :title, :string
      field :notes, :string
      field :role, :string, default: "admin" #admin, sales, client
      field :tags, {:array, :string}

      has_many :campaign_id, Campaign
      belongs_to :company, Company

      timestamps()

    end

  def changeset(%MarketoClone.Model.User{} = user, attrs) do

      user

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint(:email)

    end
  end


