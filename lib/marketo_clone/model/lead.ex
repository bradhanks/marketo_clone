defmodule MarketoClone.Model.Lead do
  @moduledoc """

  Lead data model

  """
  use Ecto.Schema
  import Ecto.Changeset


  alias  MarketoClone.Model.{User,Campaign,Opportunity,List,Activity}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name email score user_id campaign_id)

    schema "leads" do

      field :name, :string
      field :email, :string
      field :phone, :string
      field :tags, {:array, :string}
      field :score, :integer, default: 1

      belongs_to :user, User
      belongs_to :campaign, Campaign
      belongs_to :opportunity, Opportunity

      has_many :list, List
      has_many :activity, Activity

      timestamps()

      end

  def changeset(%MarketoClone.Model.Lead{} = lead, attrs) do

        lead

        |> cast(attrs, @required_fields)
        |> validate_required(@required_fields)
        |> validate_format(:email, ~r/@/)
        |> unique_constraint(:email)
        |> validate_inclusion(:score, 0..100)

      end
  end






