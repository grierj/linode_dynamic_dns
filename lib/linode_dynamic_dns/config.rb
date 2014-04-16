require 'ostruct'
require 'yaml'

module LinodeDynamicDns
  def self.config
    @config ||= OpenStruct.new(
                  YAML.load_file(
                    File.join(
                      File.dirname(__FILE__), '../..', 'config',
                      'linode_dynamic_dns.yaml'
                    )
                  )
                )
  end
end
