module HtmlSelectorsHelpers
  include FormHelper

  def selector_for(locator)
    case locator
    when /(.+) within (.+)/
      "#{selector_for($2)} #{selector_for($1)}"
    when /^the element for (.+) "(.+)"$/
      '#' + element_id(send("fetch_#{$1}", $2))
    when /^the link "([^"]+)"$/
      "a:contains('#{$1}')"
    when /^a link with the text "([^"]+)"$/
      "a:contains('#{$1}')"
    when /^the "(.+)" field$/
      $1
    when /^"(.+)"$/
      $1

    when /^the page$/         then 'html > body'
    when /^the signin link$/  then 'a#signin'
    when /^the signout link$/ then 'a#signout'

    else
      puts '*'*80
      puts "Named element: '#{locator}' was not found"
      puts '*'*80
      locator
    end
  end
end

World(HtmlSelectorsHelpers)
