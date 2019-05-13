defmodule MarketoClone.Repo.Migrations.UpdateCompanies do
  use Ecto.Migration

  def change do
    create table("companies") do
      add :name, :string
      add :description, :string
      add :address, :string
      add :website_url, :string
      add :tags, {:array, :string}

     timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateUsers do
    use Ecto.Migration

    def change do
    create table("users") do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :title, :string
      add :notes, :string
      add :role, :string
      add :tags, {:array, :string}
      add :company_id, references(:companies)

    timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateLeads do
    use Ecto.Migration

    def change do
    create table("leads") do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :tags, {:array, :string}
      add :score, :integer

      add :campaign_id, references(:campaigns)
      add :opportunity_id, references(:opportunities)

    timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateLists do
    use Ecto.Migration

    def change do
    create table("lists") do
      add :name, :string
      add :description, :string
      add :type, :string
      add :active_status, :boolean
      add :tags, {:array, :string}
      add :campaign_id, references(:campaigns)

      timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateOpportunities do
    use Ecto.Migration

    def change do
    create table("opportunities") do
      add :name, :string
      add :active_status, :boolean
      add :tags, {:array, :string}
      add :campaign_id, references(:campaigns)

      timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateActivities do
    use Ecto.Migration

    def change do
    create table("activities") do
      add :name, :string
      add :attributes, :map
      add :tags, {:array, :string}
     # add campaign_id, references(:campaigns)
     # add opportunity_id, references(:opportunities)
     # add list_id, references(:lists)

    timestamps()

    end
  end
end

defmodule MarketoClone.Repo.Migrations.UpdateCampaigns do
    use Ecto.Migration

    def change do
    create table("campaigns") do
      add :name, :string
      add :parent_id, :integer
      add :description, :string
      add :active_status, :boolean
      add :type, :string
      add :tags, {:array, :string}

      timestamps()
    end
  end
end
