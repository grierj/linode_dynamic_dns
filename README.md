# Linode Dynamic Dns

This is a really simple gem to update a dns entry via Linode's DNS API to mimic something like Dyn's dynamic dns.  Dyn recently killed their free dynamic record, so I dug into how to do it with Linode's DNS since I already host it through them.

## Installation

### Rubygem

To install from rubygems:

    gem install linode_dynamic_dns

You can then grab the example config file (if you need it) with:

    curl -o ~/linode_dynamic_dns.yaml https://raw.githubusercontent.com/grierj/linode_dynamic_dns/master/config/linode_dynamic_dns.EXAMPLE.yaml

Modify the config file according to the comments

### With bundler

This gem is generally used in a standalone manner using bundler.  To install it run:

    git clone https://github.com/grierj/linode_dynamic_dns.git
    cd linode_dynamic_dns
    bundle install
    
After that run:

    cp config/linode_dynamic_dns.EXAMPLE.yaml config/linode_dynamic_dns.yaml
    
And edit the fields in that config file.  The comments should explain what's going on.

## Setting up your DNS

In your Linode DNS manager pick the "Domain Zone" you want to put the record in.  This is what goes in the "domain" section of the config file, btw.  In that zone add a new A record.  Set the IP to something like 127.0.0.1 for now, it'll get updated via the script later.  The name of this A record is what goes in the "record" section of the config.

## Usage

### Rubygem

Run the updater like:

    linode_dynamic_dns -c ~/linode_dynamic_dns.yaml -v

If you don't like the status messages, remove the -v
If you put your config file somewhere else, update the path

### Bundler

Run the updater via bundler like

    bundle exec bin/linode_dynamic_dns
    
This should update whatever record you configured to whatever your IP address is.

## Keep on runnin'

You can run this in a loop every 5 or so minutes, or use cron, or just run it from time to time by hand

## Contributing

1. Fork it ( https://github.com/grierj/linode_dynamic_dns/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
