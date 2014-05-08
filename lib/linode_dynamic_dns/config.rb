require 'ostruct'
require 'yaml'

module LinodeDynamicDns
  def self.config
    @config ||= load_config_from(
      File.join(
        File.dirname(__FILE__), '../..', 'config',
        'linode_dynamic_dns.yaml'
      )
    )
  end

  def self.load_config_from(path)
    OpenStruct.new(
      YAML.load_file(
        path
      )
    )
  end

  def self.set_config(path)
    @config = load_config_from(File.expand_path(path))
  end
end
