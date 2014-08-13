name             'likewise'
maintainer       'raparkhurst'
maintainer_email 'robert.parkhurst@gmail.com'
license          'All rights reserved'
description      'Installs/Configures likewise'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.8'

depends "sudo"

%w{ ubuntu debian }.each do |os|
  supports os
end

