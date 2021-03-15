defmodule StrawHat.Idp.ValueObject.Settings do
  use StrawHat.Idp.ValueObject

  embedded_schema do
    embedded_one :session, SessionSetting
  end

  defmodule SessionSetting do
    use StrawHat.Idp.ValueObject

    embedded_schema do
      embedded_one :cookie, CookieSetting
      field :idle_lifetime, :string
      field :lifetime, :string
    end

    defmodule CookieSetting do
      use StrawHat.Idp.ValueObject

      embedded_schema do
        field :lifespan, :string
        field :same_site, :string
        field :domain, :string
        field :name, :string
        field :path, :string
      end
  end
end
