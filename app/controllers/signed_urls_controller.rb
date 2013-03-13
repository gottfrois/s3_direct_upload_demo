# Not used with gem s3_direct_upload since they do that using a form_handler

# class SignedUrlsController < ApplicationController

#   def index
#     render json: {
#       policy: s3_upload_policy_document,
#       signature: s3_upload_signature,
#       key: "uploads/#{SecureRandom.uuid}/#{params[:doc][:title]}",
#       success_action_redirect: "/"
#     }
#   end

#   private

#   # generate the policy document that amazon is expecting.
#   def s3_upload_policy_document
#     Base64.encode64(
#       {
#         'expiration' => Time.now.utc + 30.minutes,
#         'conditions' => [
#           [ "starts-with", "$key", 'uploads/' ],
#           { 'bucket' => ENV['S3_BUCKET'] },
#           { 'acl' => 'public-read' },
#           { success_action_status: '201' },
#           [ "content-length-range", 1, 50.megabytes ]
#         ]
#       }.to_json
#     ).gsub("\n","")
#   end

#   # sign our request by Base64 encoding the policy document.
#   def s3_upload_signature
#     Base64.encode64(
#       OpenSSL::HMAC.digest(
#         OpenSSL::Digest::Digest.new('sha1'),
#         ENV['AWS_SECRET_KEY_ID'],
#         s3_upload_policy_document
#       )
#     ).gsub(/\n/, '')
#   end
# end
