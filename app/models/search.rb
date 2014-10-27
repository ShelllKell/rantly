class Search
  attr_reader :term

  def initialize(options = {})
    @term = options.fetch(:term, "")
  end

  def users
    User.where("first_name iLIKE ? or username iLIKE ? or last_name iLIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")
  end

  def rants
    Rant.where("rant iLIKE ? or topic iLIKE ?", "%#{term}%", "%#{term}%")
  end

end