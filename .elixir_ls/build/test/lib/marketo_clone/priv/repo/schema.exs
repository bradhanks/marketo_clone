defmodule MarketoClone.Schema.Company do
  use Ecto.Schema

  alias MarketoClone.Schema.User

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name)

  schema "companies" do

    field :name, :string, unique: true
    field :description, :string
    field :address, :string
    field :website_url, :string
    field :tags, {:array, :string}

    has_many :users, User

    timestamps()

    end

  def changeset(%Company{} = company, attrs) do

      company
      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

    end
  end

defmodule MarketoClone.Schema.User do
  use Ecto.Schema

  alias  MarketoClone.Schema.{Campaign, Company}

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

      has_many :campaigns, Campaign
      belongs_to, :company, Company

      timestamps()

    end

  def changeset(%User{} = user, attrs) do

      user

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint(:email)

    end
  end


defmodule MarketoClone.Schema.Lead do
  use Ecto.Schema

  alias  MarketoClone.Schema.{User,Campaign,Opportunity,List,Activity}

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

      has_many :lists, List
      has_many :activities, Activity

      timestamps()

      end

  def changeset(%Lead{} = lead, attrs) do

        lead

        |> cast(attrs, @required_fields)
        |> validate_required(@required_fields)
        |> validate_format(:email, ~r/@/)
        |> unique_constraint(:email)
        |> validate_inclusion(:score, 0..100)

      end
  end

defmodule MarketoClone.Schema.List do
  use Ecto.Schema

  alias MarketoClone.Schema.Campaign

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name type active_status)

    schema "lists" do

      field :name, :string
      field :description, :string
      field :type, :string, default: "static"
      field :active_status, :boolean, default: true
      field :tags, {:array, :string}

      belongs_to :campaign, Campaign

      timestamps()

  end

  def changeset(%List{} = list, attrs) do

    list

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

  end
end

defmodule MarketoClone.Schema.Opportunity do
  use Ecto.Schema

  alias MarketoClone.Schema.{Lead,Campaign}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name active_status)

    schema "opportunities" do
      field :name, :string
      field :active_status, :boolean, default: true
      field :tags, {:array, :string}

      has_many :leads, Lead
      belongs_to :campaign, Campaign

      timestamps()

    end

    def changeset(%Opportunity{} = opportunity, attrs) do

      opportunity

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

    end
  end

defmodule MarketoClone.Schema.Activity do
  use Ecto.Schema

  alias MarketoClone.Schema.{Campaign,Opportunity,List}

  @timestamps_opts [type: :utc_datetime]
  @required_fields ~w(name campaign_id)

    schema "activities" do
      field :name, :string
      field :attributes, :map #(key => value)
      field :tags, {:array, :string}

      belongs_to :campaign, Campaign
      belongs_to :opportunity, Opportunity
      belongs_to :lists, List

      tomestamps()

  end

  def changeset(%Lead{} = lead, attrs) do

    activity

    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)

  end
 end

defmodule MarketoClone.Schema.Campaign do
    use Ecto.Schema

    @timestamps_opts [type: :utc_datetime]
    @required_fields ~w(name parent_id active_status type)

    schema "campaigns" do

      field :name, :string
      field :parent_id, :integer, default: nil
      field :description, :string
      field :active_status, :boolean, default: true
      field :type, :string, default: "static" #(static,smart)
      field :tags, {:array, :string}

      timestamps()

    end

    def changeset(%Campaign{} = campaign, attrs) do

      campaign

      |> cast(attrs, @required_fields)
      |> validate_required(@required_fields)

    end
  end
