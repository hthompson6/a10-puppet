# Copyright 2018,  A10 Networks.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.

require 'axapi_http'

Puppet::Functions.create_function('virtual_server_create') do
    def virtual_server_create(**kwargs)
       client = A10Client::ACOSClient(kwargs['host'], kwargs['port'], kwargs['protocol'],
                                      kwargs['username'], kwargs['password'])

       kwargs.each do |k, v|
           if not v 
               kwargs.delete(k)
           end
       end
       params = { "virtual-server": kwargs }

       url = "/axapi/v3/slb/virtual-server/"
       client.create(url, params: params)
    end
end
