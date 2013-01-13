module HtmlSelectorsHelpers
  include FormHelper
  def selector_for(locator)
    case locator
    when "(.+) within (.+)"
      "#{selector_for($2)} #{selector_for($1)}"
    when "the page"
      "html > body"
    when /the element for admin "(.+)"/
      admin = Admin.where(:email => $1).first
      '#' + element_id(admin)
    when /^"(.+)"$/
      $1
    else
      raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(HtmlSelectorsHelpers)
