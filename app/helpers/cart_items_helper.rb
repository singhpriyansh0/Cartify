module CartItemsHelper

def cart	
cartvalue=0
end

def save_for_later_f(a)
	if a.where(save_for_later: false).count >0
		return true

	else
		return false
	end
end

def save_for_later_t(a)
	if a.where(save_for_later: true).count >0
		return true

	else
		return false
	end
end


def display_image(a)
	Rails.application.routes.url_helpers.rails_blob_url(a.images.first, only_path: true)
end



def check_for_f(a)
	if a.save_for_later == false
		return true
	
	else
		return false
	end
end


def check_for_t(a)
	if a.save_for_later == true
		return true
	
	else
		return false
	end
end


def value(a , b, c)
   a+(price(b)*quantity(c))
end


def price(a)
	a.price
end

def colour(a)
	a.colour
end

def material(a)
	a.material
end

def weight(a)
	a.weight
end

def quantity(a)
    a.quantity.to_i
end

def product(a)
	a.product
end

def check(a)
	if quantity(a)>1
		return false
	else
		return true
	end
end
end
