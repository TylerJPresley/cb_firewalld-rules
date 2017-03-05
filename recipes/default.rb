include_recipe('firewalld::enable')

if node['firewalld-rules']['interface']
  node['firewalld-rules']['interface'].each do |item|
    raise("firewalld-rules::interface - Missing interface") if !item.key?('interface')
    raise("firewalld-rules::interface - Missing zone") if !item.key?('zone')
    raise("firewalld-rules::interface - Missing action") unless %w(add change remove).include?(item['action'])
    firewalld_interface item['interface'] do
      action :add if item['action'] == 'add'
      action :remove if item['action'] == 'remove'
      action :change if item['action'] == 'change'
      zone item['zone']
    end
  end
end

if node['firewalld-rules']['rich']
  node['firewalld-rules']['rich'].each do |item|
    raise("firewalld-rules::rich - Missing name") if !item.key?('name')
    raise("firewalld-rules::rich - Missing action [add/remove]") unless %w(add remove).include?(item['action'])
    firewalld_rich_rule item['name'] do
      family item['family'] if item.key?('family')
      source_address item['source_address'] if item.key?('source_address')
      destination_address item['destination_address'] if item.key?('destination_address')
      service_name item['service_name'] if item.key?('service_name')
      log_prefix item['log_prefix'] if item.key?('log_prefix')
      log_level item['log_level'] if item.key?('log_level')
      limit_value item['limit_value'] if item.key?('limit_value')
      port_number item['port_number'] if item.key?('port_number')
      port_protocol item['port_protocol'] if item.key?('port_protocol')
      firewall_action item['firewall_action'] if item.key?('firewall_action')
      zone item['zone'] if item.key?('zone') if item.key?('zone')
      action :add if item['action'] == 'add'
      action :remove if item['action'] == 'remove'
    end
  end
end

if node['firewalld-rules']['service']
  node['firewalld-rules']['service'].each do |item|
    raise("firewalld-rules::service - Missing service") if !item.key?('service')
    raise("firewalld-rules::service - Missing action") unless %w(add remove).include?(item['action'])
    firewalld_service item['service'] do
      zone item['zone'] if item.key?('zone')
      action :add if item['action'] == 'add'
      action :remove if item['action'] == 'remove'
    end
  end
end

if node['firewalld-rules']['port']
  node['firewalld-rules']['port'].each do |item|
    raise("firewalld-rules::port - Missing port") if !item.key?('port')
    raise("firewalld-rules::port - Missing action") unless %w(add remove).include?(item['action'])
    firewalld_port item['port'] do
      zone item['zone'] if item.key?('zone')
      action :add if item['action'] == 'add'
      action :remove if item['action'] == 'remove'
    end
  end
end
