module OpsHelper
  include_concern 'TextualSummary'

  def automate_humanized_filter(filter)
    text = ''
    filter.each do |key, val|
      next if val.empty?
      text << "#{key.to_s.capitalize.humanize}:</br> #{humanized_nested_keys(val)}</br>"
    end
    text.html_safe
  end

  def humanized_nested_keys(value)
    text = ''
    value.each do |key, val|
      next if val.empty?
      text << "&nbsp;&nbsp;#{key.to_s.humanize}: #{val}</br>"
    end
    text.html_safe
  end

  def hide_button(button, opt)
    if opt == "on"
      button ? '' : 'display:none'
    else
      button ? 'display:none' : ''
    end
  end

  def selected_settings_tree?(tree_node)
    tree_keys = tree_node.split("-")
    # only 'root' key has 1 key after split
    if tree_keys.count == 2
      tree_keys.any? { |t_key| %w(msc sis z l ld lr).include? t_key }
    else
      false
    end
  end

  def selected?(tree_node, key)
    tree_node.split('-').first == key
  end
end
