require 'rails_helper'

RSpec.describe 'Routes Spec', type: :routing do
  describe 'Admin Section' do
    describe 'Devise Section' do
      it 'does not route registrations' do
        expect(get: '/user/cancel').not_to be_routable
        expect(get: '/user/sign_up').not_to be_routable
        expect(get: '/user/edit').not_to be_routable
        expect(patch: '/user').not_to be_routable
        expect(post: '/user').not_to be_routable
        expect(put: '/user').not_to be_routable
        expect(delete: '/user').not_to be_routable
      end
    end
  end
end
