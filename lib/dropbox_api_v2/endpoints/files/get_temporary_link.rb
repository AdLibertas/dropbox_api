module DropboxApiV2::Endpoints::Files
  class GetTemporaryLink < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/get_temporary_link".freeze
    ResultType  = DropboxApiV2::Results::GetTemporaryLinkResult
    ErrorType   = DropboxApiV2::Errors::GetMetadataError

    # @method get_temporary_link(path)
    # Get a temporary link to stream content of a file. This link will expire
    # in four hours and afterwards you will get 410 Gone. Content-Type of the
    # link is determined automatically by the file's mime type.
    #
    # @param path [String] The path to the file you want a temporary link to.
    add_endpoint :get_temporary_link do |path|
      perform_request({:path => path})
    end
  end
end
