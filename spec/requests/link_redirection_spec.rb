require 'rails_helper'

RSpec.describe "Link redirection", type: :request do

    it "redirects to the given URL with short link" do
        url = "https://www.youtube.com/watch?v=nPZwwye3Mn0&list=PLjItgYqIzJ9WGy9WMf-44DXHB_7aWwJMc&index=10"
        shortener = Shortener.new(url)
        link = shortener.generate_short_link

        get link.shortened_url
        expect(response).to redirect_to(link.original_url)
    end

end