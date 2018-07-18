########################################################################
# AwsGlueTrigger is the +aws_glue_trigger+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/glue_trigger.html
# Terraform Docs}
########################################################################
class GeoEngineer::Resources::AwsGlueTrigger < GeoEngineer::Resource
  validate -> { validate_required_attributes([:name, :actions, :type]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { description } }

  def support_tags?
    false
  end
end
