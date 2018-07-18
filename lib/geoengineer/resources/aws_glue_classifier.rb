########################################################################
# AwsGlueClassifier is the +aws_glue_classifier+ terrform resource,
#
# {https://www.terraform.io/docs/providers/aws/r/glue_classifier.html
# Terraform Docs}
########################################################################
class GeoEngineer::Resources::AwsGlueClassifier < GeoEngineer::Resource
  validate -> { validate_required_attributes([:name]) }

  after :initialize, -> { _terraform_id -> { NullObject.maybe(remote_resource)._terraform_id } }
  after :initialize, -> { _geo_id -> { description } }

  def support_tags?
    false
  end
end
