defmodule Parker.Accounts.Encryption do
  alias Comeonin.Bcrypt
  alias Parker.Accounts.User

  def hash_field(field), do: Bcrypt.hashpwsalt(field)

  def validate_against_hash(%User{} = user, field), do: Bcrypt.check_pass(user, field)
end
