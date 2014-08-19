class Post < ActiveRecord::Base

	belongs_to :user

	has_attached_file :picture, 
										styles: { :medium => "300x300#" },
                    storage: :s3,
                    s3_credentials: {
                    	bucket: 'marco_instagram',
                      access_key_id: Rails.application.secrets.s3_access_key_id,
                      secret_access_key: Rails.application.secrets.s3_secret_access_key
                    }

	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def tags_list
  end

  def tags_list=(all_tags)
  end
	
end
