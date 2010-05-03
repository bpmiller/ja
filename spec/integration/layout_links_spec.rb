require 'spec_helper'

describe "LayoutLinks" do
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end
  it "should have a landing page at '/landingpage'" do
    get '/landingpage'
    response.should render_template('landingpages/new')
  end
end
