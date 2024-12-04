resource "aws_ecr_repository" "ecr_repository"{
	name = "${var.tenant}/${var.project}/application"

}

resource "aws_ecr_repository_policy" "ecr_repository_policy_immutable_tags"{
	repository = aws_ecr_repository.ecr_repository.name

	policy = <<EOF
	{
		"Version": "2008-10-17",
		"Statement": [
			{
			"Sid": "TagImmutability",
			"Effect": "Deny",
			"Principal": "*",
			"Action": "ecr:PutImageTagMutability",
			"Condition":{
				"StringNotEquals" : {
					"ecr:imageTagMutability": "IMMUTABLE"
				}
			  }
			}
		]
	}
EOF
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle_policy"{
	repository = aws_ecr_repository.ecr_repository.name

	policy = <<EOF
	{
		"rules":[
			{
			"rulePriority": 1,
			"description": "Expire old images",
			"selection": {
				"tagStatus": "any",
				"countType": "imageCountMoreThan",
				"countNumber": 10
			},
			"action": {
				"type": "expire"
			}
		   }
		]
	}
	EOF
}
