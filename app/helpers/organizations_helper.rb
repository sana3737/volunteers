module OrganizationsHelper
  def display_prefeature(id)
    prefecture = Prefecture.find_by(id: id)
    prefecture.prefecture if prefecture.present?
  end
end
