module FormHelper
  def element_id(*args)
    args.map do |arg|
      case arg
      when Mongoid::Document then "#{arg.class.name.downcase}-#{arg.id}"
      else arg.to_s
      end
    end.join('_')
  end
end
