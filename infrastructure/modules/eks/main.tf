module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "20.13.1"

    cluster_name = var.cluster_name
    cluster_version = var.cluster_version

    vpc_id = var.vpc_id
    subnet_ids = var.private_subnets

    enable_irsa = true

    cluster_endpoint_public_access = true

    eks_managed_node_groups = {
        default = {
            instance_types = ["t3.medium"]

            min_size = 1
            max_size = 3
            desired_size = 2

            capacity_type = "ON_DEMAND"
        }
    }

    tags = {
        Environment = var.environment
        Terraform = "true"
    }
}