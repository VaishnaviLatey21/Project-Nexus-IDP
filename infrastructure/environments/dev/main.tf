module "vpc" {
    source = "../../modules/vpc"

    cluster_name = "project-nexus"
    aws_region = "ap-south-1"
    environment = "dev"
}

module "eks" {
    source = "../../modules/eks"

    cluster_name = "project-nexus"
    cluster_version = "1.29"

    vpc_id = module.vpc.vpc_id
    private_subnets = module.vpc.private_subnets

    environment = "dev"
}