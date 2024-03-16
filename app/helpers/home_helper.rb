module HomeHelper
	def display(a)
      Rails.application.routes.url_helpers.rails_blob_url(a.variants.first.images.last, only_path: true)
	end

	def price_p(a)
       a.variants.first.price
	end

	def name(a)
		a.name
	end

	def brand_name(a)
		a.brand_name
	end
end
