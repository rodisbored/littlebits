module SharedMethods
  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
