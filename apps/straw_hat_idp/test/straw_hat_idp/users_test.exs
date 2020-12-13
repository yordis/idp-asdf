defmodule StrawHat.Idp.UsersTest do
  use StrawHat.Idp.TestSupport.DataCase
  alias StrawHat.Idp.Users

  describe "creating a user with magic link" do
    @tag :integration
    test "creates a user and request a magic link" do
      {:error, :validation_failure, errors} = Users.create_user_with_magic_link(%{email: ""})
      assert errors == %{email: ["must be present"]}
    end
  end
end
