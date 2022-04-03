describe 'links' do
  let(:user) { create(:user) }

  context 'index' do
    subject do
      get '/links', params: params
    end

    before do
      create(:link, user: user)
      create(:link, user: user)
    end

    it '' do

    end
  end
end
