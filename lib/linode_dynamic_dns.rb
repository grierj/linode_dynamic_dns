require "net/http"
require "linode_dynamic_dns/version"
require "linode_dynamic_dns/config"

module LinodeDynamicDns
  def self.api
    @api ||= Linode.new(:api_key => config.api_key)
  end

  def self.ttl
    config.ttl || 300
  end

  def self.ip_file
    if config.ip_file
      config.ip_file = File.expand_path(config.ip_file)
    end
    config.ip_file || '/tmp/linode_last_ip'
  end

  def self.get_my_ip
    response = Net::HTTP.get_response(URI(config.ip_url))
    if response.code.to_i == 200
      response.body
    else
      raise "Got bad response code #{response.code}"
    end
  end

  def self.get_last_ip
    if File.exist?(ip_file)
      File.read(ip_file).chomp
    else
      nil
    end
  end

  def self.set_last_ip(ip)
    File.open(ip_file, 'w') do |fh|
      fh.write(ip)
    end
  end

  def self.get_domain_id
    api.domain.list.each do |dom|
      if dom.domain == config.domain
        return dom.domainid
      end
    end
    raise "No domain found matching #{config.domain}"
  end

  def self.get_record_id(domain_id)
    api.domain.resource.list(:DomainId => domain_id).each do |res|
      if res.name == config.record
        return res.resourceid
      end
    end
    raise "No resource found matching #{config.record}"
  end

  def self.update_record_ip(domain_id, record_id, ip)
    api.domain.resource.update(:DomainId => domain_id,
                               :ResourceId => record_id,
                               :TTL_sec => ttl,
                               :Target => ip)
  end
end
