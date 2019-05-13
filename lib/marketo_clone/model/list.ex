defmodule MarketoClone.Model.List do
  @moduledoc """

  List data model

  """
  use Ecto.Schema
  import Ecto.Changeset


  alias MarketoClone.Model.{Campaign,Lead}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name type active_status)

    schema "lists" do

      field :name, :string
      field :description, :string
      field :type, :string, default: "static"
      field :active_status, :boolean, default: true
      field :tags, {:array, :string}

      belongs_to :campaign, Campaign
      has_many :lead, Lead


      timestamps()

  end

  def changeset(%MarketoClone.Model.List{} = list, attrs) do

    list

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

  end
end
