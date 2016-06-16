module DropboxApiV2::Metadata
  # NOTE: We should have a test to cover the initialization of this object.
  # Sample:
  # {
  #   "name": "arizona_baby",
  #   "path_lower": "/arizona_baby",
  #   "path_display": "/arizona_baby",
  #   "id": "id:7eWkV5hcfzAAAAAAAAAAAQ"
  # }
  class Folder < Base
    field :name, String
    field :path_lower, String
    field :path_display, String
    field :id, String
    field :sharing_info, DropboxApiV2::Metadata::FolderSharingInfo
  end
end
