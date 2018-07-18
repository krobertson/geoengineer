########################################################################
# AwsGlueCrawler is the +aws_glue_crawler+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/glue_crawler.html
# Terraform Docs}
########################################################################
class GeoEngineer::Resources::AwsGlueCrawler < GeoEngineer::Resource
  validate -> { validate_required_attributes([:name, :database_name, :role]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { description } }

  def support_tags?
    false
  end
end
