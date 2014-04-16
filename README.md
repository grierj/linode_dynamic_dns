# Linode Dynamic Dns

This is a really simple gem to update a dns entry via Linode's DNS API to mimic something like Dyn's dynamic dns.  Dyn recently killed their free dynamic record, so I dug into how to do it with Linode's DNS since I already host it through them.

## Installation

This gem is generally used in a standalone manner using bundler.  To install it run:

    git clone https://github.com/grierj/linode_dynamic_dns.git
    cd linode_dynamic_dns
    bundle install
    
After that run:

    cp config/linode_dynamic_dns.EXAMPLE.yaml config/linode_dynamic_dns.yaml
    
And edit the fields in that config file.  The comments should explain what's going on.

## Usage

After your config file is up to date, simply run:

    bundle exec bin/linode_dynamic_dns
    
This should update whatever record you configured to whatever your IP address is.  To run this continuously use runit or daemontools or whatever your favorite process minder is.

## Contributing

1. Fork it ( https://github.com/grierj/linode_dynamic_dns/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request