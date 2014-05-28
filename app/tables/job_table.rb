class JobTable < TableCloth::Base
  def self.t(attribute)
    Job.human_attribute_name(attribute)
  end

  column(t(:title)) do |o|
    o.title
  end

  column t(:published_at) do |o|
    o.decorate.created_at_ago
  end

  actions do
    action {|o| show_link(o) }
    action {|o| edit_link([:edit, o]) }
    action {|o| destroy_link(o) }
  end

end
