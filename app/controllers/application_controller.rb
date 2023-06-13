class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project Eugene Holenstein!!!" }.to_json
  end

  # Start of Container routers

  get "/containers" do
    Container.all.to_json
  end

  get "/containers/:id" do
    Container.find_by(id: params[:id]).to_json(include: :tags)
  end

  # Start of Tag routers

  post "/tags/new" do
    new_tag = Tag.create(
      name: params[:name],
      type_tag: params[:type_tag],
      container_id: params[:container_id])
  end

  get "/tags" do
    Tag.all.to_json
  end

  get "/tags/count" do
    Tag.count.to_json
  end

  get "/tag/last" do
    Tag.last_tag.to_json
  end

  get "/tags/:type" do
    {tags: params(self.find_tag_by_type(type))}.to_json
  end

  get "/tags/:id" do
    Tag.find_by(id: params[:id]).to_json(include :events)
  end

  # Start of Event routers

  post "/events/new" do
    Event.create(
      trigger_name: params[:trigger_name],
      event_name: params[:event_name],
      type_event: params[:type_event],
      container_id: params[:container_id],
      tag_id: params[:tag_id]
    )
  end

  get "/events" do
    Event.all.to_json
  end

  get "/events/count" do
    Event.count.to_json
  end

  get "/events/last" do
    Event.last.to_json
  end

  get "/events/by-date" do
    Event.all.order(created_at: :desc).to_json
  end

  get "/events/type/:id" do
    event_type = Event.find_by(id: params[:id])
    event_type.type_event.to_json
  end

  patch "/events/update-trigger/:id" do
    event_to_update = Event.find_by(id: params[:id])
    event_to_update.trigger_name = params[:trigger_name]
    event_to_update.save
    event_to_update.to_json
  end

  delete "/events/delete/:id" do
    event_to_delete = Event.find(params[:id])
    event_to_delete.delete
    event_to_delete.to_json
  end

end