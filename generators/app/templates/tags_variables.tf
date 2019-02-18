variable "tags_eng_project" {
  description = "A team or project name using the resource."
  default     = ""
}

variable "tags_eng_app_environment" {
  description = "The environment in which the resource resides."
}

variable "tags_eng_app_name" {
  description = "The name of the app or general function area of the resource."
  default     = ""
}

variable "tags_eng_app_svc" {
  description = "The service provided by the resource or specific function area of the resource."
  default     = ""
}

variable "tags_bill_costcenter" {
  description = "The costcenter handling payment for the resource."
  default     = ""
}

variable "tags_bill_owner" {
  description = "The person responsible for managing the cost of the resource."
  default     = ""
}

variable "tags_bill_unit" {
  description = "The dept responsible for managing the cost of the resource."
  default     = ""
}

variable "tags_bill_category" {
  description = "Effectively, a general purpose category for billing purposes. This is sometimes used to track production vs non-production assets."
  default     = ""
}

variable "tags_ops_status" {
  description = "An external status of the resource. For example, 'operational', 'non-operational', 'decommissioned'."
  default     = "operational"
}

variable "tags_ops_firstcreatedon" {
  description = "A date when the resource is expected to be created for the first time. This is used for inventory purposes."
  default     = ""
}

variable "tags_ops_support" {
  description = "The team responsible for supporting the resource."
  default     = ""
}

variable "tags_comply_data_type" {
  description = "Describes the highest level of classification regarding the data stored or transiting through this resource. For example 'protected', 'confidential', 'internal', 'public'"
  default     = ""
}

locals {
  name         = "${var.tags_eng_app_environment}-${var.tags_eng_app_name}-${var.tags_eng_app_svc}"
  central_name = "${var.org_name}-${var.account_name}-${var.tags_eng_app_name}-${var.tags_eng_app_svc}"

  tags = {
    eng_project         = "${var.tags_eng_project}"
    eng_app_environment = "${var.tags_eng_app_environment}"
    eng_app_name        = "${var.tags_eng_app_name}"
    eng_app_svc         = "${var.tags_eng_app_svc}"
    bill_costcenter     = "${var.tags_bill_costcenter}"
    bill_owner          = "${var.tags_bill_owner}"
    bill_unit           = "${var.tags_bill_unit}"
    bill_category       = "${var.tags_eng_app_environment == "prod" ? var.tags_eng_app_environment : "nonprod"}"
    ops_status          = "${var.tags_ops_status}"
    ops_createdby       = "terraform"
    ops_firstcreatedon  = "${var.tags_ops_firstcreatedon}"
    ops_support         = "${var.tags_ops_support}"
    comply_data_type    = "${var.tags_comply_data_type}"
  }
}
