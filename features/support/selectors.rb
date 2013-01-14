module HtmlSelectorsHelpers
  include FormHelper
  def selector_for(locator)
    case locator
    when /(.+) within (.+)/
      "#{selector_for($2)} #{selector_for($1)}"
    when /^the page$/
      "html > body"
    when /^the element for admin "(.+)"$/
      '#' + element_id(Admin.where(:email => $1).first)
    when /^the link "([^"]+)"$/
      "a:contains('#{$1}')"
    when /^a link with the text "([^"]+)"$/
      "a:contains('#{$1}')"
    when /^the "(.+)" field$/
      $1
    when /^"(.+)"$/
      $1
    else
      puts "*"*80
      puts "Named element: '#{locator}' was not found"
      puts "*"*80
      locator
    end
  end
end

World(HtmlSelectorsHelpers)
