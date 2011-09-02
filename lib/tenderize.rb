module Tenderize
end

# Extend Hash objects
class Hash
  def method_missing(method, *args, &block)
    if self.has_key?(method.to_s)
      return self[method.to_s]
    elsif self.has_key?(method.to_sym)
      return self[method.to_sym]
    else
      super
    end
  end
end


Dir.entries("./lib/").each do |file|
  require "./lib/#{file}" if file =~ /(.+)\.rb$/
end