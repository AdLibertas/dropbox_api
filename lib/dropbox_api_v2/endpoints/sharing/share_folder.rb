module DropboxApiV2::Endpoints::Sharing
  class ShareFolder < DropboxApiV2::Endpoints::Rpc
    Method      = :post
    Path        = "/2/sharing/share_folder".freeze
    ResultType  = DropboxApiV2::Results::ShareFolderLaunch
    ErrorType   = DropboxApiV2::Errors::ShareFolderError

    # @method share_folder(path, options = {})
    # Share a folder with collaborators.
    #
    # Most sharing will be completed synchronously. Large folders will be
    # completed asynchronously. To make testing the async case repeatable, set
    # `ShareFolderArg.force_async`.
    #
    # If a ShareFolderLaunch.async_job_id is returned, you'll need to call
    # check_share_job_status until the action completes to get the metadata
    # for the folder.
    #
    # Apps must have full Dropbox access to use this endpoint.
    #
    # @param path [String] The path to the folder to share. If it does not
    #   exist, then a new one is created.
    # @option member_policy [:anyone, :team] Who can be a member of this shared
    #   folder. Only applicable if the current user is on a team. The default
    #   is `:anyone`.
    # @option acl_update_policy [:owner, :editors] Who can add and remove
    #   members of this shared folder. The default is `:owner`.
    # @option shared_link_policy [:anyone, :members] The policy to apply to
    #   shared links created for content inside this shared folder. The
    #   current user must be on a team to set this policy to `:members`.
    #   The default is `anyone`.
    # @option force_async [Boolean] Whether to force the share to happen
    #   asynchronously. The default for this field is `false`.
    # @return [ShareFolderLaunch] Shared folder metadata.
    add_endpoint :share_folder do |path, options = {}|
      validate_options(options)
      options[:member_policy] ||= :anyone
      options[:acl_update_policy] ||= :owner
      options[:shared_link_policy] ||= :anyone
      options[:force_async] ||= false

      begin
        perform_request options.merge({
          :path => path
        })
      rescue DropboxApiV2::Errors::AlreadySharedError => error
        error.shared_folder
      end
    end

    private

    def validate_options(options)
      valid_option_keys = [
        :member_policy,
        :acl_update_policy,
        :shared_link_policy,
        :force_async
      ]

      options.keys.each do |key|
        unless valid_option_keys.include? key.to_sym
          raise ArgumentError, "Invalid option `#{key}`"
        end
      end
    end
  end
end
