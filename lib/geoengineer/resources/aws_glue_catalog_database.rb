########################################################################
# AwsGlueCatalogDatabase is the +aws_glue_catalog_database+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/glue_catalog_database.html
# Terraform Docs}
########################################################################
class GeoEngineer::Resources::AwsGlueCatalogDatabase < GeoEngineer::Resource
  validate -> { validate_required_attributes([:name]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { description } }

  def support_tags?
    false
  end
end
