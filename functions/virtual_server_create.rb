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

Puppet::Functions.create_function('virtual_server_create') do
    dispatch :virtual_sever_create do
        param 'String', :ip_addr
        param 'String', :name
        param 'String', :host
        param 'Integer', :port
        param 'String', :protocol
        param 'String', :username
        param 'String', :password
    end

    def virtual_server_create(**kwargs)
       client = A10Client::ACOSClient(kwargs['host'], kwargs['port'], kwargs['protocol'],
                                      kwargs['username'], kwargs['password']) 
    end
end
