defmodule ElixirSenseExample.BehaviourWithMacrocallback do
  @doc """
  A required macrocallback
  """
  @macrocallback required(atom) :: Macro.t()

  @doc """
  An optional macrocallback
  """
  @macrocallback optional(a) :: Macro.t() when a: atom
  @optional_callbacks [optional: 1]
end

defmodule ElixirSenseExample.BehaviourWithMacrocallback.Impl do
  @behaviour ElixirSenseExample.BehaviourWithMacrocallback
  defmacro required(var), do: Macro.expand(var, __CALLER__)
  defmacro optional(var), do: Macro.expand(var, __CALLER__)

  @doc """
  some macro
  """
  @spec some(integer) :: Macro.t()
  @spec some(b) :: Macro.t() when b: float
  defmacro some(var), do: Macro.expand(var, __CALLER__)
end