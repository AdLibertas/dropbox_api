module DropboxApiV2::Results
  class ListSharedLinksResult < DropboxApiV2::Results::Base
    #  Shared links applicable to the path argument.
    def links
      @entries ||= @data["links"].map do |entry|
        DropboxApiV2::Metadata::SharedLink.new entry
      end
    end

    # Pass the cursor into `list_folder_continue` to see what's changed in the
    # folder since your previous query.
    def cursor
      @data["cursor"]
    end

    # If true, then there are more entries available. Pass the cursor to
    # `list_folder_continue` to retrieve the rest.
    def has_more?
      @data["has_more"].to_s == "true"
    end
  end
end
