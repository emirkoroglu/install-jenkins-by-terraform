variable "region" {
  type        = string
  description = "Please provide a region for instances"
  default     = "ap-northeast-1" #tokyo
}
variable "key_name" {
  type        = string
  description = "Please provide a key pair name for instances"
  default     = "jenkins"
}
variable "sec_group_name" {
  type        = string
  description = "Please provide a sec group name for instances"
  default     = "jenkinsecurity"
}