locals {
  prefix  = "azure"
  rg_name = "${local.prefix}-${var.org_name}-${var.project_name}"
}