module PaymentsHelper
	def order
		OrderItem.where(order_id: Order.last.id).sum("price")
	end

	def url
	return "/payments/#{Order.last.id}"
	end

end
