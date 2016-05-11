module EventMixin
  extend ActiveSupport::Concern

  def start_time
    self.date
  end

  def view_class
    case self.tag
    when "red"
      "bg-danger"
    when "blue"
      "bg-info"
    when "yellow"
      "bg-warning"
    when "green"
      "bg-success"
    when "primary"
      "bg-primary"
    end
  end

end
