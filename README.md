# firewalld-rules Cookbook

Sets up simple firewalld rules with attributes

## Supported Platforms

- CentOS >= 7 (Only tested on)

## Attributes

Attributes are based off the firewalld LWRP: [https://github.com/rigrassm/firewalld-cookbook]

**_Attributes in bold are required!_**

### Rules

- `node['firewalld-rules']['rich']` - rich rules. [Array]
- `node['firewalld-rules']['service']` - service rules. [Array]
- `node['firewalld-rules']['port']` - port rules. [Array]
- `node['firewalld-rules']['interface']` - firewall interfaces. [Array]

#### rich

- **`node['firewalld-rules']['rich']['name']`** - resource name [string]
- `node['firewalld-rules']['rich']['family']` - ip family (values: ipv4, ipv6) (default: ipv4) [String]
- `node['firewalld-rules']['rich']['source_address']` - limits source ip(s) (ex: "192.168.100.5" or "192.168.100.5/32") [String]
- `node['firewalld-rules']['rich']['destination_address']` - limits target ip(s) (ex: "192.168.100.5" or "192.168.100.5/32") [String]
- `node['firewalld-rules']['rich']['service_name']` - firewalld provided service name [String]
- `node['firewalld-rules']['rich']['log_prefix']` - log prefix [String]
- `node['firewalld-rules']['rich']['log_level']` - log level (values: emerg, alert, error, warning, notice, info, debug) [String]
- `node['firewalld-rules']['rich']['limit_value']` - log write rate limit (default: 1/m) [String]
- `node['firewalld-rules']['rich']['port_number']` - port number (ex: "5060" or "5060-5062") [String]
- `node['firewalld-rules']['rich']['port_protocol']` - port protocol (values: tcp, udp) (default: tcp) [String]
- `node['firewalld-rules']['rich']['firewall_action']` - firewall action (values: accept, reject, drop) (default: accept) [String]
- `node['firewalld-rules']['rich']['zone']` - zone [String]
- `node['firewalld-rules']['rich']['action']` - action (values: add, remove) (default: remove) [String]

#### service

- **`node['firewalld-rules']['service']['name']`** - firewalld service name [string]
- `node['firewalld-rules']['service']['zone']` - zone [String]
- `node['firewalld-rules']['service']['action']` - action (values: add, remove) (default: remove) [String]

#### port

- **`node['firewalld-rules']['service']['port']`** - port and protocol (ex: 8888/tcp) [string]
- `node['firewalld-rules']['service']['zone']` - zone [String]
- `node['firewalld-rules']['service']['action']` - action (values: add, remove) (default: remove) [String]

#### interface

- **`node['firewalld-rules']['service']['interface']`** - network interface name (ex: eth0) [string]
- **`node['firewalld-rules']['service']['zone']`** - zone [String]
- `node['firewalld-rules']['service']['action']` - action (values: add, remove) (default: remove) [String]

## Usage

### firewalld-rules::default

Just include `firewalld-rules` in your node's `run_list`: `recipe[firewalld-rules::default]`

In your role file:
```
json
{
  "firewalld-rules": {
    "rich": [
      {
        "rule_name": "public_ssh",
        "port_number": "2222",
        "port_protocol": "tcp",
        "zone": "public",
        "family": "ipv4",
        "firewall_action": "accept",
        "action": "add"
      }
    ],
    "service": [
      {
        "service_name": "ssh",
        "action": "remove"
      }
    ],
    "port": [
      {
        "port": "8888/tcp",
        "zone": "public",
        "action": "add"
      }
    ],
    "interface": [
      {
        "interface": "eth0",
        "zone": "public",
        "action": "add"
      }
    ]
  }
}
```

## Contributing

1. Fork the repository on Github<br>
2. Create a named feature branch (like `add_component_x`)<br>
3. Write your change<br>
4. Write tests for your change (if applicable)<br>
5. Run the tests, ensuring they all pass<br>
6. Submit a Pull Request using Github

## License and Authors

MIT License

Authors: Tyler J Presley (tjpresley@gmail.com)
