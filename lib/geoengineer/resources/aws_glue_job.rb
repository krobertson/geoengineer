########################################################################
# AwsGlueJob is the +aws_glue_job+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/glue_job.html
# Terraform Docs}
########################################################################
class GeoEngineer::Resources::AwsGlueJob < GeoEngineer::Resource
  validate -> { validate_required_attributes([:name, :role_arn, :command]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { description } }

  def support_tags?
    false
  end
end
