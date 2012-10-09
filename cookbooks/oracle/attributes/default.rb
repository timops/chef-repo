#
# Cookbook Name:: oracle
# Attributes:: default
#
# Copyright 2008-2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# NOTE: users and groups are stored in 'oracle' data bag.  See README for details.

install_options = {
  'install_db_swonly' => 1,
  'install_db_and_config' => 2,
  'upgrade_db' => 3
}

edition = {
  'standard' => 'SE',
  'enterprise' => 'EE'
}

default['oracle']['install']['install_option'] = install_options['install_db_swonly']

# Database / instance naming.
default['oracle']['install']['global_db_name'] = 'TEST'
default['oracle']['install']['db_sid'] = 'TEST'

# Oracle edition - see above editions[] for supported options.
default['oracle']['install']['edition'] = edition['enterprise']

# Install paths.
default['oracle']['install']['inv_loc'] = '/u01/app/oracle/oraInventory'
default['oracle']['install']['ora_base'] = '/u01/app/oracle/product/11.2.0.1'
default['oracle']['install']['ora_home'] = "/u01/app/oracle/product/11.2.0.1/#{default['oracle']['install']['db_sid']}"

# default['oracle']['install']['charset'] = 'optional'
# default['oracle']['install']['db_type'] = 'optional'

default['oracle']['install']['os_packages'] = {
  'binutils' => 'x86_64',
  'compat-libcap1' => 'x86_64',
  'compat-libstdc++-33' => 'x86_64',
  'compat-libstdc++-33' => 'i686',
  'gcc' => 'x86_64',
  'gcc-c++' => 'x86_64',
  'glibc' => 'i686',
  'glibc' => 'x86_64',
  'glibc-devel' => 'x86_64',
  'glibc-devel' => 'i686',
  'ksh' => 'x86_64',
  'libgcc' => 'i686',
  'libgcc' => 'x86_64',
  'libstdc++' => 'x86_64',
  'libstdc++' => 'i686',
  'libstdc++-devel' => 'x86_64',
  'libstdc++-devel' => 'i686',
  'libaio' => 'x86_64',
  'libaio-devel' => 'i686',
  'libaio-devel' => 'x86_64',
  'libaio-devel' => 'i686',
  'make' => 'x86_64',
  'sysstat' => 'x86_64'
}

default['oracle']['kernel']['shmall'] = '2097152'
default['oracle']['kernel']['shmmax'] = '536870912'
default['oracle']['kernel']['aio_max_nr'] = '1048576'
default['oracle']['kernel']['file_max'] = '6815744'
default['oracle']['kernel']['shmmni'] = '4096'
default['oracle']['kernel']['sem'] = '250 32000 100 128'
default['oracle']['kernel']['port_range'] = '9000 65500'
default['oracle']['kernel']['rmem_default'] = '262144'
default['oracle']['kernel']['rmem_max'] = '4194304'
default['oracle']['kernel']['wmem_default'] = '262144'
default['oracle']['kernel']['wmem_max'] = '1048576' 
