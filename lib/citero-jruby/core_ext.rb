String.class_eval do
  def to_java_name
    if self.include? '_'
      self.gsub(/(_[a-z])/) { $1[1].capitalize }
    else
      self
    end
  end
  def to_ruby_name
    (self.gsub(/([A-Z])/) { "_"+$1 }).downcase
  end
end