# Dependencies required by nokogiri (for fog)
%w(build-essential libxslt1-dev libxml2-dev).each do |pkg|
  c_pkg = package(pkg)
  c_pkg.run_action(:install)
end

chef_gem "fog" do
  version node[:dns][:fog_version]
end
