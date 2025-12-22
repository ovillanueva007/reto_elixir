defmodule RetoElixir.Infrastructure.EntryPoint.HealthCheckTest do
  alias RetoElixir.Infrastructure.EntryPoint.HealthCheck

  use ExUnit.Case

  describe "check_http/0" do
    test "returns :ok" do
      assert HealthCheck.check_http() == :ok
    end
  end
end
