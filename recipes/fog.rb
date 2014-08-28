node.set[:build_essential][:compiletime] = true
include_recipe 'build-essential'

# Dependencies required by nokogiri (for fog)
%w(libxslt1-dev libxml2-dev).each do |pkg|
  c_pkg = package(pkg)
  c_pkg.run_action(:install)
end


# TODO: Remove this once the gem_hell cookbook is ready to roll
chef_gem "fog" do
  version node[:dns][:fog_version]
  action :install
end
