defmodule MarketoClone.Model.Activity do
  @moduledoc """

  Activity data model

  """
  use Ecto.Schema
  import Ecto.Changeset


  alias MarketoClone.Model.{Lead,Campaign,Opportunity,List}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name campaign_id)

    schema "activities" do
      field :name, :string
      field :attributes, :map #(key => value)
      field :tags, {:array, :string}

      belongs_to :lead, Lead
      has_one :campaign, Campaign
      has_one :opportunity, Opportunity
      has_one :list, List

      timestamps()

  end

  def changeset(%MarketoClone.Model.Activity{} = activity, attrs) do

    activity

    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)

  end
 end
