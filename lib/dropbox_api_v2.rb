require 'json'
require 'faraday'

require "dropbox_api_v2/middleware/decode_json"
require "dropbox_api_v2/middleware/encode_json"

require "dropbox_api_v2/metadata/base"
require "dropbox_api_v2/metadata/file"
require "dropbox_api_v2/metadata/folder"
require "dropbox_api_v2/metadata/factory"

require "dropbox_api_v2/errors/basic_error"
require "dropbox_api_v2/errors/lookup_error"
require "dropbox_api_v2/errors/write_conflict_error"
require "dropbox_api_v2/errors/write_error"
require "dropbox_api_v2/errors/relocation_error"
require "dropbox_api_v2/errors/create_folder_error"
require "dropbox_api_v2/errors/delete_error"
require "dropbox_api_v2/errors/download_error"

require "dropbox_api_v2/client"
require "dropbox_api_v2/response"

require 'dropbox_api_v2/endpoints/base'
require 'dropbox_api_v2/endpoints/rpc'
require 'dropbox_api_v2/endpoints/content_download'
require 'dropbox_api_v2/endpoints/content_download'
require 'dropbox_api_v2/endpoints/files/copy'
require 'dropbox_api_v2/endpoints/files/create_folder'
require 'dropbox_api_v2/endpoints/files/delete'
require 'dropbox_api_v2/endpoints/files/download'

require "dropbox_api_v2/version"
