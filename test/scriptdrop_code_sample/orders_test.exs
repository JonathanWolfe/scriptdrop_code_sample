defmodule ScriptdropCodeSample.OrdersTest do
  use ScriptdropCodeSample.DataCase

  alias ScriptdropCodeSample.Orders

  describe "orders" do
    alias ScriptdropCodeSample.Orders.Order

    @valid_attrs %{
      canceled: true,
      completed: true,
      dropoff_time: "2010-04-17T14:00:00Z",
      pickup_time: "2010-04-17T14:00:00Z"
    }
    @update_attrs %{
      canceled: false,
      completed: false,
      dropoff_time: "2011-05-18T15:01:01Z",
      pickup_time: "2011-05-18T15:01:01Z"
    }
    @invalid_attrs %{canceled: nil, completed: nil, dropoff_time: nil, pickup_time: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Orders.create_order()

      order
    end

    # test "list_orders/0 returns all orders" do
    #   order = order_fixture()
    #   assert Orders.list_orders() == [order]
    # end

    # test "get_order!/1 returns the order with given id" do
    #   order = order_fixture()
    #   assert Orders.get_order!(order.id) == order
    # end

    test "create_order/1 with valid data creates a order" do
      order = Orders.create_order(@valid_attrs)
      assert order.canceled == true
      assert order.completed == true
      assert order.dropoff_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert order.pickup_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Orders.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      order = Orders.update_order(order, @update_attrs)
      assert order.canceled == false
      assert order.completed == false
      assert order.dropoff_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert order.pickup_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Orders.update_order(order, @invalid_attrs)
      # assert order == Orders.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Orders.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Orders.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Orders.change_order(order)
    end
  end
end
