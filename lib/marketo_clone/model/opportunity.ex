defmodule MarketoClone.Model.Opportunity do
  @moduledoc """

  Opportunity data model

  """
  use Ecto.Schema
  import Ecto.Changeset


  alias MarketoClone.Model.{Lead,Campaign,Activity}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name active_status)

    schema "opportunities" do
      field :name, :string
      field :active_status, :boolean, default: true
      field :tags, {:array, :string}

      has_many :lead, Lead
      belongs_to :campaign, Campaign
      has_many :activity, Activity

      timestamps()

    end

    def changeset(%MarketoClone.Model.Opportunity{} = opportunity, attrs) do

      opportunity

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

    end
  end
