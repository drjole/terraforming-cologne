class MissionControlController < ApplicationController
  # Authentication is handled via HTTP Basic Authentication
  allow_unauthenticated_access
  allow_unauthorized_access
end
