defmodule MarketoClone.Model.Campaign do
  @moduledoc """

  Campaign data model

  """

  use Ecto.Schema
  import Ecto.Changeset

  alias MarketoClone.Model.{User,Activity}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name parent_id active_status type)

  schema "campaigns" do

    field :name, :string
    field :parent_id, :integer, default: nil
    field :description, :string
    field :active_status, :boolean, default: true
    field :type, :string, default: "static" #(static,smart)
    field :tags, {:array, :string}

    has_many :user_id, User
    has_many :activity, Activity

    timestamps()

  end

  def changeset(%MarketoClone.Model.Campaign{} = campaign, attrs) do

    campaign

    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)

  end
end
