require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.build(:address) }
  # pending "add some examples to (or delete) #{__FILE__}"
    context "pin-code Size" do 
    
    

      it 'should not be nil ' do
        address.pin_code = nil
        expect(address).not_to be_valid
      end

      it 'should be of length 6'do
        address.pin_code = 123333
        expect(address).not_to be_valid
      end

      
    


    end



end
