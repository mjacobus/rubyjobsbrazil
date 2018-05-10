require "rails_helper"

describe Users::JobsController, "routing", type: :routing do
  it "routes to #index" do
    expect(get('profile/jobs')).to route_to('users/jobs#index')
    expect(get(user_jobs_path)).to route_to('users/jobs#index')
  end

  it "routes to #show" do
    expect(get('profile/jobs/1')).to route_to('users/jobs#show', id: '1')
  end

  it "routes to #new" do
    expect(get('profile/jobs/new')).to route_to('users/jobs#new')
  end

  it "routes to #create" do
    expect(post('profile/jobs')).to route_to('users/jobs#create')
  end

  it "routes to #edit" do
    expect(get('profile/jobs/1/edit')).to route_to('users/jobs#edit', id: '1')
  end

  it "routes to #update" do
    expect(patch('profile/jobs/1')).to route_to('users/jobs#update', id: '1')
  end

  it "routes to #destroy" do
    expect(delete('profile/jobs/1')).to route_to('users/jobs#destroy', id: '1')
  end
end
