
apt_repository "s3cmd" do
	uri "http://s3tools.org/repo/deb-all"
	components ["deb", "stable"]
end

package "s3cmd"

cookbook_file "/home/christian/.s3cfg" do
	source "s3cfg"
	owner "christian"
	group "christian"
	mode "0755"
end