class Request < ApplicationRecord
  belongs_to :request, class_name: "User"
  belongs_to :host, class_name: "User"
end
