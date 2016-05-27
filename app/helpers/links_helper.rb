module LinksHelper
  def display_link_for(interaction)
    if @links.key? interaction
      link_to nil, @links[interaction]
    else
      'n/a'
    end
  end
end