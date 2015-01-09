#
# Cookbook Name:: impala
# Attribute:: config
#
# Copyright © 2013-2015 Cask Data, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Default: conf.chef
default['impala']['conf_dir'] = 'conf.chef'

# User/Group
default['impala']['user'] = 'impala'
default['impala']['group'] = 'impala'

# Set Hadoop attributes
override['hadoop']['distribution'] = 'cdh'
override['hadoop']['distribution_version'] = 5

# Impala /etc/default/impala startup configurations
default['impala']['config']['IMPALA_CATALOG_SERVICE_HOST'] = '127.0.0.1'
default['impala']['config']['IMPALA_STATE_STORE_HOST'] = '127.0.0.1'
default['impala']['config']['IMPALA_STATE_STORE_PORT'] = '24000'
default['impala']['config']['IMPALA_BACKEND_PORT'] = '22000'
default['impala']['config']['IMPALA_LOG_DIR'] = '/var/log/impala'
default['impala']['config']['IMPALA_CATALOG_ARGS'] = ' -log_dir=${IMPALA_LOG_DIR}'
default['impala']['config']['IMPALA_STATE_STORE_ARGS'] = ' -log_dir=${IMPALA_LOG_DIR} -state_store_port=${IMPALA_STATE_STORE_PORT}'
default['impala']['config']['IMPALA_SERVER_ARGS'] = ' \
    -log_dir=${IMPALA_LOG_DIR} \
    -catalog_service_host=${IMPALA_CATALOG_SERVICE_HOST} \
    -state_store_port=${IMPALA_STATE_STORE_PORT} \
    -use_statestore \
    -state_store_host=${IMPALA_STATE_STORE_HOST} \
    -be_port=${IMPALA_BACKEND_PORT}'
default['impala']['config']['ENABLE_CORE_DUMPS'] = 'false'
