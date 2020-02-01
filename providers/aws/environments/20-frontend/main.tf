module "bastion" {
  source = "../../../../modules/aws/frontend"
  acm    = data.terraform_remote_state.acm.outputs.acm
}
