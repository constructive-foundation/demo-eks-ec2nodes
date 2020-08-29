terraform {
  backend "s3" {
    bucket = "demo-eks-cluster-tfstate"
    key    = "eks-cluster"
    region = "us-east-1"
  }
}